Return-Path: <SRS0=oC12=FL=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695782979; x=1696387779; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/2kz70YHvjOxfx0hg1mA3pZEKRRWHABQYHHN9bkBURI=;
        b=iaKhd92wU4eO6T63W8rbU47UQo08KOe9Fo9FS2sjzhDTEfTTOvOxT4o87ejmeHKkZQ
         nuM3UWLb2fGVJqKoYc9hXIgNo2JeMMCzdukdOE4iFvn3ERBtMAiouzH+DoiazWcnUYPR
         t5iRlZgVGJXNhsGxmGqonltrqU4MKtOHxoKkW3G5XwPjEY1RZ4qsbLHVDchh40xPwWsH
         l7RSGq+QhMXQRsZIiCT3cgsGCOs3L9e+YMseNdHTSkcmbSNRiSSFPy+D5MhYECpl2yhn
         RVRz9Iw1qqTXapPyBdsl1yAehqiZPobJm1Ta3pZsc3fTDUb6Aqmbk6nsfjE6bP+gnls+
         VMYw==
Message-ID: <2501287715c33675a6fac1e27cb27d09d97aefd9.camel@gmail.com>
Subject: Re: [PATCH -perfbook 0/6] Update Dockerfiles
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Tue, 26 Sep 2023 23:49:34 -0300
In-Reply-To: <309f740a-b678-3983-2847-e1bd9b64e90c@gmail.com>
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
	 <203674d7-5b6d-1d09-5de1-ef824d1b7017@gmail.com>
	 <170675ed7b1b5d86cc9ebac30f05a03c9677ba92.camel@gmail.com>
	 <fece6e8f-4e1d-de11-a082-b80eebb28c66@gmail.com>
	 <309f740a-b678-3983-2847-e1bd9b64e90c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
List-ID: <perfbook.vger.kernel.org>

Hello Akira,

On Sat, 2023-09-23 at 08:52 +0900, Akira Yokosawa wrote:
> Hi Leo,
>=20
> Follow-up news on font info in PDF:
>=20
> On 2023/06/16 20:05, Akira Yokosawa wrote:
> > On 2023/06/16 15:07, Leonardo Br=C3=A1s wrote:
> > > On Thu, 2023-06-15 at 19:43 +0900, Akira Yokosawa wrote:
> > > > [+To: Leo]
> > > >=20
> > > > On 2023/06/15 18:48, Akira Yokosawa wrote:
> > > > > Hi Paul,
> > > > >=20
> > > > > Commit a80a57b21a5e ("fixsvgfonts.sh: Convert sans-serif into 'De=
jaVu Sans'")
> > > > > assumed that having "DejaVu Sans Mono" is sufficent for "DejaVu S=
ans".
> > > > >=20
> > > > > It turns out that docker/Dockerfile.fedora doesn't cover "DejaVu =
Sans".
> > > > > Fedora's dejavu-sans-mono-fonts package doesn't contain "DejaVu S=
ans Mono"!
> > > > > There is a meta package of the name dejavu-fonts-all which covers=
 them
> > > > > both as well as dejavu-serif-fonts.
> > > > >=20
> > > > > It also turns out that Answer to #9 in FAQ-BUILD.txt saying:
> > > > >=20
> > > > >     As for Ubuntu and Fedora, packages listed in #5 should cover
> > > > >     all the font families needed.
> > > > >=20
> > > > > is wrong on the Fedora front.  DejaVu and Liberation fonts need
> > > > > font packages dejavu-fonts-all and liberation-fonts.
> > > > >=20
> > > > > Furthermore, Fedora 38 (released this April) has a regression of
> > > > > Inkscape where font markup is corrupted in SVG --> PDF conversion=
.
> > > >=20
> > > > Leo, just for you info, I see the same regression under Arch Linux.
> > >=20
> > > Hello Akira, thanks for letting me know!
> > >=20
> > > >=20
> > > > Pick a perfbook.pdf from your gitlab-ci build, and run:
> > > >=20
> > > >     pdffonts perfbook.pdf
> > > >=20
> > > > You will see something like (I don't know how the corrupted encodin=
g
> > > > will work in your mailbox...):
> > > >=20
> > > > name                                 type              encoding    =
     emb sub uni object ID
> > > > ------------------------------------ ----------------- ------------=
---- --- --- --- ---------
> > > > WGDPYX+LMMono8-Regular               Type 1            Custom      =
     yes yes yes   1722  0
> > > > ULGKTM+TeXGyreTermesX-Regular        Type 1            Custom      =
     yes yes yes   1725  0
> > > > OTFSIT+LMMono12-Regular              Type 1            Custom      =
     yes yes yes   1726  0
> > > > IYVMBP+TeXGyreTermesX-Bold           Type 1            Custom      =
     yes yes yes   1741  0
> > > > PSUFXP+TeXGyreTermes-Regular         Type 1            Custom      =
     yes yes yes   1742  0
> > > > IMBSNT+NimbusRomNo9L-Regu-Slant_167  Type 1            Custom      =
     yes yes yes   1929  0
> > > > NWEUXR+LMMonoLt10-Bold               Type 1            Custom      =
     yes yes yes   2227  0
> > > > EOPMEH+LinBiolinumTI                 Type 1            Custom      =
     yes yes yes   2673  0
> > > > UHVCIJ+LinBiolinumT                  Type 1            Custom      =
     yes yes yes   2674  0
> > > > EOPMEH+LinBiolinumTI                 Type 1            Custom      =
     yes yes yes   2677  0
> > > > OIRARM+LMMono10-Regular              Type 1            Custom      =
     yes yes yes   2764  0
> > > > TLODOC+txsys                         Type 1            Builtin     =
     yes yes yes   2828  0
> > > > UFJTMD+StandardSymL                  Type 1            Builtin     =
     yes yes yes   2830  0
> > > > IGSKIX+NewTXMI5                      Type 1            Builtin     =
     yes yes yes   2831  0
> > > > VVGNAR+TeXGyreTermesX-Italic         Type 1            Custom      =
     yes yes yes   2921  0
> > > > YFRDMR+NimbusSanL-Regu               Type 1            Custom      =
     yes yes no    2980  0
> > > > YFRDMR+NimbusSanL-Regu               Type 1            Custom      =
     yes yes no    3012  0
> > > > JZAPTL+k=E6=B9=8C=E9=A1=95                       CID Type 0C       =
Identity-H       yes yes yes   3038  0
> > > > XCILRI+i=E6=B9=8C=E9=A1=95                       Type 1C           =
WinAnsi          yes yes yes   3039  0
> > > > CZRRGJ+=3D=E6=BD=8C=E9=A1=95                       CID Type 0C     =
  Identity-H       yes yes yes   3040  0
> > > > LAEXLB+o=E6=B9=8C=E9=A1=95                       Type 1C           =
WinAnsi          yes yes yes   3041  0
> > > > WJVJMV+NimbusSans-Regular            Type 1C           Custom      =
     yes yes no    3066  0
> > > > WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi     =
     yes yes no    3129  0
> > > > LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi     =
     yes yes no    3130  0
> > > > WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi     =
     yes yes no    3159  0
> > > > LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi     =
     yes yes no    3160  0
> > > > DEIMBC+j=EC=86=9B=E6=85=95                       TrueType          =
WinAnsi          yes yes yes   3209  0
> > > > RWADWA+=E8=9B=92=E0=AD=96                       TrueType          W=
inAnsi          yes yes yes   3238  0
> > > > HDCMTE+=E8=9B=92=E0=AD=96                       TrueType          W=
inAnsi          yes yes yes   3239  0
> > > > JGKXJS+=C2=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=E4=95=96                  =
    Type 1C           WinAnsi          yes yes yes   3269  0
> > > > ANXDLC+X=DB=A8=E3=9D=96                        TrueType          Wi=
nAnsi          yes yes yes   3320  0
> > > > RUPDBM+=D1=93=E3=A1=96                       Type 1C           WinA=
nsi          yes yes yes   3553  00
> > > > LWHAZS+=E7=A7=9E=E7=85=95                       Type 1C           W=
inAnsi          yes yes yes   3560  0
> > > > RQGRST+A=E7=BB=9E=E7=85=95                       TrueType          =
WinAnsi          yes yes yes   3561  0
> > > >=20
> > > > [...]
> > > >=20
> > > > Expected output is:
> > > >=20
> > > > name                                 type              encoding    =
     emb sub uni object ID
> > > > ------------------------------------ ----------------- ------------=
---- --- --- --- ---------
> > > > WGDPYX+LMMono8-Regular               Type 1            Custom      =
     yes yes yes   1722  0
> > > > ULGKTM+TeXGyreTermesX-Regular        Type 1            Custom      =
     yes yes yes   1725  0
> > > > ICXLWS+LMMono12-Regular              Type 1            Custom      =
     yes yes yes   1726  0
> > > > IYVMBP+TeXGyreTermesX-Bold           Type 1            Custom      =
     yes yes yes   1741  0
> > > > PSUFXP+TeXGyreTermes-Regular         Type 1            Custom      =
     yes yes yes   1742  0
> > > > IMBSNT+NimbusRomNo9L-Regu-Slant_167  Type 1            Custom      =
     yes yes yes   1929  0
> > > > NUKNCC+LMMonoLt10-Bold               Type 1            Custom      =
     yes yes yes   2227  0
> > > > EOPMEH+LinBiolinumTI                 Type 1            Custom      =
     yes yes yes   2673  0
> > > > UHVCIJ+LinBiolinumT                  Type 1            Custom      =
     yes yes yes   2674  0
> > > > EOPMEH+LinBiolinumTI                 Type 1            Custom      =
     yes yes yes   2677  0
> > > > OIRARM+LMMono10-Regular              Type 1            Custom      =
     yes yes yes   2764  0
> > > > TLODOC+txsys                         Type 1            Builtin     =
     yes yes yes   2828  0
> > > > UFJTMD+StandardSymL                  Type 1            Builtin     =
     yes yes yes   2830  0
> > > > IGSKIX+NewTXMI5                      Type 1            Builtin     =
     yes yes yes   2831  0
> > > > VVGNAR+TeXGyreTermesX-Italic         Type 1            Custom      =
     yes yes yes   2921  0
> > > > YFRDMR+NimbusSanL-Regu               Type 1            Custom      =
     yes yes no    2980  0
> > > > YFRDMR+NimbusSanL-Regu               Type 1            Custom      =
     yes yes no    3012  0
> > > > QNDHMI+NimbusSans-Regular            CID Type 0C       Identity-H  =
     yes yes yes   3038  0
> > > > JKBTOX+NimbusSans-Regular            Type 1C           WinAnsi     =
     yes yes yes   3039  0
> > > > BIKSFC+NimbusSans-Bold               CID Type 0C       Identity-H  =
     yes yes yes   3040  0
> > > > XFXZKY+NimbusSans-Bold               Type 1C           WinAnsi     =
     yes yes yes   3041  0
> > > > WJVJMV+NimbusSans-Regular            Type 1C           Custom      =
     yes yes no    3066  0
> > > > WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi     =
     yes yes no    3129  0
> > > > LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi     =
     yes yes no    3130  0
> > > > WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi     =
     yes yes no    3159  0
> > > > LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi     =
     yes yes no    3160  0
> > > > KPAYFY+steelcitycomic                TrueType          WinAnsi     =
     yes yes yes   3209  0
> > > > IGYOWD+steelcitycomic                TrueType          WinAnsi     =
     yes yes yes   3238  0
> > > > LVRVOR+steelcitycomic                TrueType          WinAnsi     =
     yes yes yes   3239  0
> > > > OCNFNQ+FreeMonoBold                  Type 1C           WinAnsi     =
     yes yes yes   3269  0
> > > > DHHOAV+DejaVuSans                    TrueType          WinAnsi     =
     yes yes yes   3320  0
> > > > RVTHEX+DejaVuSansMono-Bold           TrueType          WinAnsi     =
     yes yes yes   3479  0
> > > > ODJFYL+FreeMonoBold                  Type 1C           WinAnsi     =
     yes yes yes   3553  0
> > > > HAXSLA+URWGothic-DemiOblique         Type 1C           WinAnsi     =
     yes yes yes   3560  0
> > > > [...]
> > > >=20
> > >=20
> > > IIUC, the issue is the appearing of non-ascii chars in the output of =
pdffonts,
> > > is that correct?
> >=20
> > Right.
> >=20
> > >=20
> > > Arch Linux provides two packages for DejaVu fonts:
> > > ttf-dejavu and ttf-dejavu-nerd, and both seem to provide DejaVu-Sans-=
mono
> > >=20
> > > In this test, I install them both, just for the sake of trying to fix=
 the issue:
> > > https://gitlab.com/linux-kernel/perfbook/-/jobs/4485677006
> > >=20
> > > I also added pdffonts command in the end to make it easier to verify =
if
> > > everything is fine, which still outputs non-ascii names.=20
> > >=20
> > > When I grep for DejaVuSansMono I see them appearing in the output of =
the job,
> > > and also in a previous pdf I have downloaded.
> > >=20
> > > I don't quite understand this, but maybe the issue is missing other f=
onts?
> > >=20
> > > Please help me understand the issue.
> >=20
> > As far as I see, there is no font problem on your side.
> > I think this is regression of Inkscape.
> >=20
> > As a matter of fact, Inkscape packages on most rolling-release distros
> > are having a more annoying regression, random SIGSEGV when run from
> > CLI under Gnome desktop environment.
> >=20
> > See: https://gitlab.com/inkscape/inkscape/-/issues/4177
> >      "glib2 2.76.0 breaks Command Line export"
> >=20
> > This issue was opened back on January 24, 2023.
> > It was once believed to have been resolved with a fix in gtk3, but the
> > issue still remains after the fixed version of gtk3 reached Fedora 38.
> > =20
> > For gitlab-ci, where there is no Gnome desktop involved, this issue
> > has never affected, but the font markup corruption has sneaked in
> > without being reported by anyone.
> >=20
> > I happened to test Dockerfile.fedora (from fedora:38) and checked if
> > "DejaVu Sans" was used in Intel_Core2_arch-simplified.pdf as intended,
> > and failed to see the font markup.
> >=20
> > So, I think there is nothing wrong in your gitlab-ci.yaml script.
> > You need to wait until the regression is fixed in the Arch Linux
> > Inkscape or its dependency.
>=20
> It turns out there was a regression in Cairo 1.17.8 (released Feb 2, 2023=
).
> It was fixed in upstream Cairo on Feb 8, 2023.
> Soon-to-be-released Cairo 1.18.0 should have the fix.

Thanks for the update!

> I guess Arch Linux will get the Cairo upgrade soon after.

Today Cairo got updated to 1.18.0 in Arch Linux, and it totally fixes the i=
ssue.

Check this pipeline (fixed):
https://gitlab.com/linux-kernel/perfbook/-/pipelines/1017496054

The previous pipeline still reproduces the issue:
https://gitlab.com/linux-kernel/perfbook/-/pipelines/1014892578

Thanks!
Leo


>=20
> See: https://gitlab.freedesktop.org/cairo/cairo/-/issues/806
>=20
>         Thanks, Akira
>=20
> >=20
> > I have no idea how long that would take, though.
> >=20
> > Or you could switch the container to a fedora:37 or ubuntu:jammy
> > based one for the moment.
> >=20
> >         Thanks, Akira
> >=20
> > >=20
> > > Best regards,
> > > Leo
> > >=20
> > >=20
> > >=20
> > > >=20
> > > >         Thanks, Akira
> [...]

