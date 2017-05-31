Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zimV6hA+O6b+eypuVDnW26XKhQURfx/FR3/Y4W0cfXs=;
 b=s3dW/CPBUT0wNSpQ3xasdx97c6HDYIo8oRo/sPVh9Jk7JtNMAqcDltcvgUt0u91ebC
 Pjm616L35fVnwLk6bcA/kNN0T/UPyz6an1+9jFaNJLQ/3AMMq8vjJnCkR2Smh0QcLzxu
 Bzzh3hGVWZVGXmdC2N9AZHBwlP8hIGfSmXRDGD71pCsxvA0jlkbqjRVP2n7lXlI021pD
 pWShPxY8qhTvLsPEnS6GJgzpAmsCwa+O+/XCJuzVWfL7ejehYplbStSuyER/Qzgq7R46
 6AFTfjOWz9b0wCVz2OtKQ4MohuQcAgk7S1N4iKrRbudR7HDOSKRga1OR2rk6e0wqmLDa
 EDjA==
Subject: Re: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
 <20170531184655.GR3956@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <907f9e98-05b5-ab60-c854-e19deab39629@gmail.com>
Date: Thu, 1 Jun 2017 06:19:16 +0900
MIME-Version: 1.0
In-Reply-To: <20170531184655.GR3956@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/31 11:46:55 -0700, Paul E. McKenney wrote:
> On Tue, May 30, 2017 at 09:05:15PM +0900, Akira Yokosawa wrote:
>> >From 489b5e3bdeba2f9b733dbe3d85390368dd159174 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 30 May 2017 20:44:52 +0900
>> Subject: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
>>
>> Hi Paul,
>>
>> This is the respin of the latter two patches of v1. I'm keeping RFC
>> because of some questions.
>>
>> "long" -> "intptr_t" changes in Patch 1 have no effect on a platform
>> where "long" and "intptr_t" have the same width, but I think they
>> are good in portability POV.
>>
>> WRITE_ONCE() in Patch 2 is placed under the assignment to the array
>> because I could not translate post increment in any other way.
>> Does the WRITE_ONCE() ensure the outer "while" capture the value?
> 
> Wow, that loop is old code!!!  My current compiler creates an infinite
> loop for it, so yes, there is more required.

You mean on GCC for ppc64?

>                                               Plus there are confusing
> and redundant comparisons, so that it is not entirely clear to me that
> the loop is guaranteed to terminate properly
> 
> So I took both patches, but rewrote the loop in the second patch as
> shown below.
> 
> If you are OK with this rewrite, I will push them.

I'm OK with this, but it is a whole rewrite of the code, so

Reported-by: Akira Yokosawa <akiyks@gmail.com>

looks appropriate in this case.
It's up to you which tag to use.

                  Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 8a54d9aeeeefa1909db062dc893705ff8fefd702
> Author: Akira Yokosawa <akiyks@gmail.com>
> Date:   Tue May 30 20:40:04 2017 +0900
> 
>     CodeSamples/defer: Rework loop in gettimestampmp.c
>     
>     Add READ_ONCE() and WRITE_ONCE() ensure curtimestamp is read and written
>     once in every iteration.  The READ_ONCE() is not optional, as modern
>     compilers can (and do) emit an infinite loop for the earlier code.
>     
>     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>     [ paulmck: Rework loop to eliminate redundant fetches and comparisons. ]
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
> index 2abade42e233..8780b71f33d7 100644
> --- a/CodeSamples/defer/gettimestampmp.c
> +++ b/CodeSamples/defer/gettimestampmp.c
> @@ -30,16 +30,19 @@ long curtimestamp = 0;
>  void *collect_timestamps(void *mask_in)
>  {
>  	long mask = (intptr_t)mask_in;
> +	long cts;
>  
> -	while (curtimestamp < MAX_TIMESTAMPS) {
> -		while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
> -			continue;
> -		if (curtimestamp >= MAX_TIMESTAMPS)
> +	for (;;) {
> +		cts = READ_ONCE(curtimestamp);
> +		if (cts >= MAX_TIMESTAMPS)
>  			break;
> +		if ((cts & CURTIMESTAMP_MASK) != mask)
> +			continue;
>  
>  		/* Don't need memory barrier -- no other shared vars!!! */
>  
> -		ts[curtimestamp++] = get_timestamp();
> +		ts[cts] = get_timestamp();
> +		WRITE_ONCE(curtimestamp, cts + 1);
>  	}
>  	smp_mb();
>  	return (NULL);
> 
> 

