Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rmClJ7O7aV3DIRfbwx1Ptlg+H1iaxcPfgZbwioXS/bM=;
 b=HOGL455bga9TX8Z/BEv1aka0ZBOoJFJlB+ImxUrMzYhSjmFD+aSNZr0PT6b1VA1J2R
 9N+sm1WSyQ8DEYKvaYuAU17RSGUp6GeAEFJO6wGCL7UuzXVlqkpPHmEXHguIqBthbnTs
 lOanzgEJpc0SGc7IPJMeGo17dtUosuINAAXoBOO+LkkTAsPDsTeBA1uhUTr+v7Q/Q3ez
 PF0+Sw85kVeULqHgYUw7HTaxB1G43RgkHWmIfZ5H8hl8vejDHDQMvr1kXZ6OXoWfg+uY
 1ih04nQkuonN7MlmUL1yeOT9NZte4/M8mJGB3HT1IwEWPgPG37UpaV3sIeqAiKZhIuAn
 KSrw==
Date: Tue, 9 May 2017 22:45:05 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: The weird re-ordering issue of the Alpha arch'
Message-ID: <20170509144429.GA4868@HP>
References: <20170429142605.GC2536@master>
 <20170501155816.GB3956@linux.vnet.ibm.com> <20170508132523.GA7570@HP>
 <20170508155052.GA3956@linux.vnet.ibm.com> <20170509110758.GA5835@HP>
 <20170509042132.GJ3956@linux.vnet.ibm.com> <20170509155818.GA4123@HP>
 <CABoNC82KixTg6zMfmH19cj1M1SjZXihsGGtk_Cbb4sHtjtA+Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CABoNC82KixTg6zMfmH19cj1M1SjZXihsGGtk_Cbb4sHtjtA+Ag@mail.gmail.com>
To: Junchang Wang <junchangwang@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, May 09, 2017 at 05:03:36PM +0800, Junchang Wang wrote:
> Hi Yubin,
> 
> I never heard that memory barrier instructions can speedup other
> instructions (either read or write). My understanding is that under the
> covers a barrier instruction may need to, for example, flush pipeline to
> maintain program order, and to wait for the propagation of data to other
> CPU cores, which disturbs the normal execution process of other
> instructions instead of accelerating.

Yes you are right. I just messed it up, because, for example, on x86, a write
memory barrier would guarantee that previous writes will arrive at other
processors in their program order (which is not always the case for Alpha). And
that is as if there are something pushing them...So I make that mistake...

Still, I would love to know what is your idea for testing whether this is true.

Thanks,
Yubin

> 
> On Tue, May 9, 2017 at 11:58 PM, Yubin Ruan <ablacktshirt@gmail.com> wrote:
> 
> > On Mon, May 08, 2017 at 09:21:32PM -0700, Paul E. McKenney wrote:
> > > On Tue, May 09, 2017 at 07:08:01PM +0800, Yubin Ruan wrote:
> > > > On Mon, May 08, 2017 at 08:50:52AM -0700, Paul E. McKenney wrote:
> > > > > On Mon, May 08, 2017 at 09:25:28PM +0800, Yubin Ruan wrote:
> > > > > > On Mon, May 01, 2017 at 08:58:16AM -0700, Paul E. McKenney wrote:
> > > > > > > On Sat, Apr 29, 2017 at 10:26:05PM +0800, Yubin Ruan wrote:
> > > > >
> > > > > [ . . . ]
> > > > >
> > > > > > Hmm...that reminds me of some words in the perfbook. In the answer
> > of quick quiz 4.17,
> > > > > > you state that:
> > > > > >
> > > > > >     Memory barrier only enforce ordering among multiple memory
> > references: They do
> > > > > >     absolutely nothing to expedite the propogation of data from
> > one part of the system
> > > > > >     to another. This leads to a quick rule of thumb:  You do not
> > need memory barriers
> > > > > >     unless you are using more than one variable to communicate
> > between multiple threads.
> > > > > >
> > > > > > Is that only true for the Alpha processor? I mean, on platforms
> > other than
> > > > > > Alpha (e.g x86), memory barrier *do* expedite the propogation of
> > data from one
> > > > > > processor/core to other processor/core, even though that is not
> > officially documented.
> > > > >
> > > > > Can you point me at any unofficial documentation of this, for
> > example,
> > > > > any performance measurements indicating that (for example) the mfence
> > > > > instruction speeds up the propagation of previous writes to other
> > CPUs?
> > > >
> > > > Hmm...I might had had too much drug at that moment. What I mean is
> > that, on platform
> > > > like x86, memory barrier instructions(e.g sfence) enforce that the
> > order of some memory
> > > > references are preserved as the same as in the origin processor by
> > another processors.
> > > > However, any speedup is not guaranteed.
> > >
> > > Hey, I was hoping!  ;-)
> >
> > Ah...sorry to dispoint you. :)
> > Maybe some memory barrier instructions do have some speedup side effect to
> > "expedite" the propogation of previous writes. Maybe try to consult some
> > Intel
> > engineer about this...?
> > It would be good to have some experiments to measure this. But currently I
> > don't
> > know how to carry out the experiment myself. Do you have any plan or idea?
> >
> > Thanks,
> > Yubin
> >
> > >
> > >                                                       Thanx, Paul
> > >
> > > > Regards,
> > > > Yubin
> > > >
> > > > > In the absence of such documentation, all I can really do is change
> > > > > "They do absolutely nothing to expedite..." to something like "They
> > are
> > > > > not guaranteed to do anything to expedite..."
> > > > >
> > > > >                                                   Thanx, Paul
> > > > >
> > > > > > ---
> > > > > > Yubin
> > > > > >
> > > > > > > >
> > > > > > > > [1]: https://www.cs.umd.edu/~pugh/java/memoryModel/
> > AlphaReordering.html
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> > --
> > To unsubscribe from this list: send the line "unsubscribe perfbook" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >

