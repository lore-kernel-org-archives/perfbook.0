Return-Path: <SRS0=VEDh=F4=joelfernandes.org=joel@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1697322378; x=1697927178; darn=kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wdl2vF2AmSe+c372yfR95PyS11MokYzXFhd8kuLkQto=;
        b=KbOnzKNzVErXCBP2G9NYD/XXpcDnAZqKWSD3SCT9Llbx89ue+37sdMioZhBObzyMrD
         tYbe7aOCahJdEFhkbCKh3tb98Fw1gLGF5Y8J34IggusoL4mXDc7vXDDiH4NlE+ZSKheD
         6vMuTWQw0lqquqfYyQjdlgLlyoyogHdhrZXsU=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] memorder: Add info on recent x86 implemenation of smp_mb()
Date: Sat, 14 Oct 2023 18:26:06 -0400
Message-Id: <EDD903B0-E107-441C-88A8-D6D2444184EA@joelfernandes.org>
References: <04335cff-c0f8-41ff-912f-5da9d670786b@gmail.com>
In-Reply-To: <04335cff-c0f8-41ff-912f-5da9d670786b@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

> On Oct 13, 2023, at 11:07 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
>=20
> =EF=BB=BFHi Joel,
>=20
>> On 2023/10/13 10:22, Joel Fernandes (Google) wrote:
>> smp_mb() uses lock;add for x86 in the linux kernel. Add information
>> about the same.
>>=20
>> Cc: paulmck@kernel.org
>> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>> ---
>> Not even build tested, just focused on the content and to keep my promise=
 I'd
>> send this out (better than never sending it) ;-). I appreciate maintainer=
s of
>> perfbook taking this forward ;-). Thanks!
>=20
> I've just tested this...
> And it failed to build.
>=20
> I think I'll post a v2 which will build, with some wordsmithing
> I can think of.
>=20
> A few quick comments below.

Thank you very much for your help! I looked through the v2 and everything LG=
TM.

 - Joel


>=20
>>=20
>> bib/hw.bib            | 8 ++++++++
>=20
> bib/memorymodel.bib looks like a suitable destination.
>=20
>> memorder/memorder.tex | 8 ++++++++
>> 2 files changed, 16 insertions(+)
>>=20
>> diff --git a/bib/hw.bib b/bib/hw.bib
>> index b0885e74..b1dfd119 100644
>> --- a/bib/hw.bib
>> +++ b/bib/hw.bib
>> @@ -1159,3 +1159,11 @@ Luis Stevens and Anoop Gupta and John Hennessy",
>>  note=3D"\url{https://github.com/google/fuzzing/blob/master/docs/silifuzz=
.pdf}",
>> }
>>=20
>> +@unpublished{Tsirkin2017,
>> + Author=3D"Michael S. Tsirkin",
>> + Title=3D"locking/x86: Use LOCK ADD for smp_mb() instead of MFENCE",
> "_" in title needs an escape.
>=20
>> + month=3D"November",
>> + day=3D"10",
>> + year=3D"2017",
>> + note=3D"\url{https://lore.kernel.org/all/tip-450cbdd0125cfa5d7bbf9e2a6b=
6961cc48d29730@git.kernel.org/}",
>> +}
>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>> index 5c978fbe..b28ac4f0 100644
>> --- a/memorder/memorder.tex
>> +++ b/memorder/memorder.tex
>> @@ -6081,6 +6081,14 @@ A few older variants of the x86 CPU have a mode bi=
t that enables out-of-order
>> stores, and for these CPUs, \co{smp_wmb()} must also be defined to
>> be \co{lock;addl}.
>>=20
>> +A 2017 kernel commit by Michael S. Tsirkin replaced \co{mfence} with
>> +\co{lock add} in \co{smp_mb()}, achieving a 60 percent performance
>> +boost~\cite{Tsirkin2017}. The change used a 4-byte negative offset from
>                           ^
> perfbook's LaTeX source convention needs a line break at the end of a
> sentence.
>=20
>> +the \co{SP} to avoid slowness due to false data-dependencies,
>> +instead of directly modifying the \co{SP}. \co{clflush} users still
>> +need to use \co{mfence} for ordering, so they have been converted to use=

>> +\co{mb} instead of \co{smp_mb}, which uses an \co{mfence} as before.
>> +
>> Although newer x86 implementations accommodate self-modifying code
>> without any special instructions, to be fully compatible with
>> past and potential future x86 implementations, a given CPU must
>=20
> Anyway, please wait for my v2.
>=20
>        Thanks, Akira
