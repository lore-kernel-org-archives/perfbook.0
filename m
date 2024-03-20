Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [178.154.239.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551312E52
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710973950; cv=none; b=aoCrO5B9T9Zn2oZEIvz7Vkfm8CYUN1UDQrzpo1qo4hCsterQrXTSwo+VD96o0ct66dgqmkV/IG8/x10plAY+hY4vGUctcqSylyFlBOvO+sjrIbYx3uQicW1p5fumSmGCXMj1fpgf409BCgvB1OcTh/Nxh4InCymn8WGp05iCo4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710973950; c=relaxed/simple;
	bh=ZvOc2o1dfIK1JYCObx1gGYdYVeCbQRJANfnkCRRER5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcu1BetlHla50w2NGa+Vo+JJgCaSX6oa1Es++L8XH7UogXbpQSl8nRjilP8riTXgZ0EL68x3skRbtiRaTu/JbOQodJjqVA6MG+32/qa1keglFyrgjCmvPoKjyOzc3AXdx7jdOpaz7atUyf+Mii/+a4BFy/vdxbqn+O7pbV4uLpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=t3jlJguU; arc=none smtp.client-ip=178.154.239.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="t3jlJguU"
Received: from mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:22a1:0:640:9de0:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id 36F275F0B4;
	Thu, 21 Mar 2024 01:26:14 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 9QOsmt9OoKo0-Rxu27pra;
	Thu, 21 Mar 2024 01:26:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1710973573; bh=Dk2wOQ8hAF7RVMyAalGJSBumibUb/jQiIXlsCvGNO4s=;
	h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
	b=t3jlJguUm+tbrE8ArUiSJ/auFAqmg2cOP839aEaAUBPagauVIZ2/JUIf1tSWQUOMB
	 KbWoEDSTJKCEEXmspsvk4d0xDKnWJ1YgoJPB4CVAqrrx2M3quTa1TOuGVCWDw5Tjyi
	 eVtNSIxRcz5RyPa0jb6UjvmVwCq4uQ1KtibIGbyY=
Authentication-Results: mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Date: Wed, 20 Mar 2024 22:26:04 +0000
From: Guilherme Janczak <guilherme.janczak@yandex.com>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR
 sigatomic_t
Message-ID: <v4xac5cuhx3zzyvyg7f6q2ehrss7u7nayncskwygglwqotbfom@7oj5pnoialze>
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
 <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>

The standard says it's necessary.
If you have a `volatile long long` on a 32-bit architecture, the
compiler will have to compile it to some bignum code (meaning multiple
instructions), and the signal can come in between them.

I can quickly make it happen on a Nintendo Wii (32-bit powerpc) as
well as an i386 laptop using this test program:
```
#define _POSIX_C_SOURCE 200809L

#include <sys/time.h>

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>

static void catch_sigalrm(int);

volatile unsigned long long longword;
volatile sig_atomic_t partial_update;

int
main(void)
{
	const struct sigaction act = { .sa_handler = catch_sigalrm };
	const struct itimerval timer = { 
		.it_value.tv_usec = 1, 
		.it_interval.tv_usec = 1,
	};
	unsigned long long n;

	sigaction(SIGALRM, &act, NULL);
	setitimer(ITIMER_REAL, &timer, NULL);
	for (unsigned char i = 0;; i++) {
		memset(&n, i, sizeof(n));
		longword = n;
		if (partial_update) {
			fprintf(stderr, "longword partially updated\n");
			exit(1);
		}
	}
}

static void
catch_sigalrm(int unused)
{
	union multibyte {
		long long n;
		unsigned char bytes[sizeof(long long)];
	} window;
	(void)unused;	
	window.n = longword;

	for (size_t i = 1; i < sizeof(window.bytes); i++) {
		if (window.bytes[i] != window.bytes[0])
			partial_update = 1;
	}
}
```

Output:
```
$ cc -O2 test.c && ./a.out
longword partially updated
```

The program runs (apparently) forever on my amd64 desktop.

If you look at the powerpc assembly version of the program in Godbolt:
https://godbolt.org/z/Pc8q7E5ej
Lines 69 and 70 of the assembly use 2 STW instructions to store each 
32-bit half of the bignum.

On Wed, Mar 20, 2024 at 04:44:33PM -0400, Elad Lahav wrote:
> Do you really need volatile?
> There are two cases to consider. Either your code synchronizes updates
> to the shared value with the signal handler (e.g., by blocking and
> then unblocking the signal), in which case I believe the compiler
> cannot ignore updates to the value; or you don't, and you can't depend
> on the variable having any specific value in the signal handler. The
> only thing you want to prevent in the latter case is the handler
> observing a partial update to the variable, which I presume is where
> the other requirements originate. (In practice, there should be little
> or no concern with any primitive type on modern hardware).
> 
> --Elad
> 
> On Wed, Mar 20, 2024 at 4:32 PM Guilherme Janczak
> <guilherme.janczak@yandex.com> wrote:
> >
> > Variables shared with signal handlers must be of type `volatile
> > sigatomic_t`, not `volatile` or `sigatomic_t` as the current text says,
> > according to a C11 draft:
> >
> >     When ... interrupted by ... a signal, values of objects that are
> >     neither lock-free atomic objects nor of type volatile sig_atomic_t
> >     are unspecified.
> >
> > Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
> > Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.com>
> > ---
> >  memorder/memorder.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 5c50d42d..873c3424 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thread, at least at the
> >  assembly-language level.
> >  However, the C and C++ languages do not define the results of handlers
> >  and interrupted threads sharing plain variables.
> > -Instead, such shared variables must be \co{sig_atomic_t}, lock-free
> > -atomics, or \co{volatile}.
> > +Instead, such shared variables must be \co{volatile sig_atomic_t} or
> > +lock-free atomics.
> >
> >  On the other hand, because the handler executes within the interrupted
> >  thread's context, the memory ordering used to synchronize communication
> > --
> > 2.42.0
> >
> >
