Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgFAQNu (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 1 Jun 2020 12:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591028029;
        bh=tjU+jPv0DdQ8BFlpVPEu+Jiy/BA43bnNmxTBi52Y8Ew=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=atVPijYFCEmJsNM9UBDDTcZAnUFQTTfDjtPvARa4nD629clUHrZxRFFbk2Rkcafd8
         8XB1FvGWZFKvt3z/wmqhbC9wF63Fd87pQNV7RE41+O4AJm5/BbY/tqwxsWUFzFKKJv
         uZXYduiAAOU8gBVTWD2hmlZqKPbnwdMI56V3EOw8=
Date: Mon, 1 Jun 2020 09:13:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] defer: misc updates
Message-ID: <20200601161349.GB29598@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
 <20200531165023.GL2869@paulmck-ThinkPad-P72>
 <fedc50c6-1f06-f223-25df-4001d6457120@gmail.com>
 <20200601011838.GP2869@paulmck-ThinkPad-P72>
 <8ddda3fd-b95f-4558-6d7c-d205d9704575@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ddda3fd-b95f-4558-6d7c-d205d9704575@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jun 02, 2020 at 12:10:06AM +0900, Akira Yokosawa wrote:
> On Sun, 31 May 2020 18:18:38 -0700, Paul E. McKenney wrote:
> > On Mon, Jun 01, 2020 at 08:11:06AM +0900, Akira Yokosawa wrote:
> >> On Sun, 31 May 2020 09:50:23 -0700, Paul E. McKenney wrote:
> >>> On Sun, May 31, 2020 at 09:30:44AM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> This is misc updates in response to your recent updates.
> >>>>
> >>>> Patch 1/3 treats QQZ annotations for "nq" build.
> >>>
> >>> Good reminder, thank you!
> >>>
> >>>> Patch 2/3 adds a paragraph in #9 of FAQ.txt.  The wording may need
> >>>> your retouch for fluency.
> >>>> Patch 3/3 is an independent improvement of runlatex.sh.  It will avoid
> >>>> a few redundant runs of pdflatex when you have some typo in labels/refs.
> >>>
> >>> Nice, queued and pushed, thank you!
> >>>
> >>>> Another suggestion to Figures 9.25 and 9.29.
> >>>> Wouldn't these graphs look better with log scale x-axis?
> >>>>
> >>>> X range can be 0.001 -- 10.
> >>>>
> >>>> You'll need to add a few data points in sub-microsecond critical-section
> >>>> duration to show plausible shapes in those regions, though.
> >>>
> >>> I took a quick look and didn't find any nanosecond delay primitives
> >>> in the Linux kernel, but yes, that would be nicer looking.
> >>>
> >>> I don't expect to make further progress on this particular graph
> >>> in the immediate future, but if you know of such a delay primitive,
> >>> please don't keep it a secret!  ;-)
> >>
> >> I find ndelay() defined in include/asm_generic/delay.h.
> >> I'm not sure if it works as you would expect, though.
> > 
> > I must be going blind, given that I missed that one!
> 
> :-) :-)
> 
> > I did try it out, and it suffers from about 10% timing errors.  In
> > contrast, udelay is usually less than 1%.
> 
> You mean udelay(1)'s error is less than 10ns, whereas ndelay(1000)'s
> error is about 100ns?

Yuck.  The 10% was a preliminary eyeballing.  An overnight run showed it
to be worst than that.  100ns gets me about 130ns, 200ns gets me about
270ns, and 500ns gets me about 600ns.  So ndelay() is useful only for
very short delays.

> Looking at the definition of __udelay() and __ndelay() in
> arch/x86/lib/delay.c, the constant 0x10c7 has much effective bits
> than 0x0005. This is likely the cause of difference in errors.

That makes a lot of sense, and thank you for checking!

> >                                           But how about as shown below?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 7d9ab703b0a33ff5f8db330f0bac3dde9deead07
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Sun May 31 18:14:57 2020 -0700
> > 
> >     refperf: Change readdelay module parameter to nanoseconds
> >     
> >     The current units of microseconds are too coarse, so this commit
> >     changes the units to nanoseconds.  However, ndelay is used only for the
> >     nanoseconds with udelay being used for whole microseconds.  For example,
> >     setting refperf.readdelay=1500 results in an ndelay(500) followed by
> >     a udelay(1).
> 
> Your code below looks opposite, udelay(1) + ndelay(500), doesn't it?

Indeed it does!  I will fix this, thank you.

> >     Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/kernel/rcu/refperf.c b/kernel/rcu/refperf.c
> > index 3b72925..96f8ba0 100644
> > --- a/kernel/rcu/refperf.c
> > +++ b/kernel/rcu/refperf.c
> > @@ -66,8 +66,8 @@ torture_param(long, loops, 10000, "Number of loops per experiment.");
> >  torture_param(int, nreaders, -1, "Number of loops per experiment.");
> >  // Number of runs.
> >  torture_param(int, nruns, 30, "Number of experiments to run.");
> > -// Reader delay in microseconds, 0 for no delay.
> > -torture_param(int, readdelay, 0, "Read-side delay in microseconds.");
> > +// Reader delay in nanoseconds, 0 for no delay.
> > +torture_param(int, readdelay, 0, "Read-side delay in nanoseconds.");
> >  
> >  #ifdef MODULE
> >  # define REFPERF_SHUTDOWN 0
> > @@ -111,7 +111,8 @@ struct ref_perf_ops {
> >  	void (*init)(void);
> >  	void (*cleanup)(void);
> >  	void (*readsection)(const int nloops);
> > -	void (*delaysection)(const int nloops, const int ndelay);
> > +	void (*delaysection)(const int nloops,
> > +			     const int udelay, const int ndelay);
> >  	const char *name;
> >  };
> >  
> > @@ -127,13 +128,17 @@ static void ref_rcu_read_section(const int nloops)
> >  	}
> >  }
> >  
> > -static void ref_rcu_delay_section(const int nloops, const int ndelay)
> > +static void
> > +ref_rcu_delay_section(const int nloops, const int udelay, const int ndelay)
> >  {
> >  	int i;
> >  
> >  	for (i = nloops; i >= 0; i--) {
> >  		rcu_read_lock();
> > -		udelay(ndelay);
> > +		if (udelay)
> > +			udelay(udelay);
> > +		if (ndelay)
> > +			ndelay(ndelay);
> >  		rcu_read_unlock();
> >  	}
> >  }
> > @@ -165,14 +170,18 @@ static void srcu_ref_perf_read_section(const int nloops)
> >  	}
> >  }
> >  
> > -static void srcu_ref_perf_delay_section(const int nloops, const int ndelay)
> > +static void srcu_ref_perf_delay_section(const int nloops,
> > +					const int udelay, const int ndelay)
> >  {
> >  	int i;
> >  	int idx;
> >  
> >  	for (i = nloops; i >= 0; i--) {
> >  		idx = srcu_read_lock(srcu_ctlp);
> > -		udelay(ndelay);
> > +		if (udelay)
> > +			udelay(udelay);
> > +		if (ndelay)
> > +			ndelay(ndelay);
> >  		srcu_read_unlock(srcu_ctlp, idx);
> >  	}
> >  }
> > @@ -197,13 +206,17 @@ static void ref_refcnt_section(const int nloops)
> >  	}
> >  }
> >  
> > -static void ref_refcnt_delay_section(const int nloops, const int ndelay)
> > +static void
> > +ref_refcnt_delay_section(const int nloops, const int udelay, const int ndelay)
> >  {
> >  	int i;
> >  
> >  	for (i = nloops; i >= 0; i--) {
> >  		atomic_inc(&refcnt);
> > -		udelay(ndelay);
> > +		if (udelay)
> > +			udelay(udelay);
> > +		if (ndelay)
> > +			ndelay(ndelay);
> >  		atomic_dec(&refcnt);
> >  	}
> >  }
> > @@ -233,13 +246,17 @@ static void ref_rwlock_section(const int nloops)
> >  	}
> >  }
> >  
> > -static void ref_rwlock_delay_section(const int nloops, const int ndelay)
> > +static void
> > +ref_rwlock_delay_section(const int nloops, const int udelay, const int ndelay)
> >  {
> >  	int i;
> >  
> >  	for (i = nloops; i >= 0; i--) {
> >  		read_lock(&test_rwlock);
> > -		udelay(ndelay);
> > +		if (udelay)
> > +			udelay(udelay);
> > +		if (ndelay)
> > +			ndelay(ndelay);
> >  		read_unlock(&test_rwlock);
> >  	}
> >  }
> > @@ -269,13 +286,17 @@ static void ref_rwsem_section(const int nloops)
> >  	}
> >  }
> >  
> > -static void ref_rwsem_delay_section(const int nloops, const int ndelay)
> > +static void
> > +ref_rwsem_delay_section(const int nloops, const int udelay, const int ndelay)
> >  {
> >  	int i;
> >  
> >  	for (i = nloops; i >= 0; i--) {
> >  		down_read(&test_rwsem);
> > -		udelay(ndelay);
> > +		if (udelay)
> > +			udelay(udelay);
> > +		if (ndelay)
> > +			ndelay(ndelay);
> 
> Maybe defining a helper function/macro for this common pattern in rcu.h 
> can ease maintenance cost. Say undelay(udl, ndl)?

Good point!  Updated and currently testing.

Thank you for your review and comments!

							Thanx, Paul

>         Thanks, Akira
> 
> >  		up_read(&test_rwsem);
> >  	}
> >  }
> > @@ -292,7 +313,8 @@ static void rcu_perf_one_reader(void)
> >  	if (readdelay <= 0)
> >  		cur_ops->readsection(loops);
> >  	else
> > -		cur_ops->delaysection(loops, readdelay);
> > +		cur_ops->delaysection(loops,
> > +				      readdelay / 1000, readdelay % 1000);
> >  }
> >  
> >  // Reader kthread.  Repeatedly does empty RCU read-side
> > 
