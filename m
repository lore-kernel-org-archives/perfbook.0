Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58388 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727400AbeJYX6M (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 25 Oct 2018 19:58:12 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9PFO5tK067017
        for <perfbook@vger.kernel.org>; Thu, 25 Oct 2018 11:24:56 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nbf12cyyh-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 25 Oct 2018 11:24:56 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 25 Oct 2018 11:24:55 -0400
Date: Thu, 25 Oct 2018 08:24:50 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
Reply-To: paulmck@linux.ibm.com
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
 <20181020163648.GA2674@linux.ibm.com>
 <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
 <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
 <20181025094516.GO4170@linux.ibm.com>
 <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com>
Message-Id: <20181025152450.GS4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Thu, Oct 25, 2018 at 10:09:22PM +0800, Junchang Wang wrote:
> On Thu, Oct 25, 2018 at 5:45 PM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
> >
> > On Thu, Oct 25, 2018 at 10:11:18AM +0800, Junchang Wang wrote:
> > > Hi Akira,
> > >
> > > Thanks for the mail. My understanding is that PPC uses LL/SC to
> > > emulate CAS by using a tiny loop. Unfortunately, the LL/SC loop itself
> > > could fail (due to, for example, context switches) even if *ptr equals
> > > to old. In such a case, a CAS instruction in actually should return a
> > > success. I think this is what the term "spurious fail" describes. Here
> > > is a reference:
> > > http://liblfds.org/mediawiki/index.php?title=Article:CAS_and_LL/SC_Implementation_Details_by_Processor_family
> >
> > First, thank you both for your work on this!  And yes, my cmpxchg() code
> > is clearly quite broken.
> >
> > > It seems that __atomic_compare_exchange_n() provides option "weak" for
> > > performance. I tested these two solutions and got the following
> > > results:
> > >
> > >                            1      4      8     16     32    64
> > > my patch (ns)     35    34    37    73    142  281
> > > strong (ns)          39    39    41    79    158  313
> >
> > So strong is a bit slower, correct?
> >
> > > I tested the performance of count_lim_atomic by varying the number of
> > > updaters (./count_lim_atomic N uperf) on a 8-core PPC server. The
> > > first row in the table is the result when my patch is used, and the
> > > second row is the result when the 4th argument of the function is set
> > > to false(0). It seems performance improves slightly if option "weak"
> > > is used. However, there is no performance boost as we expected. So
> > > your solution sounds good if safety is one major concern because
> > > option "weak" seems risky to me :-)
> > >
> > > Another interesting observation is that the performance of LL/SC-based
> > > CAS instruction deteriorates dramatically when the number of working
> > > threads exceeds the number of CPU cores.
> >
> > If weak is faster, would it make sense to return (~o), that is,
> > the bitwise complement of the expected arguement, when the weak
> > __atomic_compare_exchange_n() fails?  This would get the improved
> > performance (if I understand your results above) while correctly handling
> > the strange (but possible) case where o==n.
> >
> > Does that make sense, or am I missing something?
> 
> Hi Paul and Akira,
> 
> Yes, the weak version is faster. The solution looks good. But when I
> tried to use the following patch
> 
> #define cmpxchg(ptr, o, n) \
> ({ \
>         typeof(*ptr) old = (o); \
>         (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
>                                 (o) : (~o); \
> })
> 
> gcc complains of my use of complement symbol
> 
> ../api.h:769:12: error: wrong type argument to bit-complement
>      (o) : (~o); \
>               ^
> 
> Any suggestions?

You might need to do this for the macro argument: "(~(o))".

Another possibility is ((o) + 1), which would work for pointers as well
as for integers.

							Thanx, Paul

