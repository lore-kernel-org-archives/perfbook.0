Return-Path: <SRS0=wyJl=UX=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rlzOotKfBHkhjJeNAyrD6/9namTvM3AXYsC7HkouttA=;
        b=DOQTenJI2h1OSF4C73vDZCLsgPx4askS05CNdFwpApg+3OyMrr/Q/yD17MmXGHLDMZ
         VbiqnBYOTHlpRN99MKG/RFS/0sXnkE9lKhQ2N7VkLWJkwwmByeGpCWiGybZvAEsXjmk1
         In4cgF/NZR66TDZACWyYI7E+7PiQQbmHD4G0YKTpaAzyULexsw8DKVn5sohBAA0Oj4Dk
         Hj1b+9Blf99Tk4Bn+grUzrjeM6UfI1ewP5wgu9mc109IVXZmgoWsg/WJxhiHbi3ft2Nc
         8gzYVj43WAvVHqwN8Ow/Px3s1e281IL83kf9BosH4HcnQ34gthKJ1BpkZ4LgjujlT1b+
         g5kQ==
Date: Wed, 13 Apr 2022 04:43:21 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Re: A question about MESI in appendix C.2 Transition (h)
Message-ID: <20220413044321.GA28881@haolee.io>
References: <20220412025559.GA3597@haolee.io>
 <20220413030911.GI4285@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413030911.GI4285@paulmck-ThinkPad-P17-Gen-1>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Apr 12, 2022 at 08:09:11PM -0700, Paul E. McKenney wrote:
> On Tue, Apr 12, 2022 at 02:55:59AM +0000, Hao Lee wrote:
> > Hello,
> > 
> > I have a question about the MESI protocol in appendix C.2.
> > 
> > As said in C.2.1, the cache line in the shared state is up-to-date. And,
> > C.2.2 says implicitly a writeback message is used to writeback a dirty
> > cache line.
> > 
> > Then in C.2.3 Transition (h) Shared->Exculsive, it says:
> > 
> > 	Alternatively, all other CPUs eject this cache line from their
> > 	caches via "writeback" messages (presumably to make room for
> > 	other cache lines), so that this CPU is the last CPU caching it.
> > 
> > As some CPUs share this cache line, it must be clean. I think other CPUs
> > only need to discard the corresponding cache line in their cache without
> > any additional operation when receiving a invalidate message. Why do
> > they need to send a "writeback" message?
> 
> Right you are!  I was failing to push my mind all the way back to
> pure MESI.  Cache-coherence protocols in real use are more complex,
> and do allow several CPUs to share a cacheline that is read-only,
> but for which memory has not yet been updated.
> 
> But for this book, MESI is complex enough!  ;-)
> 
> How does the patch shown below look?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 81c728e6bb06ffa59282f550616c498c8d9f7169
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Tue Apr 12 20:06:31 2022 -0700
> 
>     appendix/whymb: Make Transition (h) do strict MESI
>     
>     The text claimed that CPUs could share a cacheline that was dirty.
>     This is commonly true in real computer systems, but not for the textbook
>     strict-MESI protocol.  So this commit pulls Transition (h) back to
>     strict MESI.
>     
>     Reported-by: Hao Lee <haolee.swjtu@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index b49d5fe8..8d58483f 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -494,11 +494,9 @@ The transition arcs in this figure are as follows:
>  	This CPU realizes that it will soon need to write to some data
>  	item in this cache line, and thus transmits an ``invalidate'' message.
>  	The CPU cannot complete the transition until it receives a full
> -	set of ``invalidate acknowledge'' responses.
> -	Alternatively, all other CPUs eject this cache line from
> -	their caches via ``writeback'' messages (presumably to make room
> -	for other cache lines),
> -	so that this CPU is the last CPU caching it.
> +	set of ``invalidate acknowledge'' responses, indicating that
> +	no other CPU has this cacheline in its cache.
> +	In other words, this CPU is the only CPU caching it.

Thanks. It's clear enough now. Strict MESI is concise and easy to
understand.

Regards,
Hao Lee

>  \item	[Transition (i):]
>  	Some other CPU does an atomic read-modify-write operation on
>  	a data item in a cache line held only in this CPU's cache,
