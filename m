Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE785C7B
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 23:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710976816; cv=none; b=YoxGBYRYhUwryFMVrwBdvorOMKJbLjdVe3rqMOVGK4qJDAjEG3MeNnip3Aq8nnuT5+Pbl7EfJXqsx+U+jz6WVjQMh+uKwgL3fiSpgE+/f8zSqYkypzBWOqbThtY2NB5C6R9im+d7f9OwN4W33iUqHSubP++FZtV9K+13kSQJ4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710976816; c=relaxed/simple;
	bh=yBSKXTEi+5MTCJx3Et4E7S+o8/tORIuW27h6bhmhE3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=hwRAmuATpSPTeyLrEP23gdETml3qvUkg/uparBywmck+4/X7f2w1P2+5n9rJP/4yxtwspNk05v2KD3euw+tiRFs5JyRcLoDGMQ+ve3o+en5pny8IW2RacbHVNAh5tSY2gqMoRaLvHHXadvtqOSKdc0CLaS4v6SsDb/7wH2/LGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nppDGDCw; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nppDGDCw"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc71031680so280097276.2
        for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 16:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710976814; x=1711581614; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghfFhEdb72SKX3m5BzqQCgYLQZf0jHAtgI1yC4hmhd8=;
        b=nppDGDCwop98zKN5+KwoTZkYgjSVpNQ36vOSxmm4tqPvt6GQw6unAlU/JfYNfbVxnx
         tDUfl7wmbxbg4ihK4Z9P9HNzIOOdbWIc5da7D5cp7xa1QznNgfwlrEOCrhyq73YscaVK
         iDv1FZ25wIgQQO70tGX1k2Eh04w2wMDtCdWRwFfmmVm9OWuKpxdyFamMYx4FTJEyTXfK
         1KpwKqroB2tYEbxTknMVauQfGa7tOLOw5deCKFKNOKsAeixV4wsQE6Deh1wUeaMlsYMe
         S4VZ5NnKdopBT+o6AbKHnTWzuUi5kH5h5DKbS3nUdqicZdhmNaJ3SNmNWt4jmMwcyabm
         iRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710976814; x=1711581614;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghfFhEdb72SKX3m5BzqQCgYLQZf0jHAtgI1yC4hmhd8=;
        b=bQowutHIStVCFWyHiGPVZurF9QQ2Tmz0G9plrX3RSRR3xRDiDY7Dvk8+il4HpKGdeb
         17PmbY51J4quIqMi54gW+uxcRIYd7xtzysBymnAemsl/ZADYCYDCaroOCDJ2F5dCnBSh
         hb/g/4VTYkubV+VKispNIRT4IPbOz29uRDkz7J5Dpc33rwYMPHXS/lQm0419oYbdQcu7
         nUgP6dCQ1zyrLn2e3xLLi5MLlYZ0KRPcvkzYGpuU9zDCbE1xsBzt+42YisGuSTiK/IBQ
         9uSmOOtdgvMiBk4KuCUU73g/s8pbetOcHCEI5fBdfC2UkmDuaZXw2WHj487AujKwgT8W
         Ss3g==
X-Forwarded-Encrypted: i=1; AJvYcCW0FNBiqoxOtc5j1Y/P6HWov9YLXJLazc+hTBuu/+tQUE/tpsp+CaY1JuFK3uZg6pfZZhVYnQuapc4LLd8Z/rrBWmSyiqp1ssM=
X-Gm-Message-State: AOJu0YyXlzKZ4Xr05OgK54AqIuq+xVyUjEhtGE5qTdi3CIXmzezLHgLr
	jka8pdbhH8iSAcHETtGeQS4fLeJs4t87VGJmvAxwyxBdbMNLKQRqsJPmg3jwVL3R7vPcfl2AX6b
	vJP/Ft/wVWOguYL1ePYKLv8Rxqqckg3CM
X-Google-Smtp-Source: AGHT+IFrJ8DC4wlBZ+MXEvrHWFGhe9IEZCTKePG0jQuRwuBmMHgYXwhrzl3PzR9TyvdBsdPb/erYriRoKhdyAp2poxs=
X-Received: by 2002:a25:109:0:b0:dcf:66d4:1766 with SMTP id
 9-20020a250109000000b00dcf66d41766mr277851ybb.52.1710976813929; Wed, 20 Mar
 2024 16:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
 <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>
 <r63f5f54bb6cilp542vw52ctpjnjbik5pbfrsswvjzccipokgg@c2kdkpmxbfue> <CAJbg=FWq5hWFy48bYXHnaBQpV5Xga9pryB-qHCbFgUGpFZ1bNg@mail.gmail.com>
In-Reply-To: <CAJbg=FWq5hWFy48bYXHnaBQpV5Xga9pryB-qHCbFgUGpFZ1bNg@mail.gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 20 Mar 2024 19:20:03 -0400
Message-ID: <CAJbg=FUFNk=7OQmtz8X7JaRyPGP5OBjpio_KzWEQREoncsA5oQ@mail.gmail.com>
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR sigatomic_t
To: Guilherme Janczak <guilherme.janczak@yandex.com>, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually, in the example I cited, there are multiple function calls
(printf, raise) between the two reads. How can the compiler optimize
out reading the value a second time?

My view, which is subject to change at any moment and without notice,
is that you need volatile in the cases where you normally need
volatile, rather than inherently whenever you use sig_atomic_t. In the
following example I would not expect you to need it:

static sig_atomic_t value;

void
sig_handler(int signum)
{
    value++;
}

void
func(void)
{
    value =3D 0;
    sleep(1);
    printf("There have been %d signals while I was napping\n", value);
}

--Elad

On Wed, Mar 20, 2024 at 7:05=E2=80=AFPM Elad Lahav <e2lahav@gmail.com> wrot=
e:
>
> No problem...
> Yes, in your example the issue is that the type is not atomic, and
> thus subject to partial updates that can be interrupted.
> Looking at the example given in
> https://en.cppreference.com/w/c/program/sig_atomic_t the volatile is
> needed to let the compiler know that the value can be updated in
> between two reads by the main function. That makes sense, especially
> if you have code that loops waiting for the value to change.
>
> --Elad
>
> On Wed, Mar 20, 2024 at 6:39=E2=80=AFPM Guilherme Janczak
> <guilherme.janczak@yandex.com> wrote:
> >
> > Actually, uh, I misread your reply, forget the previous reply I sent.
> >
> > You don't need the volatile with lock-free atomics, but the standard
> > says you do need it with sig_atomic_t. I don't know of a case that woul=
d
> > break a plain `sig_atomic_t` variable with no `volatile`, however.
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
> > >
