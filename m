Return-Path: <SRS0=voED=6D=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ll72TeDWeIfMYQh0IUGt2owb6BrOcq6jj1GAIIjW+0=;
        b=OeZAkOlhZm65MFc6CVEHtqYlwcJk4dDGlzjKEnYOz0nJteo2Zn7ZuUP8aR5/1Mh0VS
         53t+eIt8qLJ3D39MUtnO2cVAjRZkjTUow6T6W3eW06uzJvLHuhsYP06lnQnH+esqi+W9
         prI6pX7abKuQCwT+0Gi7VXaNiqMUPp2PR/HlCEDsfubFX9CPZK0F/Ai3Ml/3e7itXtRJ
         9EZ8pD8jEMr1aHJ1fsZd4PBhvMGhbYvoev/1JRqITr0do+yPFDAPn/004EydWrHx3pBT
         kOHf3FIRUb34Ai6r5RzDHuBfritM5xfYx7AVmOS5dUQdNIVEGzG5xo2atPrAllFgN3pZ
         m9fA==
Message-ID: <5a0ca273c8772e9854f836343816840e1ca31f00.camel@gmail.com>
Subject: Re: [PATCH v1] utilities/gitlab-ci: Change base machine type to
 2-cpu to fix make check
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Tue, 07 Feb 2023 00:34:51 -0300
In-Reply-To: <20230207011740.GV2948950@paulmck-ThinkPad-P17-Gen-1>
References: <20230206205514.442896-1-leobras.c@gmail.com>
	 <e983bd58-3a43-8138-cf57-7f7a44f52cfb@gmail.com>
	 <20230207011740.GV2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, 2023-02-06 at 17:17 -0800, Paul E. McKenney wrote:
> On Tue, Feb 07, 2023 at 09:19:09AM +0900, Akira Yokosawa wrote:
> > On Mon,  6 Feb 2023 17:55:15 -0300, Leonardo Bras wrote:
> > > `make -C CodeSamples/ check` currently fails on Gitlab-CI.
> > >=20
> > > Failure happen on sched_setaffinity:
> > > sched_setaffinity: Invalid argument
> > >=20
> > > Further debuging, it's possible to notice that some tests are trying =
to set
> > > the cpu affinity in CPUs 0 and 1, so at least 2 cpus are needed for t=
he
> > > test to run properly.
> > >=20
> > > Current (default) saas-linux-small-amd64 instances used for testing o=
n
> > > Gitlab-CI only offer a single CPU, which is not enough.
> > >=20
> > > For the test_codesamples pre-test, change the instance type to
> > > saas-linux-medium-amd64 so the tests can run properly.
> > >=20
> > > Fixes: 9217963c ("utilities/gitlab-ci.yml: Add 'make check' on
> > > test_codesamples")
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> >=20
> > Hi,
> >=20
> > I see that this change worked at:
> >=20
> >     https://gitlab.com/linux-kernel/perfbook/-/jobs/3723917786
> >=20
> > So FWIW,
> >=20
> > Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
>=20
> Queued and pushed, thank you both!
>=20
> > I don't have a list of minimum CPU count for programs under
> > CodeSamples/, but I guess there are a few which need more than
> > two CPUs.
> >=20
> > You might need to add conditionals in Makefile to exclude those
> > tests depending on available CPU count.

Sure,
I think my project group (linux-kernel) has an Ultimate subscription for be=
ing
open-source (I recall filling-in a form and getting for that in the past).

So, if it's up to 4 cpus, I think we can manage to test on the Gitlab-ci.

>=20
> In addition, some of the tests may need special command-line arguments.
> For example, most of the tests that take "--smoketest" probably want to
> use that argument for "make check".

For directories with those cases, we could write a script for calling every=
 test
with their command-line arguments, and then call it from the directory's
Makefile.

>=20
> One thought is to take this one directory at a time.  Any better ideas?
>=20
> 							Thanx, Paul

That works for me!

Every directory could have it's own `make check`, and we could call them fr=
om
the CodeSamples directory's `make check`

Thanks,
Leo

>=20
> >         Thanks, Akira
> >=20
> > > ---
> > >  utilities/gitlab-ci.yml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > > index 9545029e..42eda60f 100644
> > > --- a/utilities/gitlab-ci.yml
> > > +++ b/utilities/gitlab-ci.yml
> > > @@ -5,6 +5,7 @@ stages:
> > >    - build
> > > =20
> > >  test_codesamples:
> > > +    tags: [ saas-linux-medium-amd64 ]
> > >      stage: test
> > > =20
> > >      before_script:

