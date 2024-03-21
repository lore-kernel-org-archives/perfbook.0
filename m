Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065745CB0
	for <perfbook@vger.kernel.org>; Thu, 21 Mar 2024 01:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710983006; cv=none; b=RGCahqr4dgWcR9xlKSOGwRD4zCRTSLNMcEWDfixZtREcKH5EUQYIXKK+gv2WcslJ4w3ARhkUyqYrwYNJdnlgY3530EfQhyWuGKO0kkLOHjUkA+TiozTDat2kbDZUCg30pLspMFRm10dCjWTEzGBISBSPJJxgko7K1PVqy9ogLfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710983006; c=relaxed/simple;
	bh=lC8Smt0AP4IeA+ZRJ+cyOn+eXCqLD9UrCWaevof/v3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUMd/P+UrMUTzBqoIvEGgHYozAaaC4/jdc7itF6/PGp+NqB98xCIx5wadMco1p+K1PQML8munuaMFbH6EE32fkThPdX9bWtC/KfMBlhg3AnzBJDvqSi99marTRwH7KRMtxJcUhZ/yv3DLB03H3nhKmMYxt2hJ/KMCMnv8JZgM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdUj/eBe; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdUj/eBe"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso355611276.1
        for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 18:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710983004; x=1711587804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OEhUwpq9kHNFAJVkw1zTo9p9sshAvaZX4H+f0C7GwU=;
        b=WdUj/eBeJYfe0clnO+87L5apIyRbUaQLY8felVsPRD5u7rMaDwNNoMmpoEqWFvBLEU
         7Bm8klBaPG8BRIv4pd+eOXkeopO4xztZ67aSCk+aR02/ItC/8yzobud+gQQYCII6ZdId
         BGVNCOfwCI6R0S6yDOgE2sP35kBVCbq+10hQPOgbDh+25i5Xp/f+wpZzEExxZY4v46Fc
         6Zpr7Z6kXcXs5zSQKIVq6Ge2/y6NinA2wdzTHnTeShh2ydkw94Llr5hjMA/4q+Iw5XXN
         qa0toGIv9Ers/M7169dg43fuzYO/U6KiVEILdh4IF+Nyb4wDM9gIcwyHVNYbUB17iUeg
         zuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710983004; x=1711587804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OEhUwpq9kHNFAJVkw1zTo9p9sshAvaZX4H+f0C7GwU=;
        b=u+tzZvZ/28LVL/SuqB1lOIp0GPKzj/FBC1oasMK0rLJqD6OECfDlwJYb01R4E11B4G
         MDQ7RzeXczeEWTD88r3+fCeVS15GaweyxMpt3qX8+Q2+z13axlkYx3qFQKP4SKxENg8u
         iiXsuqwh9Nb+7Oaelzt18Tt0jvohnRygmgOnV0xAN2+8dT55Dklg/l6wQRCU6WXHOkPt
         0aYUNz9KW7jXwhQFvdrHown1XjfPRSSJwz7favAQpLjidOaw6LrJob0UlzVu8OdFS7dQ
         9WwvPSui+B7j87r36ckbwksHgsX+aH9/uSUwP2juox0H/vttmO1ErTbdNsPShQYoJrC0
         6xog==
X-Gm-Message-State: AOJu0Yw1gdvbJQcvktNDC1pQT6juBfXmVBgl3TBrPyYBXOrjypi+BoLb
	IEJWz08GGn4Safw2aDw4Lh4AisyfD9I+U8PrknNReYV/90DJsOLFgb6xCdjqKWfsBfLaF4cLVpF
	oUZg6u5mL244gvtdGDGzc5UmKdtLnGA3G
X-Google-Smtp-Source: AGHT+IESqkRPZc5ExboPs0UOclllUlRAVvtlJF/9w7cAhKeNG3a3yk6/fEKOE1ZHEzSFCEqDbwpXnf1gDrEImx0vqao=
X-Received: by 2002:a05:6902:1b13:b0:dcd:3338:a3c5 with SMTP id
 eh19-20020a0569021b1300b00dcd3338a3c5mr3829688ybb.33.1710983003914; Wed, 20
 Mar 2024 18:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
 <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>
 <r63f5f54bb6cilp542vw52ctpjnjbik5pbfrsswvjzccipokgg@c2kdkpmxbfue>
 <CAJbg=FWq5hWFy48bYXHnaBQpV5Xga9pryB-qHCbFgUGpFZ1bNg@mail.gmail.com>
 <CAJbg=FUFNk=7OQmtz8X7JaRyPGP5OBjpio_KzWEQREoncsA5oQ@mail.gmail.com> <wnqdnghhpmwutvpw5qp6pw3n3itez6k7oppzstyjunoeb5vypi@mriwhhk7aocj>
In-Reply-To: <wnqdnghhpmwutvpw5qp6pw3n3itez6k7oppzstyjunoeb5vypi@mriwhhk7aocj>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 20 Mar 2024 21:03:13 -0400
Message-ID: <CAJbg=FXF2cnjoRPZum-069kTRFqkSgdRsbGbZNLpcjnQwhXgDQ@mail.gmail.com>
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR sigatomic_t
To: Guilherme Janczak <guilherme.janczak@yandex.com>
Cc: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, that's not at all what I meant. I used sleep() just to simulate
the main function doing something while signals arrive asynchronously.
What you gave in your example is exactly the situation that does
require volatile, per my previous email, as the main function
constantly polls the shared value without any function calls in reads.

--Elad

On Wed, Mar 20, 2024 at 8:34=E2=80=AFPM Guilherme Janczak
<guilherme.janczak@yandex.com> wrote:
>
> In the case in your example, sleep() doesn't need to be implemented
> using SIGALRM. It isn't in glibc and OpenBSD that I know of:
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/posix/slee=
p.c;h=3D3df79097c4464510f0197138a00a0c9772a5e83e;hb=3D3ab9b88e2ac91062b6d49=
3fe32bd101a55006c6a
> https://man.openbsd.org/sleep.3
>
> I managed to make GCC and Clang optimize out a sig_atomic_t store:
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
> #ifdef VOLATILE
> volatile sig_atomic_t msg;
> static const char *decl =3D "volatile sig_atomic_t msg";
> #else
> sig_atomic_t msg;
> static const char *decl =3D "sig_atomic_t msg";
> #endif
>
> volatile sig_atomic_t reply;
> volatile sig_atomic_t replied;
>
> int
> main(void)
> {
>         const struct sigaction act =3D { .sa_handler =3D catch_sigalrm };
>         const struct itimerval timer =3D {
>                 .it_value.tv_usec =3D 1,
>                 .it_interval.tv_usec =3D 1,
>         };
>         sigaction(SIGALRM, &act, NULL);
>         setitimer(ITIMER_REAL, &timer, NULL);
>         while (!replied) {
>                 msg =3D 1;
>         }
>         printf("%s =3D=3D %d\n", decl, (int)reply);
> }
>
> static void
> catch_sigalrm(int unused)
> {
>         int n =3D msg;
>         if (!n)
>                 return;
>         reply =3D n;
>         replied =3D 1;
> }
> ```
>
> This runs forever:
> ```
> $ cc -O2 test2.c && ./a.out
> ```
> This terminates:
> ```
> $ clang -O2 -DVOLATILE test2.c && ./a.out
> volatile sig_atomic_t msg =3D=3D 1
> ```
>
> Without volatile in its declaration, msg is never set, so the program
> spins forever because the signal handler never tells the loop to stop.
> There's probably a simpler way to do this.
>
> On Wed, Mar 20, 2024 at 07:20:03PM -0400, Elad Lahav wrote:
> > Actually, in the example I cited, there are multiple function calls
> > (printf, raise) between the two reads. How can the compiler optimize
> > out reading the value a second time?
> >
> > My view, which is subject to change at any moment and without notice,
> > is that you need volatile in the cases where you normally need
> > volatile, rather than inherently whenever you use sig_atomic_t. In the
> > following example I would not expect you to need it:
> >
> > static sig_atomic_t value;
> >
> > void
> > sig_handler(int signum)
> > {
> >     value++;
> > }
> >
> > void
> > func(void)
> > {
> >     value =3D 0;
> >     sleep(1);
> >     printf("There have been %d signals while I was napping\n", value);
> > }
> >
> > --Elad
> >
> > On Wed, Mar 20, 2024 at 7:05=E2=80=AFPM Elad Lahav <e2lahav@gmail.com> =
wrote:
> > >
> > > No problem...
> > > Yes, in your example the issue is that the type is not atomic, and
> > > thus subject to partial updates that can be interrupted.
> > > Looking at the example given in
> > > https://en.cppreference.com/w/c/program/sig_atomic_t the volatile is
> > > needed to let the compiler know that the value can be updated in
> > > between two reads by the main function. That makes sense, especially
> > > if you have code that loops waiting for the value to change.
> > >
> > > --Elad
> > >
> > > On Wed, Mar 20, 2024 at 6:39=E2=80=AFPM Guilherme Janczak
> > > <guilherme.janczak@yandex.com> wrote:
> > > >
> > > > Actually, uh, I misread your reply, forget the previous reply I sen=
t.
> > > >
> > > > You don't need the volatile with lock-free atomics, but the standar=
d
> > > > says you do need it with sig_atomic_t. I don't know of a case that =
would
> > > > break a plain `sig_atomic_t` variable with no `volatile`, however.
> > > >
> > > > On Wed, Mar 20, 2024 at 04:44:33PM -0400, Elad Lahav wrote:
> > > > > Do you really need volatile?
> > > > > There are two cases to consider. Either your code synchronizes up=
dates
> > > > > to the shared value with the signal handler (e.g., by blocking an=
d
> > > > > then unblocking the signal), in which case I believe the compiler
> > > > > cannot ignore updates to the value; or you don't, and you can't d=
epend
> > > > > on the variable having any specific value in the signal handler. =
The
> > > > > only thing you want to prevent in the latter case is the handler
> > > > > observing a partial update to the variable, which I presume is wh=
ere
> > > > > the other requirements originate. (In practice, there should be l=
ittle
> > > > > or no concern with any primitive type on modern hardware).
> > > > >
> > > > > --Elad
> > > > >
> > > > > On Wed, Mar 20, 2024 at 4:32=E2=80=AFPM Guilherme Janczak
> > > > > <guilherme.janczak@yandex.com> wrote:
> > > > > >
> > > > > > Variables shared with signal handlers must be of type `volatile
> > > > > > sigatomic_t`, not `volatile` or `sigatomic_t` as the current te=
xt says,
> > > > > > according to a C11 draft:
> > > > > >
> > > > > >     When ... interrupted by ... a signal, values of objects tha=
t are
> > > > > >     neither lock-free atomic objects nor of type volatile sig_a=
tomic_t
> > > > > >     are unspecified.
> > > > > >
> > > > > > Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
> > > > > > Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.com>
> > > > > > ---
> > > > > >  memorder/memorder.tex | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > > > > > index 5c50d42d..873c3424 100644
> > > > > > --- a/memorder/memorder.tex
> > > > > > +++ b/memorder/memorder.tex
> > > > > > @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thr=
ead, at least at the
> > > > > >  assembly-language level.
> > > > > >  However, the C and C++ languages do not define the results of =
handlers
> > > > > >  and interrupted threads sharing plain variables.
> > > > > > -Instead, such shared variables must be \co{sig_atomic_t}, lock=
-free
> > > > > > -atomics, or \co{volatile}.
> > > > > > +Instead, such shared variables must be \co{volatile sig_atomic=
_t} or
> > > > > > +lock-free atomics.
> > > > > >
> > > > > >  On the other hand, because the handler executes within the int=
errupted
> > > > > >  thread's context, the memory ordering used to synchronize comm=
unication
> > > > > > --
> > > > > > 2.42.0
> > > > > >
> > > > > >
> > > > >
