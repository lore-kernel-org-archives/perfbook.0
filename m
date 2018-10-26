Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ws3XihMOUO8AEzfsgn9K1n0Duu/zvNfRzC5M6AxGFAA=;
        b=Xqj1GnK0CtXE8GIKsp4UGSLWkhWBic7TyXLki/3HJeK69amy0UoR0ortQSFVKpHb4g
         eAKr+9KCQPF4p35yfRj6zhsHRnRd7r5PgirhKm6q0gByfjDd6Pgu76bcwWdE0Zi5LTax
         LJO5Uimg3T4w72bi5aPUp8hl5Z3F9bCPpEQoi6IK72s3LhPYmI38OHUBXU3zHc0kb/Vn
         78yTw2b8MBryoXbvFLWRW16gs1H7fhw0OLQBP7wUCuJ55wbaXCbx/nQmgT+QXAUuSoDI
         lzCnZVdldZPtfFIAeNdfn6gFoNAXe0YIOLBWUW+i4hKslMfFS0hHqzsxw4dl1sQ/EyMl
         GuIQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ca3f5f62-be71-7cd0-c251-1c544a8170ca@gmail.com>
Date: Fri, 26 Oct 2018 10:12:19 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC7DD2EE-6A2A-401D-9161-41DA658A9075@gmail.com>
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com> <20181020163648.GA2674@linux.ibm.com> <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com> <073797d5-67f7-7426-f895-8004428a84ab@gmail.com> <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com> <20181025094516.GO4170@linux.ibm.com> <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com> <444c8f09-b9b3-9564-2418-a7c93198f2e7@gmail.com> <ca3f5f62-be71-7cd0-c251-1c544a8170ca@gmail.com>
To: Junchang Wang <junchangwang@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

(from mobile, might be QP encoded)

2018/10/26 7:04=E3=80=81Akira Yokosawa <akiyks@gmail.com> wrote:

>> On 2018/10/26 0:17, Akira Yokosawa wrote:
>>> On 2018/10/25 23:09, Junchang Wang wrote:
>>>> On Thu, Oct 25, 2018 at 5:45 PM Paul E. McKenney <paulmck@linux.ibm.com=
> wrote:
>>>>=20
>>>>> On Thu, Oct 25, 2018 at 10:11:18AM +0800, Junchang Wang wrote:
>>>>> Hi Akira,
>>>>>=20
>>>>> Thanks for the mail. My understanding is that PPC uses LL/SC to
>>>>> emulate CAS by using a tiny loop. Unfortunately, the LL/SC loop itself=

>>>>> could fail (due to, for example, context switches) even if *ptr equals=

>>>>> to old. In such a case, a CAS instruction in actually should return a
>>>>> success. I think this is what the term "spurious fail" describes. Here=

>>>>> is a reference:
>>>>> http://liblfds.org/mediawiki/index.php?title=3DArticle:CAS_and_LL/SC_I=
mplementation_Details_by_Processor_family
>>>>=20
>>>> First, thank you both for your work on this!  And yes, my cmpxchg() cod=
e
>>>> is clearly quite broken.
>>>>=20
>>>>> It seems that __atomic_compare_exchange_n() provides option "weak" for=

>>>>> performance. I tested these two solutions and got the following
>>>>> results:
>>>>>=20
>>>>>                           1      4      8     16     32    64
>>>>> my patch (ns)     35    34    37    73    142  281
>>>>> strong (ns)          39    39    41    79    158  313
>>>>=20
>>>> So strong is a bit slower, correct?
>>>>=20
>>>>> I tested the performance of count_lim_atomic by varying the number of
>>>>> updaters (./count_lim_atomic N uperf) on a 8-core PPC server. The
>>>>> first row in the table is the result when my patch is used, and the
>>>>> second row is the result when the 4th argument of the function is set
>>>>> to false(0). It seems performance improves slightly if option "weak"
>>>>> is used. However, there is no performance boost as we expected. So
>>>>> your solution sounds good if safety is one major concern because
>>>>> option "weak" seems risky to me :-)
>>>>>=20
>>>>> Another interesting observation is that the performance of LL/SC-based=

>>>>> CAS instruction deteriorates dramatically when the number of working
>>>>> threads exceeds the number of CPU cores.
>>>>=20
>>>> If weak is faster, would it make sense to return (~o), that is,
>>>> the bitwise complement of the expected arguement, when the weak
>>>> __atomic_compare_exchange_n() fails?  This would get the improved
>>>> performance (if I understand your results above) while correctly handli=
ng
>>>> the strange (but possible) case where o=3D=3Dn.
>>>>=20
>>>> Does that make sense, or am I missing something?
>>>=20
>>> Hi Paul and Akira,
>>>=20
>>> Yes, the weak version is faster. The solution looks good. But when I
>>> tried to use the following patch
>>>=20
>>> #define cmpxchg(ptr, o, n) \
>>> ({ \
>>>        typeof(*ptr) old =3D (o); \
>>>        (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
>>=20
>> You need a "\" at the end of the line above. (If it was not unintentional=
ly
>> wrapped.)
>>=20
>> If it was wrapped by your mailer, which is troublesome in sending patches=
,
>> please refer to:
>>=20
>> https://www.kernel.org/doc/html/latest/process/email-clients.html.
>>=20
>>> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
>>>                                (o) : (~o); \
>>> })
>>>=20
>>> gcc complains of my use of complement symbol
>>>=20
>>> ../api.h:769:12: error: wrong type argument to bit-complement
>>>     (o) : (~o); \
>>>              ^
>>>=20
>>> Any suggestions?
>>=20
>> I don't see such error if I add the "\" mentioned above.
>> Or do you use some strict error checking option of GCC?
>=20
> Ah, I see that the error in compiling CodeSamples/advsync/q.c.
>=20
> The call site is:
>=20
> struct el *q_pop(struct queue *q)
> {
>    struct el *p;
>    struct el *pnext;
>=20
>    for (;;) {
>        do {
>            p =3D q->head;
>            pnext =3D p->next;
>            if (pnext =3D=3D NULL)
>                return NULL;
>        } while (cmpxchg(&q->head, p, pnext) !=3D p);
>        if (p !=3D &q->dummy)
>            return p;
>        q_push(&q->dummy, q);
>        if (q->head =3D=3D &q->dummy)
>            return NULL;
>    }
> }
>=20
> In this case, p and pnext are pointers, hence the error.
> returning (o)+1 instead should be OK in this case.
>=20
> But now, "count_lim_atomic 3 hog" says:
>=20
>    FAIL: only reached -1829 rather than 0
>=20
> on x86_64. Hmm. No such error is observed on POWER8.
> Hmm...

I tried the same source with (o)+1 on another x86_64 host (Ubuntu 16.04).

count_lim_atomic hog test runs flawlessly.

The host I tried earlier was a bit old SB laptop. I=E2=80=99ll try there aga=
in later.

Thanks, Akira

>=20
> The strong version works both on x86_64 and POWER8.
>=20
>        Thanks, Akira
>=20
>>=20
>>        Thanks, Akira
>>=20
>>>=20
>>> Thanks,
>>> --Junchang
>>>=20
>>>=20
>>>>=20
>>>>                                                        Thanx, Paul
>>>>=20
>>>>> Thanks,
>>>>> --Junchang
>>>>>=20
>>>>>=20
>>>>>> On Thu, Oct 25, 2018 at 6:05 AM Akira Yokosawa <akiyks@gmail.com> wro=
te:
>>>>>>=20
>>>>>>> On 2018/10/24 23:53:29 +0800, Junchang Wang wrote:
>>>>>>> Hi Akira and Paul,
>>>>>>>=20
>>>>>>> I checked the code today and the implementation of cmpxchg() looks
>>>>>>> very suspicious to me; Current  cmpxchg() first executes function
>>>>>>> __atomic_compare_exchange_n, and then checks whether the value store=
d
>>>>>>> in field __actual (old) has been changed to decide if the CAS
>>>>>>> instruction has been successfully performed. However, I saw the *wea=
k*
>>>>>>> field is set, which, as far as I know, means
>>>>>>> __atomic_compare_exchange_n could fail even if the value of *ptr is
>>>>>>> equal to __actual (old). Unfortunately, current cmpxchg will treat
>>>>>>> this case as a success because the value of __actual(old) does not
>>>>>>> change.
>>>>>>=20
>>>>>> Thanks for looking into this!
>>>>>>=20
>>>>>> I also suspected the use of "weak" semantics of
>>>>>> __atomic_compare_exchange_n(), but did not quite understand what
>>>>>> "spurious fail" actually means. Your theory sounds plausible to me.
>>>>>>=20
>>>>>> I've suggested in a private email to Paul to modify the 4th argument
>>>>>> to false(0) as a workaround, which would prevent such "spurious fail"=
.
>>>>>>=20
>>>>>> Both approaches looks good to me. I'd defer to Paul on the choice.
>>>>>>=20
>>>>>>        Thanks, Akira
>>>>>>=20
>>>>>>>=20
>>>>>>> This bug happens in both Power8 and ARMv8. It seems it affects
>>>>>>> architectures that use LL/SC to emulate CAS. Following patch helps
>>>>>>> solve this issue on my testbeds. Please take a look. Any thoughts?
>>>>>>>=20
>>>>>>> ---
>>>>>>> CodeSamples/api-pthreads/api-gcc.h | 8 +++-----
>>>>>>> 1 file changed, 3 insertions(+), 5 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/CodeSamples/api-pthreads/api-gcc.h
>>>>>>> b/CodeSamples/api-pthreads/api-gcc.h
>>>>>>> index 1dd26ca..38a16c0 100644
>>>>>>> --- a/CodeSamples/api-pthreads/api-gcc.h
>>>>>>> +++ b/CodeSamples/api-pthreads/api-gcc.h
>>>>>>> @@ -166,11 +166,9 @@ struct __xchg_dummy {
>>>>>>>=20
>>>>>>> #define cmpxchg(ptr, o, n) \
>>>>>>> ({ \
>>>>>>> -       typeof(*ptr) _____actual =3D (o); \
>>>>>>> -       \
>>>>>>> -       (void)__atomic_compare_exchange_n(ptr, (void *)&_____actual,=
 (n), 1, \
>>>>>>> -                                         __ATOMIC_SEQ_CST, __ATOMIC=
_SEQ_CST); \
>>>>>>> -       _____actual; \
>>>>>>> +       typeof(*ptr) old =3D (o); \
>>>>>>> +       (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
>>>>>>> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
>>>>>>> +                               (o) : (n); \
>>>>>>> })
>>>>>>>=20
>>>>>>> static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
>>>>>>>=20
>>>>>>=20
>>>>>=20
>>>>=20
>>=20
>=20

