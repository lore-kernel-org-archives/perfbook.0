Return-Path: <SRS0=AwJw=56=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VQPdJWPO6upDiV5m39OXwLdk7pTEcfz+mth1I6y4A3g=;
        b=HCEeLj1c47KSNZOpMLl27QHrbspXNIFX3z2On+YLDFpxam8hEwtkSm08VBH7YxyuMI
         i06ZbAqYT43tlVPAhTYMBbx89Z0vhqWixui12DG5f0hzxarWW6q3CnHSLYyqHqAvXfsg
         lOX5428cpk0ol4s63TIynZhfC6qxaRnZdVQMMAnLNtAMs9AUIHv/ds39heNq05A3773C
         wHp0Xh5KsTXX9/yulaMgzQSgMyAJhvHnnXL0P8Ag7W7bKobjL/4JJ2VKQ2IJMtAcb37K
         vmYDl/7isosw3AVkVK3v+kM76qnpha1J3q3oZ0sjBZvpQm18hjh8oZ1DryKBjnOk5qbN
         +obw==
Message-ID: <203c05624258d0eecaae9717c25e9232ff450ee4.camel@gmail.com>
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Thu, 02 Feb 2023 13:52:08 -0300
In-Reply-To: <11517498-7fc9-2cd5-7cf8-6cb8705abf31@gmail.com>
References: <20230201201529.901316-1-leobras.c@gmail.com>
	 <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
	 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
	 <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
	 <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
	 <ee2eb78d9575b53080a265c46775d01f0da37214.camel@gmail.com>
	 <11517498-7fc9-2cd5-7cf8-6cb8705abf31@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 2023-02-02 at 23:42 +0900, Akira Yokosawa wrote:
> On Thu, 02 Feb 2023 01:37:02 -0300, Leonardo Br=C3=A1s wrote:
> [...]
> >=20
> > It looks like it can be done by "Running CI/CD for external repositorie=
s".

Nah, it looks like this won't work either. After my patch on top of master,=
 it's
already warning about diverging repositories when I try to sync.

Another solution I could find:
- Change the patch I sent before to keep the file on another directory, eve=
n
with a different name: this will not trigger the build for anyone.
- Change my repository config to trigger the CI from that file.

The file would only be a random YML file in the repo.
Would that be ok?

> >=20
> > I removed my previous repository and then imported perfbook again using=
 the
> > above mentioned mode. According to the man page, it will run CI for the=
 project
> > whenever a new push to the referenced repository happens.
> >=20
> > So it's just a matter of waiting a new commit getting push'ed to see if=
 it will
> > be working.
>=20
> Hi Leonardo,
>=20
> I noticed a minor glitch in the generated PDFs.
> They don't have Git commit info in the title page and footer area of
> pages.
>=20
> I can't tell what went wrong, but expected autodate.tex should look like:

I found it out: gitlab was doing a shallow clone, and the previous tag was =
not
in the commits, so I modified the Gitlab config so it does a complete clone=
 of
the repository instead.

The last output of the pipeline seems to have been correct, please check:
https://gitlab.com/linux-kernel/perfbook/-/jobs/3705185694/artifacts/browse


>=20
> -----
> \date{February 1, 2023 \\ Commit: \texttt{v2022.09.25a-81-g4327c1f3809e}}
> \newcommand{\commityear}{2023}
> \newcommand{\commitid}{v2022.09.25a-81-g4327c1f3809e}
> \IfQqzBg{}{\setboolean{qqzbg}{false}}
> % tcolorbox version: 5.1
> \tcbsetforeverylayer{autoparskip}
> -----
>=20
> It is not kept in the artifact, so I'm just guessing.
> I guess utilities/autodate.sh failed to see .git/ in the build directory
> and generated the following based on the build date instead:
>=20
> -----
> \date{February 2, 2023  }
> \newcommand{\commityear}{2023}
> \newcommand{\commitid}{}
> \IfQqzBg{}{\setboolean{qqzbg}{false}}
> % tcolorbox version: 5.1
> \tcbsetforeverylayer{autoparskip}
> -----
>=20
> Not a big deal, but can you look into this?
>=20
> BTW, I just requested a permission for accessing your repo.

Let's put that on hold: I think it will be necessary to delete this repo an=
d
import again from kernel.org if the pipeline don't work fine for next commi=
ts.

>=20
>         Thanks, Akira
>=20
>=20

Thank you for reporting the issue!

Best regards,
Leo
