Return-Path: <balbi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609685256;
	bh=FIn3f/gMyIz47msiVNSEKVn4eR6cB8N3chUXeRTUK1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WRG0n302EMrdJFlbIgMZWEp5xnsOet0cjOonbTaToyHF5WOxAUR+wi9jT0CbnSrIf
	 kmN2/C4CIfznNdvUu10ruHxG8WFXaHe01yzJVJetzMG1FCykRYrDWP7naI5YSTKdBa
	 TMs+Bnqzn+y/AH6kOI2GWv67bjOnWTMo6yBsSit1EskVEpHjhlCSkrGCrPrrIKCqgz
	 /BVz5ocJZ16fiq77WoU42uUkv7ugBXVzIxL6T7RdXlpSGK7DPNQtvOkw7ifbR7srN2
	 Ojqzg/8hlgCmP5J4TuBC83VZcvNhYjj+MEQGutlUKCMkxEUU1okXOlf+cTo2EAQgpY
	 56SMrEN9qq2gg==
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH -perfbook] Makefile: Cope with GhostScript 9.53.0 or later
In-Reply-To: <29de25dd-09e4-cd0b-a743-6e5a7c8dfb36@gmail.com>
References: <29de25dd-09e4-cd0b-a743-6e5a7c8dfb36@gmail.com>
Date: Sun, 03 Jan 2021 16:47:33 +0200
Message-ID: <87y2ha2i2i.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>


Hi,

Akira Yokosawa <akiyks@gmail.com> writes:

> From f04ab9441df5256aa9df73bb4fa005b43517f2f2 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 3 Jan 2021 19:15:25 +0900
> Subject: [PATCH -perfbook] Makefile: Cope with GhostScript 9.53.0 or later
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Combination of GhostScript 9.53.x and pstricks-base 3.01 requires
> an additional option of "gs" to enable transparency.
>
> Current version of a2ping can not cope with this change.
>
> Instead, use the pair of commands "ps2pdf" and "pdfcrop" for .eps
> files originated from .tex sources.
>
> Reported-by: =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=94=D1=8C=D1=
=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE <dimhen@gmail.com>
> Reported-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

This seems to work fine, a few warnings during compilation of affected imag=
es:

SMPdesign/DiningPhilosopher4part-b.eps --> SMPdesign/DiningPhilosopher4part=
-b.pdf
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
SMPdesign/DiningPhilosopher5.eps --> SMPdesign/DiningPhilosopher5.pdf
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
SMPdesign/DiningPhilosopher5PEM.eps --> SMPdesign/DiningPhilosopher5PEM.pdf
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
SMPdesign/DiningPhilosopher5TB.eps --> SMPdesign/DiningPhilosopher5TB.pdf
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution
   **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will be =
removed in a future release
   **** See .setfillconstantalpha/.setalphaisshape for the improved solution

Tested-by: Felipe Balbi <balbi@kernel.org>

--=20
balbi
