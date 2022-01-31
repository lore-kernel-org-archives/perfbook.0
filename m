Return-Path: <SRS0=dEfS=SP=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=PpQGYbQsSpsi/k
	4kHxCD7TRvY9JPgfC/wKmu+LatOig=; b=j7EJL8v5hPB0rW2KHE9kVwhvCNTGHP
	D4qXyq08jMuNVGYwEUfZbwbKY6FKpyX/uhQokNSK6Mn5Onuyn3BMq8ja8s+fpNS/
	ka/RCDB9UlJTvUE6niUjU6w6HOGS754SG3sGaGazx8Onent1NoBlDBD23WOkGtxS
	dqGnLL1jPw3tQbBYgvfllugpyw3QYp88ItbVLufu4rlW1J4Upjy9ZPHrvr2HIn5X
	31/3il09Gyp6rgVPT9Tu9YTOhyBERzBMs4LU0lXJtaizFh8a4zDyzSZFVDqQQ8Q8
	lIvJIulIkBYjsP9t9jp4jGTt8u8dnlr+118krJWETvgNxEfvdPtwzVjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=PpQGYbQsSpsi/k4kHxCD7TRvY9JPgfC/wKmu+LatO
	ig=; b=DoazW0sIGpHpSYsWEM9pGrs1zyCfSmVRGtYQWiN9wtXInp8C72sT67p8i
	d5UEGiUAco8RdR/S1/Ii9mXWAazMJfOxFnwzwdrMTQmncEOkbEwtTyE83SLq4Iq3
	45vr4Ow5AijIx7RAOpOOyx39HSXDzWbC0+NHoFPtZVgzprHwsKgtjbYJ2Cgv6kcn
	Yg+sGbQXavCEk0DSJP+sUYQ7q5W7ZI4FMiXlARIJ4k2zqoJ63WT2lotBih5vGRz7
	S3BSW2Z6tSjlDm5PJ1csuw/JEIjJng4eT13ncgPu848vRcjtOaw6nLG+qluR93bh
	QOFgwH401QH7UCW0mqtoCo+6/X7bA==
From: =?utf-8?Q?Johann_Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: Re: [PATCH-perfbook] count: Fix typos
References: <20220129221815.89451-1-johann@jklaehn.de>
	<20220131015504.GU4285@paulmck-ThinkPad-P17-Gen-1>
Date: Mon, 31 Jan 2022 20:12:46 +0100
In-Reply-To: <20220131015504.GU4285@paulmck-ThinkPad-P17-Gen-1> (Paul
	E. McKenney's message of "Sun, 30 Jan 2022 17:55:04 -0800")
Message-ID: <87o83r3ej5.fsf@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Jan 30, 2022 at 17:55 -0800, Paul E. McKenney wrote:
> Queued and pushed, thank you!  I did take the liberty of changing your
> added "can" to a "nevertheless".  Does that work for you?

Sure, in that case maybe also remove the second =E2=80=9Cbe=E2=80=9D?
| Atomic increment might be completely acceptable for a two-CPU
| system, but nevertheless completely inadequate for an eight-CPU system.

Thanks
Johann
