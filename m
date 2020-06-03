Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgFCBCE (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 2 Jun 2020 21:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591146123;
        bh=YCEh0Z6zHiaHga5LgDt0HMNNRGbuSU/bwvSvKhAgWNs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=NITJLBSeFNf1cio/kwQTjBc+lL0NEmxJbGTb6SfcVAZbX5VZbl0rxXCYxLbZ6ys1p
         m4jXQ8u0UDwhwFSXMHJMIPEGgTXIpp77Esixx065xWDF8syOY/DB8WHiwsI80Dwwiz
         i8KAu8iV90RtWgbFRWfzk55Ql0RIjpa77rQ/brz8=
Date: Tue, 2 Jun 2020 18:02:03 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] defer: misc updates
Message-ID: <20200603010203.GK29598@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200531165023.GL2869@paulmck-ThinkPad-P72>
 <fedc50c6-1f06-f223-25df-4001d6457120@gmail.com>
 <20200601011838.GP2869@paulmck-ThinkPad-P72>
 <8ddda3fd-b95f-4558-6d7c-d205d9704575@gmail.com>
 <20200601161349.GB29598@paulmck-ThinkPad-P72>
 <7fed7967-19e2-5d26-9848-4e998586c88c@gmail.com>
 <20200601234545.GE29598@paulmck-ThinkPad-P72>
 <75823adf-b8e4-f3d8-55f8-522333484e4c@gmail.com>
 <20200602152809.GF29598@paulmck-ThinkPad-P72>
 <fde7efb7-f274-7b1e-2b21-a5e60f10c2d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fde7efb7-f274-7b1e-2b21-a5e60f10c2d0@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 03, 2020 at 08:05:48AM +0900, Akira Yokosawa wrote:
> On Tue, 2 Jun 2020 08:28:09 -0700, Paul E. McKenney wrote:
> > On Tue, Jun 02, 2020 at 11:27:37PM +0900, Akira Yokosawa wrote:
> >> On Mon, 1 Jun 2020 16:45:45 -0700, Paul E. McKenney wrote:
> >>> On Tue, Jun 02, 2020 at 07:51:31AM +0900, Akira Yokosawa wrote:
> >>>> On Mon, 1 Jun 2020 09:13:49 -0700, Paul E. McKenney wrote:
> >>>>> On Tue, Jun 02, 2020 at 12:10:06AM +0900, Akira Yokosawa wrote:
> >>>>>> On Sun, 31 May 2020 18:18:38 -0700, Paul E. McKenney wrote:
> >>>>>>> On Mon, Jun 01, 2020 at 08:11:06AM +0900, Akira Yokosawa wrote:
> >>>>>>>> On Sun, 31 May 2020 09:50:23 -0700, Paul E. McKenney wrote:
> >>>>>>>>> On Sun, May 31, 2020 at 09:30:44AM +0900, Akira Yokosawa wrote:
> >>>>>>>>>> Hi Paul,
> >>>>>>>>>>
> >>>>>>>>>> This is misc updates in response to your recent updates.
> >>>>>>>>>>
> >>>>>>>>>> Patch 1/3 treats QQZ annotations for "nq" build.
> >>>>>>>>>
> >>>>>>>>> Good reminder, thank you!
> >>>>>>>>>
> >>>>>>>>>> Patch 2/3 adds a paragraph in #9 of FAQ.txt.  The wording may need
> >>>>>>>>>> your retouch for fluency.
> >>>>>>>>>> Patch 3/3 is an independent improvement of runlatex.sh.  It will avoid
> >>>>>>>>>> a few redundant runs of pdflatex when you have some typo in labels/refs.
> >>>>>>>>>
> >>>>>>>>> Nice, queued and pushed, thank you!
> >>>>>>>>>
> >>>>>>>>>> Another suggestion to Figures 9.25 and 9.29.
> >>>>>>>>>> Wouldn't these graphs look better with log scale x-axis?
> >>>>>>>>>>
> >>>>>>>>>> X range can be 0.001 -- 10.
> >>>>>>>>>>
> >>>>>>>>>> You'll need to add a few data points in sub-microsecond critical-section
> >>>>>>>>>> duration to show plausible shapes in those regions, though.
> >>>>>>>>>
> >>>>>>>>> I took a quick look and didn't find any nanosecond delay primitives
> >>>>>>>>> in the Linux kernel, but yes, that would be nicer looking.
> >>>>>>>>>
> >>>>>>>>> I don't expect to make further progress on this particular graph
> >>>>>>>>> in the immediate future, but if you know of such a delay primitive,
> >>>>>>>>> please don't keep it a secret!  ;-)
> >>>>>>>>
> >>>>>>>> I find ndelay() defined in include/asm_generic/delay.h.
> >>>>>>>> I'm not sure if it works as you would expect, though.
> >>>>>>>
> >>>>>>> I must be going blind, given that I missed that one!
> >>>>>>
> >>>>>> :-) :-)
> >>>>>>
> >>>>>>> I did try it out, and it suffers from about 10% timing errors.  In
> >>>>>>> contrast, udelay is usually less than 1%.
> >>>>>>
> >>>>>> You mean udelay(1)'s error is less than 10ns, whereas ndelay(1000)'s
> >>>>>> error is about 100ns?
> >>>>>
> >>>>> Yuck.  The 10% was a preliminary eyeballing.  An overnight run showed it
> >>>>> to be worst than that.  100ns gets me about 130ns, 200ns gets me about
> >>>>> 270ns, and 500ns gets me about 600ns.  So ndelay() is useful only for
> >>>>> very short delays.
> >>>>
> >>>> To compensate the error, how about doing the appended?
> >>>> Yes, this is kind of ugly...
> >>>>
> >>>> Another point you should be aware.  It looks like arch/powerpc
> >>>> does not have __ndelay defined.  Which means ndelay() would cause
> >>>> build error.  Still, I might be missing something.
> >>>
> >>> That is quite clever!  It does turn ndelay(1) into ndelay(0), but it
> >>> probably costs more than a nanosecond to do the integer division, so
> >>> that shouldn't be a problem.
> >>>
> >>> However, I believe that any such compensatory schemes should be done
> >>> within ndelay() rather than by its users.
> >>
> >> I'm not brave enough to change the behavior of ndelay() seeing the
> >> number of call sites in kernel code base, especially under drivers/.
> >>
> >> Looking at the updated Figures 9.25 and 9.29, the timing error of
> >> ndelay() results in the discrepancy of "rcu" plots from the ideal
> >> orthogonal lines in sub-microseconds regions (0.1, 0.2, and 0.5us).
> >> I don't think you like such misleading plots.
> >>
> >> You could instead compensate the x-values you give to ndelay().
> >>
> >> On x86, you know the resolution of xdelay() is 1.164153ns.
> >> Which means if you want a time delay of 100ns, ndelay(86) will
> >> be 100.117ns.
> >> ndelay(172) will be 200.234ns and ndelay(429) will be 499.422ns.
> >> ndelay(430) will be 500.586ns, which is the 2nd closest.
> >> If you don't want to exceed 500ns, ndelay(430) would be your choice.
> >>
> >> I think this level of tweak is worthwhile, especially it will
> >> result in a better looking plot of RCU scaling.
> >>
> >> Thoughts?
> > 
> > Huh.
> > 
> > What we could do is to do a calibration pass where we sample a
> > fine-grained timesource, spin on a series of ndelay() calls that last for
> > a few microseconds, then resample the fine-grained timestamp.  We could
> > then do a binary search so as to compute a corrected ndelay argument.
> > We would then need to verify the corrected argument.
> > 
> > This procedure would be architecture independent, and might also account
> > for instruction-stream differences.
> 
> This calibration part could be implemented and tested on a small system,
> assuming you have sub-microsecond ndelay() and fine-grained timer.

Just to be clear, my thought is to do a short calibration cycle on the
system running the actual test as part of refperf initialization.

> For example, powerpc I mentioned earlier uses the fallback definition
> in linux/delay.h:
> 
> 	#ifndef ndelay
> 	static inline void ndelay(unsigned long x)
> 	{
> 		udelay(DIV_ROUND_UP(x, 1000));
> 	}
> 	#define ndelay(x) ndelay(x)
> 	#endif

Indeed, any calibration would need to be careful of this!

> > Is there a better way?  Seems like there should be.  ;-)
> 
> There can be someone already has done a similar thing.

Quite possibly.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >> PS: The bumps in Figures 9.25 and 9.29 in the sub-microsecond region 
> >> might be the effect of difference of instruction stream.
> >> As we have seen in Figure 9.22, slight changes in the code path,
> >> e.g. jump target alignment, can cause 10% -- 20% of performance
> >> difference.
> >>
> >> Enforce inlining un_delay() might or might not help. Just guessing.
> >>
> >>
> >>>                                           Plus, as you imply, different
> >>> architectures might need different adjustments.  My concern is that
> >>> different CPU generations within a given architecture might also need
> >>> different adjustments. :-(
> >>>
> >>> 							Thanx, Paul
> >>>
> >>>>         Thanks, Akira
> >>>>
> >>>> diff --git a/kernel/rcu/refperf.c b/kernel/rcu/refperf.c
> >>>> index 5db165ecd465..0a3764ea220c 100644
> >>>> --- a/kernel/rcu/refperf.c
> >>>> +++ b/kernel/rcu/refperf.c
> >>>> @@ -122,7 +122,7 @@ static void un_delay(const int udl, const int ndl)
> >>>>         if (udl)
> >>>>                 udelay(udl);
> >>>>         if (ndl)
> >>>> -               ndelay(ndl);
> >>>> +               ndelay((ndl * 859) / 1000); // 5 : 2^32/1000000000 (4.295)
> >>>>  }
> >>>>  
> >>>>  static void ref_rcu_read_section(const int nloops)
> >>>>
> >>>>
> >>>>
