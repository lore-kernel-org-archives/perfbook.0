Return-Path: <SRS0=4dhI=GC=gmail.com=dimhen@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ln/RYRUWhdkhqh0qeVJMyLJjQvClXVrHvm6F3nKpXdU=;
        b=aM9Ro/BB1vQp2t4kBg1cuk5HC6kQVAvNOlQ3qVlVbZeL+QG9/EUw3PBtyQmcgSJkHd
         HVXZOjOyIerhFj1v8EI56ES6AGsYXyxfCah5IlBwpKCi95lwzRRZUztFuLpoIlZIdC10
         MArh2Lm7M+IMSHBAv3ObsJ1O6vL0xfIEDSfLsnnUzM+F4Joyt8n1Gnft2eXkwYABEnnT
         VCoQYPq2HhhvMfX7OfWONZ4agxCdZCt0rX7PDZrV7S5TT0Db2emRd9DgtP3deetkDC4k
         dIY7ekbxJQImBFSduNRIkqT7APuTciHVIHVVFkoDOnT9RaCuQBkq+5c7CPSN9vQtQ1YR
         chSg==
MIME-Version: 1.0
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
In-Reply-To: <20201230053728.GA31231@paulmck-ThinkPad-P72>
From: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Date: Wed, 30 Dec 2020 18:09:21 +0300
Message-ID: <CADJjh6mLJtT8g0ZyO1bHkVN69YnvbEG4Xp_aD3iWs0heDgm06A@mail.gmail.com>
Subject: Re: FYI, Second Edition Release Candidate 1 now available
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello!

Alas, perfbook cant build for me:
-- Fedora 32/x86_64
-- TexLive 2020 current from TexArchive (not Fedora packages)
-- ghostscript 9.53.3 from Fedora package
-- perfbook up-to-date

If I remember correctly
last PASS for me was not early than  2020-september-28
first FAIL for me was not later than 2020-november-03

clean build
$ cp -Rp ~/src/egit/perfbook/ .
$ cd perfbook/
$ make
sh ./utilities/gen_snippet_d.sh
...
SMPdesign/CPUvsEnet.eps --> SMPdesign/CPUvsEnet.pdf
SMPdesign/DiningPhilosopher4part-b.tex -->
SMPdesign/DiningPhilosopher4part-b.eps
sh utilities/mpostcheck.sh
SMPdesign/DiningPhilosopher4part-b.eps -->
SMPdesign/DiningPhilosopher4part-b.pdf
make: *** [Makefile:400: SMPdesign/DiningPhilosopher4part-b.pdf] Error 1

manual run last cmd
$ a2ping --below --hires --bboxfrom=3Dcompute-gs
SMPdesign/DiningPhilosopher4part-b.eps
SMPdesign/DiningPhilosopher4part-b.pdf
/run/media/dima/TexLive/bin/x86_64-linux/a2ping: warning: BBox
discovery was not successful


%%%% WARNING: Transparency operations ignored - need to use
-dALLOWPSTRANSPARENCY

Error: /undefined in .setopacityalpha
Operand stack:
   1.0
Execution stack:
   %interp_exit   .runexec2   --nostringval--   --nostringval--
--nostringval--   2   %stopped_push   --nostringval--
--nostringval--   --nostringval--   false   1   %stopped_push   1974
1   3   %oparray_pop   1973   1   3   %oparray_pop   1961   1   3
%oparray_pop   1817   1   3   %oparray_pop   --nostringval--
%errorexec_pop   .runexec2   --nostringval--   --nostringval--
--nostringval--   2   %stopped_push   --nostringval--
Dictionary stack:
   --dict:738/1123(ro)(G)--   --dict:0/20(G)--   --dict:152/200(L)--
--dict:180/300(L)--   --dict:38/200(L)--   --dict:127/200(L)--
Current allocation mode is local
GPL Ghostscript 9.53.3: Unrecoverable error, exit code 1
/run/media/dima/TexLive/bin/x86_64-linux/a2ping: closing gs filter: 256

Thank you,
Dmitry

=D1=81=D1=80, 30 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 08:39, Paul E. McK=
enney <paulmck@kernel.org>:

>
> Hello!
>
> Release Candidate 1 of the Second Edition is now available, and I have
> started a prototype blog entry: https://paulmck.livejournal.com/59935.htm=
l
> Please let me know of any omissions or errors in this blog entry.  I expe=
ct
> to post it to my social media accounts in a few days.
>
> And thank you all for your interest in and contributions to perfbook!
>
>                                                         Thanx, Paul
