Return-Path: <SRS0=5VrI=GD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=64ySdxMLX6DEbyNgz+S6hJm/xJltQ1jGV19zNBdw1UU=;
        b=EPiACS7F4kF+o2SIe0bNW09eoTXPES1Z7w1pj28zIWp6TMltgI8c05LAnccx57/Lyi
         i4OIPWlXtt6MJ3Mv0RgqEh6Z7tVfwuq59r+F8VuvocUQmHgE2XftxTwRu45qipOtRcfM
         zvfPe5wcTSZzv+6D9kAMGdbLuxcWwapI8YF4dk7KZ3E0fjMeX0kpFAyZ5cFor9R8aUjg
         csm5ZVN0OBjKKJKh7uZ8V0NgoG4Ywnvc4/Nk3lZ5HZo4AeI6ngNJOlTuDJJok2jFVbqV
         2PgK3Ypkw2csXESM2C8YOSCoZs64AzwfSnXOACHpTqO3sZkT0WtOtumC98eY18IAC2tS
         XJzQ==
Subject: Re: FYI, Second Edition Release Candidate 1 now available
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <CADJjh6mLJtT8g0ZyO1bHkVN69YnvbEG4Xp_aD3iWs0heDgm06A@mail.gmail.com>
 <d62fdaa6-bdcf-9a34-9b78-57e103058d55@gmail.com>
 <CADJjh6kgrfGmxDaoT0RPoG5R=EJPRNfKv8LmFMLr8Fho8bJ=mw@mail.gmail.com>
 <4fc24c4c-1151-0133-7b19-b9a416af67ce@gmail.com>
 <12f7f86d-1da0-f192-d215-db83de6e3a57@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f3fcbc29-c778-f882-d38e-242b9a9e75c9@gmail.com>
Date: Thu, 31 Dec 2020 16:22:22 +0900
MIME-Version: 1.0
In-Reply-To: <12f7f86d-1da0-f192-d215-db83de6e3a57@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 31 Dec 2020 11:05:34 +0900, Akira Yokosawa wrote:
> On Thu, 31 Dec 2020 08:14:36 +0900, Akira Yokosawa wrote:
>> On Wed, 30 Dec 2020 21:18:24 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=
=D0=B9 =D0=94=D1=8C=D1=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE wrote:
>>> Hi,
>>>
>>> a2ping is up to date
>>> $ a2ping -v
>>> a2ping.pl 2.84p, 2019-11-17
>>> [..]
>>>
>>> My TexLive 2020 is not from Fedora packages but from TexArchive.
>>
>> Dmitry,
>>
>> By "from TexArchive", how did you install the TexLive 2020?
>>
>> When I install upstream TeX Live, I follow the instructions at:
>>
>>     https://www.tug.org/texlive/acquire-netinstall.html>=20
>> By the way, in your error report, you said:
>>
>>>>> ...
>>>>> SMPdesign/CPUvsEnet.eps --> SMPdesign/CPUvsEnet.pdf
>>>>> SMPdesign/DiningPhilosopher4part-b.tex -->
>>>>> SMPdesign/DiningPhilosopher4part-b.eps
>>>>> sh utilities/mpostcheck.sh
>>>>> SMPdesign/DiningPhilosopher4part-b.eps -->
>>>>> SMPdesign/DiningPhilosopher4part-b.pdf
>>>>> make: *** [Makefile:400: SMPdesign/DiningPhilosopher4part-b.pdf] Er=
ror 1    ...
>>
>> , which suggests your a2ping & gs pair accepts other .eps files such a=
s
>> /SMPdesign/CPUvsEnet.eps.
>> If this is the case, I suspect that the .eps file generated from .tex
>> is somehow incompatible with the command pair.
>>
>> Can you share your SMPdesign/DiningPhilosopher4part-b.eps so that I ca=
n
>> compare it with mine?
>=20
> So I have installed upstream TeX Live on Fedora 33 (for the first time)=
=2E
> And the build of perfbook failed in a different way.
>=20
>     SMPdesign/AllocatorPool.fig --> SMPdesign/AllocatorPool.eps
>     mv: cannot stat 'SMPdesign/AllocatorPool.eps': No such file or dire=
ctory
>     utilities/fixanepsfonts-urwps.sh: line 26: SMPdesign/AllocatorPool.=
eps.badfonts: No such file or directory
>     rm: cannot remove 'SMPdesign/AllocatorPool.eps.badfonts': No such f=
ile or directory
>     make: *** [Makefile:380: SMPdesign/AllocatorPool.eps] Error 1
>=20
> Directly invoking fig2esp ends up in:
>=20
>     $ fig2eps --nogv SMPdesign/AllocatorPool.fig=20
>     This is fig2ps 1.5, Copyright (C) 2004-2006, 2008-2010 by Vincent F=
ourmond
>    =20
>     fig2ps comes with ABSOLUTELY NO WARRANTY. This is free software, an=
d
>     you are welcome to redistribute it under the conditions stated in t=
he
>     GPL.txt file in the source archive.
>    =20
>     Job 1 -- file SMPdesign/AllocatorPool.fig
>     This is pdfTeX, Version 3.14159265-2.6-1.40.21 (TeX Live 2020) (pre=
loaded format=3Dlatex)
>      restricted \write18 enabled.
>     entering extended mode
>      -> Problems with latex: command returned 256cannot remove path whe=
n cwd is /tmp/FwddsT3iVg for /tmp/FwddsT3iVg:  at /usr/bin/fig2eps line 2=
54.
>=20
> So there seems to be some incompatibility between fig2ps package of Fed=
ora 33
> and upstream TeX Live.
>=20
> Directly making SMPdesign/DiningPhilosopher5.eps also ends up in an err=
or.
> SMPdesign/DiningPhilosopher5.log has an error message which reads:
>=20
>     (/usr/local/texlive/2020/texmf-dist/tex/latex/l3backend/l3backend-d=
vips.def
>     File: l3backend-dvips.def 2020-09-24 L3 backend support: dvips
>    =20
>    =20
>     ! LaTeX Error: Mismatched LaTeX support files detected.
>                    Loading aborted!.
>    =20
>     See the LaTeX manual or LaTeX Companion for explanation.
>     Type  H <return>  for immediate help.
>=20
> Do you see similar error messages if you directly build these .eps file=
s?
>=20
> Switching back to TeX Live 2020 of Fedora package restored the successf=
ul build.
>=20
> This suggests something in upstream TeX Live 2020 has lost compatibilit=
y with
> Fedora 32/33 since this September/October.
> I have no idea what went wrong, though. Both Fedora and upstream TeX Li=
ve are
> updated frequently, so...

Dmitry,

I have resolved a issue on my side (clash of $HOME/.texlive2020 with
the Fedora's TeX Live) and now I see the same error as you have reported.=


Now I can compare the .eps files on my own.

        Thanks, Akira

>=20
>         Thanks, Akira
>=20
>>
>>         Thanks, Akira
>>
>>>
>>> Thank you, Akira!
>>>
>>> Dmitry
>>>
>>> =D1=81=D1=80, 30 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 18:42, Akira=
 Yokosawa <akiyks@gmail.com>:
>>>>
>>>> On Wed, 30 Dec 2020 18:09:21 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=
=B8=D0=B9 =D0=94=D1=8C=D1=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE wrote:
>>>>> Hello!
>>>>>
>>>>> Alas, perfbook cant build for me:
>>>>> -- Fedora 32/x86_64
>>>>> -- TexLive 2020 current from TexArchive (not Fedora packages)
>>>>> -- ghostscript 9.53.3 from Fedora package
>>>>> -- perfbook up-to-date
>>>>>
>>>>> If I remember correctly
>>>>> last PASS for me was not early than  2020-september-28
>>>>> first FAIL for me was not later than 2020-november-03
>>>>>
>>>>> clean build
>>>>> $ cp -Rp ~/src/egit/perfbook/ .
>>>>> $ cd perfbook/
>>>>> $ make
>>>>> sh ./utilities/gen_snippet_d.sh
>>>>> ...
>>>>> SMPdesign/CPUvsEnet.eps --> SMPdesign/CPUvsEnet.pdf
>>>>> SMPdesign/DiningPhilosopher4part-b.tex -->
>>>>> SMPdesign/DiningPhilosopher4part-b.eps
>>>>> sh utilities/mpostcheck.sh
>>>>> SMPdesign/DiningPhilosopher4part-b.eps -->
>>>>> SMPdesign/DiningPhilosopher4part-b.pdf
>>>>> make: *** [Makefile:400: SMPdesign/DiningPhilosopher4part-b.pdf] Er=
ror 1
>>>>
>>>> Hi,
>>>>
>>>> Can't reproduce here on Fedora 33,
>>>> TeXLive 2020 and ghostscript 9.53.3 from Fedora package.
>>>>
>>>> Is your a2ping up-to-date (a2ping.pl 2.84p, 2019-11-17)?
>>>>
>>>>         Thanks, Akira
>>>>
>>>>>
>>>>> manual run last cmd
>>>>> $ a2ping --below --hires --bboxfrom=3Dcompute-gs
>>>>> SMPdesign/DiningPhilosopher4part-b.eps
>>>>> SMPdesign/DiningPhilosopher4part-b.pdf
>>>>> /run/media/dima/TexLive/bin/x86_64-linux/a2ping: warning: BBox
>>>>> discovery was not successful
>>>>>
>>>>>
>>>>> %%%% WARNING: Transparency operations ignored - need to use
>>>>> -dALLOWPSTRANSPARENCY
>>>>>
>>>>> Error: /undefined in .setopacityalpha
>>>>> Operand stack:
>>>>>    1.0
>>>>> Execution stack:
>>>>>    %interp_exit   .runexec2   --nostringval--   --nostringval--
>>>>> --nostringval--   2   %stopped_push   --nostringval--
>>>>> --nostringval--   --nostringval--   false   1   %stopped_push   197=
4
>>>>> 1   3   %oparray_pop   1973   1   3   %oparray_pop   1961   1   3
>>>>> %oparray_pop   1817   1   3   %oparray_pop   --nostringval--
>>>>> %errorexec_pop   .runexec2   --nostringval--   --nostringval--
>>>>> --nostringval--   2   %stopped_push   --nostringval--
>>>>> Dictionary stack:
>>>>>    --dict:738/1123(ro)(G)--   --dict:0/20(G)--   --dict:152/200(L)-=
-
>>>>> --dict:180/300(L)--   --dict:38/200(L)--   --dict:127/200(L)--
>>>>> Current allocation mode is local
>>>>> GPL Ghostscript 9.53.3: Unrecoverable error, exit code 1
>>>>> /run/media/dima/TexLive/bin/x86_64-linux/a2ping: closing gs filter:=
 256
>>>>>
>>>>> Thank you,
>>>>> Dmitry
>>>>>
>>>>> =D1=81=D1=80, 30 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 08:39, Pau=
l E. McKenney <paulmck@kernel.org>:
>>>>>
>>>>>>
>>>>>> Hello!
>>>>>>
>>>>>> Release Candidate 1 of the Second Edition is now available, and I =
have
>>>>>> started a prototype blog entry: https://paulmck.livejournal.com/59=
935.html
>>>>>> Please let me know of any omissions or errors in this blog entry. =
 I expect
>>>>>> to post it to my social media accounts in a few days.
>>>>>>
>>>>>> And thank you all for your interest in and contributions to perfbo=
ok!
>>>>>>
>>>>>>                                                         Thanx, Pau=
l
>>>>
>>
>=20

