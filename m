Return-Path: <SRS0=Fz29=AN=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682160109; x=1684752109;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/ags7lML7P2hm0iqK3LSFvMCdQItWJBZNL+aTx/hrg=;
        b=kXIck6pt3YVBORcehkrlIb+itec4VcJLx/5OW8BTkwDKcSTltpGZXjuDEhHgIXMrUB
         z53vyFSiIj/qv6jRztwKvvMjHABWlQvv3JVOA7a15qNU5VOhewTPBg6K16uETpPlTx5d
         WHlm3QWqwTLqE8pLB+XlEtx36LhE/hXoKoPTUOb5yL5thaeqcY0yZb0mGOcTF2KYFOzu
         Nmdg/9h/SJU9BVRRKxzGHNVM601B6U0Ix54tVyFd+AG1e4d4teIxxHf40vld3n0HcDON
         zkfj59gHpc9cm/ZtRdfa2gZlshUuSjYZJA/R/jUpD9vFqu99vAH1faDl2gIQ1A7YBjSP
         Vw5Q==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] CodeSamples/defer: Fix hazard torture
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <f4c9bb03-a9c9-cd05-dba3-503ee1a0f0bf@gmail.com>
Date: Sat, 22 Apr 2023 18:41:31 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E54FF5A-46BE-47B6-A142-8A577A584AFF@gmail.com>
References: <20230420072923.35042-1-mmpgouride@gmail.com>
 <f4c9bb03-a9c9-cd05-dba3-503ee1a0f0bf@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

I have sent patch v2 with a more clear commit message.

Thanks,
Alan

> 2023=E5=B9=B44=E6=9C=8822=E6=97=A5 16:28=EF=BC=8CAkira Yokosawa =
<akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> On Thu, 20 Apr 2023 07:29:23 +0000, Alan Huang wrote:
>> This patch fixes hazard torture.
>=20
> Please describe what bug you are fixing.
>=20
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/defer/hazptr.h        | 2 +-
>> CodeSamples/defer/hazptrtorture.h | 3 +--
>> 2 files changed, 2 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
>> index 759ab53d..e061303d 100644
>> --- a/CodeSamples/defer/hazptr.h
>> +++ b/CodeSamples/defer/hazptr.h
>> @@ -87,7 +87,7 @@ static inline void *hp_record(void **p, =
//\lnlbl{hr:b}
>> void *tmp;
>>=20
>> do {
>> - tmp =3D hp_try_record(*p, hp);
>> + tmp =3D hp_try_record(p, hp);
>=20
> This looks to me fixes the regression introduced by commit
> a082aba85ce0 ("defer/hazptr: Checkpoint for text/code update")
> made back on Apr 1, 2019.
>=20
> Was it an April fool?  I don't know, but Paul planted this bug to
> see if there is somebody who would catch it.  ;-)
>=20
>> } while (tmp =3D=3D (void *)HAZPTR_POISON);
>> return tmp;
>> } //\lnlbl{hr:e}
>> diff --git a/CodeSamples/defer/hazptrtorture.h =
b/CodeSamples/defer/hazptrtorture.h
>> index 53efa259..29761e3d 100644
>> --- a/CodeSamples/defer/hazptrtorture.h
>> +++ b/CodeSamples/defer/hazptrtorture.h
>> @@ -241,8 +241,7 @@ DEFINE_PER_THREAD(long long =
[HAZPTR_STRESS_PIPE_LEN + 1], hazptr_stress_count);
>>=20
>> void *hazptr_read_stress_test(void *arg)
>> {
>> - int me =3D (int)(long)arg;
>> - int base =3D me * K;
>> + int base =3D smp_thread_id() * K;
>=20
> I'm not sure if this change is related to the fix above.
>=20
> Or are you fixing an independent issue?  If so, can you make this part
> a follow-up patch, with the other patch squashed?
>=20
>        Thanks, Akira
>=20
>> struct hazptr_stress *p;
>> int pc;


