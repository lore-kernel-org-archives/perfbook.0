Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j8JE59SN6TDGNBfeQ38F2uVbIZJJjkt0th7TYwP2Xtg=;
 b=deVJJ3CSipQFPjxpHvz9c5eLxYIic71YraIhXelt8iWy4lw3PPayvRU6U3DCVFzR6N
 5NF5/QhoQUfkhS4gjXDsTomMF/yPq9Q2l0YhsRugMG/qRJXxJBSkhKSx0BpdXWVUlB9z
 9MBzMSw3ceteZYemJlfeuDaDrBKq8D6rkthRL2dfomLNmBKOzgsP27a+luklrCFLz9DR
 /pYj5rU5yLVf0QhgPqQZaewVDYcnrjBOcSVoiV0cK/AViulQpEp1wVkx6kIkETdWOLr0
 E5Jlfvm+bXsmiplNMUFq/hoHcz8MuUjIjLPZxYogSd35ZTWLV+UtWPyq/bjltJm0cmik
 zwOA==
Subject: Re: [PATCH] advsync: Adjust context to herd7 litmus test
References: <2e39d17d-bb28-db5b-b8e1-f65b8fa1caa4@gmail.com>
 <20170626165042.GR3721@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b206671c-78ce-5f62-3cc9-eeb4d17ffebe@gmail.com>
Date: Tue, 27 Jun 2017 07:18:12 +0900
MIME-Version: 1.0
In-Reply-To: <20170626165042.GR3721@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/06/26 09:50:42 -0700, Paul E. McKenney wrote:
> On Tue, Jun 27, 2017 at 12:04:14AM +0900, Akira Yokosawa wrote:
>> >From 3db6dc5ae7f71c42f91742064ec38db750f3f25d Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 26 Jun 2017 22:33:30 +0900
>> Subject: [PATCH] advsync: Adjust context to herd7 litmus test
>>
>> Commit 96ab6febd94c ("advsync: Convert memory-misordering table to
>> herd7 litmus test") needs further adjustment.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Queued and pushed, thank you!
> 
> Proofreading the surrounding paragraphs showed some room for improvement,
> so I have queued the following patch.  Thoughts?

Now, they are clear and easy enough for me to see the point.

If you'd like,

Acked-by: Akira Yokosawa <akiyks@gmail.com>

           Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit fb481305ecb2185749586b85dddf38bff3ebd494
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Mon Jun 26 09:49:21 2017 -0700
> 
>     advsync: Wordsmith memory-barriers intro
>     
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 4a2c334728d3..d758cfb70a8c 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -46,27 +46,24 @@ RCU.
>  \end{figure}
>  
>  Unfortunately, these intuitions break down completely in face of
> -code that makes direct use of explicit memory barriers for data structures
> -in shared memory.
> -For example, the litmus test in
> +code that fails to use standard mechanisms.
> +For example, the trivial-seeming litmus test in
>  Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
> -appears to guarantee that the \co{exists} clause is never validated.
> -After all, if \nbco{0:r2=0},\footnote{
> +appears to guarantee that the \co{exists} clause is never satisfied.
> +After all, if \nbco{0:r2=0}\footnote{
>  	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
>  	equals zero.
>  	See Section~\ref{sec:formal:Anatomy of a Litmus Test}
> -	for documention of litmus-test structure.}
> +	for documention of litmus-test nomenclature.}
>  as shown in the \co{exists} clause, we might hope that Thread~\co{P0()}'s
>  load from~\co{x1} must have happened before Thread~\co{P1()}'s store to~\co{x1},
>  which might raise
>  further hopes that Thread~\co{P1()}'s load from~\co{x0} must happen after
>  Thread~\co{P0()}'s store to~\co{x0}, so that \nbco{1:r2=2},
> -which should negate the \co{exits} clause.
> -The example is symmetric, so similar hopeful reasoning might lead
> +thus not satisfying the \co{exists} clause.
> +The example is symmetric, so similar reasoning might lead
>  us to hope that \nbco{1:r2=0} guarantees that \nbco{0:r2=2}.
> -Unfortunately, the lack of memory barriers in
> -Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
> -dashes these hopes.
> +Unfortunately, the lack of memory barriers dashes these hopes.
>  Both the compiler and the CPU are within their rights to reorder
>  the statements within both Thread~\co{P0()} and Thread~\co{P1()},
>  even on relatively strongly ordered systems such as x86.
> @@ -77,8 +74,8 @@ which found that the counter-intuitive ordering happened
>  314 times out of 100,000,000 trials on my x86 laptop.
>  Oddly enough, the perfectly legal outcome where both loads return the
>  value 2 occurred less frequently, in this case, only 167 times.
> -The lesson here is clear: Counterintuitivity does not necessarily
> -imply lower probability!
> +The lesson here is clear: Increased counterintuitivity does not necessarily
> +imply decreased probability!
>  % Run on June 23, 2017:
>  % litmus7 -r 1000 -carch X86 C-SB+o-o+o-o.litmus
>  % Test C-SB+o-o+o-o Allowed
> 
> 

