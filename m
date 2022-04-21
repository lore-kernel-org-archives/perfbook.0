Return-Path: <SRS0=6Btf=U7=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QQa6wj26ByfRAZrGhSyOFY5f9ETyggTgTENr6a5Yj90=;
        b=lHeapoOFK7fp7ZIAeepDk5gCgE7/B3AieC2VdFtqA1m0NX/fTs8Zv07o/e9o/T7iQJ
         nwYmtF852sDGdWmMYxGcmTnq4FCBnfcVdIY7hITsQh6B0nS6HMgEA2GOuiBFFvYagIfV
         qKtmM0ziuuHvF2r8ppiRYPGZ4Q1N8nDlHvujFcWq1fzQ1uap/VDutxqH2pOn4IO12F/N
         v1rImlfEHEttCUMEkvMrUdwW/fcNz+XQJuW6gRsBO+P33+DnAOCVRhuWdaM6wrxpevBl
         gu3iISpWu9VgTGo9Tsd34/8DFjmPT/Mt7ni+7/YcySAvmXgea03yVicOxScTkAUPgENQ
         pjoA==
Date: Thu, 21 Apr 2022 13:37:57 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Re: Clarify what the read memory barrier really does
Message-ID: <20220421133757.GB24332@haolee.io>
References: <20220417111726.GA27498@haolee.io>
 <20220417173406.GQ4285@paulmck-ThinkPad-P17-Gen-1>
 <20220418073721.GB12176@haolee.io>
 <20220419173125.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <20220420065729.GA25933@haolee.io>
 <20220421035839.GO4285@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220421035839.GO4285@paulmck-ThinkPad-P17-Gen-1>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, Apr 20, 2022 at 08:58:39PM -0700, Paul E. McKenney wrote:
> On Wed, Apr 20, 2022 at 06:57:29AM +0000, Hao Lee wrote:
> > On Tue, Apr 19, 2022 at 10:31:25AM -0700, Paul E. McKenney wrote:
> > > On Mon, Apr 18, 2022 at 07:37:21AM +0000, Hao Lee wrote:
> > > > On Sun, Apr 17, 2022 at 10:34:06AM -0700, Paul E. McKenney wrote:
> > > > > On Sun, Apr 17, 2022 at 11:17:26AM +0000, Hao Lee wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > I think maybe we can make the following contents more clear:
> > > > > 
> > > > > Too true, and thank you for spotting this!
> > > > > 
> > > > > > Cite from Appendix C.4:
> > > > > > 
> > > > > > 	when a given CPU executes a memory barrier, it marks all the
> > > > > > 	entries currently in its invalidate queue, and forces any
> > > > > > 	subsequent load to wait until all marked entries have been
> > > > > > 	applied to the CPU’s cache.
> > > > > > 
> > > > > > It's obvious that this paragraph means read barrier can flush invalidate
> > > > > > queue.
> > > > > 
> > > > > True, it -could- flush the invalidate queue.  Or it could just force later
> > > > > reads to wait until the invalidate queue drains of its own accord, which
> > > > > is what is actually described in the above passage.  Or it could implement
> > > > > a large number of possible strategies in between these two extremes.
> > > > 
> > > > This is quite interesting. Thanks.
> > > > 
> > > > > 
> > > > > The key point is that C.4 is describing implementation.  And implementation
> > > > > of full memory barriers.
> > > > > 
> > > > > > Cite from Appendix C.5:
> > > > > > 
> > > > > > 	The effect of this is that a read memory barrier orders only
> > > > > > 	loads on the CPU that executes it, so that all loads preceding
> > > > > > 	the read memory barrier will appear to have completed before any
> > > > > > 	load following the read memory barrier.
> > > > > > 
> > > > > > This paragraph means read barrier can prevent Load-Load memory
> > > > > > reordering which is caused by out-of-order execution.
> > > > > 
> > > > > This passage describes the software-visible effects of whatever
> > > > > implementation is actually used for a given system. 
> > > > 
> > > > This explanation makes sense to me. Thanks.
> > > > 
> > > > > Another passage in
> > > > > the preceding paragraph describes what is happening at the implementations
> > > > > level.
> > > > > 
> > > > > > If I understand correctly, read memory barrier has _two functions_, one
> > > > > > is flushing invalidate queue to make the loads following the barrier can
> > > > > > load the latest value, and the other is stalling instruction pipeline to
> > > > > > prevent Load-Load memory reordering. I think these are two completely
> > > > > > different functions and we should make such a summary in the book.
> > > > > 
> > > > > I would instead say that there are two different ways that memory barriers
> > > > > can interact with invalidate queues.  And there are two different
> > > > > levels of abstraction, hardware implementation (buffers and queues)
> > > > > and software-visible effect (ordering).
> > > > > 
> > > > > I queued the commit shown below.  Thoughts?
> > > > > 
> > > > > 							Thanx, Paul
> > > > > 
> > > > > ------------------------------------------------------------------------
> > > > > 
> > > > > commit 1389b9da9760040276f8c53215aaa96d964a0892
> > > > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > > > Date:   Sun Apr 17 10:32:19 2022 -0700
> > > > > 
> > > > >     appendix/whymb: Clarify memory-barrier operation
> > > > >     
> > > > >     Reported-by: Hao Lee <haolee.swjtu@gmail.com>
> > > > >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > > > 
> > > > > diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> > > > > index 8d58483f..8f607e35 100644
> > > > > --- a/appendix/whymb/whymemorybarriers.tex
> > > > > +++ b/appendix/whymb/whymemorybarriers.tex
> > > > > @@ -1233,33 +1233,76 @@ With this change, the sequence of operations might be as follows:
> > > > >  With much passing of MESI messages, the CPUs arrive at the correct answer.
> > > > >  This section illustrates why CPU designers must be extremely careful
> > > > >  with their cache-coherence optimizations.
> > > > > +The key requirement is that the memory barriers provide the appearance
> > > > > +of ordering to the software.
> > > > > +As long as these appearances are maintained, the hardware can carry
> > > > > +out whatever queueing, buffering, marking, stallings, and flushing
> > > > > +optimizations it likes.
> > > > 
> > > > I still have a question here. For the following example cited from
> > > > C.4.3, we know bar() could see the stale value of "a", which is 0. But
> > > > I'm curious why we regard "reading a stale value" as "an appearance of
> > > > reordering". It seems that the two terms are not the same concept.
> > > 
> > > They are indeed different concepts, but the software cannot distinguish
> > > them.
> > 
> > Got it !
> > 
> > > 
> > > > void foo(void)
> > > > {
> > > > 	a = 1;
> > > > 	smp_mb();
> > > > 	b = 1;
> > > > }
> > > > 
> > > > void bar(void)
> > > > {
> > > > 	while (b == 0) continue;
> > > > 	assert(a == 1);
> > > > }
> > > 
> > > Did the bar() function's loads from b and a get reordered?
> > > Or did the bar() function's load from a return a stale value?
> > > 
> > > The bar() function cannot tell the difference.
> > 
> > Ah, this is exactly what I want!
> > I once thought of this explanation, but I'm not sure. Thanks for
> > confirming this!
> 
> I added the following QQ.  Does that help?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 089f8a025a5ce4adc3a8f97b975ed638e8fb7a95
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Wed Apr 20 20:56:22 2022 -0700
> 
>     appendix/whymb: Add stale/reorded QQ
>     
>     Reported-by: Hao Lee <haolee.swjtu@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index 347635a4..2140eb8a 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -857,21 +857,33 @@ Then the sequence of operations might be as follows:
>  \item	CPU~0 receives the cache line containing ``a'' and applies
>  	the buffered store just in time to fall victim to CPU~1's
>  	failed assertion.
> +	\label{seq:app:whymb:Store Buffers and Memory Barriers victim}
>  \end{sequence}
>  
> -\QuickQuiz{
> +\EQuickQuiz{
>  	In \cref{seq:app:whymb:Store Buffers and Memory Barriers} above,
>  	why does CPU~0 need to issue a ``read invalidate''
>  	rather than a simple ``invalidate''?
>  	After all, \co{foo()} will overwrite the variable \co{a} in any
>  	case, so why should it care about the old value of \co{a}?
> -}\QuickQuizAnswer{
> +}\EQuickQuizAnswer{
>  	Because the cache line in question contains more data than just the
>  	variable \co{a}.
>  	Issuing ``invalidate'' instead of the needed ``read invalidate''
>  	would cause that other data to be lost, which would constitute
>  	a serious bug in the hardware.
> -}\QuickQuizEnd
> +}\EQuickQuizEnd
> +
> +\EQuickQuiz{
> +	In \cref{seq:app:whymb:Store Buffers and Memory Barriers victim}
> +	above, did \co{bar()} read a stale value from \co{a}, or did
> +	its reads of \co{b} and \co{a} get reordered?
> +}\EQuickQuizAnswer{
> +	It could be either, depending on the hardware implementation.
> +	And it really does not matter which.
> +	After all, the \co{bar()} function's \co{assert()} cannot tell
> +	the difference!
> +}\EQuickQuizEnd

Pretty helpful!
Other readers can also be inspired by this Quiz. Thanks!

Regards,
Hao Lee
>  
>  The hardware designers cannot help directly here, since the CPUs have
>  no idea which variables are related, let alone how they might be related.
