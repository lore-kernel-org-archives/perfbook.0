Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56215 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S933900AbdBQPfX (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 17
 Feb 2017 10:35:23 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1HFYaVc045269
 for <perfbook@vger.kernel.org>; Fri, 17 Feb 2017 10:35:22 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28npegefwa-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 17 Feb 2017 10:35:22 -0500
Received: from localhost by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 17 Feb
 2017 08:35:21 -0700
Date: Fri, 17 Feb 2017 07:35:17 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Question] different kinds of memory barrier
Reply-To: paulmck@linux.vnet.ibm.com
References: <881f369d-4e5b-a335-6359-c5d7bf1bc086@gmail.com>
 <20170213190600.GJ30506@linux.vnet.ibm.com>
 <79ac9a88-3f3a-5b97-940f-35210a7d9405@gmail.com>
 <20170216185845.GJ30506@linux.vnet.ibm.com>
 <70c1256d-1045-f4df-3423-b326b28ff86d@gmail.com>
 <04e7f34d-4e18-701d-80db-5a57a6e9718b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04e7f34d-4e18-701d-80db-5a57a6e9718b@gmail.com>
Message-Id: <20170217153517.GS30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Feb 17, 2017 at 05:20:30PM +0800, Yubin Ruan wrote:
> 
> 
> On 2017年02月17日 16:45, Yubin Ruan wrote:
> >
> >
> >On 2017年02月17日 02:58, Paul E. McKenney wrote:
> >>On Tue, Feb 14, 2017 at 06:35:05PM +0800, Yubin Ruan wrote:
> >>>On 2017/2/14 3:06, Paul E. McKenney wrote:
> >>>>On Mon, Feb 13, 2017 at 09:55:50PM +0800, Yubin Ruan wrote:
> >>>>>It have been mentioned in the book that there are three kinds of
> >>>>>memory barriers: smp_rmb, smp_wmb, smp_mb
> >>>>>
> >>>>>I am confused about their actual semantic:
> >>>>>
> >>>>>The book says that(B.5 paragraph 2, perfbook2017.01.02a):
> >>>>>
> >>>>>for smp_rmb():
> >>>>>   "The effect of this is that a read memory barrier orders
> >>>>>    only loads on the CPU that executes it, so that all loads
> >>>>>    preceding the read memory barrier will appear to have
> >>>>>    completed before any load following the read memory
> >>>>>    barrier"
> >>>>>
> >>>>>for smp_wmb():
> >>>>>   "so that all stores preceding the write memory barrier will
> >>>>>    appear to have completed before any store following the
> >>>>>    write memory barrier"
> >>>>>
> >>>>>I wonder, is there any primitive "X" which can guarantees:
> >>>>>   "that all 'loads' preceding the X will appear to have completed
> >>>>>    before any *store* following the X "
> >>>>>
> >>>>>and similarly:
> >>>>>   "that all 'store' preceding the X will appear to have completed
> >>>>>    before any *load* following the X "
> >>>
> >>>I am reading your the material you provided.
> >>>So, there is no short answer(yes/no) to the questions above?(I mean
> >>>the primitive X)
> >>
> >>For smp_mb(), the full memory barrier, things are pretty simple.
> >>All CPUs will agree that all accesses by any CPU preceding a given
> >>smp_mb() happened before any accesses by that same CPU following that
> >>same smp_mb().  Full memory barriers are also transitive, so that you
> >>can reason (relatively) easily about situations involving many CPUs.
> 
> One more thing about the full memory barrier. You say *all CPU
> agree*. It does not include Alpha, right?

It does include Alpha.  Remember that Alpha's peculiarities occur when
you -don't- have full memory barriers.  If you have a full memory barrier
between each pair of accesses, then everything will be ordered on pretty
much every type of CPU.

The one exception that I am aware of is Itanium, which also requires
that the stores be converted to store-release instructions.

							Thanx, Paul

> regards,
> Yubin Ruan
> 
> >>For smp_rmb() and smp_wmb(), not so much.  The canonical example showing
> >>the complexity of smp_wmb() is called "R":
> >>
> >>    Thread 0        Thread 1
> >>    --------        --------
> >>    WRITE_ONCE(x, 1);    WRITE_ONCE(y, 2);
> >>    smp_wmb();        smp_mb();
> >>    WRITE_ONCE(y, 1);    r1 = READ_ONCE(x);
> >>
> >>One might hope that if the final value of y is 2, then the value of
> >>r1 must be 1.  People hoping this would be disappointed, because
> >>there really is hardware that will allow the outcome y == 1 && r1 == 0.
> >>
> >>See the following URL for many more examples of this sort of thing:
> >>
> >>    https://www.cl.cam.ac.uk/~pes20/ppc-supplemental/test6.pdf
> >>
> >>For more information, including some explanation of the nomenclature,
> >>see:
> >>
> >>    https://www.cl.cam.ac.uk/~pes20/ppc-supplemental/test7.pdf
> >>
> >>There are formal memory models that account for this, and in fact this
> >>appendix is slated to be rewritten based on some work a group of us have
> >>been doing over the past two years or so.  A tarball containing a draft
> >>of this work is attached.  I suggested starting with index.html.  If
> >>you get a chance to look it over, I would value any suggestions that
> >>you might have.
> >>
> >
> >Thanks for your reply. I will take some time to read those materials.
> >Discussions with you really help eliminate some of my doubts. Hopefully
> >we can have more discussions in the future.
> >
> >regards,
> >Yubin Ruan
> >
> >>>>>I know I can use the general smp_mb() for that, but that is a little
> >>>>>too general.
> >>>>>
> >>>>>Do I miss/mix anything ?
> >>>>
> >>>>Well, the memory-ordering material is a bit dated.  There is some work
> >>>>underway to come up with a better model, and I presented on it a couple
> >>>>weeks ago:
> >>>>
> >>>>http://www.rdrop.com/users/paulmck/scalability/paper/LinuxMM.2017.01.19a.LCA.pdf
> >>>>
> >>>>
> >>>>This presentation calls out a tarball that includes some .html files
> >>>>that have much better explanations, and this wording will hopefully
> >>>>be reflected in an upcoming version of the book.  Here is a direct
> >>>>URL for the tarball:
> >>>>
> >>>>http://www.rdrop.com/users/paulmck/scalability/paper/LCA-LinuxMemoryModel.2017.01.15a.tgz
> >>>>
> >>>>
> >>>>                            Thanx, Paul
> >>>>
> >>>
> >>>regrads,
> >>>Yubin Ruan
> >>>
> 

