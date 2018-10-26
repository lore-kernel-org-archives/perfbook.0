Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ou+T07SLez4qHZRYG8l60xHu5gVFsevY3FLhXJHdqlU=;
        b=llbGUWPgvHkjon/lfzeLfNav1LYqcJMyV3nOTuLqTQMIUAZNzFUevk1SiP0T/7RMMO
         hbKYo3KlmQqEYrfJ1/jlXBEyRlptU+esQ6GuuVU3Z20JtT/ObsaCVbJBwg9QFkdxRrzA
         bVST4lb5sxBqDOWzcYlUQ4ivNTCgZZYMvx+EVZTcA5khMQEH9eirfpad4eOZK26NGx5w
         3r6vaAEKGf6I8gl8QEbAdx8O+p2Pxu9RGDOOFyqzgbPPQSO0jSuB7u1rcrTIrSI9BX9a
         2Cij1uPTZB0T3ySoW5VUzD7h3FPdg2ogMpmgWhyCTW+mj5tQlROgtYTyWC0+AxCfHOaI
         +6lg==
MIME-Version: 1.0
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
 <20181020163648.GA2674@linux.ibm.com> <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com> <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
 <20181025094516.GO4170@linux.ibm.com> <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com>
 <444c8f09-b9b3-9564-2418-a7c93198f2e7@gmail.com> <ca3f5f62-be71-7cd0-c251-1c544a8170ca@gmail.com>
 <AC7DD2EE-6A2A-401D-9161-41DA658A9075@gmail.com> <73d90afa-5ef1-0acd-ec2d-d44b083b34d8@gmail.com>
In-Reply-To: <73d90afa-5ef1-0acd-ec2d-d44b083b34d8@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sat, 27 Oct 2018 00:06:45 +0800
Message-ID: <CABoNC80_zTmR3XdLSQk-Quo=u5HYgcByjuwctfKhFu=o1SNXEw@mail.gmail.com>
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, Oct 26, 2018 at 7:34 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On 2018/10/26 10:12:19 +0900, Akira Yokosawa wrote:
> > (from mobile, might be QP encoded)
> >
> > 2018/10/26 7:04=E3=80=81Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> >>> On 2018/10/26 0:17, Akira Yokosawa wrote:
> >>>> On 2018/10/25 23:09, Junchang Wang wrote:
> >>>>> On Thu, Oct 25, 2018 at 5:45 PM Paul E. McKenney <paulmck@linux.ibm=
.com> wrote:
> >>>>>
> >>>>>> On Thu, Oct 25, 2018 at 10:11:18AM +0800, Junchang Wang wrote:
> >>>>>> Hi Akira,
> >>>>>>
> >>>>>> Thanks for the mail. My understanding is that PPC uses LL/SC to
> >>>>>> emulate CAS by using a tiny loop. Unfortunately, the LL/SC loop it=
self
> >>>>>> could fail (due to, for example, context switches) even if *ptr eq=
uals
> >>>>>> to old. In such a case, a CAS instruction in actually should retur=
n a
> >>>>>> success. I think this is what the term "spurious fail" describes. =
Here
> >>>>>> is a reference:
> >>>>>> http://liblfds.org/mediawiki/index.php?title=3DArticle:CAS_and_LL/=
SC_Implementation_Details_by_Processor_family
> >>>>>
> >>>>> First, thank you both for your work on this!  And yes, my cmpxchg()=
 code
> >>>>> is clearly quite broken.
> >>>>>
> >>>>>> It seems that __atomic_compare_exchange_n() provides option "weak"=
 for
> >>>>>> performance. I tested these two solutions and got the following
> >>>>>> results:
> >>>>>>
> >>>>>>                           1      4      8     16     32    64
> >>>>>> my patch (ns)     35    34    37    73    142  281
> >>>>>> strong (ns)          39    39    41    79    158  313
> >>>>>
> >>>>> So strong is a bit slower, correct?
> >>>>>
> >>>>>> I tested the performance of count_lim_atomic by varying the number=
 of
> >>>>>> updaters (./count_lim_atomic N uperf) on a 8-core PPC server. The
> >>>>>> first row in the table is the result when my patch is used, and th=
e
> >>>>>> second row is the result when the 4th argument of the function is =
set
> >>>>>> to false(0). It seems performance improves slightly if option "wea=
k"
> >>>>>> is used. However, there is no performance boost as we expected. So
> >>>>>> your solution sounds good if safety is one major concern because
> >>>>>> option "weak" seems risky to me :-)
> >>>>>>
> >>>>>> Another interesting observation is that the performance of LL/SC-b=
ased
> >>>>>> CAS instruction deteriorates dramatically when the number of worki=
ng
> >>>>>> threads exceeds the number of CPU cores.
> >>>>>
> >>>>> If weak is faster, would it make sense to return (~o), that is,
> >>>>> the bitwise complement of the expected arguement, when the weak
> >>>>> __atomic_compare_exchange_n() fails?  This would get the improved
> >>>>> performance (if I understand your results above) while correctly ha=
ndling
> >>>>> the strange (but possible) case where o=3D=3Dn.
> >>>>>
> >>>>> Does that make sense, or am I missing something?
> >>>>
> >>>> Hi Paul and Akira,
> >>>>
> >>>> Yes, the weak version is faster. The solution looks good. But when I
> >>>> tried to use the following patch
> >>>>
> >>>> #define cmpxchg(ptr, o, n) \
> >>>> ({ \
> >>>>        typeof(*ptr) old =3D (o); \
> >>>>        (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
> >>>
> >>> You need a "\" at the end of the line above. (If it was not unintenti=
onally
> >>> wrapped.)
> >>>
> >>> If it was wrapped by your mailer, which is troublesome in sending pat=
ches,
> >>> please refer to:
> >>>
> >>> https://www.kernel.org/doc/html/latest/process/email-clients.html.
> >>>
> >>>> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
> >>>>                                (o) : (~o); \
> >>>> })
> >>>>
> >>>> gcc complains of my use of complement symbol
> >>>>
> >>>> ../api.h:769:12: error: wrong type argument to bit-complement
> >>>>     (o) : (~o); \
> >>>>              ^
> >>>>
> >>>> Any suggestions?
> >>>
> >>> I don't see such error if I add the "\" mentioned above.
> >>> Or do you use some strict error checking option of GCC?
> >>
> >> Ah, I see that the error in compiling CodeSamples/advsync/q.c.
> >>
> >> The call site is:
> >>
> >> struct el *q_pop(struct queue *q)
> >> {
> >>    struct el *p;
> >>    struct el *pnext;
> >>
> >>    for (;;) {
> >>        do {
> >>            p =3D q->head;
> >>            pnext =3D p->next;
> >>            if (pnext =3D=3D NULL)
> >>                return NULL;
> >>        } while (cmpxchg(&q->head, p, pnext) !=3D p);
> >>        if (p !=3D &q->dummy)
> >>            return p;
> >>        q_push(&q->dummy, q);
> >>        if (q->head =3D=3D &q->dummy)
> >>            return NULL;
> >>    }
> >> }
> >>
> >> In this case, p and pnext are pointers, hence the error.
> >> returning (o)+1 instead should be OK in this case.
> >>
> >> But now, "count_lim_atomic 3 hog" says:
> >>
> >>    FAIL: only reached -1829 rather than 0
> >>
> >> on x86_64. Hmm. No such error is observed on POWER8.
> >> Hmm...
> >
> > I tried the same source with (o)+1 on another x86_64 host (Ubuntu 16.04=
).
> >
> > count_lim_atomic hog test runs flawlessly.
> >
> > The host I tried earlier was a bit old SB laptop. I=E2=80=99ll try ther=
e again later.
>
> And I _did_ make a stupid typo there. I tried with "(o+1)", not "(o)+1".
> Apologies...
>
> So all clear for Junchang's patch with Paul's minor tweak.
>
> FWIW, diff of my version looks like the following:
>
> diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthread=
s/api-gcc.h
> index 1dd26ca..2e65998 100644
> --- a/CodeSamples/api-pthreads/api-gcc.h
> +++ b/CodeSamples/api-pthreads/api-gcc.h
> @@ -168,9 +168,8 @@ struct __xchg_dummy {
>  ({ \
>         typeof(*ptr) _____actual =3D (o); \
>         \
> -       (void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n),=
 1, \
> -                                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_=
CST); \
> -       _____actual; \
> +       __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> +                                   __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ?=
 (o) : (o)+1; \
>  })
>
>  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
> ---

Hi Akira,

Thanks a lot. Yes, the patch works for my x86 laptop and servers. I
have submitted the path in an independent thread.


Thanks,
--Junchang





>
>         Thanks, Akira
>
> >
> > Thanks, Akira
> >
> >>
> >> The strong version works both on x86_64 and POWER8.
> >>
> >>        Thanks, Akira
> >>
> >>>
> >>>        Thanks, Akira
> >>>
> >>>>
> >>>> Thanks,
> >>>> --Junchang
> >>>>
> >>>>
> >>>>>
> >>>>>                                                        Thanx, Paul
> >>>>>
> >>>>>> Thanks,
> >>>>>> --Junchang
> >>>>>>
> >>>>>>
> >>>>>>> On Thu, Oct 25, 2018 at 6:05 AM Akira Yokosawa <akiyks@gmail.com>=
 wrote:
> >>>>>>>
> >>>>>>>> On 2018/10/24 23:53:29 +0800, Junchang Wang wrote:
> >>>>>>>> Hi Akira and Paul,
> >>>>>>>>
> >>>>>>>> I checked the code today and the implementation of cmpxchg() loo=
ks
> >>>>>>>> very suspicious to me; Current  cmpxchg() first executes functio=
n
> >>>>>>>> __atomic_compare_exchange_n, and then checks whether the value s=
tored
> >>>>>>>> in field __actual (old) has been changed to decide if the CAS
> >>>>>>>> instruction has been successfully performed. However, I saw the =
*weak*
> >>>>>>>> field is set, which, as far as I know, means
> >>>>>>>> __atomic_compare_exchange_n could fail even if the value of *ptr=
 is
> >>>>>>>> equal to __actual (old). Unfortunately, current cmpxchg will tre=
at
> >>>>>>>> this case as a success because the value of __actual(old) does n=
ot
> >>>>>>>> change.
> >>>>>>>
> >>>>>>> Thanks for looking into this!
> >>>>>>>
> >>>>>>> I also suspected the use of "weak" semantics of
> >>>>>>> __atomic_compare_exchange_n(), but did not quite understand what
> >>>>>>> "spurious fail" actually means. Your theory sounds plausible to m=
e.
> >>>>>>>
> >>>>>>> I've suggested in a private email to Paul to modify the 4th argum=
ent
> >>>>>>> to false(0) as a workaround, which would prevent such "spurious f=
ail".
> >>>>>>>
> >>>>>>> Both approaches looks good to me. I'd defer to Paul on the choice=
.
> >>>>>>>
> >>>>>>>        Thanks, Akira
> >>>>>>>
> >>>>>>>>
> >>>>>>>> This bug happens in both Power8 and ARMv8. It seems it affects
> >>>>>>>> architectures that use LL/SC to emulate CAS. Following patch hel=
ps
> >>>>>>>> solve this issue on my testbeds. Please take a look. Any thought=
s?
> >>>>>>>>
> >>>>>>>> ---
> >>>>>>>> CodeSamples/api-pthreads/api-gcc.h | 8 +++-----
> >>>>>>>> 1 file changed, 3 insertions(+), 5 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/CodeSamples/api-pthreads/api-gcc.h
> >>>>>>>> b/CodeSamples/api-pthreads/api-gcc.h
> >>>>>>>> index 1dd26ca..38a16c0 100644
> >>>>>>>> --- a/CodeSamples/api-pthreads/api-gcc.h
> >>>>>>>> +++ b/CodeSamples/api-pthreads/api-gcc.h
> >>>>>>>> @@ -166,11 +166,9 @@ struct __xchg_dummy {
> >>>>>>>>
> >>>>>>>> #define cmpxchg(ptr, o, n) \
> >>>>>>>> ({ \
> >>>>>>>> -       typeof(*ptr) _____actual =3D (o); \
> >>>>>>>> -       \
> >>>>>>>> -       (void)__atomic_compare_exchange_n(ptr, (void *)&_____act=
ual, (n), 1, \
> >>>>>>>> -                                         __ATOMIC_SEQ_CST, __AT=
OMIC_SEQ_CST); \
> >>>>>>>> -       _____actual; \
> >>>>>>>> +       typeof(*ptr) old =3D (o); \
> >>>>>>>> +       (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
> >>>>>>>> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
> >>>>>>>> +                               (o) : (n); \
> >>>>>>>> })
> >>>>>>>>
> >>>>>>>> static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int n=
ew)
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>
> >>>
> >>
>

