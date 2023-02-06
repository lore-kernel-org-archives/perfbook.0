Return-Path: <SRS0=PHIa=6C=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M9cS3pAuPHB9ZYn3UUzZw4PCW400Ol/x5utcGGVxlXY=;
        b=MP09uC0KDgA0d66IPJomsiejD1hnrqw18BYmnWA83s7V1FNVo3Ko8XLAJMPJBt4oHI
         kHVntC0qI80Be1osiuFtn+pJkuNgAlFarKAC6cGOQR8Npm3Y/WDlBn8nZnBT5dh+Rz3Z
         PETmiYqJuR+jiHUXkAzAN4OanADw/UQEWm0XXIBaIhrEOX2e/Bi8p3AL3k2eDqhFTtrc
         84wjifi6RDWoyVkY5aM+gk9nL1VxmAuddV6V1MYEyyOYc65bfUSIYuzYLDZQEz2Mehdx
         cXfZMjvfpy38aBFUmP320a+hxjm8yytHUClg/BvadMQY6cJi2FxDw6ud+fOusBlqrasE
         /YqQ==
Message-ID: <391ab1828141041b10a32d35b8722e3265e2166f.camel@gmail.com>
Subject: Re: [PATCH -perfbook] autodate.sh: Add graceful fallback of
 commitid-only mode for shallow clone
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Mon, 06 Feb 2023 17:41:28 -0300
In-Reply-To: <ea98db11-6549-793b-5b23-37a9cf441fe1@gmail.com>
References: <5011ac44-402f-5185-bb62-0d2ac908da5e@gmail.com>
	 <20230203164716.GJ2948950@paulmck-ThinkPad-P17-Gen-1>
	 <402f2ac0179552e214206fb6adb36240113ddc51.camel@gmail.com>
	 <20230203181950.GL2948950@paulmck-ThinkPad-P17-Gen-1>
	 <72fe4499f87fb861c5fca94b6a8670e4c1100d4c.camel@gmail.com>
	 <20230203185539.GM2948950@paulmck-ThinkPad-P17-Gen-1>
	 <f04b56846957201b4212b5cdc183eaff926b6f85.camel@gmail.com>
	 <20230204043614.GU2948950@paulmck-ThinkPad-P17-Gen-1>
	 <ea98db11-6549-793b-5b23-37a9cf441fe1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, 2023-02-04 at 15:35 +0900, Akira Yokosawa wrote:
> On Fri, 3 Feb 2023 20:36:14 -0800, Paul E. McKenney wrote:
> > On Fri, Feb 03, 2023 at 11:55:20PM -0300, Leonardo Br=C3=A1s wrote:
> ...
> > >=20
> > > I will send a patch fixing the uname soon :)
> >=20
> > Thank you for digging into this!
> >=20
> > And yes, portability is easier than it was 40 years ago, but still not
> > easy.  :-/
>=20
> Hi,
>=20
> You might be interested in this email thread in 2012 at GNU bugreport:
>=20
>     https://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D13001
>=20
> Looks like the behavior of "uname -p" CodeSamples had assumed is common
> to Ubuntu and Fedora (as well as RHEL and SUSE).


Hello Akira,

Thanks for contributing this documentation!

>=20
> So, this issue is exposed by Leo's choice of archlinux:latest as the
> base image.
>=20
> Leo, just out of curiosity, what made you pick Arch Linux?

Arch Linux is a rolling release distro, that tries as much as possible to k=
eep
up with the upstream releases.

From previous experiences, I noticed testing your code with upstream libs a=
nd
tools is better: it avoids falling into issues that have already been fixed
upstream, and also help keeping up with changes and improvements in fresh
releases.

>=20
>         Thanks, Akira
>=20

Best regards,
Leo
