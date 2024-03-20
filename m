Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C576BFDB
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 23:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710976072; cv=none; b=WKQyqKqu/RVUw8nImoLRcjJw8+CS5mGQpbb0C9td9aae0aTonYmsBWOpGR+MaWuX8lZjPuOK+pKPIsqO94BBbxOM36uk7RAJZpqf01d0OdqZoShYa34ghFFCqsleou2YN1Pz/KtHDOM30lB7/T1KouRT3H7I8N4AEBVWGbjmIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710976072; c=relaxed/simple;
	bh=92OMSx8e0nzuDi9OztfdrV5qRQmN93EJlUAvyPc6ZjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8jkaoUqTYDZqhNgXvsTHqYSklr2F3sIo6AdvZJ004hvZdpg4m8qzADgwTXDlvHINWwBwg9H2+OS4OeDCvF1bn99H3dmfIYGn9hI6jRcRJ0lP6G6AV/kWIQIdI7Jg47Z8JEl2FerpswUBUoeMvQcY6lJv2Rew0YfxtE9JGLcl0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ah8N2/OX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ah8N2/OX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D692C433F1;
	Wed, 20 Mar 2024 23:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710976072;
	bh=92OMSx8e0nzuDi9OztfdrV5qRQmN93EJlUAvyPc6ZjE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Ah8N2/OXJSh+0fhQwV5OsqK8uFH36sxlZyy21tPGVrW8CnO2vNRNWbGDC3cq5QRUs
	 cn/hmE5k8GqE/obEbLmKsGRbQoqatcikR6QkI+6z7zCemlg/PCzihDbkfYOMyCPVe+
	 b37xBzdFXVupIveFMRW2a8Ne6yUMd5V14xrXJ00pIY3XfIAHzVJalsVdv+am5Wu/io
	 KftIQXJwKd1BpN/5fdKfo2JQvxaTpVo9uhGNW6WHeOZKfw16QWSm9agOunNRObxG6U
	 Ce/sdvUVGtHTh0Zey+E1EegLBXo923IeNJrAfS8tEoa83re2IMWCPwUapmhCQFkgGh
	 /xFe/v25X0Pog==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2CC4ECE0716; Wed, 20 Mar 2024 16:07:50 -0700 (PDT)
Date: Wed, 20 Mar 2024 16:07:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Guilherme Janczak <guilherme.janczak@yandex.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR
 sigatomic_t
Message-ID: <36283212-fc58-4bb9-9768-e5f8cea12487@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
 <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>
 <v4xac5cuhx3zzyvyg7f6q2ehrss7u7nayncskwygglwqotbfom@7oj5pnoialze>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <v4xac5cuhx3zzyvyg7f6q2ehrss7u7nayncskwygglwqotbfom@7oj5pnoialze>

On Wed, Mar 20, 2024 at 10:26:04PM +0000, Guilherme Janczak wrote:
> The standard says it's necessary.
> If you have a `volatile long long` on a 32-bit architecture, the
> compiler will have to compile it to some bignum code (meaning multiple
> instructions), and the signal can come in between them.

Agreed, because in this case the variable is not machine-word sized.

What happens if you instead use a 32-bit aligned volatile quantity?
(Or 16 or 8 bits, for that matter, at least on PowerPC [1].)

I would hope that these smaller sizes would work, otherwise, again,
device drivers become problematic on that platform.

							Thanx, Paul

[1] There have been some platforms without 16-bit or 8-bit loads, 
    and on such platforms, you could also see failures of one sort
    or another.

> I can quickly make it happen on a Nintendo Wii (32-bit powerpc) as
> well as an i386 laptop using this test program:
> ```
> #define _POSIX_C_SOURCE 200809L
> 
> #include <sys/time.h>
> 
> #include <stdio.h>
> #include <stdlib.h>
> #include <signal.h>
> #include <string.h>
> 
> static void catch_sigalrm(int);
> 
> volatile unsigned long long longword;
> volatile sig_atomic_t partial_update;
> 
> int
> main(void)
> {
> 	const struct sigaction act = { .sa_handler = catch_sigalrm };
> 	const struct itimerval timer = { 
> 		.it_value.tv_usec = 1, 
> 		.it_interval.tv_usec = 1,
> 	};
> 	unsigned long long n;
> 
> 	sigaction(SIGALRM, &act, NULL);
> 	setitimer(ITIMER_REAL, &timer, NULL);
> 	for (unsigned char i = 0;; i++) {
> 		memset(&n, i, sizeof(n));
> 		longword = n;
> 		if (partial_update) {
> 			fprintf(stderr, "longword partially updated\n");
> 			exit(1);
> 		}
> 	}
> }
> 
> static void
> catch_sigalrm(int unused)
> {
> 	union multibyte {
> 		long long n;
> 		unsigned char bytes[sizeof(long long)];
> 	} window;
> 	(void)unused;	
> 	window.n = longword;
> 
> 	for (size_t i = 1; i < sizeof(window.bytes); i++) {
> 		if (window.bytes[i] != window.bytes[0])
> 			partial_update = 1;
> 	}
> }
> ```
> 
> Output:
> ```
> $ cc -O2 test.c && ./a.out
> longword partially updated
> ```
> 
> The program runs (apparently) forever on my amd64 desktop.
> 
> If you look at the powerpc assembly version of the program in Godbolt:
> https://godbolt.org/z/Pc8q7E5ej
> Lines 69 and 70 of the assembly use 2 STW instructions to store each 
> 32-bit half of the bignum.
> 
> On Wed, Mar 20, 2024 at 04:44:33PM -0400, Elad Lahav wrote:
> > Do you really need volatile?
> > There are two cases to consider. Either your code synchronizes updates
> > to the shared value with the signal handler (e.g., by blocking and
> > then unblocking the signal), in which case I believe the compiler
> > cannot ignore updates to the value; or you don't, and you can't depend
> > on the variable having any specific value in the signal handler. The
> > only thing you want to prevent in the latter case is the handler
> > observing a partial update to the variable, which I presume is where
> > the other requirements originate. (In practice, there should be little
> > or no concern with any primitive type on modern hardware).
> > 
> > --Elad
> > 
> > On Wed, Mar 20, 2024 at 4:32 PM Guilherme Janczak
> > <guilherme.janczak@yandex.com> wrote:
> > >
> > > Variables shared with signal handlers must be of type `volatile
> > > sigatomic_t`, not `volatile` or `sigatomic_t` as the current text says,
> > > according to a C11 draft:
> > >
> > >     When ... interrupted by ... a signal, values of objects that are
> > >     neither lock-free atomic objects nor of type volatile sig_atomic_t
> > >     are unspecified.
> > >
> > > Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
> > > Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.com>
> > > ---
> > >  memorder/memorder.tex | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > > index 5c50d42d..873c3424 100644
> > > --- a/memorder/memorder.tex
> > > +++ b/memorder/memorder.tex
> > > @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thread, at least at the
> > >  assembly-language level.
> > >  However, the C and C++ languages do not define the results of handlers
> > >  and interrupted threads sharing plain variables.
> > > -Instead, such shared variables must be \co{sig_atomic_t}, lock-free
> > > -atomics, or \co{volatile}.
> > > +Instead, such shared variables must be \co{volatile sig_atomic_t} or
> > > +lock-free atomics.
> > >
> > >  On the other hand, because the handler executes within the interrupted
> > >  thread's context, the memory ordering used to synchronize communication
> > > --
> > > 2.42.0
> > >
> > >
> 
