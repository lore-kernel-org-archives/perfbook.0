Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4B3DABF0
	for <perfbook@vger.kernel.org>; Thu, 28 Mar 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711643438; cv=none; b=BUjhZujBVklJOneDwSAYJDPJXIsnmx30SvpTp18MtTipEAo0WJp+xafUBLFojRyXk7bf+O0laOPA8So7NOODi7/kClRq9gwb5Ml0YK1f2wep8B4Gw4aqsIn43zsPe1zC6APLqg2XCnVp8NJX1zO/vRFVfKvukIrxEbG9+bdSP94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711643438; c=relaxed/simple;
	bh=3+HeLHXaj4ZXjwwKk7VW9YtfN5FqdrYrfQ0BPpWbgTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FqIlTqMNe1OGL3DoOf3iaB3K1yrlcPpzPMHrwlzArZiCzLlqpK+1QAP4zjFxuSdfoWr5OqddQEFLL8MF2DmtOMDvLDKju+fu3CuIfxhxmgYlRE46Wz7jNP/UvDBquKM64sFhqAVm6C9hdZzeBmWz5LY15T45rYWjzD8hQwXTL3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoJnmmvR; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoJnmmvR"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5a51c063f99so592971eaf.0
        for <perfbook@vger.kernel.org>; Thu, 28 Mar 2024 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711643435; x=1712248235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRIu+/wlXQ1ZIV1ae14JAZ8s9HAfDucCuACQJlR2kik=;
        b=EoJnmmvRmshTz8lFaioFcjB9dmNkwBNSHffDZdXg3GMrYrzejj71NCrcnW0Io88CV2
         OzksUqKYLpQTOefUCOzASv86d+JtI5fwN5sWDVfq8SDxCSQY7xepGEguG8M01rCVi8FU
         J44wh0zXr4Vn/npdqRp0t7H7qleMrsK3UNNhg2kdu5Y6BSnJ9s/9zioIB28UeliDU9rZ
         ozXxZn0VJkBpAWNXdb4NHa3GGCsSipguckJ4UAqp0b689CD4UjT6Chta0C5KhV+a0vjM
         djvThM6wmGXFRgfadcR6V+Nj6b2+O3aW4bncVPIEU7nZaBzaXCKqTv6SrPwacpscIu2h
         nfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643435; x=1712248235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRIu+/wlXQ1ZIV1ae14JAZ8s9HAfDucCuACQJlR2kik=;
        b=ROlPS+TrvfWIfjysqDJ0uofWgz/LtnicwEpM/WbdLmHi7HnGAGv/HDLgRAV/flmJaw
         m86DpZiEtJz0ykVvXr+jql0K3/lO4SVqVqh+BwbwGu/7pvVGsFD76nH3YUfVoph7wjKP
         GBvJ3AI66VvVGEyLPKBnlhdEov89RvswFejq1Ssu8nPSIjT2Xs48oB1P0wiXRcaxCOnv
         8QntqtSr5zYhswKcBDToNhxktTOtwjINCLorXfT2mz4JHsKwr86itEL2RfCtkW9WKTLf
         9VgucEh2BvHDyA7GABCHDzQN6JgvfhWWfePoT7dQ7wb+gtSJHDwNHKpW/ydHgpNL9Tyb
         KY8w==
X-Forwarded-Encrypted: i=1; AJvYcCX6rEyUx7edxPLZEumdPBYO50BHSGg3FG6doaEwBNWlnij0LLhl5JBomtkizx+l1x9kcDkDSGIz58Xy7o6En5cgdeopnFa39sc=
X-Gm-Message-State: AOJu0YzkYvbKSizVHDFBguer6RNdSJb3JRNMwyKdTLimuUwRYxjMg4ED
	Pj+vOvxxTM5GgpMi818EDqTtdtDo+UDizr5LBdxZtAzT8HKw2B6Yp56Ih3kawh5x9mzLSYqzGGM
	VjFpDnr+iMqidEGbpNVkspO85tgoxkSYHe/o=
X-Google-Smtp-Source: AGHT+IFzv4yNN4e+aUelYBQF6qN87F2gpzVnxPTyNRRi0Tzy0BbMtniu+PiKRokdwhUGnwhvzBGHc/cjI910HKStPQ4=
X-Received: by 2002:a05:6358:2c8e:b0:17f:77e5:85df with SMTP id
 l14-20020a0563582c8e00b0017f77e585dfmr3281706rwm.2.1711643435137; Thu, 28 Mar
 2024 09:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
 <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>
 <v4xac5cuhx3zzyvyg7f6q2ehrss7u7nayncskwygglwqotbfom@7oj5pnoialze> <36283212-fc58-4bb9-9768-e5f8cea12487@paulmck-laptop>
In-Reply-To: <36283212-fc58-4bb9-9768-e5f8cea12487@paulmck-laptop>
From: Elad Lahav <e2lahav@gmail.com>
Date: Thu, 28 Mar 2024 12:30:26 -0400
Message-ID: <CAJbg=FXkTO1KObfi-K6fxHb5nh3CaMHXR9FcPLO5hGf=3eGX_Q@mail.gmail.com>
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR sigatomic_t
To: paulmck@kernel.org
Cc: Guilherme Janczak <guilherme.janczak@yandex.com>, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like this patch wasn't merged. Regardless of my
questions/observations, Guilherme is absolutely right that volatile is
required for sig_atomic_t by the standard. It may also need to be
mentioned that, despite its name, the only operations that can be
safely done on sig_atomic_t are store and load - it does not provide
read/modify/write atomicity, unlike the lock-free atomic types. The
standard says so, but it's easy to miss:

"the signal handler refers to an object with static or thread storage
duration that is not a
lock-free atomic object other than by *assigning* a value to an object
declared as
volatile sig_atomic_t"

--Elad

On Wed, Mar 20, 2024 at 7:07=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Wed, Mar 20, 2024 at 10:26:04PM +0000, Guilherme Janczak wrote:
> > The standard says it's necessary.
> > If you have a `volatile long long` on a 32-bit architecture, the
> > compiler will have to compile it to some bignum code (meaning multiple
> > instructions), and the signal can come in between them.
>
> Agreed, because in this case the variable is not machine-word sized.
>
> What happens if you instead use a 32-bit aligned volatile quantity?
> (Or 16 or 8 bits, for that matter, at least on PowerPC [1].)
>
> I would hope that these smaller sizes would work, otherwise, again,
> device drivers become problematic on that platform.
>
>                                                         Thanx, Paul
>
> [1] There have been some platforms without 16-bit or 8-bit loads,
>     and on such platforms, you could also see failures of one sort
>     or another.
>
> > I can quickly make it happen on a Nintendo Wii (32-bit powerpc) as
> > well as an i386 laptop using this test program:
> > ```
> > #define _POSIX_C_SOURCE 200809L
> >
> > #include <sys/time.h>
> >
> > #include <stdio.h>
> > #include <stdlib.h>
> > #include <signal.h>
> > #include <string.h>
> >
> > static void catch_sigalrm(int);
> >
> > volatile unsigned long long longword;
> > volatile sig_atomic_t partial_update;
> >
> > int
> > main(void)
> > {
> >       const struct sigaction act =3D { .sa_handler =3D catch_sigalrm };
> >       const struct itimerval timer =3D {
> >               .it_value.tv_usec =3D 1,
> >               .it_interval.tv_usec =3D 1,
> >       };
> >       unsigned long long n;
> >
> >       sigaction(SIGALRM, &act, NULL);
> >       setitimer(ITIMER_REAL, &timer, NULL);
> >       for (unsigned char i =3D 0;; i++) {
> >               memset(&n, i, sizeof(n));
> >               longword =3D n;
> >               if (partial_update) {
> >                       fprintf(stderr, "longword partially updated\n");
> >                       exit(1);
> >               }
> >       }
> > }
> >
> > static void
> > catch_sigalrm(int unused)
> > {
> >       union multibyte {
> >               long long n;
> >               unsigned char bytes[sizeof(long long)];
> >       } window;
> >       (void)unused;
> >       window.n =3D longword;
> >
> >       for (size_t i =3D 1; i < sizeof(window.bytes); i++) {
> >               if (window.bytes[i] !=3D window.bytes[0])
> >                       partial_update =3D 1;
> >       }
> > }
> > ```
> >
> > Output:
> > ```
> > $ cc -O2 test.c && ./a.out
> > longword partially updated
> > ```
> >
> > The program runs (apparently) forever on my amd64 desktop.
> >
> > If you look at the powerpc assembly version of the program in Godbolt:
> > https://godbolt.org/z/Pc8q7E5ej
> > Lines 69 and 70 of the assembly use 2 STW instructions to store each
> > 32-bit half of the bignum.
> >
> > On Wed, Mar 20, 2024 at 04:44:33PM -0400, Elad Lahav wrote:
> > > Do you really need volatile?
> > > There are two cases to consider. Either your code synchronizes update=
s
> > > to the shared value with the signal handler (e.g., by blocking and
> > > then unblocking the signal), in which case I believe the compiler
> > > cannot ignore updates to the value; or you don't, and you can't depen=
d
> > > on the variable having any specific value in the signal handler. The
> > > only thing you want to prevent in the latter case is the handler
> > > observing a partial update to the variable, which I presume is where
> > > the other requirements originate. (In practice, there should be littl=
e
> > > or no concern with any primitive type on modern hardware).
> > >
> > > --Elad
> > >
> > > On Wed, Mar 20, 2024 at 4:32=E2=80=AFPM Guilherme Janczak
> > > <guilherme.janczak@yandex.com> wrote:
> > > >
> > > > Variables shared with signal handlers must be of type `volatile
> > > > sigatomic_t`, not `volatile` or `sigatomic_t` as the current text s=
ays,
> > > > according to a C11 draft:
> > > >
> > > >     When ... interrupted by ... a signal, values of objects that ar=
e
> > > >     neither lock-free atomic objects nor of type volatile sig_atomi=
c_t
> > > >     are unspecified.
> > > >
> > > > Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
> > > > Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.com>
> > > > ---
> > > >  memorder/memorder.tex | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > > > index 5c50d42d..873c3424 100644
> > > > --- a/memorder/memorder.tex
> > > > +++ b/memorder/memorder.tex
> > > > @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thread,=
 at least at the
> > > >  assembly-language level.
> > > >  However, the C and C++ languages do not define the results of hand=
lers
> > > >  and interrupted threads sharing plain variables.
> > > > -Instead, such shared variables must be \co{sig_atomic_t}, lock-fre=
e
> > > > -atomics, or \co{volatile}.
> > > > +Instead, such shared variables must be \co{volatile sig_atomic_t} =
or
> > > > +lock-free atomics.
> > > >
> > > >  On the other hand, because the handler executes within the interru=
pted
> > > >  thread's context, the memory ordering used to synchronize communic=
ation
> > > > --
> > > > 2.42.0
> > > >
> > > >
> >
