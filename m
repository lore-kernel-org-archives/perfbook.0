Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50188 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726448AbeJ1WDu (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 28 Oct 2018 18:03:50 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9SDJ91t023321
        for <perfbook@vger.kernel.org>; Sun, 28 Oct 2018 09:19:11 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nd57q5e7c-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 28 Oct 2018 09:19:11 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 28 Oct 2018 09:19:11 -0400
Date: Sun, 28 Oct 2018 06:19:07 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
Reply-To: paulmck@linux.ibm.com
References: <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
 <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
 <20181025094516.GO4170@linux.ibm.com>
 <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com>
 <444c8f09-b9b3-9564-2418-a7c93198f2e7@gmail.com>
 <ca3f5f62-be71-7cd0-c251-1c544a8170ca@gmail.com>
 <CABoNC80D9bO6bXi5YfOAA6dJzUEwObHKuYihS5P0-9DdOaK0GQ@mail.gmail.com>
 <5c2c8a25-cc15-d262-34fc-ae5eb1f5d6f6@gmail.com>
 <20181028001723.GJ4170@linux.ibm.com>
 <CABoNC82HM5aTauUv573+7NtnZ060_N=mfdLSjAyfGoz2dk3qNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoNC82HM5aTauUv573+7NtnZ060_N=mfdLSjAyfGoz2dk3qNQ@mail.gmail.com>
Message-Id: <20181028131907.GK4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sun, Oct 28, 2018 at 08:08:21PM +0800, Junchang Wang wrote:
> On Sun, Oct 28, 2018 at 8:17 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
> >
> > On Sat, Oct 27, 2018 at 11:56:54PM +0900, Akira Yokosawa wrote:
> > > On 2018/10/26 08:58:30 +0800, Junchang Wang wrote:
> > > [...]
> > > >
> > > > BTW, I found I'm not good in writing C macro (e.g., cmpxchg). Do you
> > > > know some specification/document on writing C macro functions in
> > > > Linux?
> > >
> > > Although I'm not qualified as a kernel developer,
> > > Linux kernel's "coding style" has a section on this. See:
> > >
> > > https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enums-and-rtl
> > >
> > > In that regard, macros I added in commit b2acf6239a95
> > > ("count: Tweak counttorture.h to avoid segfault") do not meet
> > > the style guide in a couple of ways:
> > >
> > >     1) Inline functions are preferable to macros resembling functions
> > >     2) Macros with multiple statements should be enclosed in a do - while block
> > >     3) ...
> > >
> > > Any idea for improving them is more than welcome!
> >
> > Let's see...
> >
> > #define cmpxchg(ptr, o, n) \
> > ({ \
> >         typeof(*ptr) _____actual = (o); \
> >         \
> >         __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> >                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
> > })
> >
> > We cannot do #1 because cmpxchg() is type-generic, and thus cannot be
> > implemented as a C function.  (C++ could use templates, but we are not
> > writing C++ here.)
> >
> > We cannot do #2 because cmpxchg() must return a value.
> >
> > Indentation is not perfect, but given the long names really cannot be
> > improved all that much, if at all.
> >
> > However, we do have a problem, namely the multiple uses of "o", which
> > would be very bad if "o" was an expression with side-effects.
> >
> > How about the following?
> >
> > #define cmpxchg(ptr, o, n) \
> > ({ \
> >         typeof(*ptr) _____old = (o); \
> >         typeof(*ptr) _____actual = _____old; \
> >         \
> >         __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> >                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)
> >                         ? _____old : _____old + 1; \
> > })
> >
> > This still might have problems with signed integer overflow, but I am
> > inclined to ignore that for the moment.  Because paying attention to it
> > results in something like this:
> >
> > #define cmpxchg(ptr, o, n) \
> > ({ \
> >         typeof(*ptr) _____old = (o); \
> >         typeof(*ptr) _____actual = _____old; \
> >         \
> >         __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> >                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) \
> >                         ? _____old \
> >                         : _____old > 0 ? _____old - 1; : _____old + 1; \
> > })
> >
> > Thoughts?  Most especially, any better ideas?
> >
> 
> Hi Paul and Akira,
> 
> Thanks a lot for the mail. I have been curious about why cmpxchg()
> sticks to returning the old value to notify the caller if the CAS
> operation succeeds. Besides the overflow issue mentioned in Paul's
> last mail, current cmpxchg() can only be used in the control flow of
> "if CAS fails, do something" (Control Flow 1). However, it cannot be
> used in the control flow of "if CAS succeeds, do something" (Control
> Flow 2).
> 
> So another option is that cmpxchg() could just return true or false,
> and if the caller needs the current value of the content of the
> specified memory address, it could read the value out of field *old*.
> Of course, we must adjust the parameters of cmpxchg() slightly by
> passing the address of *old* to the function. Here is how cmpxchg()
> looks like in my mind:
> 
> #define cmpxchg(ptr, o, n) \
> ({ \
>         __atomic_compare_exchange_n(ptr, (void *)(o), (n), 1, \
>                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
> })
> 
> static __inline__ int atomic_cmpxchg(atomic_t *v, int *old, int new)
> {
>         return cmpxchg(&v->counter, old, new);
> }
> 
> Any thoughts? Or did I miss something here? I will send the full patch
> in another thread in case you want to review the code.

The reason perfbook's cmpxchg() returns the old value is that the Linux
kernel's cmpxchg() returns the old value.  The reason that the Linux
kernel's cmpxchg() returns the old value is that doing so allows a tighter
retry loop -- it is not necessary to separately reload the current value.
This does mean that one disadvantage of returning a made-up value is
that the next iteration would likely be starting from the wrong value,
but this should not be a real problem given that spurious failure should
be rare.  After all, if spurious failure is not rare, we have way more
serious performance issues.  ;-)

							Thanx, Paul

