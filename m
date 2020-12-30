Return-Path: <SRS0=0yOs=GC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JV/wZ+UepcJPmSgE1TxNxbqECLEVKz1sEhbX769s1ps=;
        b=WBKx3/7GRvxXEgYnzwJgRY8Q378TPi1Tm8u+fkbeMjXSY6dOqC2c9v5zcAm9bJe75f
         G2fFv79c77PRj71zO242VHMUux/H4nEFzP9yrmySy8T/BQuRcJtfQL5CEb9YtoIyG83u
         +zUo6nO4rXBkHdypDkMQRsuQTlHYF0bGqlF6xwXff8ifntk74Xwqi+dXx/3S+XXAWcLR
         A8dYUseJ6f/dCn2HOyPnFK2LtBlHaKhfP7JBOF/eoKQmOuHLYS82M9Cw3EjDRhO3ukAY
         AxWohYcAZQErUAV+f5VRxkr3EPcTk0mKh622ctwpK3uf5Gdlc0kIN4gqdb79HMupwj5h
         fKSw==
Subject: Re: FYI, Second Edition Release Candidate 1 now available
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
 <CADJjh6mLJtT8g0ZyO1bHkVN69YnvbEG4Xp_aD3iWs0heDgm06A@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d62fdaa6-bdcf-9a34-9b78-57e103058d55@gmail.com>
Date: Thu, 31 Dec 2020 00:42:17 +0900
MIME-Version: 1.0
In-Reply-To: <CADJjh6mLJtT8g0ZyO1bHkVN69YnvbEG4Xp_aD3iWs0heDgm06A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 30 Dec 2020 18:09:21 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=
=B9 =D0=94=D1=8C=D1=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE wrote:
> Hello!
>=20
> Alas, perfbook cant build for me:
> -- Fedora 32/x86_64
> -- TexLive 2020 current from TexArchive (not Fedora packages)
> -- ghostscript 9.53.3 from Fedora package
> -- perfbook up-to-date
>=20
> If I remember correctly
> last PASS for me was not early than  2020-september-28
> first FAIL for me was not later than 2020-november-03
>=20
> clean build
> $ cp -Rp ~/src/egit/perfbook/ .
> $ cd perfbook/
> $ make
> sh ./utilities/gen_snippet_d.sh
> ...
> SMPdesign/CPUvsEnet.eps --> SMPdesign/CPUvsEnet.pdf
> SMPdesign/DiningPhilosopher4part-b.tex -->
> SMPdesign/DiningPhilosopher4part-b.eps
> sh utilities/mpostcheck.sh
> SMPdesign/DiningPhilosopher4part-b.eps -->
> SMPdesign/DiningPhilosopher4part-b.pdf
> make: *** [Makefile:400: SMPdesign/DiningPhilosopher4part-b.pdf] Error =
1

Hi,

Can't reproduce here on Fedora 33,
TeXLive 2020 and ghostscript 9.53.3 from Fedora package.

Is your a2ping up-to-date (a2ping.pl 2.84p, 2019-11-17)?

        Thanks, Akira
=20
>=20
> manual run last cmd
> $ a2ping --below --hires --bboxfrom=3Dcompute-gs
> SMPdesign/DiningPhilosopher4part-b.eps
> SMPdesign/DiningPhilosopher4part-b.pdf
> /run/media/dima/TexLive/bin/x86_64-linux/a2ping: warning: BBox
> discovery was not successful
>=20
>=20
> %%%% WARNING: Transparency operations ignored - need to use
> -dALLOWPSTRANSPARENCY
>=20
> Error: /undefined in .setopacityalpha
> Operand stack:
>    1.0
> Execution stack:
>    %interp_exit   .runexec2   --nostringval--   --nostringval--
> --nostringval--   2   %stopped_push   --nostringval--
> --nostringval--   --nostringval--   false   1   %stopped_push   1974
> 1   3   %oparray_pop   1973   1   3   %oparray_pop   1961   1   3
> %oparray_pop   1817   1   3   %oparray_pop   --nostringval--
> %errorexec_pop   .runexec2   --nostringval--   --nostringval--
> --nostringval--   2   %stopped_push   --nostringval--
> Dictionary stack:
>    --dict:738/1123(ro)(G)--   --dict:0/20(G)--   --dict:152/200(L)--
> --dict:180/300(L)--   --dict:38/200(L)--   --dict:127/200(L)--
> Current allocation mode is local
> GPL Ghostscript 9.53.3: Unrecoverable error, exit code 1
> /run/media/dima/TexLive/bin/x86_64-linux/a2ping: closing gs filter: 256=

>=20
> Thank you,
> Dmitry
>=20
> =D1=81=D1=80, 30 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 08:39, Paul E.=
 McKenney <paulmck@kernel.org>:
>=20
>>
>> Hello!
>>
>> Release Candidate 1 of the Second Edition is now available, and I have=

>> started a prototype blog entry: https://paulmck.livejournal.com/59935.=
html
>> Please let me know of any omissions or errors in this blog entry.  I e=
xpect
>> to post it to my social media accounts in a few days.
>>
>> And thank you all for your interest in and contributions to perfbook!
>>
>>                                                         Thanx, Paul

