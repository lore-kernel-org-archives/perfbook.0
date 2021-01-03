Return-Path: <SRS0=Fff6=GG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9J74HeuW7eY3A5IsrI63ZPnspge4idMA9xNCxtrySkk=;
        b=HcsoBgnYXNZ2gtovQvFXRSo2yTGORtHVTggNflHuSbBSHLOqtfiWSCKWx7vBX1hUyD
         sZdayvifjL0i1lDCG692nP3LVXyXJQL3Q0AhfEKksl3P6XynG7Yo4IKsigtZYs1odPHm
         jaoDlH83lsxqakPd/827H4sSRWZLRECvJ6k4FGUAjM1+hQ16GyOZReCIgzaLGfCVGmYP
         XoxUyxRZEeQ6wytVL6ctUzKJhpH2pZEEnT/KJO90cvNm3ckrxKOws2YppyAq9Dib98LD
         h+tgKnNPre1w6INgCUlvKGQFzMwrJEcpyMZnH7lR7e7T3NxYrjxLSwZGpOe4N2UA7hj/
         APYA==
Subject: Re: [PATCH -perfbook] Makefile: Cope with GhostScript 9.53.0 or later
References: <29de25dd-09e4-cd0b-a743-6e5a7c8dfb36@gmail.com>
 <87y2ha2i2i.fsf@kernel.org>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1d95fe13-87e7-7f3b-35b0-489eddb714ab@gmail.com>
Date: Mon, 4 Jan 2021 00:13:28 +0900
MIME-Version: 1.0
In-Reply-To: <87y2ha2i2i.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Felipe Balbi <balbi@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 03 Jan 2021 16:47:33 +0200, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Akira Yokosawa <akiyks@gmail.com> writes:
>=20
>> From f04ab9441df5256aa9df73bb4fa005b43517f2f2 Mon Sep 17 00:00:00 2001=

>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 3 Jan 2021 19:15:25 +0900
>> Subject: [PATCH -perfbook] Makefile: Cope with GhostScript 9.53.0 or l=
ater
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=3DUTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> Combination of GhostScript 9.53.x and pstricks-base 3.01 requires
>> an additional option of "gs" to enable transparency.
>>
>> Current version of a2ping can not cope with this change.
>>
>> Instead, use the pair of commands "ps2pdf" and "pdfcrop" for .eps
>> files originated from .tex sources.
>>
>> Reported-by: =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=94=D1=8C=D1=
=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE <dimhen@gmail.com>
>> Reported-by: Felipe Balbi <balbi@kernel.org>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>=20
> This seems to work fine, a few warnings during compilation of affected =
images:

Thank you for testing this, Felipe.

I'm aware of these messages and should have mentioned them in the commit
log.

=2Esetopacityalpha comes from pstricks-base package's pstricks.pro, which=

defines prologue code.  So pstricks-base will need yet another update whe=
n
it becomes actually unavailable.

I plan to keep these warning messages for a while.
New commands in a Makefile might behave unexpectedly.
I'm just cautious.  ;-)

>=20
> SMPdesign/DiningPhilosopher4part-b.eps --> SMPdesign/DiningPhilosopher4=
part-b.pdf
>    **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will=
 be removed in a future release
>    **** See .setfillconstantalpha/.setalphaisshape for the improved sol=
ution
>    **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will=
 be removed in a future release
>    **** See .setfillconstantalpha/.setalphaisshape for the improved sol=
ution
>    **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will=
 be removed in a future release
>    **** See .setfillconstantalpha/.setalphaisshape for the improved sol=
ution
>    **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will=
 be removed in a future release
>    **** See .setfillconstantalpha/.setalphaisshape for the improved sol=
ution
>    **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will=
 be removed in a future release
>    **** See .setfillconstantalpha/.setalphaisshape for the improved sol=
ution
>    **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will=
 be removed in a future release
>    **** See .setfillconstantalpha/.setalphaisshape for the improved sol=
ution
[...]
>=20
> Tested-by: Felipe Balbi <balbi@kernel.org>
>=20

I'll send a v2 with the updated commit log and your Tested-by:

        Thanks, Akira


