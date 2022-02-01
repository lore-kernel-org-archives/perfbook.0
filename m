Return-Path: <SRS0=q5UQ=SQ=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=sFuYRGaigQDzqF
	PeQq92633cRc/BGGGtk6bSt7lZ7Z4=; b=m6ymLcYBR8pvb7kpMdEZQhDSWrhcMK
	SibAIppyLLk1w2h71Af66QKssXqSFYjfJllchrWI9fUv0vo2xwLPGlNGCAmhvXkg
	HFj7qJUvQ6jKYGAmHrMCZAseKxY6pJp/PrtQXKDCMMJopAHwfCnzHKqLEGZoc+av
	I2F2p/f6KiiE5ncqg4mn1eTpRAyK4SAFQ8SWq4dYLifRvZz4LY1TmadQXV29Fi0y
	tNX2eZp7DZ5CaOqhUGh9RfJPLwb2zpCEs+L7Qr43Wb1609gIUgtp81tJh2MGN5Kg
	cU4/uwxtx13FwNUNHJXB8GlTOjDsp4MbrK/siDBGM4g4MhD0pxOJkrmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=sFuYRGaigQDzqFPeQq92633cRc/BGGGtk6bSt7lZ7
	Z4=; b=DFw1KeUeSvRN2bPLc7wsUD2Majcudekx7g2PgDbY/Kv2IVjUjiZ1sQPYl
	BrAf3KxfCtmxzIIQTfMg1jOcG77lKvc22r+qNZFysz8pMc2MwSb85i1c20Y5m65c
	OJt5Pu22kVT6XyZ8Dbkj76dPuBxorFdE4ZjcX82zsxjP1WaYVJ+sw33wGgszlCDY
	MLsm3NtWAUj8cyMzXP/CQ8dwmaqokCJuZOaUtlUo6l8a2yw7FXUMPMSBnOkYWsaV
	4mGhdAykDMw1Dwosok5oXUew1/5ILvYR6W6EVQHBvWVckd3w+2gkC6k1RgnmvbEd
	9OJ/vWB98OlFF4I410PgDyZqRPMcQ==
From: =?utf-8?Q?Johann_Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: Re: [PATCH-perfbook 4/4] glossary: Use more common definition of RAII
References: <20220201200751.23589-1-johann@jklaehn.de>
	<20220201200751.23589-4-johann@jklaehn.de>
	<20220201203832.GG4285@paulmck-ThinkPad-P17-Gen-1>
Date: Tue, 01 Feb 2022 23:16:14 +0100
In-Reply-To: <20220201203832.GG4285@paulmck-ThinkPad-P17-Gen-1> (Paul
	E. McKenney's message of "Tue, 1 Feb 2022 12:38:32 -0800")
Message-ID: <87o83qi66p.fsf@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


On Tue, Feb 01, 2022 at 12:38 -0800, Paul E. McKenney wrote:
> I do see older uses of "allocation" rather than "acquisition".
> Perhaps it changed once RAII locking entered the picture.

Yes, perhaps because it's as good an explanation for the =E2=80=9CA=E2=80=
=9D if one is
only concerned with memory management?  Apparently the phrase =E2=80=9Creso=
urce
acquisition is initialization=E2=80=9D (though not the acronym) was propose=
d as
early as ~1990: https://www.stroustrup.com/except89.pdf.  Either way,
=E2=80=9Cacquisition=E2=80=9D seems to have taken over in popularity by now=
. :-)

> I took all but the hazptr change.  I am not necessarily opposed to that
> one, but I did want to check whether you had built and tested it.

Oh, I forgot to --annotate the patch.  Let me paste my notes here:

To test the change I added the following assert:
| assert((hp & 0x1UL) =3D=3D 0);
| plist[psize++] =3D (hazptr_head_t *)hp;

And then I ran the different modes of hazptr and route_hazptr (although
only on my =E2=80=98spare time reading=E2=80=99 machine, which has a Intel =
Pentium 4415Y
with 2 cores/4 threads):
|./hazptr {2,3} {stress,perf,uperf,rperf}
|./route_hazptr {--stresstest,--smoketest,--perftest}

The assertion did not fail.

However, /also before applying the patch/,
=E2=80=A2 to build route_hazptr I had to work around several =E2=80=9Cmulti=
ple
  definition=E2=80=9D linker errors (e.g., for HP in hazptr.h), and
=E2=80=A2 the =E2=80=9Cstress=E2=80=9D mode of hazptr printed several field=
s of the form
  =E2=80=9C2:15=E2=80=9D, even though hazptrtorture.h points out that this =
should
  only happen for buggy implementations.

(I can have a closer look at some point.)

Thanks
Johann
