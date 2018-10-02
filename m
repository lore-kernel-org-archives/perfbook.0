Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eluC8gs3VNhQMdwb9WRpsyq4IN+FFTsR+4jIdctEM80=;
        b=gb67rGyApPMmM5X6KNfXJPpEN6npRfosueoBBHiVYwXGGYt6FSg7svFnhkFbh9YK94
         vRJsyxU9eOasMPyeFgBq1DP9Awj6bu5m63TUMW8hxYrvwqnETs+xn5WKjtLIpRr7L/N+
         /d9I5x8VuhccRKmBupjiZlY4trA96W3x79y6PMuYsOVgW96hmDhX7KmRews19jkNj51g
         3JABZlB766qmqnMFqUHOcWej/7y9KAK5Ep8u+OKw5sgCk46GcZ67Yoe2Obng02yqHtIc
         FIx2Nf5xPbNd+IokGLlUQHyvFdgpAcJvLU+dAZVm8TZMFfOfV2rkCbmag10y+r5Hcjvr
         G8Ow==
Subject: Re: [PATCH 2/2] count: Adjust type of variable 'counter' with code
 snippet
References: <afb11222-c68a-22e6-a95c-bfb4d4b9344d@gmail.com>
 <549dac1f-17b7-5225-7d91-e7cd83b8b63b@gmail.com>
 <a06d09f0-7c87-c0ed-f695-b25778aa4bfa@gmail.com>
 <20181002182123.GK4222@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <67a1d644-6289-4582-aa1b-d8f97bf4b538@gmail.com>
Date: Wed, 3 Oct 2018 07:12:32 +0900
MIME-Version: 1.0
In-Reply-To: <20181002182123.GK4222@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/02 11:21:23 -0700, Paul E. McKenney wrote:
> On Wed, Oct 03, 2018 at 12:24:17AM +0900, Akira Yokosawa wrote:
>> On 2018/10/03 00:16:12 +0900, Akira Yokosawa wrote:
>>> From a9c276c3da87ed327d003a70d60777f41999b4fc Mon Sep 17 00:00:00 2001
>>> From: Akira Yokosawa <akiyks@gmail.com>
>>> Date: Wed, 3 Oct 2018 00:08:49 +0900
>>> Subject: [PATCH 2/2] count: Adjust type of variable 'counter' with code snippet
>>>
>>> In the actual code of count_stat.c, the per-thread variable
>>> "counter" has the type "unsigned long".
> 
> Looks good, so I applied and pushed both patches, thank you!
> 
>> And the other description on Listing 5.3 in the text needs some reworking
>> to reflect the changes in the snippet. Paul, can you have a look into
>> this?
> 
> How does the patch below look?

Looks good to me (at least for the moment).

Acked-by: Akira Yokosawa <akiyks@gmail.com>

And I'm anticipating your expansion on the use of READ_ONCE()/WRITE_ONCE()
in, say, somewhere in toolsoftrade. Then we would be able to reduce
repetitive explanation here and there.

I'll continue to apply new scheme for other snippets in "count" chapter.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit cc0409cfb0581924b05744a15fa3ebd5c1e298af
> Author: Paul E. McKenney <paulmck@linux.ibm.com>
> Date:   Tue Oct 2 11:19:33 2018 -0700
> 
>     count: Update code description and QQ based on {READ,WRITE}_ONCE()
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> 
> diff --git a/count/count.tex b/count/count.tex
> index 9f9fd0f64838..c36e7d826a7b 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -495,23 +495,22 @@ show a function that increments the counters, using the
>  thread's element of the \co{counter} array.
>  Because this element is modified only by the corresponding thread,
>  non-atomic increment suffices.
> -
> -Lines~\lnref{read:b}-\lnref{read:e}
> -show a function that reads out the aggregate value of the counter,
> -using the \co{for_each_thread()} primitive to iterate over the list of
> -currently running threads, and using the \co{per_thread()} primitive
> -to fetch the specified thread's counter.
> -Because the hardware can fetch and store a properly aligned \co{unsigned long}
> -atomically, and because \GCC\ is kind enough to make use of this capability,
> -normal loads suffice, and no special atomic instructions are required.
> -\end{lineref}
> +However, this code uses \co{WRITE_ONCE()} to prevent destructive compiler
> +optimizations.
> +For but one example, the compiler is within its rights to use a
> +to-be-stored-to location as temporary storage, thus writing what
> +would be for all intents and purposes garbage to that location
> +just before doing the desired store.
> +This could of course be rather confusing to anything attempting to
> +read out the count.
> +The use of \co{WRITE_ONCE()} prevents this optimization and others besides.
>  
>  \QuickQuiz{}
> -	What other choice does \GCC\ have, anyway???
> +	What other nasty optimizations could \GCC\ apply?
>  \QuickQuizAnswer{
> -	According to the C standard, the effects of fetching a variable
> -	that might be concurrently modified by some other thread are
> -	undefined.
> +	According to the C standard, the effects of doing a normal store
> +	to a variable that might be concurrently loaded by some other
> +	thread are undefined.
>  	It turns out that the C standard really has no other choice,
>  	given that C must support (for example) eight-bit architectures
>  	which are incapable of atomically loading a \co{long}.
> @@ -540,8 +539,10 @@ normal loads suffice, and no special atomic instructions are required.
>  	It is therefore reasonable to expect that any Linux-kernel
>  	adoption of C11 atomics will be incremental at best.
>  
> -	So why not just use plain old C-language assignment statements
> -	to access shared variables?
> +	But if the code is doing loads and stores that the underlying
> +	hardware can implement with single instructions, why not just
> +	use plain old C-language assignment statements to access shared
> +	variables?
>  	The problem is that the compiler is within its rights to assume
>  	that no other thread is modifying the variable being accessed.
>  	Given a plain old C-language load, the compiler would therefore
> @@ -581,6 +582,22 @@ normal loads suffice, and no special atomic instructions are required.
>  	coding standards.
>  } \QuickQuizEnd
>  
> +Lines~\lnref{read:b}-\lnref{read:e}
> +show a function that reads out the aggregate value of the counter,
> +using the \co{for_each_thread()} primitive to iterate over the list of
> +currently running threads, and using the \co{per_thread()} primitive
> +to fetch the specified thread's counter.
> +This code also uses \co{READ_ONCE()} to ensure that the compiler doesn't
> +optimize these loads into oblivion.
> +For but one example, a pair of consecutive calls to \co{read_count()}
> +might be inlined, and an intrepid optimizer might notice that the same
> +locations were being summed and thus incorrectly conclude that it would
> +be simply wonderful to sum them once and use the resulting value twice.
> +This sort of optimization might be rather frustrating to people expecting
> +later \co{read_count()} calls to return larger values.
> +The use of \co{READ_ONCE()} prevents this optimization and others besides.
> +\end{lineref}
> +
>  \QuickQuiz{}
>  	How does the per-thread \co{counter} variable in
>  	Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
> 

