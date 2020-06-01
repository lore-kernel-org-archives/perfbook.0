Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgFAXpq (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 1 Jun 2020 19:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591055145;
        bh=GkjRVtNCJE6dGkyX/qoUA+WmXDm9lLr24KYwqVrUO4Y=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Hx5rse0fAljoRJOocbKZ3CujeG0vGgKD9MKXxO52K6Qv8ZQlpiNNo1Bl/reicHvRV
         oay16cQc5+8OPdhZM8+q8/qAJcaXHPZGAaz2XXUb2RTvDccrqOd1RJB8wKy9LBr/y6
         fGPsJMD284AkR8Ct9HpZBNCNI3f480728VkTNzdo=
Date: Mon, 1 Jun 2020 16:45:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] defer: misc updates
Message-ID: <20200601234545.GE29598@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
 <20200531165023.GL2869@paulmck-ThinkPad-P72>
 <fedc50c6-1f06-f223-25df-4001d6457120@gmail.com>
 <20200601011838.GP2869@paulmck-ThinkPad-P72>
 <8ddda3fd-b95f-4558-6d7c-d205d9704575@gmail.com>
 <20200601161349.GB29598@paulmck-ThinkPad-P72>
 <7fed7967-19e2-5d26-9848-4e998586c88c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fed7967-19e2-5d26-9848-4e998586c88c@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jun 02, 2020 at 07:51:31AM +0900, Akira Yokosawa wrote:
> On Mon, 1 Jun 2020 09:13:49 -0700, Paul E. McKenney wrote:
> > On Tue, Jun 02, 2020 at 12:10:06AM +0900, Akira Yokosawa wrote:
> >> On Sun, 31 May 2020 18:18:38 -0700, Paul E. McKenney wrote:
> >>> On Mon, Jun 01, 2020 at 08:11:06AM +0900, Akira Yokosawa wrote:
> >>>> On Sun, 31 May 2020 09:50:23 -0700, Paul E. McKenney wrote:
> >>>>> On Sun, May 31, 2020 at 09:30:44AM +0900, Akira Yokosawa wrote:
> >>>>>> Hi Paul,
> >>>>>>
> >>>>>> This is misc updates in response to your recent updates.
> >>>>>>
> >>>>>> Patch 1/3 treats QQZ annotations for "nq" build.
> >>>>>
> >>>>> Good reminder, thank you!
> >>>>>
> >>>>>> Patch 2/3 adds a paragraph in #9 of FAQ.txt.  The wording may need
> >>>>>> your retouch for fluency.
> >>>>>> Patch 3/3 is an independent improvement of runlatex.sh.  It will avoid
> >>>>>> a few redundant runs of pdflatex when you have some typo in labels/refs.
> >>>>>
> >>>>> Nice, queued and pushed, thank you!
> >>>>>
> >>>>>> Another suggestion to Figures 9.25 and 9.29.
> >>>>>> Wouldn't these graphs look better with log scale x-axis?
> >>>>>>
> >>>>>> X range can be 0.001 -- 10.
> >>>>>>
> >>>>>> You'll need to add a few data points in sub-microsecond critical-section
> >>>>>> duration to show plausible shapes in those regions, though.
> >>>>>
> >>>>> I took a quick look and didn't find any nanosecond delay primitives
> >>>>> in the Linux kernel, but yes, that would be nicer looking.
> >>>>>
> >>>>> I don't expect to make further progress on this particular graph
> >>>>> in the immediate future, but if you know of such a delay primitive,
> >>>>> please don't keep it a secret!  ;-)
> >>>>
> >>>> I find ndelay() defined in include/asm_generic/delay.h.
> >>>> I'm not sure if it works as you would expect, though.
> >>>
> >>> I must be going blind, given that I missed that one!
> >>
> >> :-) :-)
> >>
> >>> I did try it out, and it suffers from about 10% timing errors.  In
> >>> contrast, udelay is usually less than 1%.
> >>
> >> You mean udelay(1)'s error is less than 10ns, whereas ndelay(1000)'s
> >> error is about 100ns?
> > 
> > Yuck.  The 10% was a preliminary eyeballing.  An overnight run showed it
> > to be worst than that.  100ns gets me about 130ns, 200ns gets me about
> > 270ns, and 500ns gets me about 600ns.  So ndelay() is useful only for
> > very short delays.
> 
> To compensate the error, how about doing the appended?
> Yes, this is kind of ugly...
> 
> Another point you should be aware.  It looks like arch/powerpc
> does not have __ndelay defined.  Which means ndelay() would cause
> build error.  Still, I might be missing something.

That is quite clever!  It does turn ndelay(1) into ndelay(0), but it
probably costs more than a nanosecond to do the integer division, so
that shouldn't be a problem.

However, I believe that any such compensatory schemes should be done
within ndelay() rather than by its users.  Plus, as you imply, different
architectures might need different adjustments.  My concern is that
different CPU generations within a given architecture might also need
different adjustments. :-(

							Thanx, Paul

>         Thanks, Akira
> 
> diff --git a/kernel/rcu/refperf.c b/kernel/rcu/refperf.c
> index 5db165ecd465..0a3764ea220c 100644
> --- a/kernel/rcu/refperf.c
> +++ b/kernel/rcu/refperf.c
> @@ -122,7 +122,7 @@ static void un_delay(const int udl, const int ndl)
>         if (udl)
>                 udelay(udl);
>         if (ndl)
> -               ndelay(ndl);
> +               ndelay((ndl * 859) / 1000); // 5 : 2^32/1000000000 (4.295)
>  }
>  
>  static void ref_rcu_read_section(const int nloops)
> 
> 
> 
