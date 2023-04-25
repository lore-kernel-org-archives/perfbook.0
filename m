Return-Path: <SRS0=gvYa=AQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682436842; x=1685028842;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ll/H5x0ZSBYqcRKYJKRk7KthKKWkad6yQ6oZJPpKCyc=;
        b=EAU4Nj+euZuES0xmulMsspGEy2nUFHDMLN17LR1YPe8z7lt+YyxyHKyZpSZhIEnkTo
         titH29hYH9PHIcP4jZrOFSaV8wT4JUlPxbCP8a114o2sJCWxyl2Oin4E7iz6bML30foy
         vRHDIwSIAssHot38n1xGdHCevs0DTS8NOFzAyF63Bl8ct+JVuulE16n8VfPdI+4cwRDx
         Bk5h9R6ou566VA1lpZ8q3lopUbW55mOIB+jvOaugxYtvVTfgMm+xNaAmtOozhk6OUgJq
         Qxux6pqEeHxPVPrOgPBuHipi3Z1R7oijP/hc8Y0i+Qcsf3clMNtpm0l+Haoz/xGFPkGF
         J3nw==
Message-ID: <25bd5e72-0d70-3268-afa4-7a6ba0febcfa@gmail.com>
Date: Wed, 26 Apr 2023 00:33:58 +0900
MIME-Version: 1.0
Subject: Re: Question: Why does the modification of seq in write_seqlock not
 require WRITE_ONCE?
References: <77ACB1FE-73A2-4C0D-A4EE-67D108DA539C@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <77ACB1FE-73A2-4C0D-A4EE-67D108DA539C@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

On Tue, 25 Apr 2023 21:52:48 +0800, Alan Huang wrote:
> Hi,
>=20
> I noticed that the modifications of seq in write_seqlock and write_sequ=
nlock of Listing 9.10 use plain ++ operation.
> But as Chapter 4 (especially 4.3.4.4) says, there will be store tearing=
 since there are concurrent readers.
>=20
> However, the kernel implementation of sequence lock also uses plain ++ =
operation.
>=20
> I=E2=80=99m somewhat confused.
>=20
> Why does the modification of seq in write_seqlock not require WRITE_ONC=
E?

Good question...

I don't have a straight answer, but the history of include/linux/seqlock.=
h
says those plain increments predate the introduction of ACCESS_ONCE
(predecessor to READ_ONCE/WRITE_ONCE) to the Linux kernel.

The code at the time (pre v2.6.0) looked like this:

static inline void write_seqlock(seqlock_t *sl)
{
	spin_lock(&sl->lock);
	++sl->sequence;
	smp_wmb();		=09
}=09

static inline void write_sequnlock(seqlock_t *sl)=20
{
	smp_wmb();
	sl->sequence++;
	spin_unlock(&sl->lock);
}

static inline int write_tryseqlock(seqlock_t *sl)
{
	int ret =3D spin_trylock(&sl->lock);

	if (ret) {
		++sl->sequence;
		smp_wmb();		=09
	}
	return ret;
}

The purpose of WRITE_ONCE() would be to suppress compiler optimization
of write accesses.  In the code above, smp_wmb(), spin_lock(),
spin_unlock(), and spin_trylock() all imply compiler barriers.
So, there is not much room for compilers to optimize the store part
of increments.

I think those plain-looking increments are safe as far as current
compilers are concerned.

Does this explanation help you?

Paul, please chime in if I'm missing something.

        Thanks, Akira

>=20
> Thanks,
> Alan
