Return-Path: <SRS0=PvuL=6A=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NMxUr5dmnUFptqNIiRrBWtwOoekKprB7/I3s8yfT4Ak=;
        b=jNcMYqr/YbUuTLZzVc6kGOHwevwCZyOlO04CatHWp2r2yOqee3gc2xV/BjrZ5DApuI
         bUNEI3zmtNBVJolAyf0e52nguADkUy99UzruaIMuA3kaOD5tQNtzxY2BXlV4+KVIiSJN
         q4uWB7FFvcjlLt2g3xV3py+XfC6ySNYoBFBbNW6DwbvLjNsGTq7Tp5UoEUPUADjNRNL/
         EP2T3EemR03ykfh4SuxpmMFb8GED7ezBSn2J9nqqqDkhnph5v7lwMazCQQ+AttCnWKkl
         cwK3lZ6WNLpS5QEH8au97vXdrakbWpiXPUgNDGA5Dt+JreolA/BQzd3Ux4Gc1Z83Dycu
         SQvQ==
Message-ID: <ee7a963b07364d01c33c77e7cebdc1c9f4955904.camel@gmail.com>
Subject: Re: [PATCH v1 2/2] utilities/gitlab-ci.yml: Add 'make check' on
 test_codesamples
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Sat, 04 Feb 2023 03:09:08 -0300
In-Reply-To: <20230204045113.GV2948950@paulmck-ThinkPad-P17-Gen-1>
References: <20230204033627.67980-1-leobras.c@gmail.com>
	 <20230204033627.67980-2-leobras.c@gmail.com>
	 <20230204045113.GV2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, 2023-02-03 at 20:51 -0800, Paul E. McKenney wrote:
> On Sat, Feb 04, 2023 at 12:36:27AM -0300, Leonardo Bras wrote:
> > Call make -C CodeSamples/ check on test_codesamples, so any runtime err=
or
> > can be detected by Gitlab-CI.
> >=20
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>=20
> I queued and pushed all three, thank you!
>=20
> 							Thanx, Paul
>=20

Thank you Paul!

It looks like my pipeline failed with:

sched_setaffinity: Invalid argument

Which got me to look for some info:
- The Gitlab-CI instances are all single-cpu.

Which got me thinking:
- How would we be able to test code for Parallel Programming in a single cp=
u?

Well, I still haven't debugged all this, after I am sure this is the issue,=
 I
will reach people from Gitlab and check if is there any solution for this.

Best regards,
Leo


> > ---
> >  utilities/gitlab-ci.yml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > index f2cb1c8e..7f50f12a 100644
> > --- a/utilities/gitlab-ci.yml
> > +++ b/utilities/gitlab-ci.yml
> > @@ -12,6 +12,7 @@ test_codesamples:
> > =20
> >      script:
> >          - make -C CodeSamples/
> > +        - make -C CodeSamples/ check
> > =20
> >  generate_pdfs:
> >      stage: build
> > --=20
> > 2.39.1
> >=20

