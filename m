Return-Path: <SRS0=8NM3=AR=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682507963; x=1685099963;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNdGUkOSntBNx3/8m0x3r6mTJ1ePsgljVYSrQc1k8V8=;
        b=GTM+omgwHkYVuVSvhu6xlOl+McThI4YUI7w4TWvMbEz1FuRlI0KZiL2Uo2AvSwCBLv
         1Q24rPuMNH8Elnh6TMkwPaQRCPQFz9SL6ZeM2u03drjyNc7CPO8iHHtzKaYZTJlIzvOK
         PVWm4byJUgxdpQflo/XN3ils6mieEfc1l/Q38q4ATmGzoToQFKFOCN+pS4zPxcZSl+ud
         3W55ShcQRht4ZLTfZCgVkhf/J6HHxW2qXl2kIyrEIMHicJBo6K18V22JASRwDFh8MTdn
         J+zwQDtC5DKFBXr0AxdZqvrYjx0vY6DrtLyharldPneqPwmhQKfcHHf2hsxzdD128JUI
         HY+w==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Question: Why does the modification of seq in write_seqlock not
 require WRITE_ONCE?
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <2f93807e-5137-4ed2-9267-ab3dab24ac57@paulmck-laptop>
Date: Wed, 26 Apr 2023 19:19:02 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <50A530B8-254C-4D88-81ED-096684A3D377@gmail.com>
References: <77ACB1FE-73A2-4C0D-A4EE-67D108DA539C@gmail.com>
 <25bd5e72-0d70-3268-afa4-7a6ba0febcfa@gmail.com>
 <6FDBABBC-7444-4189-A881-147F9D42B041@gmail.com>
 <2f93807e-5137-4ed2-9267-ab3dab24ac57@paulmck-laptop>
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


> 2023=E5=B9=B44=E6=9C=8826=E6=97=A5 01:50=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, Apr 26, 2023 at 01:06:57AM +0800, Alan Huang wrote:
>> Hi Akira,
>>=20
>>> 2023=E5=B9=B44=E6=9C=8825=E6=97=A5 23:33=EF=BC=8CAkira Yokosawa =
<akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> Hi Alan,
>>>=20
>>> On Tue, 25 Apr 2023 21:52:48 +0800, Alan Huang wrote:
>>>> Hi,
>>>>=20
>>>> I noticed that the modifications of seq in write_seqlock and =
write_sequnlock of Listing 9.10 use plain ++ operation.
>>>> But as Chapter 4 (especially 4.3.4.4) says, there will be store =
tearing since there are concurrent readers.
>>>>=20
>>>> However, the kernel implementation of sequence lock also uses plain =
++ operation.
>>>>=20
>>>> I=E2=80=99m somewhat confused.
>>>>=20
>>>> Why does the modification of seq in write_seqlock not require =
WRITE_ONCE?
>>>=20
>>> Good question...
>>>=20
>>> I don't have a straight answer, but the history of =
include/linux/seqlock.h
>>> says those plain increments predate the introduction of ACCESS_ONCE
>>> (predecessor to READ_ONCE/WRITE_ONCE) to the Linux kernel.
>>>=20
>>> The code at the time (pre v2.6.0) looked like this:
>>>=20
>>> static inline void write_seqlock(seqlock_t *sl)
>>> {
>>> spin_lock(&sl->lock);
>>> ++sl->sequence;
>>> smp_wmb();=20
>>> }=20
>>>=20
>>> static inline void write_sequnlock(seqlock_t *sl)=20
>>> {
>>> smp_wmb();
>>> sl->sequence++;
>>> spin_unlock(&sl->lock);
>>> }
>>>=20
>>> static inline int write_tryseqlock(seqlock_t *sl)
>>> {
>>> int ret =3D spin_trylock(&sl->lock);
>>>=20
>>> if (ret) {
>>> ++sl->sequence;
>>> smp_wmb();=20
>>> }
>>> return ret;
>>> }
>>>=20
>>> The purpose of WRITE_ONCE() would be to suppress compiler =
optimization
>>> of write accesses.  In the code above, smp_wmb(), spin_lock(),
>>> spin_unlock(), and spin_trylock() all imply compiler barriers.
>>> So, there is not much room for compilers to optimize the store part
>>> of increments.
>>=20
>> But unsigned long is at least 32 bits, here is the COMPILER BARRIER =
section of Documentation/memory-barriers.txt:
>>=20
>> For example, given an architecture having 16-bit store instructions =
with 7-bit immediate fields, the compiler
>> might be tempted to use two 16-bit store-immediate instructions to =
implement the following 32-bit store:
>> p =3D 0x00010002;
>>=20
>> The kernel defines sequence as unsigned, which is at least 16 bits, I =
don=E2=80=99t know if there exists an architecture having 16-bit store =
instructions with 32-bit unsigned=E2=80=A6
>=20
> There have been CPUs and compilers that would use a pair of 16-bit
> store-immediate instructions to store a 32-bit constant.  I don't know
> of any situation where a compiler would use 16-bit loads or stores for
> a 32-bit increment, but there is no law forbidding the compiler from
> doing so.
>=20
> To answer the higher-level question, once we had the Linux-kernel =
memory
> model in place, I focused more on explaining it and clearly not enough
> on bringing the perfook code samples into line with it.
>=20
> So I would welcome a patch making sequence locking use READ_ONCE()
> and WRITE_ONCE() to do the increments.  The Linux kernel might not
> be so excited about the corresponding patch because it could result
> in slightly worse code being generated, for example, a++ might use
> an x86 add-to-memory instruction while the READ_ONCE()/WRITE_ONCE()
> counterpart would load, increment, and store.  Though I hear rumors =
that
> some compilers might start better optimizing this.

I see. Let=E2=80=99s keep the sample code consistent with kernel=E2=80=99s=
.

Thank you both for the explanation!

Thanks,
Alan

>=20
> Thanx, Paul
>=20
>> Thanks,
>> Alan
>>=20
>>>=20
>>> I think those plain-looking increments are safe as far as current
>>> compilers are concerned.
>>>=20
>>> Does this explanation help you?
>>>=20
>>> Paul, please chime in if I'm missing something.
>>>=20
>>>       Thanks, Akira
>>>=20
>>>>=20
>>>> Thanks,
>>>> Alan


