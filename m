Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38582 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726819AbeJYSRW (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 25 Oct 2018 14:17:22 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9P9iQtO021223
        for <perfbook@vger.kernel.org>; Thu, 25 Oct 2018 05:45:22 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nb93pf4fg-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 25 Oct 2018 05:45:22 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 25 Oct 2018 05:45:20 -0400
Date: Thu, 25 Oct 2018 02:45:16 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
Reply-To: paulmck@linux.ibm.com
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
 <20181020163648.GA2674@linux.ibm.com>
 <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
 <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
Message-Id: <20181025094516.GO4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Thu, Oct 25, 2018 at 10:11:18AM +0800, Junchang Wang wrote:
> Hi Akira,
> 
> Thanks for the mail. My understanding is that PPC uses LL/SC to
> emulate CAS by using a tiny loop. Unfortunately, the LL/SC loop itself
> could fail (due to, for example, context switches) even if *ptr equals
> to old. In such a case, a CAS instruction in actually should return a
> success. I think this is what the term "spurious fail" describes. Here
> is a reference:
> http://liblfds.org/mediawiki/index.php?title=Article:CAS_and_LL/SC_Implementation_Details_by_Processor_family

First, thank you both for your work on this!  And yes, my cmpxchg() code
is clearly quite broken.

> It seems that __atomic_compare_exchange_n() provides option "weak" for
> performance. I tested these two solutions and got the following
> results:
> 
>                            1      4      8     16     32    64
> my patch (ns)     35    34    37    73    142  281
> strong (ns)          39    39    41    79    158  313

So strong is a bit slower, correct?

> I tested the performance of count_lim_atomic by varying the number of
> updaters (./count_lim_atomic N uperf) on a 8-core PPC server. The
> first row in the table is the result when my patch is used, and the
> second row is the result when the 4th argument of the function is set
> to false(0). It seems performance improves slightly if option "weak"
> is used. However, there is no performance boost as we expected. So
> your solution sounds good if safety is one major concern because
> option "weak" seems risky to me :-)
> 
> Another interesting observation is that the performance of LL/SC-based
> CAS instruction deteriorates dramatically when the number of working
> threads exceeds the number of CPU cores.

If weak is faster, would it make sense to return (~o), that is,
the bitwise complement of the expected arguement, when the weak
__atomic_compare_exchange_n() fails?  This would get the improved
performance (if I understand your results above) while correctly handling
the strange (but possible) case where o==n.

Does that make sense, or am I missing something?

							Thanx, Paul

> Thanks,
> --Junchang
> 
> 
> On Thu, Oct 25, 2018 at 6:05 AM Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> > On 2018/10/24 23:53:29 +0800, Junchang Wang wrote:
> > > Hi Akira and Paul,
> > >
> > > I checked the code today and the implementation of cmpxchg() looks
> > > very suspicious to me; Current  cmpxchg() first executes function
> > > __atomic_compare_exchange_n, and then checks whether the value stored
> > > in field __actual (old) has been changed to decide if the CAS
> > > instruction has been successfully performed. However, I saw the *weak*
> > > field is set, which, as far as I know, means
> > > __atomic_compare_exchange_n could fail even if the value of *ptr is
> > > equal to __actual (old). Unfortunately, current cmpxchg will treat
> > > this case as a success because the value of __actual(old) does not
> > > change.
> >
> > Thanks for looking into this!
> >
> > I also suspected the use of "weak" semantics of
> > __atomic_compare_exchange_n(), but did not quite understand what
> > "spurious fail" actually means. Your theory sounds plausible to me.
> >
> > I've suggested in a private email to Paul to modify the 4th argument
> > to false(0) as a workaround, which would prevent such "spurious fail".
> >
> > Both approaches looks good to me. I'd defer to Paul on the choice.
> >
> >         Thanks, Akira
> >
> > >
> > > This bug happens in both Power8 and ARMv8. It seems it affects
> > > architectures that use LL/SC to emulate CAS. Following patch helps
> > > solve this issue on my testbeds. Please take a look. Any thoughts?
> > >
> > > ---
> > >  CodeSamples/api-pthreads/api-gcc.h | 8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/CodeSamples/api-pthreads/api-gcc.h
> > > b/CodeSamples/api-pthreads/api-gcc.h
> > > index 1dd26ca..38a16c0 100644
> > > --- a/CodeSamples/api-pthreads/api-gcc.h
> > > +++ b/CodeSamples/api-pthreads/api-gcc.h
> > > @@ -166,11 +166,9 @@ struct __xchg_dummy {
> > >
> > >  #define cmpxchg(ptr, o, n) \
> > >  ({ \
> > > -       typeof(*ptr) _____actual = (o); \
> > > -       \
> > > -       (void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> > > -                                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
> > > -       _____actual; \
> > > +       typeof(*ptr) old = (o); \
> > > +       (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
> > > __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
> > > +                               (o) : (n); \
> > >  })
> > >
> > >  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
> > >
> >
> 

