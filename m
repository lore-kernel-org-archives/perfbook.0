Return-Path: <SRS0=7RMV=FG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695426739; x=1696031539; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gw1vlBfx/otkb1a98VGnLqjxYOedTyv9TrnAMZDlID0=;
        b=cmytvNTobn0zlF3E4qFFcNH/5f9zT68sxUpRZvGj/Dn9SJiefQZmvEdVHl3UjmENna
         Vozf5CzBEJWH3+PX0AteUaig2OHnc6lHHBYN5vNK/tB4Zz/EC7Vwa3qaG8+aYI1K2owP
         KsOfA1XI9gat1IRe2VkoL/W31Taed71kKhoHjpH3ErGG/7MEdhFQ3KhUlKp53dHngl+G
         U46tM8RYfUulIfxXf7uyyvKgd4p4riZKZJWgUbNDoS/+oW9M4QlLgJ5Eqsnm79Bd20ky
         iMYfxmoPWuQea3BVx0o2LvU48ALxVuhAACsbYJvV1LwKa/SXzkcg5IxqqUishf3ZnCCP
         Cu7g==
Message-ID: <309f740a-b678-3983-2847-e1bd9b64e90c@gmail.com>
Date: Sat, 23 Sep 2023 08:52:16 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 0/6] Update Dockerfiles
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
 <203674d7-5b6d-1d09-5de1-ef824d1b7017@gmail.com>
 <170675ed7b1b5d86cc9ebac30f05a03c9677ba92.camel@gmail.com>
 <fece6e8f-4e1d-de11-a082-b80eebb28c66@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <fece6e8f-4e1d-de11-a082-b80eebb28c66@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Leo,

Follow-up news on font info in PDF:

On 2023/06/16 20:05, Akira Yokosawa wrote:
> On 2023/06/16 15:07, Leonardo Br=C3=A1s wrote:
>> On Thu, 2023-06-15 at 19:43 +0900, Akira Yokosawa wrote:
>>> [+To: Leo]
>>>
>>> On 2023/06/15 18:48, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> Commit a80a57b21a5e ("fixsvgfonts.sh: Convert sans-serif into 'DejaV=
u Sans'")
>>>> assumed that having "DejaVu Sans Mono" is sufficent for "DejaVu Sans=
".
>>>>
>>>> It turns out that docker/Dockerfile.fedora doesn't cover "DejaVu San=
s".
>>>> Fedora's dejavu-sans-mono-fonts package doesn't contain "DejaVu Sans=
 Mono"!
>>>> There is a meta package of the name dejavu-fonts-all which covers th=
em
>>>> both as well as dejavu-serif-fonts.
>>>>
>>>> It also turns out that Answer to #9 in FAQ-BUILD.txt saying:
>>>>
>>>>     As for Ubuntu and Fedora, packages listed in #5 should cover
>>>>     all the font families needed.
>>>>
>>>> is wrong on the Fedora front.  DejaVu and Liberation fonts need
>>>> font packages dejavu-fonts-all and liberation-fonts.
>>>>
>>>> Furthermore, Fedora 38 (released this April) has a regression of
>>>> Inkscape where font markup is corrupted in SVG --> PDF conversion.
>>>
>>> Leo, just for you info, I see the same regression under Arch Linux.
>>
>> Hello Akira, thanks for letting me know!
>>
>>>
>>> Pick a perfbook.pdf from your gitlab-ci build, and run:
>>>
>>>     pdffonts perfbook.pdf
>>>
>>> You will see something like (I don't know how the corrupted encoding
>>> will work in your mailbox...):
>>>
>>> name                                 type              encoding      =
   emb sub uni object ID
>>> ------------------------------------ ----------------- --------------=
-- --- --- --- ---------
>>> WGDPYX+LMMono8-Regular               Type 1            Custom        =
   yes yes yes   1722  0
>>> ULGKTM+TeXGyreTermesX-Regular        Type 1            Custom        =
   yes yes yes   1725  0
>>> OTFSIT+LMMono12-Regular              Type 1            Custom        =
   yes yes yes   1726  0
>>> IYVMBP+TeXGyreTermesX-Bold           Type 1            Custom        =
   yes yes yes   1741  0
>>> PSUFXP+TeXGyreTermes-Regular         Type 1            Custom        =
   yes yes yes   1742  0
>>> IMBSNT+NimbusRomNo9L-Regu-Slant_167  Type 1            Custom        =
   yes yes yes   1929  0
>>> NWEUXR+LMMonoLt10-Bold               Type 1            Custom        =
   yes yes yes   2227  0
>>> EOPMEH+LinBiolinumTI                 Type 1            Custom        =
   yes yes yes   2673  0
>>> UHVCIJ+LinBiolinumT                  Type 1            Custom        =
   yes yes yes   2674  0
>>> EOPMEH+LinBiolinumTI                 Type 1            Custom        =
   yes yes yes   2677  0
>>> OIRARM+LMMono10-Regular              Type 1            Custom        =
   yes yes yes   2764  0
>>> TLODOC+txsys                         Type 1            Builtin       =
   yes yes yes   2828  0
>>> UFJTMD+StandardSymL                  Type 1            Builtin       =
   yes yes yes   2830  0
>>> IGSKIX+NewTXMI5                      Type 1            Builtin       =
   yes yes yes   2831  0
>>> VVGNAR+TeXGyreTermesX-Italic         Type 1            Custom        =
   yes yes yes   2921  0
>>> YFRDMR+NimbusSanL-Regu               Type 1            Custom        =
   yes yes no    2980  0
>>> YFRDMR+NimbusSanL-Regu               Type 1            Custom        =
   yes yes no    3012  0
>>> JZAPTL+k=E6=B9=8C=E9=A1=95                       CID Type 0C       Id=
entity-H       yes yes yes   3038  0
>>> XCILRI+i=E6=B9=8C=E9=A1=95                       Type 1C           Wi=
nAnsi          yes yes yes   3039  0
>>> CZRRGJ+=3D=E6=BD=8C=E9=A1=95                       CID Type 0C       =
Identity-H       yes yes yes   3040  0
>>> LAEXLB+o=E6=B9=8C=E9=A1=95                       Type 1C           Wi=
nAnsi          yes yes yes   3041  0
>>> WJVJMV+NimbusSans-Regular            Type 1C           Custom        =
   yes yes no    3066  0
>>> WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi       =
   yes yes no    3129  0
>>> LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi       =
   yes yes no    3130  0
>>> WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi       =
   yes yes no    3159  0
>>> LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi       =
   yes yes no    3160  0
>>> DEIMBC+j=EC=86=9B=E6=85=95                       TrueType          Wi=
nAnsi          yes yes yes   3209  0
>>> RWADWA+=E8=9B=92=E0=AD=96                       TrueType          Win=
Ansi          yes yes yes   3238  0
>>> HDCMTE+=E8=9B=92=E0=AD=96                       TrueType          Win=
Ansi          yes yes yes   3239  0
>>> JGKXJS+=C2=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=E4=95=96                    =
  Type 1C           WinAnsi          yes yes yes   3269  0
>>> ANXDLC+X=DB=A8=E3=9D=96                        TrueType          WinA=
nsi          yes yes yes   3320  0
>>> RUPDBM+=D1=93=E3=A1=96                       Type 1C           WinAns=
i          yes yes yes   3553  00
>>> LWHAZS+=E7=A7=9E=E7=85=95                       Type 1C           Win=
Ansi          yes yes yes   3560  0
>>> RQGRST+A=E7=BB=9E=E7=85=95                       TrueType          Wi=
nAnsi          yes yes yes   3561  0
>>>
>>> [...]
>>>
>>> Expected output is:
>>>
>>> name                                 type              encoding      =
   emb sub uni object ID
>>> ------------------------------------ ----------------- --------------=
-- --- --- --- ---------
>>> WGDPYX+LMMono8-Regular               Type 1            Custom        =
   yes yes yes   1722  0
>>> ULGKTM+TeXGyreTermesX-Regular        Type 1            Custom        =
   yes yes yes   1725  0
>>> ICXLWS+LMMono12-Regular              Type 1            Custom        =
   yes yes yes   1726  0
>>> IYVMBP+TeXGyreTermesX-Bold           Type 1            Custom        =
   yes yes yes   1741  0
>>> PSUFXP+TeXGyreTermes-Regular         Type 1            Custom        =
   yes yes yes   1742  0
>>> IMBSNT+NimbusRomNo9L-Regu-Slant_167  Type 1            Custom        =
   yes yes yes   1929  0
>>> NUKNCC+LMMonoLt10-Bold               Type 1            Custom        =
   yes yes yes   2227  0
>>> EOPMEH+LinBiolinumTI                 Type 1            Custom        =
   yes yes yes   2673  0
>>> UHVCIJ+LinBiolinumT                  Type 1            Custom        =
   yes yes yes   2674  0
>>> EOPMEH+LinBiolinumTI                 Type 1            Custom        =
   yes yes yes   2677  0
>>> OIRARM+LMMono10-Regular              Type 1            Custom        =
   yes yes yes   2764  0
>>> TLODOC+txsys                         Type 1            Builtin       =
   yes yes yes   2828  0
>>> UFJTMD+StandardSymL                  Type 1            Builtin       =
   yes yes yes   2830  0
>>> IGSKIX+NewTXMI5                      Type 1            Builtin       =
   yes yes yes   2831  0
>>> VVGNAR+TeXGyreTermesX-Italic         Type 1            Custom        =
   yes yes yes   2921  0
>>> YFRDMR+NimbusSanL-Regu               Type 1            Custom        =
   yes yes no    2980  0
>>> YFRDMR+NimbusSanL-Regu               Type 1            Custom        =
   yes yes no    3012  0
>>> QNDHMI+NimbusSans-Regular            CID Type 0C       Identity-H    =
   yes yes yes   3038  0
>>> JKBTOX+NimbusSans-Regular            Type 1C           WinAnsi       =
   yes yes yes   3039  0
>>> BIKSFC+NimbusSans-Bold               CID Type 0C       Identity-H    =
   yes yes yes   3040  0
>>> XFXZKY+NimbusSans-Bold               Type 1C           WinAnsi       =
   yes yes yes   3041  0
>>> WJVJMV+NimbusSans-Regular            Type 1C           Custom        =
   yes yes no    3066  0
>>> WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi       =
   yes yes no    3129  0
>>> LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi       =
   yes yes no    3130  0
>>> WGDQZH+NimbusSans-Regular            Type 1C           WinAnsi       =
   yes yes no    3159  0
>>> LSRNIT+NimbusSans-BoldItalic         Type 1C           WinAnsi       =
   yes yes no    3160  0
>>> KPAYFY+steelcitycomic                TrueType          WinAnsi       =
   yes yes yes   3209  0
>>> IGYOWD+steelcitycomic                TrueType          WinAnsi       =
   yes yes yes   3238  0
>>> LVRVOR+steelcitycomic                TrueType          WinAnsi       =
   yes yes yes   3239  0
>>> OCNFNQ+FreeMonoBold                  Type 1C           WinAnsi       =
   yes yes yes   3269  0
>>> DHHOAV+DejaVuSans                    TrueType          WinAnsi       =
   yes yes yes   3320  0
>>> RVTHEX+DejaVuSansMono-Bold           TrueType          WinAnsi       =
   yes yes yes   3479  0
>>> ODJFYL+FreeMonoBold                  Type 1C           WinAnsi       =
   yes yes yes   3553  0
>>> HAXSLA+URWGothic-DemiOblique         Type 1C           WinAnsi       =
   yes yes yes   3560  0
>>> [...]
>>>
>>
>> IIUC, the issue is the appearing of non-ascii chars in the output of p=
dffonts,
>> is that correct?
>=20
> Right.
>=20
>>
>> Arch Linux provides two packages for DejaVu fonts:
>> ttf-dejavu and ttf-dejavu-nerd, and both seem to provide DejaVu-Sans-m=
ono
>>
>> In this test, I install them both, just for the sake of trying to fix =
the issue:
>> https://gitlab.com/linux-kernel/perfbook/-/jobs/4485677006
>>
>> I also added pdffonts command in the end to make it easier to verify i=
f
>> everything is fine, which still outputs non-ascii names.=20
>>
>> When I grep for DejaVuSansMono I see them appearing in the output of t=
he job,
>> and also in a previous pdf I have downloaded.
>>
>> I don't quite understand this, but maybe the issue is missing other fo=
nts?
>>
>> Please help me understand the issue.
>=20
> As far as I see, there is no font problem on your side.
> I think this is regression of Inkscape.
>=20
> As a matter of fact, Inkscape packages on most rolling-release distros
> are having a more annoying regression, random SIGSEGV when run from
> CLI under Gnome desktop environment.
>=20
> See: https://gitlab.com/inkscape/inkscape/-/issues/4177
>      "glib2 2.76.0 breaks Command Line export"
>=20
> This issue was opened back on January 24, 2023.
> It was once believed to have been resolved with a fix in gtk3, but the
> issue still remains after the fixed version of gtk3 reached Fedora 38.
> =20
> For gitlab-ci, where there is no Gnome desktop involved, this issue
> has never affected, but the font markup corruption has sneaked in
> without being reported by anyone.
>=20
> I happened to test Dockerfile.fedora (from fedora:38) and checked if
> "DejaVu Sans" was used in Intel_Core2_arch-simplified.pdf as intended,
> and failed to see the font markup.
>=20
> So, I think there is nothing wrong in your gitlab-ci.yaml script.
> You need to wait until the regression is fixed in the Arch Linux
> Inkscape or its dependency.

It turns out there was a regression in Cairo 1.17.8 (released Feb 2, 2023=
).
It was fixed in upstream Cairo on Feb 8, 2023.
Soon-to-be-released Cairo 1.18.0 should have the fix.
I guess Arch Linux will get the Cairo upgrade soon after.

See: https://gitlab.freedesktop.org/cairo/cairo/-/issues/806

        Thanks, Akira

>=20
> I have no idea how long that would take, though.
>=20
> Or you could switch the container to a fedora:37 or ubuntu:jammy
> based one for the moment.
>=20
>         Thanks, Akira
>=20
>>
>> Best regards,
>> Leo
>>
>>
>>
>>>
>>>         Thanks, Akira
[...]
