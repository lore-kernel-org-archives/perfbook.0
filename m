Return-Path: <SRS0=q5UQ=SQ=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=VGzKl51FTbdQEkjz9hKd5tHmHeCSo+qFhVNx/l
	D5cyQ=; b=Qd5i1CAu8keNn9bcKZPl6AWkpC0Dn4lLaDl6DxKAjxOAGvVbOPwzdB
	jb6TgPaGVeXQ5SXgP0MavNa45HEEDc/5/biTPpXHjPhHeEweMguw2c1tjxyYweA3
	9L1OUGrqhPyxPDYjfj4GtKvL38jQOg1Z4GVOYNk6FTqOvvyBkoN4OsiEbBsjLLUY
	xLNiqdzln/yOPvsQkBqSN0v1V3DBNy34WoX+ax4g/3disuoLyWd405fuOQ2xbqqc
	+5yJTbX8vzTJh5LWBo7L4k7hf/DRrAM2HW4J9X8Al+6Drhg1Hp8W4a4LQ0shL8SS
	6Taxmwd/cGHUWE2nONLy9xqVNh9uG7jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VGzKl51FTbdQEkjz9
	hKd5tHmHeCSo+qFhVNx/lD5cyQ=; b=atduREe8TwBo85F4msuCK80vWia9Ne0Ce
	M31Q1VTAT2djoxWOTNTfyi7RwytdEhJR0fxNfHcho9oCsLAjyWxEtwxu446+b8C8
	mOSyWFaeA8S5KNFgr1dFbkwND3rrdXmycvDqkzd1xgF5zJ+MyKI0PqzMc3ljj8ZV
	jtkrIfrVrjLTkiBvfWtoSA4CwGfjuBM01z4IGqvwzRu8c3deiZecVYy+V4mjtC7j
	aLMg860eZFzDPuiTASCUdURRQSPFBhZjzm+qGffhGIk39F5U4LR3DgM4XDvJIpva
	qok+AMA9rrzRNT8B+Ri+d2mSJqMTXF8v6vPmFiHWMSbIp8S2fRU1w==
From: =?utf-8?Q?Johann_Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: Re: [PATCH-perfbook 3/3] toolsoftrade: Fix reference to concept
 introduced earlier
References: <20220131192826.140138-1-johann@jklaehn.de>
	<20220131192826.140138-3-johann@jklaehn.de>
	<20220131212520.GV4285@paulmck-ThinkPad-P17-Gen-1>
Date: Tue, 01 Feb 2022 21:07:00 +0100
In-Reply-To: <20220131212520.GV4285@paulmck-ThinkPad-P17-Gen-1> (Paul
	E. McKenney's message of "Mon, 31 Jan 2022 13:25:20 -0800")
Message-ID: <87wnieic63.fsf@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


On Mon, Jan 31, 2022 at 13:25 -0800, Paul E. McKenney wrote:
> I queued and pushed all three, with a slight adjustment to this one.
>
> Thoughts?
I like it.

Thanks
Johann
