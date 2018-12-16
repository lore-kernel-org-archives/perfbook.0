Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xU2lla9sHYO4RCq9QtWbObAZGYK7QNQU4gwyHBxR5Qo=;
        b=popfE0gnepsswtaAncMiyD9VPvX/xay/119LSXIwLtceQjBv+hhiWhAXILZsyIX3sQ
         Ln+Q8l/0Ymx/JYu8sNN3/JbuwWTXeidm5TAbuev51B8t9NGPfYj6sjqY+OmzbonLQz6J
         8BjOUa27IBD2KbPpAqbG9U/d6a84w/buD8mswPc2We80ThyeymnJhrwLm9vNqWwfSEoY
         dpIxEDHZxeV4UfjHo+pCRYs8x8moDzhcMjKQ6alwG+CFA0oUdhvRImTNEV9qKbCsVbfZ
         CZHlkYOxHpjgb0V1viOemqr/LCUL4I5kYgL48bEpBG60yj8NUR1MfpDN5eNVpN9vE4Rs
         ivMw==
MIME-Version: 1.0
References: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
 <98448fa1-c391-fdfe-22fa-803dacd72749@gmail.com> <43a14ef6-0fba-7619-b385-475940f244ac@gmail.com>
 <de0e1451-8978-416f-f917-486a83c025c6@gmail.com> <CABoNC827xsoJpz3c2udRADMOBH5a_x3yb0dLsNzRFH+2kLWkGg@mail.gmail.com>
 <922ad024-aee3-8ab0-de93-66377384c9dd@gmail.com>
In-Reply-To: <922ad024-aee3-8ab0-de93-66377384c9dd@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 16 Dec 2018 08:55:59 +0800
Message-ID: <CABoNC81VPXZEZGx06qFxrauA0iCLxhwSxrmdeuyBLpXOz-2VWA@mail.gmail.com>
Subject: Re: [PATCH 3/4] CodeSamples: Fix definition of cmpxchg() in api-gcc.h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Dec 15, 2018 at 10:58 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On 2018/12/14 22:32:22 +0800, Junchang Wang wrote:
> > On Thu, Dec 13, 2018 at 11:33 PM Akira Yokosawa <akiyks@gmail.com> wrot=
e:
> >>
> >> On 2018/12/13 00:01:33 +0800, Junchang Wang wrote:
> >>> On 12/11/18 11:42 PM, Akira Yokosawa wrote:
> >>>> From 7e7c3a20d08831cd64b77a4e8d8f693b4725ef89 Mon Sep 17 00:00:00 20=
01
> >>>> From: Akira Yokosawa <akiyks@gmail.com>
> >>>> Date: Tue, 11 Dec 2018 21:37:11 +0900
> >>>> Subject: [PATCH 3/4] CodeSamples: Fix definition of cmpxchg() in api=
-gcc.h
> >>>>
> >>>> Do the same change as CodeSamples/formal/litmus/api.h.
> >>>>
> >>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>>> ---
> >>>>  CodeSamples/api-pthreads/api-gcc.h | 5 +++--
> >>>>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pt=
hreads/api-gcc.h
> >>>> index 3afe340..b66f4b9 100644
> >>>> --- a/CodeSamples/api-pthreads/api-gcc.h
> >>>> +++ b/CodeSamples/api-pthreads/api-gcc.h
> >>>> @@ -168,8 +168,9 @@ struct __xchg_dummy {
> >>>>  ({ \
> >>>>      typeof(*ptr) _____actual =3D (o); \
> >>>>      \
> >>>> -    __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, =
\
> >>>> -                    __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)=
+1; \
> >>>> +    __atomic_compare_exchange_n((ptr), (void *)&_____actual, (n), 0=
, \
> >>>> +                    __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
> >>>> +    _____actual; \
> >>>>  })
> >>>>
> >>>
> >>> Hi Akira,
> >>>
> >>> Another reason that the performance of cmpxchg is catching up with cm=
pxchg_weak is that __ATOMIC_SEQ_CST is replaced by __ATOMIC_RELAXED in this=
 patch. The use of __ATOMIC_RELAXED means if the CAS primitive fails, the r=
elaxed semantic is used, rather than sequential consistent. Following are s=
ome experiment results:
> >>>
> >>> # If __ATOMIC_RELAXED is used for both cmpxchg and cmpxchg_weak
> >>>
> >>> ./count_lim_atomic 64 uperf
> >>> ns/update: 290
> >>>
> >>> ./count_lim_atomic_weak 64 uperf
> >>> ns/update: 301
> >>>
> >>>
> >>> # and then if __ATOMIC_SEQ_CST is used for both cmpxchg and cmpxchg_w=
eak
> >>>
> >>> ./count_lim_atomic 64 uperf
> >>> ns/update: 316
> >>>
> >>> ./count_lim_atomic_weak 64 uperf
> >>> ns/update: 302
> >>>
> >>> ./count_lim_atomic 120 uperf
> >>> ns/update: 630
> >>>
> >>> ./count_lim_atomic_weak 120 uperf
> >>> ns/update: 568
> >>>
> >>> The results show that if we want to ensure sequential consistency whe=
n the CAS primitive fails, cmpxchg_weak performs better than cmpxchg. It se=
ems that the (type of variation, failure_memorder) pair affects performance=
. I know that PPC uses LL/SC to simulate CAS. But what's the relationship b=
etween a simulated CAS and the memory order. This is interesting because as=
 far as I know, PPC and ARM are using LL/SC to simulate atomic primitives s=
uch as CAS and FAA. So FAA might have the same behavior.
> >>>
> >>> In actually, I'm not very clear about the meaning of different types =
of failure memory orders. For example, when should we use __ATOMIC_RELAXED,=
 rather than __ATOMIC_SEQ_CST, if a CAS fails? What happen if __ATOMIC_RELA=
XED is used for x86? The one I'm look at is https://gcc.gnu.org/onlinedocs/=
gcc/_005f_005fatomic-Builtins.html . Do you know some resources about this?=
 I can look into this tomorrow. Thanks.
> >>
> >> Hi Junchang,
> >>
> >> In Linux-kernel speak, Documentation/core-api/atomic.rst says:
> >>
> >> ----------------------------------------------------------------------=
----
> >> atomic_xchg must provide explicit memory barriers around the operation=
. ::
> >>
> >>         int atomic_cmpxchg(atomic_t *v, int old, int new);
> >>
> >> This performs an atomic compare exchange operation on the atomic value=
 v,
> >> with the given old and new values. Like all atomic_xxx operations,
> >> atomic_cmpxchg will only satisfy its atomicity semantics as long as al=
l
> >> other accesses of \*v are performed through atomic_xxx operations.
> >>
> >> atomic_cmpxchg must provide explicit memory barriers around the operat=
ion,
> >> although if the comparison fails then no memory ordering guarantees ar=
e
> >> required.
> >
> > Hi Akira,
> >
> > Thanks for the link which is helpful.
> >
> >>
> >> [snip]
> >>
> >> The routines xchg() and cmpxchg() must provide the same exact
> >> memory-barrier semantics as the atomic and bit operations returning
> >> values.
> >> ----------------------------------------------------------------------=
----
> >>
> >> The 2nd __ATOMIC_RELAXED to __atomic_compare_exchange_n() matches this
> >> lack of requirement.
> >>
> >> On x86_64, __atomic_compare_exchange_n() is translated to the same cod=
e
> >> in both cases  (with the help of litmus7's cross compiling):
> >>
> >> #START _litmus_P1
> >>         xorl    %eax, %eax
> >>         movl    $0, 4(%rsp)
> >>         lock cmpxchgl   %r10d, (%rdx)
> >>         je      .L36
> >>         movl    %eax, 4(%rsp)
> >> .L36:
> >>         movl    4(%rsp), %eax
> >>
> >> There is no difference between the code with __ATOMIC_RELAXED and
> >> the code with __ATOMIC_SEQ_CST as the 2nd parameter. As you can see,
> >> there is no memory barrier instruction emitted.
> >
> > My understanding is that x86 is using the TSO memory model, such that
> > it is unnecessary to add extra barriers. Is that right?
>
> I think so.
>
> >
> >>
> >> On PPC, there is a difference. With __ATOMIC_RELAXED as 2nd parameter,
> >> the code looks like:
> >>
> >> #START _litmus_P1
> >>         sync
> >> .L34:
> >>         lwarx 7,0,9
> >>         cmpwi 0,7,0
> >>         bne 0,.L35
> >>         stwcx. 5,0,9
> >>         bne 0,.L34
> >>         isync
> >> .L35:
> >>
> >> , OTOH with __ATOMIC_SEQ_CST as 2nd argument:
> >>
> >> #START _litmus_P1
> >>         sync
> >> .L34:
> >>         lwarx 7,0,9
> >>         cmpwi 0,7,0
> >>         bne 0,.L35
> >>         stwcx. 5,0,9
> >>         bne 0,.L34
> >> .L35:
> >>         isync
> >>
> >> See the difference of position of label .L35.
> >> (Note that we are talking about strong version of cmpxchg().)
> >>
> >> Does the above example make sense to you?
> >>
> >
> > Yes. It makes sense.
> >
> > For curiosity, I checked the assembly code of weak atomic_cmpxchg (the
> > fourth argument is set to 1) with __ATOMIC_SEQ_CST. The code is shown
> > below:
> >
> > #START _litmus_P3
> >         sync
> >         lwarx 9,0,8
> >         cmpwi 0,9,1
> >         bne 0,.L34
> >         stwcx. 4,0,8
> > .L34:
> >
> > The code shows that the weak atomic_cmpxchg fails because (1) the
> > content of *ptr is not equal to argument old, or (2) the store
> > operation fails because this thread loses reservation for the memory
> > location referenced by ptr. In contrast, the strong atomic_cmpxchg
> > (its assembly code is shown below) contains a while-loop and fails
> > only if (1) *ptr is not equal to argument old. So the weak
> > atomic_cmpxchg could fail "spuriously" and it is the caller's
> > responsibility to retry it.
> >
> > #START _litmus_P1
> >         sync
> > .L34:
> >         lwarx 7,0,9
> >         cmpwi 0,7,0
> >         bne 0,.L35
> >         stwcx. 5,0,9
> >         bne 0,.L34
> > .L35:
> >         isync
> >
> > So for the performance comparison, my hypothesis is that the weak
> > version may perform slightly better at high levels of contention
> > because if there is a "spuriously" failure, atomic_cmpxchg returns
> > immediately, which gives other threads chances to successfully perform
> > their atomic_cmpxchg instructions. For other cases, the strong> atomic_=
cmpxchg works pretty well because it avoids rebuilding
> > arguments old and new. Does that make sense?
>
> Well, as atomic_cmpxchg() is supposed to be inlined,
> it is not easy to tell how the code of count_lim_atomic.c will be
> optimized in the end.
> The performance can vary depending on compiler version.

Got it. Thanks a lot :-).

--Junchang

>
> The point of this sample code is that it scales much better than
> count_atomic.c. In the end, we need to minimize the contention
> of atomic accesses, don't we?
>
>         Thanks, Akira
>
> >
> > Thanks,
> > --Junchang
> >
> >>         Thanks, Akira
> >>
> >>>
> >>>
> >>> --Junchang
> >>>
> >>>
> >>>
> >>>>  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
> >>>>
> >>
>

