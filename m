Return-Path: <SRS0=1BqV=GD=gmail.com=dimhen@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aZjRN1lw6bKdaHTZjk4WzVJurN2fdXKuBXUPd2TFaOo=;
        b=hDfEMVpQsRi1tK3jtG+QSIZEnP4rHbGHf2LcHfSL2NV9w69rwjS2f8if2Qj53H9QbA
         wL5gQsodv2R3C92JuSxUkiFleG6E1NeFx15c2Ckrb091h3OPPVLnpSzwEBQQzyIV7jrO
         KgKZYV3f3KBmGnYS/MPcGGoYcftlzo/fRQ2zdRKhm9j+6yhZBD+SKzkSELOj5RugQhjq
         kHIlrQf+Lhl1PIt3pjgMdVnaKGq4dgsU0KajyQY4hHAooJjFQdta9Uw7xwaQSMvO+Z1z
         TutIyeBSGzVOfSnJWI1FPTlLen+ujzvARd9MeLS9clfMqcj8W2kWA0j+MU8yhyUjECNq
         RBAg==
MIME-Version: 1.0
References: <20201230053728.GA31231@paulmck-ThinkPad-P72> <CADJjh6mLJtT8g0ZyO1bHkVN69YnvbEG4Xp_aD3iWs0heDgm06A@mail.gmail.com>
 <d62fdaa6-bdcf-9a34-9b78-57e103058d55@gmail.com> <CADJjh6kgrfGmxDaoT0RPoG5R=EJPRNfKv8LmFMLr8Fho8bJ=mw@mail.gmail.com>
 <4fc24c4c-1151-0133-7b19-b9a416af67ce@gmail.com> <12f7f86d-1da0-f192-d215-db83de6e3a57@gmail.com>
 <f3fcbc29-c778-f882-d38e-242b9a9e75c9@gmail.com> <73d520b6-2686-c3b0-f9bc-07962ae1a259@gmail.com>
In-Reply-To: <73d520b6-2686-c3b0-f9bc-07962ae1a259@gmail.com>
From: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Date: Thu, 31 Dec 2020 16:51:14 +0300
Message-ID: <CADJjh6=-YS5un9_uqRQWSMvw9y5u6VAO4wNrbyzSwX2UDXDaiA@mail.gmail.com>
Subject: Re: FYI, Second Edition Release Candidate 1 now available
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Akira, thank you!
Sorry, I was slow today due to holidays.

Happy New Year!
Dmitry

=D1=87=D1=82, 31 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 13:45, Akira Yokos=
awa <akiyks@gmail.com>:
>
> On Thu, 31 Dec 2020 16:22:22 +0900, Akira Yokosawa wrote:
> > On Thu, 31 Dec 2020 11:05:34 +0900, Akira Yokosawa wrote:
> >> On Thu, 31 Dec 2020 08:14:36 +0900, Akira Yokosawa wrote:
> >>> On Wed, 30 Dec 2020 21:18:24 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=
=B8=D0=B9 =D0=94=D1=8C=D1=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE wrote:
> >>>> Hi,
> >>>>
> >>>> a2ping is up to date
> >>>> $ a2ping -v
> >>>> a2ping.pl 2.84p, 2019-11-17
> >>>> [..]
> >>>>
> >>>> My TexLive 2020 is not from Fedora packages but from TexArchive.
> [...]
> >> Switching back to TeX Live 2020 of Fedora package restored the success=
ful build.
> >>
> >> This suggests something in upstream TeX Live 2020 has lost compatibili=
ty with
> >> Fedora 32/33 since this September/October.
> >> I have no idea what went wrong, though. Both Fedora and upstream TeX L=
ive are
> >> updated frequently, so...
> >
> > Dmitry,
> >
> > I have resolved a issue on my side (clash of $HOME/.texlive2020 with
> > the Fedora's TeX Live) and now I see the same error as you have reporte=
d.
> >
> > Now I can compare the .eps files on my own.
>
> Dmitry,
>
> This September saw updates in both GhostScript (9.53.0, now 9.53.3) and
> pstricks-base (3.01).
> It turned out this combination is the cause of the error you have encount=
ered.
>
> Update announcement of pstricks-base 3.01 [1] says:
>
>     This version has a modified pstricks.tex|.pro for GhostScript version=
s > 9.52
>
> However, it does not work with ghostscript 9.53.x in perfbook's use cases=
.
>
> So, one workaround would be to downgrade ghostscript to 9.52 [2].
>
> Another option would be to downgrade pstricks-base to 2.90 (2018/12/17)
> (or similar [3]), which is the version in Fedora's current TeX Live packa=
ge.
> But note that an old version of pstricks-base might be incompatible with
> the up-to-date upstream TeX Live.
>
> It may sound strange but pstrics-base 2.90 works with ghostscript 9.53.x
> as far as transparency composition is not concerned.
> Perfbook's figures don't use transparency composition.
>
> [1]: pstricks-base 3.01 update announcement on CTAN:
>     https://www.ctan.org/ctan-ann/id/mailman.2839.1600699145.2548.ctan-an=
n@ctan.org
>
> [2]: GhostScript release downloads:
>     https://github.com/ArtifexSoftware/ghostpdl-downloads/releases
>
> [3]: pstricks-base (as of 2019/02/27)
>     https://www.texlive.info/tlnet-archive/2019/02/27/tlnet/archive/pstri=
cks.tar.xz
>
> GhostScript's compatibility-breaking "security" updates have caused a lot=
 of
> troubles these days...
>
> Hopefully pstricks-base would catch up gs 9.53.x soon.
>
>         Thanks, Akira
>
> [...]
>
