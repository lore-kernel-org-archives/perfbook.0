Return-Path: <SRS0=PHIa=6C=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nx5V3NpnJsMyjBzprFEf9Z5dxo7VVl9bm3jmeNKwB6Y=;
        b=RTMi3VrDgj9AH/jid+8gDarBiftNAmuhaybs+mvh8LKvW/zPGq06d1wtYfgDfuDrmY
         cMBksFlt8xQl2aAwQm1k5EtQIoF0VnFsj+fVflJT1lYnzUyQ/JANm7hEt5u89fnnVAlK
         b7ekAkGRXbYUiW5OkkGuLLY2h2rvSjNCgB7Hvj+FMvbOy747UEyAB0alFz00R3VXOXMq
         LHFXPxWDvFWgy/zdvVovuVDp96XuMfEgTRFmUWnmoyixSP4iCHOCx92Gz2DZcbvbagRt
         hPuBMYPIIrR8R6gn3fvgrl1A4ccJtnAQZSCehLpTkNuISrsbtl/T377ZBPViTMc6LVB0
         INNg==
Message-ID: <adef59f80e66063fef977449a71b880657e34701.camel@gmail.com>
Subject: Re: [PATCH v1 2/2] utilities/gitlab-ci.yml: Add 'make check' on
 test_codesamples
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Mon, 06 Feb 2023 17:42:37 -0300
In-Reply-To: <f051e079-4b6b-ff27-986d-ccd279ddd952@gmail.com>
References: <20230204033627.67980-1-leobras.c@gmail.com>
	 <20230204033627.67980-2-leobras.c@gmail.com>
	 <20230204045113.GV2948950@paulmck-ThinkPad-P17-Gen-1>
	 <ee7a963b07364d01c33c77e7cebdc1c9f4955904.camel@gmail.com>
	 <f051e079-4b6b-ff27-986d-ccd279ddd952@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, 2023-02-04 at 16:00 +0900, Akira Yokosawa wrote:
> On Sat, 04 Feb 2023 03:09:08 -0300, Leonardo Br=C3=A1s wrote:
> ...
> >=20
> > Thank you Paul!
> >=20
> > It looks like my pipeline failed with:
> >=20
> > sched_setaffinity: Invalid argument
> >=20
> > Which got me to look for some info:
> > - The Gitlab-CI instances are all single-cpu.
> >=20
> > Which got me thinking:
> > - How would we be able to test code for Parallel Programming in a singl=
e cpu?
>=20
> I assume you are using a runner gitlab provides.
> If this is the case, according to the page at gitlab:
>=20
>     https://docs.gitlab.com/ee/ci/runners/saas/linux_saas_runner.html
>=20
> , there are three machine types you can choose.
>=20
>     - Small:  1 vCPU   (default)
>     - Medium: 2 vCPUs
>     - Large:  4 vCPUs  (not available for free subscription)
>=20
> Hope this helps.
>=20
>         Thanks, Akira

Sure it helps. Thanks Akira!

I will send a patch fixing this as soon as I test it first.

Best regards,
Leo

>=20
> >=20
> > Well, I still haven't debugged all this, after I am sure this is the is=
sue, I
> > will reach people from Gitlab and check if is there any solution for th=
is.
> >=20
> > Best regards,
> > Leo
>=20

