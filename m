Return-Path: <SRS0=Gk1L=CD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686825794; x=1689417794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=So/NEvEQQo+mKzXiagqX4NggRysBR6mwmx2hji4Ptr0=;
        b=CmCG+RpILQ9P/23onCUjlYcO7n1tEOxGeSTtpqKfrpOqUtte31XdHNPSVL96uguO27
         tuiTx5ThJwDFHondJJrmAPbdWPiAQl72NC/m6hcMFlntRRpptwe+mv0DwWWpUYWXsa+H
         XlGbLmq9mcX/vahUvJpL38kq7O3ZcJy1GTYFRe93bbUL5KyeGR6VSKXRhr5tiNioErRe
         R2RFD4RKe5HKGD6GF1WmumcjlCvRy7ZHiQheUp4Ky3DGYusPbRAjL9j98kbyyA0uiY3P
         JMROZbRlWbkRUl4f/Nc7MoczcphFHx6ANmPSlwuHsaNqAbHLoYyyzKpxKd/zb4HCWXxz
         0P9Q==
Message-ID: <203674d7-5b6d-1d09-5de1-ef824d1b7017@gmail.com>
Date: Thu, 15 Jun 2023 19:43:10 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 0/6] Update Dockerfiles
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@kernel.org>, Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

[+To: Leo]

On 2023/06/15 18:48, Akira Yokosawa wrote:
> Hi Paul,
>=20
> Commit a80a57b21a5e ("fixsvgfonts.sh: Convert sans-serif into 'DejaVu S=
ans'")
> assumed that having "DejaVu Sans Mono" is sufficent for "DejaVu Sans".
>=20
> It turns out that docker/Dockerfile.fedora doesn't cover "DejaVu Sans".=

> Fedora's dejavu-sans-mono-fonts package doesn't contain "DejaVu Sans Mo=
no"!
> There is a meta package of the name dejavu-fonts-all which covers them
> both as well as dejavu-serif-fonts.
>=20
> It also turns out that Answer to #9 in FAQ-BUILD.txt saying:
>=20
>     As for Ubuntu and Fedora, packages listed in #5 should cover
>     all the font families needed.
>=20
> is wrong on the Fedora front.  DejaVu and Liberation fonts need
> font packages dejavu-fonts-all and liberation-fonts.
>=20
> Furthermore, Fedora 38 (released this April) has a regression of
> Inkscape where font markup is corrupted in SVG --> PDF conversion.

Leo, just for you info, I see the same regression under Arch Linux.

Pick a perfbook.pdf from your gitlab-ci build, and run:

    pdffonts perfbook.pdf

You will see something like (I don't know how the corrupted encoding
will work in your mailbox...):

name                                 type              encoding         e=
mb sub uni object ID
------------------------------------ ----------------- ---------------- -=
-- --- --- ---------
WGDPYX+LMMono8-Regular               Type 1            Custom           y=
es yes yes   1722  0
ULGKTM+TeXGyreTermesX-Regular        Type 1            Custom           y=
es yes yes   1725  0
OTFSIT+LMMono12-Regular              Type 1            Custom           y=
es yes yes   1726  0
IYVMBP+TeXGyreTermesX-Bold           Type 1            Custom           y=
es yes yes   1741  0
PSUFXP+TeXGyreTermes-Regular         Type 1            Custom           y=
es yes yes   1742  0
IMBSNT+NimbusRomNo9L-Regu-Slant_167  Type 1            Custom           y=
es yes yes   1929  0
NWEUXR+LMMonoLt10-Bold               Type 1            Custom           y=
es yes yes   2227  0
EOPMEH+LinBiolinumTI                 Type 1            Custom           y=
es yes yes   2673  0
UHVCIJ+LinBiolinumT                  Type 1            Custom           y=
es yes yes   2674  0
EOPMEH+LinBiolinumTI                 Type 1            Custom           y=
es yes yes   2677  0
OIRARM+LMMono10-Regular              Type 1            Custom           y=
es yes yes   2764  0
TLODOC+txsys                         Type 1            Builtin          y=
es yes yes   2828  0
UFJTMD+StandardSymL                  Type 1            Builtin          y=
es yes yes   2830  0
IGSKIX+NewTXMI5                      Type 1            Builtin          y=
es yes yes   2831  0
VVGNAR+TeXGyreTermesX-Italic         Type 1            Custom           y=
es yes yes   2921  0
YFRDMR+NimbusSanL-Regu               Type 1            Custom           y=
es yes no    2980  0
YFRDMR+NimbusSanL-Regu               Type 1            Custom           y=
es yes no    3012  0
JZAPTL+k=E6=B9=8C=E9=A1=95                       CID Type 0C       Identi=
ty-H       yes yes yes   3038  0
XCILRI+i=E6=B9=8C=E9=A1=95                       Type 1C           WinAns=
i          yes yes yes   3039  0
CZRRGJ+=3D=E6=BD=8C=E9=A1=95                       CID Type 0C       Iden=
tity-H       yes yes yes   3040  0
LAEXLB+o=E6=B9=8C=E9=A1=95                       Type 1C           WinAns=
i          yes yes yes   3041  0
WJVJMV+NimbusSans-Regular            Type 1C           Custom           y=
es yes no    3066  0
WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi          y=
es yes no    3129  0
LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi          y=
es yes no    3130  0
WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi          y=
es yes no    3159  0
LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi          y=
es yes no    3160  0
DEIMBC+j=EC=86=9B=E6=85=95                       TrueType          WinAns=
i          yes yes yes   3209  0
RWADWA+=E8=9B=92=E0=AD=96                       TrueType          WinAnsi=
          yes yes yes   3238  0
HDCMTE+=E8=9B=92=E0=AD=96                       TrueType          WinAnsi=
          yes yes yes   3239  0
JGKXJS+=C2=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=E4=95=96                      Ty=
pe 1C           WinAnsi          yes yes yes   3269  0
ANXDLC+X=DB=A8=E3=9D=96                        TrueType          WinAnsi =
         yes yes yes   3320  0
RUPDBM+=D1=93=E3=A1=96                       Type 1C           WinAnsi   =
       yes yes yes   3553  00
LWHAZS+=E7=A7=9E=E7=85=95                       Type 1C           WinAnsi=
          yes yes yes   3560  0
RQGRST+A=E7=BB=9E=E7=85=95                       TrueType          WinAns=
i          yes yes yes   3561  0

[...]

Expected output is:

name                                 type              encoding         e=
mb sub uni object ID
------------------------------------ ----------------- ---------------- -=
-- --- --- ---------
WGDPYX+LMMono8-Regular               Type 1            Custom           y=
es yes yes   1722  0
ULGKTM+TeXGyreTermesX-Regular        Type 1            Custom           y=
es yes yes   1725  0
ICXLWS+LMMono12-Regular              Type 1            Custom           y=
es yes yes   1726  0
IYVMBP+TeXGyreTermesX-Bold           Type 1            Custom           y=
es yes yes   1741  0
PSUFXP+TeXGyreTermes-Regular         Type 1            Custom           y=
es yes yes   1742  0
IMBSNT+NimbusRomNo9L-Regu-Slant_167  Type 1            Custom           y=
es yes yes   1929  0
NUKNCC+LMMonoLt10-Bold               Type 1            Custom           y=
es yes yes   2227  0
EOPMEH+LinBiolinumTI                 Type 1            Custom           y=
es yes yes   2673  0
UHVCIJ+LinBiolinumT                  Type 1            Custom           y=
es yes yes   2674  0
EOPMEH+LinBiolinumTI                 Type 1            Custom           y=
es yes yes   2677  0
OIRARM+LMMono10-Regular              Type 1            Custom           y=
es yes yes   2764  0
TLODOC+txsys                         Type 1            Builtin          y=
es yes yes   2828  0
UFJTMD+StandardSymL                  Type 1            Builtin          y=
es yes yes   2830  0
IGSKIX+NewTXMI5                      Type 1            Builtin          y=
es yes yes   2831  0
VVGNAR+TeXGyreTermesX-Italic         Type 1            Custom           y=
es yes yes   2921  0
YFRDMR+NimbusSanL-Regu               Type 1            Custom           y=
es yes no    2980  0
YFRDMR+NimbusSanL-Regu               Type 1            Custom           y=
es yes no    3012  0
QNDHMI+NimbusSans-Regular            CID Type 0C       Identity-H       y=
es yes yes   3038  0
JKBTOX+NimbusSans-Regular            Type 1C           WinAnsi          y=
es yes yes   3039  0
BIKSFC+NimbusSans-Bold               CID Type 0C       Identity-H       y=
es yes yes   3040  0
XFXZKY+NimbusSans-Bold               Type 1C           WinAnsi          y=
es yes yes   3041  0
WJVJMV+NimbusSans-Regular            Type 1C           Custom           y=
es yes no    3066  0
WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi          y=
es yes no    3129  0
LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi          y=
es yes no    3130  0
WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi          y=
es yes no    3159  0
LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi          y=
es yes no    3160  0
KPAYFY+steelcitycomic                TrueType          WinAnsi          y=
es yes yes   3209  0
IGYOWD+steelcitycomic                TrueType          WinAnsi          y=
es yes yes   3238  0
LVRVOR+steelcitycomic                TrueType          WinAnsi          y=
es yes yes   3239  0
OCNFNQ+FreeMonoBold                  Type 1C           WinAnsi          y=
es yes yes   3269  0
DHHOAV+DejaVuSans                    TrueType          WinAnsi          y=
es yes yes   3320  0
RVTHEX+DejaVuSansMono-Bold           TrueType          WinAnsi          y=
es yes yes   3479  0
ODJFYL+FreeMonoBold                  Type 1C           WinAnsi          y=
es yes yes   3553  0
HAXSLA+URWGothic-DemiOblique         Type 1C           WinAnsi          y=
es yes yes   3560  0
[...]


        Thanks, Akira

>=20
> So Deckerfile.fedora should stay with Fedora 37 for the moment.
>=20
> Quick search of upstream Inkscape's issue tracker didn't hit the
> font markup regression.  I'll open an issue there unless somebody
> else beats me to it.
>=20
> So, this patch set consists of the following
>=20
> Patch 1/6 adds check of "DejaVu Sans" as nice-to-have font.
>=20
> Patch 2/6 updates FAQ-BUILD.txt and Dockerfile.fedora for nice-to-have
> font packages.
>=20
> Patch 3/6 updates Dockerfile.fedora to stay with Fedora 37, using an AR=
G
> variable so that building from fedora:38 can be possible.
> It also adds popller-utils to check the font markup info in PDF propert=
ies.
>=20
> Patch 4/6 updates Dockerfile (from ubuntu) so that the default base
> image is the "latest" (jammy at the moment).  There is no reason to sti=
ck
> with focal (20.04).
>=20
> Patch 5/6 adds poppler-utils to Dockerfile (from ubuntu) to detect
> Inkscape regression early in case it actually sneaks in.
> (Note: Ubuntu 23.04 is safe at the moment.)
>=20
> Patch 6/6 changes the default uid:gid pair of container images built
> from Dockerfiles to 0:0, which is for rootless mode docker/podman.
> Repository at dockerhub for prebuilt images is changed to
> akiyks/perfbook-build, where the tags "latest" and "fedora" have
> uid:gid pair of 0:0.
>=20
>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   Makefile: Add 'DejaVu Sans' to nice-to-have fonts
>   FAQ-BUILD: Update nice-to-have fonts for SVG figures
>   docker/Dockerfile.fedora: Stay with Fedora 37 for the moment
>   docker/Dockerfile: Use 'latest' as the default tag
>   docker/Dockerfile: Add poppler-utils package
>   Dockerfile: Make uid:gid =3D 0:0 the default
>=20
>  FAQ-BUILD.txt            | 37 ++++++++++++++++++++-----------------
>  Makefile                 | 15 ++++++++++++---
>  docker/Dockerfile        |  9 +++++----
>  docker/Dockerfile.fedora | 16 +++++++++++-----
>  4 files changed, 48 insertions(+), 29 deletions(-)
>=20
>=20
> base-commit: a80a57b21a5e8ea3dfa90471126920a1131682f7
