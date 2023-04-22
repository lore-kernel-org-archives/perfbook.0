Return-Path: <SRS0=Fz29=AN=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682160005; x=1684752005;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIZGZX9qMA1ifx+eHfibRg5+/acB9RAIMjY6ti+Vbg0=;
        b=pnUCbIJU8PucpkoJJ7TdyqukqX3oCeE9EOdoz03G0aE0O7Z+VBqgXt85ahSy3eOgIE
         sMHWUudqpBtLA08X1mzTV9xr2kR5T5I6WIrJKSCfzkyNBgnXl+suARXxsJanHaiAlG0p
         +tENZyvDNh/UALM6p2bPVTl97ofItlZq2Y2dQGzP3kjKdAxWjGNhLpAk0os3ldhsrEkL
         SA7crFGGUs3AGZOmH48SfI6G1RAS6sOcct0/7zLxgh/ppV4KI/nwbNnmVqnOcs/+isSq
         qCV/wV04nmkmtHasdLEi9REdWNHAU+d8JoFcfVA8TI30PjNHuF+yH1C/7pSq0eUGZ+bq
         gBTQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2] CodeSamples/defer: Fix hazard torture
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <20230422103421.1382-1-mmpgouride@gmail.com>
Date: Sat, 22 Apr 2023 18:39:41 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <717329B1-ABDD-457E-8FDA-1733E657C065@gmail.com>
References: <20230422103421.1382-1-mmpgouride@gmail.com>
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi,

I have squashed the two commits , because they are somewhat related.

Thanks,
Alan

> 2023=E5=B9=B44=E6=9C=8822=E6=97=A5 18:34=EF=BC=8CAlan Huang =
<mmpgouride@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Because hp_try_record() must check for concurrent modifications,
> we should not dereference the pointer. The arg of =
hazptr_read_stress_test
> is always NULL, which is designated at time when create the thread,
> therefore, all threads will store their hazard pointer in the same =
slot.
> Also, hazptr_thread_exit will clear their own hazard pointer from
> smp_thread_id() * K.
>=20
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
> CodeSamples/defer/hazptr.h        | 2 +-
> CodeSamples/defer/hazptrtorture.h | 5 ++---
> 2 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
> index 759ab53d..e061303d 100644
> --- a/CodeSamples/defer/hazptr.h
> +++ b/CodeSamples/defer/hazptr.h
> @@ -87,7 +87,7 @@ static inline void *hp_record(void **p, =
//\lnlbl{hr:b}
> void *tmp;
>=20
> do {
> - tmp =3D hp_try_record(*p, hp);
> + tmp =3D hp_try_record(p, hp);
> } while (tmp =3D=3D (void *)HAZPTR_POISON);
> return tmp;
> } //\lnlbl{hr:e}
> diff --git a/CodeSamples/defer/hazptrtorture.h =
b/CodeSamples/defer/hazptrtorture.h
> index 53efa259..acdd532b 100644
> --- a/CodeSamples/defer/hazptrtorture.h
> +++ b/CodeSamples/defer/hazptrtorture.h
> @@ -99,7 +99,7 @@ void *hazptr_read_perf_test(void *arg)
> {
> int i;
> int me =3D (long)arg;
> - int base =3D me * K;
> + int base =3D smp_thread_id() * K;
> long long n_reads_local =3D 0;
> hazptr_head_t hh;
> hazptr_head_t *hhp =3D &hh;
> @@ -241,8 +241,7 @@ DEFINE_PER_THREAD(long long =
[HAZPTR_STRESS_PIPE_LEN + 1], hazptr_stress_count);
>=20
> void *hazptr_read_stress_test(void *arg)
> {
> - int me =3D (int)(long)arg;
> - int base =3D me * K;
> + int base =3D smp_thread_id() * K;
> struct hazptr_stress *p;
> int pc;
>=20
> --=20
> 2.34.1
>=20

