Return-Path: <SRS0=5VrI=GD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QpUMikRxgieSzOmImswEpbkRwAfLRe8iqisdzVOHA1k=;
        b=aL9i7/N+9Dl9FARfPr72niKJhgAO162EX4aUwSl7gSa6JbgCmgyCs9/sgf0Yqs5yla
         820G6z1VkVi9F5Um4tV/S1JlWO0JUNHBrXbNywBAUfMI1rzkycfWH9yME5KIQUqfa1++
         B2nlwfwQ+ufdyFttLppAW1kv7H3KNt9A4t5QvskQQveAanB6IyHvIM14i4gDS0DF/usR
         8G5bGg5IzCv1ztay5fE3R71pjkVLJpXYRFYoqHs6NI0tdUqlXd/ub7syOMem47LkKGUa
         8DuTLVIB5G7aBT+RLjEzHclgsQeCpqb9xrOwcWHEVZM4IKghoqNuqhQe2X3GJQZwsIRf
         S+0A==
Subject: Re: FYI, Second Edition Release Candidate 1 now available
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <CADJjh6mLJtT8g0ZyO1bHkVN69YnvbEG4Xp_aD3iWs0heDgm06A@mail.gmail.com>
 <d62fdaa6-bdcf-9a34-9b78-57e103058d55@gmail.com>
 <CADJjh6kgrfGmxDaoT0RPoG5R=EJPRNfKv8LmFMLr8Fho8bJ=mw@mail.gmail.com>
 <4fc24c4c-1151-0133-7b19-b9a416af67ce@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <12f7f86d-1da0-f192-d215-db83de6e3a57@gmail.com>
Date: Thu, 31 Dec 2020 11:05:34 +0900
MIME-Version: 1.0
In-Reply-To: <4fc24c4c-1151-0133-7b19-b9a416af67ce@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 31 Dec 2020 08:14:36 +0900, Akira Yokosawa wrote:
> On Wed, 30 Dec 2020 21:18:24 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=
=D0=B9 =D0=94=D1=8C=D1=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE wrote:
>> Hi,
>>
>> a2ping is up to date
>> $ a2ping -v
>> a2ping.pl 2.84p, 2019-11-17
>> [..]
>>
>> My TexLive 2020 is not from Fedora packages but from TexArchive.
>=20
> Dmitry,
>=20
> By "from TexArchive", how did you install the TexLive 2020?
>=20
> When I install upstream TeX Live, I follow the instructions at:
>=20
>     https://www.tug.org/texlive/acquire-netinstall.html>=20
> By the way, in your error report, you said:
>=20
>>>> ...
>>>> SMPdesign/CPUvsEnet.eps --> SMPdesign/CPUvsEnet.pdf
>>>> SMPdesign/DiningPhilosopher4part-b.tex -->
>>>> SMPdesign/DiningPhilosopher4part-b.eps
>>>> sh utilities/mpostcheck.sh
>>>> SMPdesign/DiningPhilosopher4part-b.eps -->
>>>> SMPdesign/DiningPhilosopher4part-b.pdf
>>>> make: *** [Makefile:400: SMPdesign/DiningPhilosopher4part-b.pdf] Err=
or 1    ...
>=20
> , which suggests your a2ping & gs pair accepts other .eps files such as=

> /SMPdesign/CPUvsEnet.eps.
> If this is the case, I suspect that the .eps file generated from .tex
> is somehow incompatible with the command pair.
>=20
> Can you share your SMPdesign/DiningPhilosopher4part-b.eps so that I can=

> compare it with mine?

So I have installed upstream TeX Live on Fedora 33 (for the first time).
And the build of perfbook failed in a different way.

    SMPdesign/AllocatorPool.fig --> SMPdesign/AllocatorPool.eps
    mv: cannot stat 'SMPdesign/AllocatorPool.eps': No such file or direct=
ory
    utilities/fixanepsfonts-urwps.sh: line 26: SMPdesign/AllocatorPool.ep=
s.badfonts: No such file or directory
    rm: cannot remove 'SMPdesign/AllocatorPool.eps.badfonts': No such fil=
e or directory
    make: *** [Makefile:380: SMPdesign/AllocatorPool.eps] Error 1

Directly invoking fig2esp ends up in:

    $ fig2eps --nogv SMPdesign/AllocatorPool.fig=20
    This is fig2ps 1.5, Copyright (C) 2004-2006, 2008-2010 by Vincent Fou=
rmond
   =20
    fig2ps comes with ABSOLUTELY NO WARRANTY. This is free software, and
    you are welcome to redistribute it under the conditions stated in the=

    GPL.txt file in the source archive.
   =20
    Job 1 -- file SMPdesign/AllocatorPool.fig
    This is pdfTeX, Version 3.14159265-2.6-1.40.21 (TeX Live 2020) (prelo=
aded format=3Dlatex)
     restricted \write18 enabled.
    entering extended mode
     -> Problems with latex: command returned 256cannot remove path when =
cwd is /tmp/FwddsT3iVg for /tmp/FwddsT3iVg:  at /usr/bin/fig2eps line 254=
=2E

So there seems to be some incompatibility between fig2ps package of Fedor=
a 33
and upstream TeX Live.

Directly making SMPdesign/DiningPhilosopher5.eps also ends up in an error=
=2E
SMPdesign/DiningPhilosopher5.log has an error message which reads:

    (/usr/local/texlive/2020/texmf-dist/tex/latex/l3backend/l3backend-dvi=
ps.def
    File: l3backend-dvips.def 2020-09-24 L3 backend support: dvips
   =20
   =20
    ! LaTeX Error: Mismatched LaTeX support files detected.
                   Loading aborted!.
   =20
    See the LaTeX manual or LaTeX Companion for explanation.
    Type  H <return>  for immediate help.

Do you see similar error messages if you directly build these .eps files?=


Switching back to TeX Live 2020 of Fedora package restored the successful=
 build.

This suggests something in upstream TeX Live 2020 has lost compatibility =
with
Fedora 32/33 since this September/October.
I have no idea what went wrong, though. Both Fedora and upstream TeX Live=
 are
updated frequently, so...

        Thanks, Akira

>=20
>         Thanks, Akira
>=20
>>
>> Thank you, Akira!
>>
>> Dmitry
>>
>> =D1=81=D1=80, 30 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 18:42, Akira =
Yokosawa <akiyks@gmail.com>:
>>>
>>> On Wed, 30 Dec 2020 18:09:21 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=
=B8=D0=B9 =D0=94=D1=8C=D1=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE wrote:
>>>> Hello!
>>>>
>>>> Alas, perfbook cant build for me:
>>>> -- Fedora 32/x86_64
>>>> -- TexLive 2020 current from TexArchive (not Fedora packages)
>>>> -- ghostscript 9.53.3 from Fedora package
>>>> -- perfbook up-to-date
>>>>
>>>> If I remember correctly
>>>> last PASS for me was not early than  2020-september-28
>>>> first FAIL for me was not later than 2020-november-03
>>>>
>>>> clean build
>>>> $ cp -Rp ~/src/egit/perfbook/ .
>>>> $ cd perfbook/
>>>> $ make
>>>> sh ./utilities/gen_snippet_d.sh
>>>> ...
>>>> SMPdesign/CPUvsEnet.eps --> SMPdesign/CPUvsEnet.pdf
>>>> SMPdesign/DiningPhilosopher4part-b.tex -->
>>>> SMPdesign/DiningPhilosopher4part-b.eps
>>>> sh utilities/mpostcheck.sh
>>>> SMPdesign/DiningPhilosopher4part-b.eps -->
>>>> SMPdesign/DiningPhilosopher4part-b.pdf
>>>> make: *** [Makefile:400: SMPdesign/DiningPhilosopher4part-b.pdf] Err=
or 1
>>>
>>> Hi,
>>>
>>> Can't reproduce here on Fedora 33,
>>> TeXLive 2020 and ghostscript 9.53.3 from Fedora package.
>>>
>>> Is your a2ping up-to-date (a2ping.pl 2.84p, 2019-11-17)?
>>>
>>>         Thanks, Akira
>>>
>>>>
>>>> manual run last cmd
>>>> $ a2ping --below --hires --bboxfrom=3Dcompute-gs
>>>> SMPdesign/DiningPhilosopher4part-b.eps
>>>> SMPdesign/DiningPhilosopher4part-b.pdf
>>>> /run/media/dima/TexLive/bin/x86_64-linux/a2ping: warning: BBox
>>>> discovery was not successful
>>>>
>>>>
>>>> %%%% WARNING: Transparency operations ignored - need to use
>>>> -dALLOWPSTRANSPARENCY
>>>>
>>>> Error: /undefined in .setopacityalpha
>>>> Operand stack:
>>>>    1.0
>>>> Execution stack:
>>>>    %interp_exit   .runexec2   --nostringval--   --nostringval--
>>>> --nostringval--   2   %stopped_push   --nostringval--
>>>> --nostringval--   --nostringval--   false   1   %stopped_push   1974=

>>>> 1   3   %oparray_pop   1973   1   3   %oparray_pop   1961   1   3
>>>> %oparray_pop   1817   1   3   %oparray_pop   --nostringval--
>>>> %errorexec_pop   .runexec2   --nostringval--   --nostringval--
>>>> --nostringval--   2   %stopped_push   --nostringval--
>>>> Dictionary stack:
>>>>    --dict:738/1123(ro)(G)--   --dict:0/20(G)--   --dict:152/200(L)--=

>>>> --dict:180/300(L)--   --dict:38/200(L)--   --dict:127/200(L)--
>>>> Current allocation mode is local
>>>> GPL Ghostscript 9.53.3: Unrecoverable error, exit code 1
>>>> /run/media/dima/TexLive/bin/x86_64-linux/a2ping: closing gs filter: =
256
>>>>
>>>> Thank you,
>>>> Dmitry
>>>>
>>>> =D1=81=D1=80, 30 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 08:39, Paul=
 E. McKenney <paulmck@kernel.org>:
>>>>
>>>>>
>>>>> Hello!
>>>>>
>>>>> Release Candidate 1 of the Second Edition is now available, and I h=
ave
>>>>> started a prototype blog entry: https://paulmck.livejournal.com/599=
35.html
>>>>> Please let me know of any omissions or errors in this blog entry.  =
I expect
>>>>> to post it to my social media accounts in a few days.
>>>>>
>>>>> And thank you all for your interest in and contributions to perfboo=
k!
>>>>>
>>>>>                                                         Thanx, Paul=

>>>
>=20

