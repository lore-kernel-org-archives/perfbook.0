Return-Path: <SRS0=JMj5=U4=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QIs79nLw1DQGpLfg0kiQV5tX0wu0zvBJsW4MVHxDmyw=;
        b=Cc4ScFOcY6fietByoaPbvxz9hm4GtLuOZQeD+mfiZ/6ErPYc8T9BdhsLXHHtozH4Of
         2ZZ9oPZ0cH7b9PnysgEZlQqUBjicvsndlw0o6foO9iEK8NHE27MWcGM+CkWGxmB8z0Fw
         YJNf4BVBIBtt+cgRnyVxIz0JbYRPLmgLlqRRv5sO+hEMwitArz6HLpdkJVwxc4J1Xa0j
         9gvTAbZ8FazzGBNNhb7Kcw1DulbaomKuudnxhC4664f7rehyJo9nG4cMDNi77apLbWpR
         NKJHyOMeCzUSu/hNeqDYiCmuDWyveU8Maw4GXq+tUdbMqwyjJ5/j6nkiRGwfFWp+X4pM
         TWvw==
Date: Mon, 18 Apr 2022 08:01:17 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Re: The answer of Quiz C.8 is not quite reasonable
Message-ID: <20220418080117.GC12176@haolee.io>
References: <20220414174225.GA29861@haolee.io>
 <20220417174454.GR4285@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220417174454.GR4285@paulmck-ThinkPad-P17-Gen-1>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Apr 17, 2022 at 10:44:54AM -0700, Paul E. McKenney wrote:
> On Thu, Apr 14, 2022 at 05:42:25PM +0000, Hao Lee wrote:
> > Hi,
> > 
> > At the beginning of C.3.3 we have supposed the cache line containing "a"
> > resides _only_ in _CPU1’s_ cache. I think this is why _CPU0_ has to send
> > a "_read_ invalidate message" to _retrieve_ the cache line and invalid
> > CPU1's cache line.
> > 
> > However, the answer says the reason is the cache line in question
> > contains more than just the variable a. I can't understand the logical
> > relationship between this answer and the question. Am I missing
> > something here? Thanks.
> 
> I added the commit shown below.  Does that help?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 36fe14d5ebe406e331a5d89533fe3187d2019898
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Sun Apr 17 10:41:33 2022 -0700
> 
>     appendix/whymb: Clarify QQ C.8
>     
>     More clearly note the presence of data other than the variable a.
>     
>     Reported-by: Hao Lee <haolee.swjtu@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index 8f607e35..43f1307b 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -821,9 +821,14 @@ Then the sequence of operations might be as follows:
>  	In \cref{seq:app:whymb:Store Buffers and Memory Barriers} above,
>  	why does CPU~0 need to issue a ``read invalidate''
>  	rather than a simple ``invalidate''?
> +	After all, \co{foo()} will overwrite \co{a} in any case, so why
> +	should it care about the old value of \co{a}?

Totally clear!

And we may also need to add some details to C.3.1:

	With the addition of these store buffers, CPU 0 can simply
	record its write in its store buffer and continue executing.
	When the cache line does finally make its way from CPU 1 to CPU
	0, the data will be moved from the store buffer to the cache
	line.

This passage explains why we need a store buffer, but I think the data
in store buffer won't be moved directly to the cache line.
Instead, the store buffer must be merged with the cache line responded
by CPU1, and only after that can it be moved to CPU0's cache line.

Thanks,
Hao Lee

>  }\QuickQuizAnswer{
> -	Because the cache line in question contains more than just the
> +	Because the cache line in question contains more data than just the
>  	variable \co{a}.
> +	Issuing ``invalidate'' instead of the needed ``read invalidate''
> +	would cause that other data to be lost, which would constitute
> +	a serious bug in the hardware.
>  }\QuickQuizEnd
>  
>  The hardware designers cannot help directly here, since the CPUs have
