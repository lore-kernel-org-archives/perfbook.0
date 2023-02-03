Return-Path: <SRS0=drfo=57=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OlcuR5tvbcKSBy7f75b2lKa6WcqXh9oay9vinKHbe0s=;
        b=YSIdV5g/PTYNdU3J7T7chwApMvU6Yy2he/TYe/Cizhy4Z229CMAz3YXXj1g61ILm8r
         Xj5NAVEX7FsW7/vGeHtgY0ftDskq+OsQcmM3sQmtZqr+UFS5wDQKcmayZmgJ0rDF2bXE
         jdLq+JFSu00QKly3W0NjHPJYwfUu41VoGsykFQinFAbyXYs3DiAY9jnF3PB5OxA+L/74
         e6MUzzuyCjYqyJRdz4/Rd7G8mS6whn0MXsjho9EMRuMkkNTuBfEe/3IceG4lOWPnRDUa
         ugDTDDEYR9WzxFIJ5vvh/0FQPenK26Ey9l7hEnmhSLjomQmWzDEs8mjqVa/vvWkZfe3C
         lnng==
Message-ID: <39a31ffaa40176de5a2996c97e2b4d977d6c258f.camel@gmail.com>
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Thu, 02 Feb 2023 23:19:52 -0300
In-Reply-To: <20230203000517.GB2948950@paulmck-ThinkPad-P17-Gen-1>
References: <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
	 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
	 <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
	 <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
	 <ee2eb78d9575b53080a265c46775d01f0da37214.camel@gmail.com>
	 <11517498-7fc9-2cd5-7cf8-6cb8705abf31@gmail.com>
	 <203c05624258d0eecaae9717c25e9232ff450ee4.camel@gmail.com>
	 <2b276f96-304c-39b4-e237-987ef7f7df2b@gmail.com>
	 <20230202233127.GA2948950@paulmck-ThinkPad-P17-Gen-1>
	 <4ea57882-933b-431d-45bb-ca822679716a@gmail.com>
	 <20230203000517.GB2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 2023-02-02 at 16:05 -0800, Paul E. McKenney wrote:
> On Fri, Feb 03, 2023 at 08:51:04AM +0900, Akira Yokosawa wrote:
> > On Thu, 2 Feb 2023 15:31:27 -0800, Paul E. McKenney wrote:
> > > On Fri, Feb 03, 2023 at 08:23:05AM +0900, Akira Yokosawa wrote:
> > > > Hi,
> > > >=20
> > > > On Thu, 02 Feb 2023 13:52:08 -0300, Leonardo Br=C3=A1s wrote:
> > > > > On Thu, 2023-02-02 at 23:42 +0900, Akira Yokosawa wrote:
> > > > > > On Thu, 02 Feb 2023 01:37:02 -0300, Leonardo Br=C3=A1s wrote:
> > > > > > [...]
> > > > > > >=20
> > > > > > > It looks like it can be done by "Running CI/CD for external r=
epositories".
> > > > >=20
> > > > > Nah, it looks like this won't work either. After my patch on top =
of master, it's
> > > > > already warning about diverging repositories when I try to sync.
> > > > >=20
> > > > > Another solution I could find:
> > > > > - Change the patch I sent before to keep the file on another dire=
ctory, even
> > > > > with a different name: this will not trigger the build for anyone=
.
> > > > > - Change my repository config to trigger the CI from that file.
> > > > >=20
> > > > > The file would only be a random YML file in the repo.
> > > > > Would that be ok?
> > > >=20
> > > > Hmm, yes, I think I can live with it.

Great!=20

I created a patch for including the new yml file.

I created a new repo mirroring from the kernel.org repo, and created a new
branch with the above patch. Nothing happened on push.

Then I configured the correct yml file on Gitlab (details on the patch), an=
d a
new push trigered the pipelines, so the desired effect was achieved.

> > > >=20
> > > > >=20
> > > > > > >=20
> > > > > > > I removed my previous repository and then imported perfbook a=
gain using the
> > > > > > > above mentioned mode. According to the man page, it will run =
CI for the project
> > > > > > > whenever a new push to the referenced repository happens.
> > > > > > >=20
> > > > > > > So it's just a matter of waiting a new commit getting push'ed=
 to see if it will
> > > > > > > be working.
> > > > > >=20
> > > > > > Hi Leonardo,
> > > > > >=20
> > > > > > I noticed a minor glitch in the generated PDFs.
> > > > > > They don't have Git commit info in the title page and footer ar=
ea of
> > > > > > pages.
> > > > > >=20
> > > > > > I can't tell what went wrong, but expected autodate.tex should =
look like:
> > > > >=20
> > > > > I found it out: gitlab was doing a shallow clone, and the previou=
s tag was not
> > > > > in the commits, so I modified the Gitlab config so it does a comp=
lete clone of
> > > > > the repository instead.
> > > >=20
> > > > Aha!  The script has never tested under a shallow clone...
> > > > Let me see if I can improve its behavior.
> > > >=20
> > > > > The last output of the pipeline seems to have been correct, pleas=
e check:
> > > > > https://gitlab.com/linux-kernel/perfbook/-/jobs/3705185694/artifa=
cts/browse
> > > >=20
> > > > Apparently, the commit id does not make sense in Paul's repo.

Yes, it was a commit in my personal tree.

> > > > But the random YML file approach should resolve it.

Agree.

> > >=20
> > > Apologies, I left it untracked.  There is now a Leonardo.2023.02.01a
> > > branch that references it.
> >=20
> > I mean the commit id 81974e57 presented in the artifacts is of the comm=
it
> > Leonardo made on his own:
> >=20
> >     https://gitlab.com/linux-kernel/perfbook/-/commit/81974e57bed4
>=20
> You are right, that is not the Leonardo.2023.02.01a commit.  Apologies
> for my confusion!
>=20
> 							Thanx, Paul

Please take a look in the new patch, it should sort everything out.

Best regards,
Leo


