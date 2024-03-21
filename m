Received: from forward501c.mail.yandex.net (forward501c.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E7E4A19
	for <perfbook@vger.kernel.org>; Thu, 21 Mar 2024 00:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710981730; cv=none; b=SZUp3FMVXOiJlcTV5xGTgwrzg3GJbRvpLGkea1x6bneB2GOdNvoLI/GDvujVaLiZf8DAgaS/rB5Fqp7K1tjGCv8gt0D1d8QaXomRb3BLpCxMfPaz2CqH2FXInkENHjMEjouBEFwLWXlF0pX3lm0BMXY+ROWULmrbrhX2uKf8Xec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710981730; c=relaxed/simple;
	bh=uEZGHLVsAf9OP0Z4r8nVZGTp8hJE9cLLHijLqiCQb+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJCe6mwGM/Ij58L5vIG0KMsbUz1p8XOd/s4ZY3Hl31XFGI0JUBhySVRmImyyUa+RIXywDz3jdSrcVb8Lmv+F6OQWi5x6CuLevaqOiv8mx6v4yYY/tdK0udWa6rqDkx9/FmFOZRjHYq3qO+Y+r1C98hAdAMV1QSu9WBYC/2jjLOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=B+tNqqY5; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="B+tNqqY5"
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:3483:0:640:1715:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTPS id C16B060B9A;
	Thu, 21 Mar 2024 03:34:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id QY3APk1Ia4Y0-Pn23IeSM;
	Thu, 21 Mar 2024 03:34:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1710981270; bh=CXi84OkEaXwIH/zzVk0faXsdU/qoh/OOErNa198T+nY=;
	h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
	b=B+tNqqY5xgKuBEgIG/WMuqGIJqt8nFUvmhAn9TsqS3qqUvBhDKc29ceG4/nJvoDMD
	 8A1Tqi1gkjiBquA217/mk8ByGZrSV/TSLHg9Lj/ucWvLH2fUTfahmRpcs6ChbgXvlh
	 Y9KkXNMX6jvPZTArTSmMgr2gnM9u2DX6hiqDwAuA=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Date: Thu, 21 Mar 2024 00:34:24 +0000
From: Guilherme Janczak <guilherme.janczak@yandex.com>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR
 sigatomic_t
Message-ID: <wnqdnghhpmwutvpw5qp6pw3n3itez6k7oppzstyjunoeb5vypi@mriwhhk7aocj>
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
 <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>
 <r63f5f54bb6cilp542vw52ctpjnjbik5pbfrsswvjzccipokgg@c2kdkpmxbfue>
 <CAJbg=FWq5hWFy48bYXHnaBQpV5Xga9pryB-qHCbFgUGpFZ1bNg@mail.gmail.com>
 <CAJbg=FUFNk=7OQmtz8X7JaRyPGP5OBjpio_KzWEQREoncsA5oQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJbg=FUFNk=7OQmtz8X7JaRyPGP5OBjpio_KzWEQREoncsA5oQ@mail.gmail.com>

In the case in your example, sleep() doesn't need to be implemented
using SIGALRM. It isn't in glibc and OpenBSD that I know of:
https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/posix/sleep.c;h=3df79097c4464510f0197138a00a0c9772a5e83e;hb=3ab9b88e2ac91062b6d493fe32bd101a55006c6a
https://man.openbsd.org/sleep.3

I managed to make GCC and Clang optimize out a sig_atomic_t store:
```
#define _POSIX_C_SOURCE 200809L

#include <sys/time.h>

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>

static void catch_sigalrm(int);

#ifdef VOLATILE
volatile sig_atomic_t msg;
static const char *decl = "volatile sig_atomic_t msg";
#else
sig_atomic_t msg;
static const char *decl = "sig_atomic_t msg";
#endif

volatile sig_atomic_t reply;
volatile sig_atomic_t replied;

int
main(void)
{
	const struct sigaction act = { .sa_handler = catch_sigalrm };
	const struct itimerval timer = {
		.it_value.tv_usec = 1,
		.it_interval.tv_usec = 1,
	};
	sigaction(SIGALRM, &act, NULL);
	setitimer(ITIMER_REAL, &timer, NULL);
	while (!replied) {
		msg = 1;
	}
	printf("%s == %d\n", decl, (int)reply);
}

static void
catch_sigalrm(int unused)
{
	int n = msg;
	if (!n)
		return;
	reply = n;
	replied = 1;
}
```

This runs forever:
```
$ cc -O2 test2.c && ./a.out 
```
This terminates:
```
$ clang -O2 -DVOLATILE test2.c && ./a.out
volatile sig_atomic_t msg == 1
```

Without volatile in its declaration, msg is never set, so the program 
spins forever because the signal handler never tells the loop to stop. 
There's probably a simpler way to do this.

On Wed, Mar 20, 2024 at 07:20:03PM -0400, Elad Lahav wrote:
> Actually, in the example I cited, there are multiple function calls
> (printf, raise) between the two reads. How can the compiler optimize
> out reading the value a second time?
> 
> My view, which is subject to change at any moment and without notice,
> is that you need volatile in the cases where you normally need
> volatile, rather than inherently whenever you use sig_atomic_t. In the
> following example I would not expect you to need it:
> 
> static sig_atomic_t value;
> 
> void
> sig_handler(int signum)
> {
>     value++;
> }
> 
> void
> func(void)
> {
>     value = 0;
>     sleep(1);
>     printf("There have been %d signals while I was napping\n", value);
> }
> 
> --Elad
> 
> On Wed, Mar 20, 2024 at 7:05 PM Elad Lahav <e2lahav@gmail.com> wrote:
> >
> > No problem...
> > Yes, in your example the issue is that the type is not atomic, and
> > thus subject to partial updates that can be interrupted.
> > Looking at the example given in
> > https://en.cppreference.com/w/c/program/sig_atomic_t the volatile is
> > needed to let the compiler know that the value can be updated in
> > between two reads by the main function. That makes sense, especially
> > if you have code that loops waiting for the value to change.
> >
> > --Elad
> >
> > On Wed, Mar 20, 2024 at 6:39 PM Guilherme Janczak
> > <guilherme.janczak@yandex.com> wrote:
> > >
> > > Actually, uh, I misread your reply, forget the previous reply I sent.
> > >
> > > You don't need the volatile with lock-free atomics, but the standard
> > > says you do need it with sig_atomic_t. I don't know of a case that would
> > > break a plain `sig_atomic_t` variable with no `volatile`, however.
> > >
> > > On Wed, Mar 20, 2024 at 04:44:33PM -0400, Elad Lahav wrote:
> > > > Do you really need volatile?
> > > > There are two cases to consider. Either your code synchronizes updates
> > > > to the shared value with the signal handler (e.g., by blocking and
> > > > then unblocking the signal), in which case I believe the compiler
> > > > cannot ignore updates to the value; or you don't, and you can't depend
> > > > on the variable having any specific value in the signal handler. The
> > > > only thing you want to prevent in the latter case is the handler
> > > > observing a partial update to the variable, which I presume is where
> > > > the other requirements originate. (In practice, there should be little
> > > > or no concern with any primitive type on modern hardware).
> > > >
> > > > --Elad
> > > >
> > > > On Wed, Mar 20, 2024 at 4:32 PM Guilherme Janczak
> > > > <guilherme.janczak@yandex.com> wrote:
> > > > >
> > > > > Variables shared with signal handlers must be of type `volatile
> > > > > sigatomic_t`, not `volatile` or `sigatomic_t` as the current text says,
> > > > > according to a C11 draft:
> > > > >
> > > > >     When ... interrupted by ... a signal, values of objects that are
> > > > >     neither lock-free atomic objects nor of type volatile sig_atomic_t
> > > > >     are unspecified.
> > > > >
> > > > > Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
> > > > > Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.com>
> > > > > ---
> > > > >  memorder/memorder.tex | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > > > > index 5c50d42d..873c3424 100644
> > > > > --- a/memorder/memorder.tex
> > > > > +++ b/memorder/memorder.tex
> > > > > @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thread, at least at the
> > > > >  assembly-language level.
> > > > >  However, the C and C++ languages do not define the results of handlers
> > > > >  and interrupted threads sharing plain variables.
> > > > > -Instead, such shared variables must be \co{sig_atomic_t}, lock-free
> > > > > -atomics, or \co{volatile}.
> > > > > +Instead, such shared variables must be \co{volatile sig_atomic_t} or
> > > > > +lock-free atomics.
> > > > >
> > > > >  On the other hand, because the handler executes within the interrupted
> > > > >  thread's context, the memory ordering used to synchronize communication
> > > > > --
> > > > > 2.42.0
> > > > >
> > > > >
> > > >
