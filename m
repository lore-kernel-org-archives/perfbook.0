Return-Path: <SRS0=IFZl=CE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686913506; x=1689505506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AznYReuQ4wJHmpvMK/XsDzhN5/zBkw2qsIuJmrsrMk=;
        b=gf2jzATwk76JKb0C6WhEJVPlByriy4nxgBlDBuP1MwNdb2CfGldqGNT60wvpQ8k+hl
         4UxkyuKZ3K51kv2807fPjJKFWzRi0tdIAFWWLT40h7vo+mu8VLs2BH3mS39yIELQpyL6
         dPjpjuEZN4OZm3keZ9obQP2paIkAuipUO28cDgxM/qQbyDgPWrtYQEccs5j90UsTSu2Q
         wcztPYf9xf9F3I02et2G+5HJ4Z6q31noVZqg95APTm+FFbvOwM6ihhRt2dZsyfU0jzHV
         velY83jhzDWHpWqpfLLjLWbgSTmXKT8NX96rTGdcdivyaBvNXMntGcrpl/mUsR1Cmg3G
         Udkw==
Message-ID: <fece6e8f-4e1d-de11-a082-b80eebb28c66@gmail.com>
Date: Fri, 16 Jun 2023 20:05:02 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 0/6] Update Dockerfiles
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
 <203674d7-5b6d-1d09-5de1-ef824d1b7017@gmail.com>
 <170675ed7b1b5d86cc9ebac30f05a03c9677ba92.camel@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <170675ed7b1b5d86cc9ebac30f05a03c9677ba92.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2023/06/16 15:07, Leonardo Br=C3=A1s wrote:
> On Thu, 2023-06-15 at 19:43 +0900, Akira Yokosawa wrote:
>> [+To: Leo]
>>
>> On 2023/06/15 18:48, Akira Yokosawa wrote:
>>> Hi Paul,
>>>
>>> Commit a80a57b21a5e ("fixsvgfonts.sh: Convert sans-serif into 'DejaVu=
 Sans'")
>>> assumed that having "DejaVu Sans Mono" is sufficent for "DejaVu Sans"=
=2E
>>>
>>> It turns out that docker/Dockerfile.fedora doesn't cover "DejaVu Sans=
".
>>> Fedora's dejavu-sans-mono-fonts package doesn't contain "DejaVu Sans =
Mono"!
>>> There is a meta package of the name dejavu-fonts-all which covers the=
m
>>> both as well as dejavu-serif-fonts.
>>>
>>> It also turns out that Answer to #9 in FAQ-BUILD.txt saying:
>>>
>>>     As for Ubuntu and Fedora, packages listed in #5 should cover
>>>     all the font families needed.
>>>
>>> is wrong on the Fedora front.  DejaVu and Liberation fonts need
>>> font packages dejavu-fonts-all and liberation-fonts.
>>>
>>> Furthermore, Fedora 38 (released this April) has a regression of
>>> Inkscape where font markup is corrupted in SVG --> PDF conversion.
>>
>> Leo, just for you info, I see the same regression under Arch Linux.
>=20
> Hello Akira, thanks for letting me know!
>=20
>>
>> Pick a perfbook.pdf from your gitlab-ci build, and run:
>>
>>     pdffonts perfbook.pdf
>>
>> You will see something like (I don't know how the corrupted encoding
>> will work in your mailbox...):
>>
>> name                                 type              encoding       =
  emb sub uni object ID
>> ------------------------------------ ----------------- ---------------=
- --- --- --- ---------
>> WGDPYX+LMMono8-Regular               Type 1            Custom         =
  yes yes yes   1722  0
>> ULGKTM+TeXGyreTermesX-Regular        Type 1            Custom         =
  yes yes yes   1725  0
>> OTFSIT+LMMono12-Regular              Type 1            Custom         =
  yes yes yes   1726  0
>> IYVMBP+TeXGyreTermesX-Bold           Type 1            Custom         =
  yes yes yes   1741  0
>> PSUFXP+TeXGyreTermes-Regular         Type 1            Custom         =
  yes yes yes   1742  0
>> IMBSNT+NimbusRomNo9L-Regu-Slant_167  Type 1            Custom         =
  yes yes yes   1929  0
>> NWEUXR+LMMonoLt10-Bold               Type 1            Custom         =
  yes yes yes   2227  0
>> EOPMEH+LinBiolinumTI                 Type 1            Custom         =
  yes yes yes   2673  0
>> UHVCIJ+LinBiolinumT                  Type 1            Custom         =
  yes yes yes   2674  0
>> EOPMEH+LinBiolinumTI                 Type 1            Custom         =
  yes yes yes   2677  0
>> OIRARM+LMMono10-Regular              Type 1            Custom         =
  yes yes yes   2764  0
>> TLODOC+txsys                         Type 1            Builtin        =
  yes yes yes   2828  0
>> UFJTMD+StandardSymL                  Type 1            Builtin        =
  yes yes yes   2830  0
>> IGSKIX+NewTXMI5                      Type 1            Builtin        =
  yes yes yes   2831  0
>> VVGNAR+TeXGyreTermesX-Italic         Type 1            Custom         =
  yes yes yes   2921  0
>> YFRDMR+NimbusSanL-Regu               Type 1            Custom         =
  yes yes no    2980  0
>> YFRDMR+NimbusSanL-Regu               Type 1            Custom         =
  yes yes no    3012  0
>> JZAPTL+k=E6=B9=8C=E9=A1=95                       CID Type 0C       Ide=
ntity-H       yes yes yes   3038  0
>> XCILRI+i=E6=B9=8C=E9=A1=95                       Type 1C           Win=
Ansi          yes yes yes   3039  0
>> CZRRGJ+=3D=E6=BD=8C=E9=A1=95                       CID Type 0C       I=
dentity-H       yes yes yes   3040  0
>> LAEXLB+o=E6=B9=8C=E9=A1=95                       Type 1C           Win=
Ansi          yes yes yes   3041  0
>> WJVJMV+NimbusSans-Regular            Type 1C           Custom         =
  yes yes no    3066  0
>> WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi        =
  yes yes no    3129  0
>> LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi        =
  yes yes no    3130  0
>> WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi        =
  yes yes no    3159  0
>> LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi        =
  yes yes no    3160  0
>> DEIMBC+j=EC=86=9B=E6=85=95                       TrueType          Win=
Ansi          yes yes yes   3209  0
>> RWADWA+=E8=9B=92=E0=AD=96                       TrueType          WinA=
nsi          yes yes yes   3238  0
>> HDCMTE+=E8=9B=92=E0=AD=96                       TrueType          WinA=
nsi          yes yes yes   3239  0
>> JGKXJS+=C2=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=E4=95=96                     =
 Type 1C           WinAnsi          yes yes yes   3269  0
>> ANXDLC+X=DB=A8=E3=9D=96                        TrueType          WinAn=
si          yes yes yes   3320  0
>> RUPDBM+=D1=93=E3=A1=96                       Type 1C           WinAnsi=
          yes yes yes   3553  00
>> LWHAZS+=E7=A7=9E=E7=85=95                       Type 1C           WinA=
nsi          yes yes yes   3560  0
>> RQGRST+A=E7=BB=9E=E7=85=95                       TrueType          Win=
Ansi          yes yes yes   3561  0
>>
>> [...]
>>
>> Expected output is:
>>
>> name                                 type              encoding       =
  emb sub uni object ID
>> ------------------------------------ ----------------- ---------------=
- --- --- --- ---------
>> WGDPYX+LMMono8-Regular               Type 1            Custom         =
  yes yes yes   1722  0
>> ULGKTM+TeXGyreTermesX-Regular        Type 1            Custom         =
  yes yes yes   1725  0
>> ICXLWS+LMMono12-Regular              Type 1            Custom         =
  yes yes yes   1726  0
>> IYVMBP+TeXGyreTermesX-Bold           Type 1            Custom         =
  yes yes yes   1741  0
>> PSUFXP+TeXGyreTermes-Regular         Type 1            Custom         =
  yes yes yes   1742  0
>> IMBSNT+NimbusRomNo9L-Regu-Slant_167  Type 1            Custom         =
  yes yes yes   1929  0
>> NUKNCC+LMMonoLt10-Bold               Type 1            Custom         =
  yes yes yes   2227  0
>> EOPMEH+LinBiolinumTI                 Type 1            Custom         =
  yes yes yes   2673  0
>> UHVCIJ+LinBiolinumT                  Type 1            Custom         =
  yes yes yes   2674  0
>> EOPMEH+LinBiolinumTI                 Type 1            Custom         =
  yes yes yes   2677  0
>> OIRARM+LMMono10-Regular              Type 1            Custom         =
  yes yes yes   2764  0
>> TLODOC+txsys                         Type 1            Builtin        =
  yes yes yes   2828  0
>> UFJTMD+StandardSymL                  Type 1            Builtin        =
  yes yes yes   2830  0
>> IGSKIX+NewTXMI5                      Type 1            Builtin        =
  yes yes yes   2831  0
>> VVGNAR+TeXGyreTermesX-Italic         Type 1            Custom         =
  yes yes yes   2921  0
>> YFRDMR+NimbusSanL-Regu               Type 1            Custom         =
  yes yes no    2980  0
>> YFRDMR+NimbusSanL-Regu               Type 1            Custom         =
  yes yes no    3012  0
>> QNDHMI+NimbusSans-Regular            CID Type 0C       Identity-H     =
  yes yes yes   3038  0
>> JKBTOX+NimbusSans-Regular            Type 1C           WinAnsi        =
  yes yes yes   3039  0
>> BIKSFC+NimbusSans-Bold               CID Type 0C       Identity-H     =
  yes yes yes   3040  0
>> XFXZKY+NimbusSans-Bold               Type 1C           WinAnsi        =
  yes yes yes   3041  0
>> WJVJMV+NimbusSans-Regular            Type 1C           Custom         =
  yes yes no    3066  0
>> WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi        =
  yes yes no    3129  0
>> LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi        =
  yes yes no    3130  0
>> WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi        =
  yes yes no    3159  0
>> LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi        =
  yes yes no    3160  0
>> KPAYFY+steelcitycomic                TrueType          WinAnsi        =
  yes yes yes   3209  0
>> IGYOWD+steelcitycomic                TrueType          WinAnsi        =
  yes yes yes   3238  0
>> LVRVOR+steelcitycomic                TrueType          WinAnsi        =
  yes yes yes   3239  0
>> OCNFNQ+FreeMonoBold                  Type 1C           WinAnsi        =
  yes yes yes   3269  0
>> DHHOAV+DejaVuSans                    TrueType          WinAnsi        =
  yes yes yes   3320  0
>> RVTHEX+DejaVuSansMono-Bold           TrueType          WinAnsi        =
  yes yes yes   3479  0
>> ODJFYL+FreeMonoBold                  Type 1C           WinAnsi        =
  yes yes yes   3553  0
>> HAXSLA+URWGothic-DemiOblique         Type 1C           WinAnsi        =
  yes yes yes   3560  0
>> [...]
>>
>=20
> IIUC, the issue is the appearing of non-ascii chars in the output of pd=
ffonts,
> is that correct?

Right.

>=20
> Arch Linux provides two packages for DejaVu fonts:
> ttf-dejavu and ttf-dejavu-nerd, and both seem to provide DejaVu-Sans-mo=
no
>=20
> In this test, I install them both, just for the sake of trying to fix t=
he issue:
> https://gitlab.com/linux-kernel/perfbook/-/jobs/4485677006
>=20
> I also added pdffonts command in the end to make it easier to verify if=

> everything is fine, which still outputs non-ascii names.=20
>=20
> When I grep for DejaVuSansMono I see them appearing in the output of th=
e job,
> and also in a previous pdf I have downloaded.
>=20
> I don't quite understand this, but maybe the issue is missing other fon=
ts?
>=20
> Please help me understand the issue.

As far as I see, there is no font problem on your side.
I think this is regression of Inkscape.

As a matter of fact, Inkscape packages on most rolling-release distros
are having a more annoying regression, random SIGSEGV when run from
CLI under Gnome desktop environment.

See: https://gitlab.com/inkscape/inkscape/-/issues/4177
     "glib2 2.76.0 breaks Command Line export"

This issue was opened back on January 24, 2023.
It was once believed to have been resolved with a fix in gtk3, but the
issue still remains after the fixed version of gtk3 reached Fedora 38.
=20
For gitlab-ci, where there is no Gnome desktop involved, this issue
has never affected, but the font markup corruption has sneaked in
without being reported by anyone.

I happened to test Dockerfile.fedora (from fedora:38) and checked if
"DejaVu Sans" was used in Intel_Core2_arch-simplified.pdf as intended,
and failed to see the font markup.

So, I think there is nothing wrong in your gitlab-ci.yaml script.
You need to wait until the regression is fixed in the Arch Linux
Inkscape or its dependency.

I have no idea how long that would take, though.

Or you could switch the container to a fedora:37 or ubuntu:jammy
based one for the moment.

        Thanks, Akira

>=20
> Best regards,
> Leo
>=20
>=20
>=20
>>
>>         Thanks, Akira
>>
>>>
>>> So Deckerfile.fedora should stay with Fedora 37 for the moment.
>>>
>>> Quick search of upstream Inkscape's issue tracker didn't hit the
>>> font markup regression.  I'll open an issue there unless somebody
>>> else beats me to it.
>>>
>>> So, this patch set consists of the following
>>>
>>> Patch 1/6 adds check of "DejaVu Sans" as nice-to-have font.
>>>
>>> Patch 2/6 updates FAQ-BUILD.txt and Dockerfile.fedora for nice-to-hav=
e
>>> font packages.
>>>
>>> Patch 3/6 updates Dockerfile.fedora to stay with Fedora 37, using an =
ARG
>>> variable so that building from fedora:38 can be possible.
>>> It also adds popller-utils to check the font markup info in PDF prope=
rties.
>>>
>>> Patch 4/6 updates Dockerfile (from ubuntu) so that the default base
>>> image is the "latest" (jammy at the moment).  There is no reason to s=
tick
>>> with focal (20.04).
>>>
>>> Patch 5/6 adds poppler-utils to Dockerfile (from ubuntu) to detect
>>> Inkscape regression early in case it actually sneaks in.
>>> (Note: Ubuntu 23.04 is safe at the moment.)
>>>
>>> Patch 6/6 changes the default uid:gid pair of container images built
>>> from Dockerfiles to 0:0, which is for rootless mode docker/podman.
>>> Repository at dockerhub for prebuilt images is changed to
>>> akiyks/perfbook-build, where the tags "latest" and "fedora" have
>>> uid:gid pair of 0:0.
>>>
>>>         Thanks, Akira
>>> --
>>> Akira Yokosawa (6):
>>>   Makefile: Add 'DejaVu Sans' to nice-to-have fonts
>>>   FAQ-BUILD: Update nice-to-have fonts for SVG figures
>>>   docker/Dockerfile.fedora: Stay with Fedora 37 for the moment
>>>   docker/Dockerfile: Use 'latest' as the default tag
>>>   docker/Dockerfile: Add poppler-utils package
>>>   Dockerfile: Make uid:gid =3D 0:0 the default
>>>
>>>  FAQ-BUILD.txt            | 37 ++++++++++++++++++++-----------------
>>>  Makefile                 | 15 ++++++++++++---
>>>  docker/Dockerfile        |  9 +++++----
>>>  docker/Dockerfile.fedora | 16 +++++++++++-----
>>>  4 files changed, 48 insertions(+), 29 deletions(-)
>>>
>>>
>>> base-commit: a80a57b21a5e8ea3dfa90471126920a1131682f7
>=20
