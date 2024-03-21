Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B6EC3
	for <perfbook@vger.kernel.org>; Thu, 21 Mar 2024 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710983982; cv=none; b=dPChF03hf7WA2tpiGB1y9V7/mezy5KHjB2r31fnjRiUy3QzZTnOzNwWCd/3uid0EqinyZlU+mqFyTDaGeSU9BLhvibWgRky7dQR96DV+5I2Rk6APDMy7fgszcxSeXuG/PyOh3O7dw5rxKzLuguVKCwhGgYB+DGFHD3mNrafiG0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710983982; c=relaxed/simple;
	bh=YgoePSU4qrhNevYaB92AfT2dMraO0VeHbc7IwLLzizs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFE3PbXOfQDK6KTFEtYtxatrzAC/2S/ObmuulR6n8wqGafpko8/PIjwOUuNFVJTcXGvATN96DNj+oegiOAhNMatomT7YfCm/GNDKTDuAbeOGMHy7eMQVAwmTJoDVYUB6ib2Ql1uciVuAHPR1mQ/9d/aYK4He4WYyvW+kWlSv8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+5ucxbc; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+5ucxbc"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so391612276.1
        for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 18:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710983979; x=1711588779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alQNBT+lAzvAxMvrXvqnZnUSMBay2Joi/bgtmKCH1Ws=;
        b=T+5ucxbcyMVvbytXqSzFslKOM7DqE/WQIEoEvmCYVvYq052anzOMTqt9M8F1OUKyFs
         4a4HThxovBh4Ena7rtGGckNUz6TCPitzI2A60r3HI/5dfQxlmfAVLirIlG+I+IekADXs
         +1gqjyBE1y6Coz60aRCQ7h2OBsm5r/hNP3CJe4neMf/Fdc0+NfoahRK1hPvKjdByclue
         Ot/ULTs0G47Ff2Ll7TAoRi3Ge5CW/2RFIKM0FDYkraAKoq8yTH53nFzHcXbJOqkSJ3S3
         QOlqcPgTnF28gYSiPiyXTdJoFvIkQ/Jw0tE3qUO8fNa4Dss2YSGfG6VuEOrMhAe74IWW
         0dSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710983979; x=1711588779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alQNBT+lAzvAxMvrXvqnZnUSMBay2Joi/bgtmKCH1Ws=;
        b=U8O/ewDbNL4vtkKO28lCqOxBW0MBD8xbGngszJr6LO7b3/AcZcddMDJXiHNq/p4fTW
         Z9TY9zSf3bDV5WgJpSJMG0UEkzMPMgssP2TpdNsfTXngTMBxMKnVK8YNraASDk6gFAeL
         LO4umSboFIUTWqXMbqoEWaaYqp+DTRDIGhvlVw0pDFXsPC7YAYHLVEvWTdVTjsY6Azyu
         +NUHtQkP19rRBUJav4/17AvyBTiiYsrb3ILxpFNyUpaTIZvIjCvD4r7p9Wo+0P+sH3dk
         t7/FRs/0eS/BDrhBCkS4AY/avl1e9lsyn+/IXt4FyFi9laAgpwE9HTp0CPA9SEzHO5kK
         0N9g==
X-Gm-Message-State: AOJu0YysDyB66yBPjI9b5vVV3x9tqQwVuBsCQTPBmgJoXF5NOjfl74tf
	TataGmUtWsm6p2uZuGFW5mRqGgL7ECEWuL7FHPT2IK1vKhMR2YwsD76NE005U8+HG740Ae2Jaff
	1tofOiQosKBjQB6sKLVn+K8Mbgo1IDtLl7IA=
X-Google-Smtp-Source: AGHT+IHKW0pDZF8ca2eDkiE3wj80fUB/biWAv6gjrZWKgvS0N/Sb7mYYJ1liRx3gBujtP6j8zjX9xHRQRteSmw6SSsA=
X-Received: by 2002:a25:dfcd:0:b0:dc7:4790:1b70 with SMTP id
 w196-20020a25dfcd000000b00dc747901b70mr463812ybg.54.1710983978949; Wed, 20
 Mar 2024 18:19:38 -0700 (PDT)
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
 <CAJbg=FUFNk=7OQmtz8X7JaRyPGP5OBjpio_KzWEQREoncsA5oQ@mail.gmail.com>
 <wnqdnghhpmwutvpw5qp6pw3n3itez6k7oppzstyjunoeb5vypi@mriwhhk7aocj> <CAJbg=FXF2cnjoRPZum-069kTRFqkSgdRsbGbZNLpcjnQwhXgDQ@mail.gmail.com>
In-Reply-To: <CAJbg=FXF2cnjoRPZum-069kTRFqkSgdRsbGbZNLpcjnQwhXgDQ@mail.gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 20 Mar 2024 21:19:28 -0400
Message-ID: <CAJbg=FWEkyULrF-4NBs0kVJGJcKQw=nwkyEZ4caknKmK2utKTw@mail.gmail.com>
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR sigatomic_t
To: Guilherme Janczak <guilherme.janczak@yandex.com>
Cc: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here's the actual code I had in mind:

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <time.h>
#include <unistd.h>

static sig_atomic_t value;

static void
sig_handler(int const signum)
{
    value++;
}

int
main(int argc, char **argv)
{
    // Install a signal handler for SIGUSR1.
    struct sigaction act =3D { .sa_handler =3D sig_handler };
    if (sigaction(SIGUSR1, &act, NULL) =3D=3D -1) {
        perror("sigaction");
        return EXIT_FAILURE;
    }

    // Create a timer to dispatch signals.
    struct sigevent event;
    SIGEV_SIGNAL_INIT(&event, SIGUSR1);

    timer_t timerid;
    if (timer_create(CLOCK_MONOTONIC, &event, &timerid) =3D=3D -1) {
        perror("timer_create");
        return EXIT_FAILURE;
    }

    // Start the timer to fire every 10ms.
    struct itimerspec ts =3D {
        .it_value.tv_nsec =3D 10000000UL,
        .it_interval.tv_nsec =3D 10000000UL
    };

    if (timer_settime(timerid, 0, &ts, NULL) =3D=3D -1) {
        perror("timer_settime");
        return EXIT_FAILURE;
    }

    // Wait for one second.
    // Can't use sleep(), as that call will be interrupted.
    uint64_t const start =3D clock_gettime_mon_ns();
    for (;;) {
        uint64_t const now =3D clock_gettime_mon_ns();
        if ((now - start) > 1000000000UL) {
            break;
        }
    }

    printf("There were %d signals while I was napping\n", value);

    return EXIT_SUCCESS;
}

--Elad

On Wed, Mar 20, 2024 at 9:03=E2=80=AFPM Elad Lahav <e2lahav@gmail.com> wrot=
e:
>
> Sorry, that's not at all what I meant. I used sleep() just to simulate
> the main function doing something while signals arrive asynchronously.
> What you gave in your example is exactly the situation that does
> require volatile, per my previous email, as the main function
> constantly polls the shared value without any function calls in reads.
>
> --Elad
>
> On Wed, Mar 20, 2024 at 8:34=E2=80=AFPM Guilherme Janczak
> <guilherme.janczak@yandex.com> wrote:
> >
> > In the case in your example, sleep() doesn't need to be implemented
> > using SIGALRM. It isn't in glibc and OpenBSD that I know of:
> > https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/posix/sl=
eep.c;h=3D3df79097c4464510f0197138a00a0c9772a5e83e;hb=3D3ab9b88e2ac91062b6d=
493fe32bd101a55006c6a
> > https://man.openbsd.org/sleep.3
> >
> > I managed to make GCC and Clang optimize out a sig_atomic_t store:
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
> > #ifdef VOLATILE
> > volatile sig_atomic_t msg;
> > static const char *decl =3D "volatile sig_atomic_t msg";
> > #else
> > sig_atomic_t msg;
> > static const char *decl =3D "sig_atomic_t msg";
> > #endif
> >
> > volatile sig_atomic_t reply;
> > volatile sig_atomic_t replied;
> >
> > int
> > main(void)
> > {
> >         const struct sigaction act =3D { .sa_handler =3D catch_sigalrm =
};
> >         const struct itimerval timer =3D {
> >                 .it_value.tv_usec =3D 1,
> >                 .it_interval.tv_usec =3D 1,
> >         };
> >         sigaction(SIGALRM, &act, NULL);
> >         setitimer(ITIMER_REAL, &timer, NULL);
> >         while (!replied) {
> >                 msg =3D 1;
> >         }
> >         printf("%s =3D=3D %d\n", decl, (int)reply);
> > }
> >
> > static void
> > catch_sigalrm(int unused)
> > {
> >         int n =3D msg;
> >         if (!n)
> >                 return;
> >         reply =3D n;
> >         replied =3D 1;
> > }
> > ```
> >
> > This runs forever:
> > ```
> > $ cc -O2 test2.c && ./a.out
> > ```
> > This terminates:
> > ```
> > $ clang -O2 -DVOLATILE test2.c && ./a.out
> > volatile sig_atomic_t msg =3D=3D 1
> > ```
> >
> > Without volatile in its declaration, msg is never set, so the program
> > spins forever because the signal handler never tells the loop to stop.
> > There's probably a simpler way to do this.
> >
> > On Wed, Mar 20, 2024 at 07:20:03PM -0400, Elad Lahav wrote:
> > > Actually, in the example I cited, there are multiple function calls
> > > (printf, raise) between the two reads. How can the compiler optimize
> > > out reading the value a second time?
> > >
> > > My view, which is subject to change at any moment and without notice,
> > > is that you need volatile in the cases where you normally need
> > > volatile, rather than inherently whenever you use sig_atomic_t. In th=
e
> > > following example I would not expect you to need it:
> > >
> > > static sig_atomic_t value;
> > >
> > > void
> > > sig_handler(int signum)
> > > {
> > >     value++;
> > > }
> > >
> > > void
> > > func(void)
> > > {
> > >     value =3D 0;
> > >     sleep(1);
> > >     printf("There have been %d signals while I was napping\n", value)=
;
> > > }
> > >
> > > --Elad
> > >
> > > On Wed, Mar 20, 2024 at 7:05=E2=80=AFPM Elad Lahav <e2lahav@gmail.com=
> wrote:
> > > >
> > > > No problem...
> > > > Yes, in your example the issue is that the type is not atomic, and
> > > > thus subject to partial updates that can be interrupted.
> > > > Looking at the example given in
> > > > https://en.cppreference.com/w/c/program/sig_atomic_t the volatile i=
s
> > > > needed to let the compiler know that the value can be updated in
> > > > between two reads by the main function. That makes sense, especiall=
y
> > > > if you have code that loops waiting for the value to change.
> > > >
> > > > --Elad
> > > >
> > > > On Wed, Mar 20, 2024 at 6:39=E2=80=AFPM Guilherme Janczak
> > > > <guilherme.janczak@yandex.com> wrote:
> > > > >
> > > > > Actually, uh, I misread your reply, forget the previous reply I s=
ent.
> > > > >
> > > > > You don't need the volatile with lock-free atomics, but the stand=
ard
> > > > > says you do need it with sig_atomic_t. I don't know of a case tha=
t would
> > > > > break a plain `sig_atomic_t` variable with no `volatile`, however=
.
> > > > >
> > > > > On Wed, Mar 20, 2024 at 04:44:33PM -0400, Elad Lahav wrote:
> > > > > > Do you really need volatile?
> > > > > > There are two cases to consider. Either your code synchronizes =
updates
> > > > > > to the shared value with the signal handler (e.g., by blocking =
and
> > > > > > then unblocking the signal), in which case I believe the compil=
er
> > > > > > cannot ignore updates to the value; or you don't, and you can't=
 depend
> > > > > > on the variable having any specific value in the signal handler=
. The
> > > > > > only thing you want to prevent in the latter case is the handle=
r
> > > > > > observing a partial update to the variable, which I presume is =
where
> > > > > > the other requirements originate. (In practice, there should be=
 little
> > > > > > or no concern with any primitive type on modern hardware).
> > > > > >
> > > > > > --Elad
> > > > > >
> > > > > > On Wed, Mar 20, 2024 at 4:32=E2=80=AFPM Guilherme Janczak
> > > > > > <guilherme.janczak@yandex.com> wrote:
> > > > > > >
> > > > > > > Variables shared with signal handlers must be of type `volati=
le
> > > > > > > sigatomic_t`, not `volatile` or `sigatomic_t` as the current =
text says,
> > > > > > > according to a C11 draft:
> > > > > > >
> > > > > > >     When ... interrupted by ... a signal, values of objects t=
hat are
> > > > > > >     neither lock-free atomic objects nor of type volatile sig=
_atomic_t
> > > > > > >     are unspecified.
> > > > > > >
> > > > > > > Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
> > > > > > > Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.co=
m>
> > > > > > > ---
> > > > > > >  memorder/memorder.tex | 4 ++--
> > > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > > > > > > index 5c50d42d..873c3424 100644
> > > > > > > --- a/memorder/memorder.tex
> > > > > > > +++ b/memorder/memorder.tex
> > > > > > > @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted t=
hread, at least at the
> > > > > > >  assembly-language level.
> > > > > > >  However, the C and C++ languages do not define the results o=
f handlers
> > > > > > >  and interrupted threads sharing plain variables.
> > > > > > > -Instead, such shared variables must be \co{sig_atomic_t}, lo=
ck-free
> > > > > > > -atomics, or \co{volatile}.
> > > > > > > +Instead, such shared variables must be \co{volatile sig_atom=
ic_t} or
> > > > > > > +lock-free atomics.
> > > > > > >
> > > > > > >  On the other hand, because the handler executes within the i=
nterrupted
> > > > > > >  thread's context, the memory ordering used to synchronize co=
mmunication
> > > > > > > --
> > > > > > > 2.42.0
> > > > > > >
> > > > > > >
> > > > > >
