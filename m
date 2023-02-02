Return-Path: <SRS0=s+nB=56=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+v3WXFy/HdItnv36cg7W5rJ9mC/42Z3swneBsviMiGc=;
        b=pz32sOFvXa5MGoav8lHRt2hp9dROI6mfmepcsYU1wbV618OmGW3MHHB/VCKOzbJdxs
         9ImdUdxVjNaqjbN2Ea6GPsVXT4n9N1fxHoU6+usgQDclHkqZBTke7Dteu5ZdCeOoF5JB
         CGW5SpKrbu+bZVznApp8GmUYN2vbRDYIPmdoTMN7UYTmo2p1yGOQRlQH+laJPiAH2WuJ
         ap1Fk1D+DgV70+xAqkbA+1QbdNK/8hsw48a5+yGgHWSaDIpm/c1T6kFbU5tgJdC8JPv8
         6rzbFCwKWh3IZ8gJHxPL1RGRHzbBBb4hS9DNT5X/L5EPUOm1okNaQotSqOx/v3glG5pf
         Xj3A==
Message-ID: <11517498-7fc9-2cd5-7cf8-6cb8705abf31@gmail.com>
Date: Thu, 2 Feb 2023 23:42:31 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
References: <20230201201529.901316-1-leobras.c@gmail.com>
 <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
 <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
 <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
 <ee2eb78d9575b53080a265c46775d01f0da37214.camel@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ee2eb78d9575b53080a265c46775d01f0da37214.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 02 Feb 2023 01:37:02 -0300, Leonardo Br=C3=A1s wrote:
[...]
>=20
> It looks like it can be done by "Running CI/CD for external repositorie=
s".
>=20
> I removed my previous repository and then imported perfbook again using=
 the
> above mentioned mode. According to the man page, it will run CI for the=
 project
> whenever a new push to the referenced repository happens.
>=20
> So it's just a matter of waiting a new commit getting push'ed to see if=
 it will
> be working.

Hi Leonardo,

I noticed a minor glitch in the generated PDFs.
They don't have Git commit info in the title page and footer area of
pages.

I can't tell what went wrong, but expected autodate.tex should look like:=


-----
\date{February 1, 2023 \\ Commit: \texttt{v2022.09.25a-81-g4327c1f3809e}}=

\newcommand{\commityear}{2023}
\newcommand{\commitid}{v2022.09.25a-81-g4327c1f3809e}
\IfQqzBg{}{\setboolean{qqzbg}{false}}
% tcolorbox version: 5.1
\tcbsetforeverylayer{autoparskip}
-----

It is not kept in the artifact, so I'm just guessing.
I guess utilities/autodate.sh failed to see .git/ in the build directory
and generated the following based on the build date instead:

-----
\date{February 2, 2023  }
\newcommand{\commityear}{2023}
\newcommand{\commitid}{}
\IfQqzBg{}{\setboolean{qqzbg}{false}}
% tcolorbox version: 5.1
\tcbsetforeverylayer{autoparskip}
-----

Not a big deal, but can you look into this?

BTW, I just requested a permission for accessing your repo.

        Thanks, Akira

>=20
> Best regards,
> Leo
