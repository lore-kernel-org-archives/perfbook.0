Return-Path: <SRS0=1cyx=6A=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xv3tQ/YBhoxZrNJrRo+IxcLj+xY8PgwlbXhZO9Bobc=;
        b=iSkRtX5vYJ4LA3ZSHyBS4aFUrjEaDcN7ODd+F4HFno2y9JDfyResyo9AJKrXhxAOUE
         KIsvDvTewyH0LzY7/hQ99sFgntGyqjALfgbOPcO6Kx+TcF6FrcYuzjY1v6fzEo1GdAbz
         Krn6AgNlD3/k309v+4L2vzQxEd6hx6mKVw6pkqfjbYTMImw8MZRCMAdBWxoOzqAuan4L
         3vyXA4/DyzIuxY9sJo2BbCGLe8Lh88Tm6uRWzQuY4hEIWVuUIjV4bBcHSC3VFWluFuaU
         3ALnqzzQcdxlw70a6Q7ZqymOtLgQzyYKpdZ1b5gpgix48xfPzcJgwitENSvJXlylQVkt
         F1UA==
Message-ID: <f051e079-4b6b-ff27-986d-ccd279ddd952@gmail.com>
Date: Sat, 4 Feb 2023 16:00:40 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v1 2/2] utilities/gitlab-ci.yml: Add 'make check' on
 test_codesamples
Content-Language: en-US
References: <20230204033627.67980-1-leobras.c@gmail.com>
 <20230204033627.67980-2-leobras.c@gmail.com>
 <20230204045113.GV2948950@paulmck-ThinkPad-P17-Gen-1>
 <ee7a963b07364d01c33c77e7cebdc1c9f4955904.camel@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ee7a963b07364d01c33c77e7cebdc1c9f4955904.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 04 Feb 2023 03:09:08 -0300, Leonardo Br=C3=A1s wrote:
=2E..
>=20
> Thank you Paul!
>=20
> It looks like my pipeline failed with:
>=20
> sched_setaffinity: Invalid argument
>=20
> Which got me to look for some info:
> - The Gitlab-CI instances are all single-cpu.
>=20
> Which got me thinking:
> - How would we be able to test code for Parallel Programming in a singl=
e cpu?

I assume you are using a runner gitlab provides.
If this is the case, according to the page at gitlab:

    https://docs.gitlab.com/ee/ci/runners/saas/linux_saas_runner.html

, there are three machine types you can choose.

    - Small:  1 vCPU   (default)
    - Medium: 2 vCPUs
    - Large:  4 vCPUs  (not available for free subscription)

Hope this helps.

        Thanks, Akira

>=20
> Well, I still haven't debugged all this, after I am sure this is the is=
sue, I
> will reach people from Gitlab and check if is there any solution for th=
is.
>=20
> Best regards,
> Leo

