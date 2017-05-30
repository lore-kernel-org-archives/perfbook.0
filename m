Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=OtlDkUuNuvXtwAqGeizUfGmGPetLZkEnMEAsF/HGsKI=;
 b=ahFg9kS5qcbJfMXJwSCBiaNwuF7ZPxi2QYD65D479zD3nR75+5dSSEXX8ZSxJrNTsU
 Z4JkvR5X2ZaIJIonz+ViQGS/D8GVaGpsR4HLd0tHt5B1gt27n0XO0uGHgsYDsenwu+Hu
 dq5Bo0FdIYeFXuj/7X9GRLuuKQH6WZwWbw64ELuRQCF0OtBdaUPzM+rHs83fUPT2Zzar
 s3G2T/fDhxXyswioUn0K/TUUQZe5EYP4MnnTcT+cHBThtzVjNMm9VOGAQ+GkOYRRuHG7
 A+0X12PYU36OQmOtUtQKmS8gL1MUPJ7AcJdJ6kStn+4BUr7DdlUldbctP/BsmtVc2mUx
 tFQA==
Content-Type: text/plain;	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 0/4] CodeSamples: Cleanups and fixes
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20170530000255.GQ3956@linux.vnet.ibm.com>
Date: Tue, 30 May 2017 10:44:09 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <98FADA60-C3DC-4C64-BC5D-496570B98413@gmail.com>
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <20170530000255.GQ3956@linux.vnet.ibm.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

2017/05/30 9:02=E3=80=81Paul E. McKenney <paulmck@linux.vnet.ibm.com> =E3=81=
=AE=E3=83=A1=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8:

> On Tue, May 30, 2017 at 07:13:23AM +0900, Akira Yokosawa wrote:
>>> =46rom fd5fb9afb6b99b15370a9823b42fa2a92342b92a Mon Sep 17 00:00:00 2001=

>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 30 May 2017 06:52:40 +0900
>> Subject: [RFC PATCH 0/4] CodeSamples: Cleanups and fixes
>>=20
>> Hi Paul,
>>=20
>> While I was looking around CodeSamples, I encountered several
>> warnings in build and an infinite loop in one of sample codes.
>> Also, I found that CodeSamples/api.h and CodeSamples/Makefile.arch
>> can be removed from repository if their recipe are properly
>> written in Makefiles.
>>=20
>> Patch 1 adds rules to generate Makefile.arch and api.h that
>> suit the architecture of you host. As I don't have ppc64 or
>> arm host environment, I tested it only on x86_32 and x86_64.
>> I'd like to know if it works on ppc64 and arm.
>>=20
>> Patch 2 removes the redundant files.
>=20
> I took the first two, and it is nice to just be able to type "make"
> in the CodeSamples directory!  ;-)

Does this work on ppc64 and arm (whatever arm
platform you have access to)?

>=20
>> Patch 3 and 4 are fixes of warnings and infinite loops.
>=20
> I have some concerns here, and will reply to the patches.
>=20

I see your points. I'll respin.

Thanks, Akira=E2=80=82
(from mobile, might be QP encoded)

>                                Thanx, Paul
>=20
>> Thoughts?
>>=20
>>                 Thanks, Akira
>> --=20
>> Akira Yokosawa (4):
>>  CodeSamples: Add rule to generate Makefile.arch and api.h
>>  CodeSamples: Remove generated files from repository
>>  CodeSamples: Use 'intptr_t' to be compatible with 'void *'
>>  CodeSamples/defer: Add compiler barriers in gettimestampmp.c
>>=20
>> CodeSamples/.gitignore                         |   4 +-
>> CodeSamples/Makefile                           |  18 +
>> CodeSamples/Makefile.arch                      |   6 -
>> CodeSamples/SMPdesign/Makefile                 |   3 +
>> CodeSamples/SMPdesign/matmul.c                 |  13 +-
>> CodeSamples/SMPdesign/smpalloc.c               |  11 +-
>> CodeSamples/advsync/Makefile                   |   3 +
>> CodeSamples/api.h                              | 808 --------------------=
-----
>> CodeSamples/count/Makefile                     |   3 +
>> CodeSamples/datastruct/Issaquah/Makefile       |   3 +
>> CodeSamples/datastruct/Issaquah/existence_test | Bin 26359 -> 0 bytes
>> CodeSamples/datastruct/hash/Makefile           |   3 +
>> CodeSamples/datastruct/log/Makefile            |   3 +
>> CodeSamples/datastruct/skiplist/Makefile       |   3 +
>> CodeSamples/defer/Makefile |   3 +
>> CodeSamples/defer/gettimestampmp.c             |   5 +-
>> CodeSamples/depends.mk                         |  43 ++
>> CodeSamples/intro/Makefile                     |   3 +
>> CodeSamples/intro/threadcreate.c               |   7 +-
>> CodeSamples/locking/Makefile                   |   3 +
>> CodeSamples/toolsoftrade/Makefile              |   3 +
>> 21 files changed, 117 insertions(+), 831 deletions(-)
>> delete mode 100644 CodeSamples/Makefile.arch
>> delete mode 100644 CodeSamples/api.h
>> delete mode 100755 CodeSamples/datastruct/Issaquah/existence_test
>> create mode 100644 CodeSamples/depends.mk
>>=20
>> --=20
>> 2.7.4
>>=20
>=20

