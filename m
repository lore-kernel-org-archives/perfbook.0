Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9285C58
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710975963; cv=none; b=ordZMceB+opV5XhavceieE81wwqNGxV6LsJxVB7Aqr2/IdiX9OqYfo0FXTi5T9i58uppEr09GgkQbTsDMQwGloy6SOtGEGareTYhlmk7q3Ze3JQMeUFQyWplOCY/a/6M1pbF5dj7ZunLTCZaHArvHbBjQ9jGCxZ4C2A9N6RTwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710975963; c=relaxed/simple;
	bh=wEdID/kDQvkS/rrHzt0dzje9qrsjoUkI5mDoadHLhAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=DGuN8LfG6qrMgyGNu2rcHnrsBa3jkh3/o7E+8II3iLLVgTRKNvdszYH113iAAZ4ILvCGJ80yH5WFNnMxv/lBazW/ZfWHmaiqcwR4l5RFMQGg5r3yrGwCxDqsYsEnFAL9en2RKC7FjWRAj8yjlbNwAIROQ0FsuVtdwEMBJZ5ndnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3o5aqiL; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3o5aqiL"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60a434ea806so3413177b3.3
        for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 16:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710975961; x=1711580761; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejt+VJdXrkaC4sXjRGlF37fVhx+s53503xSlIl4bpbk=;
        b=F3o5aqiLtAOY4T2RPinBGpNSjrb3POnVww1yevPsA4iaiRNhyjlZ90KA1vPe7YPItv
         ZvzofZwHOYPLL+2KTxCcQLEbUK4vXD1bLFyoD20vR4Q64UzO+TEq3k+TJQuKmchwlzOL
         3I4jV0TQ5dd5P99Y0oY4lBiLAwxt3C5cfPscmBYdwOC6SDwtFiNM3vzPnVZRjitxgiSH
         tkFzuHlOdNO3361luZf5FoABhArIEWsXk6rP7ZYYuVSi6Pinihm8mA8MlslwQunz5Xwl
         mSVCwEbVicFLFYHF6zlpq/ot3yuIDDsSFWfeuclTM1qUDHvH+LfCApxHnnj5Jp0j7C5/
         sqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710975961; x=1711580761;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ejt+VJdXrkaC4sXjRGlF37fVhx+s53503xSlIl4bpbk=;
        b=AME1FVB6KaUyRKYp0XaPH02VTC4g/evQuQoSBHCtf6lVuTynfOGBMHY3vJvM+4wO8p
         9NI1BY5B446whCXLn3z+abAtdcedf+ZbXPQSavxNatX4AfwBOBZggTT6eqUPJ4sh6iUO
         oT+cscYYTzGu3xvqfcRarsBdeMd1W0o+pNQH23iT2yVfLmt2iOl1OJtabhAXzHi6z0eh
         oKbX57PKo2Mr6X+LNVyk+/dSj+3NRcuLIQ6B5jMmYhYIYBwrT7UUkG6ZVsKEUJeCD0HL
         HCT55G4C+LduwIN+8PAHzhTawqMR3ZEkLiYEZVaII4yU/QhyKwMYeMlF9zQu3Xp01hX4
         eTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdCgCT9ndgeOsd9Xa7I/9v3lMsZz8JRvkunD40L/cWMUBS5LiMdr17QTs2OE4SBUFQVlZfefTpauey8OqpVEdIScZWBozSGbk=
X-Gm-Message-State: AOJu0YwB9DMZWLinNsW1ALbDb4m+i1yJEYbMAhWYIzIO/5NeUK7aroVB
	awSGgdIrYEeleDRnjxx9eAqMzbdEfDEZc7VmguXmH/3m12tUDTckn7BEeX5hH7kZibzPmXS9Nhv
	nztGdg9G7/Afd6aZ+xaUkvbZGBt251eWFdHk=
X-Google-Smtp-Source: AGHT+IFkowstse/5cSH1le5XdehcYsD1OhUivzGwOKREd2SijkZuva7Fh/RXzH7Hf/rZKxuIma6LHlFa4KC0aACblTE=
X-Received: by 2002:a25:ce41:0:b0:dcb:f5f9:c062 with SMTP id
 x62-20020a25ce41000000b00dcbf5f9c062mr18658391ybe.14.1710975960937; Wed, 20
 Mar 2024 16:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
 <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com> <r63f5f54bb6cilp542vw52ctpjnjbik5pbfrsswvjzccipokgg@c2kdkpmxbfue>
In-Reply-To: <r63f5f54bb6cilp542vw52ctpjnjbik5pbfrsswvjzccipokgg@c2kdkpmxbfue>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 20 Mar 2024 19:05:50 -0400
Message-ID: <CAJbg=FWq5hWFy48bYXHnaBQpV5Xga9pryB-qHCbFgUGpFZ1bNg@mail.gmail.com>
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR sigatomic_t
To: Guilherme Janczak <guilherme.janczak@yandex.com>, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No problem...
Yes, in your example the issue is that the type is not atomic, and
thus subject to partial updates that can be interrupted.
Looking at the example given in
https://en.cppreference.com/w/c/program/sig_atomic_t the volatile is
needed to let the compiler know that the value can be updated in
between two reads by the main function. That makes sense, especially
if you have code that loops waiting for the value to change.

--Elad

On Wed, Mar 20, 2024 at 6:39=E2=80=AFPM Guilherme Janczak
<guilherme.janczak@yandex.com> wrote:
>
> Actually, uh, I misread your reply, forget the previous reply I sent.
>
> You don't need the volatile with lock-free atomics, but the standard
> says you do need it with sig_atomic_t. I don't know of a case that would
> break a plain `sig_atomic_t` variable with no `volatile`, however.
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
> > On Wed, Mar 20, 2024 at 4:32=E2=80=AFPM Guilherme Janczak
> > <guilherme.janczak@yandex.com> wrote:
> > >
> > > Variables shared with signal handlers must be of type `volatile
> > > sigatomic_t`, not `volatile` or `sigatomic_t` as the current text say=
s,
> > > according to a C11 draft:
> > >
> > >     When ... interrupted by ... a signal, values of objects that are
> > >     neither lock-free atomic objects nor of type volatile sig_atomic_=
t
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
> > > @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thread, a=
t least at the
> > >  assembly-language level.
> > >  However, the C and C++ languages do not define the results of handle=
rs
> > >  and interrupted threads sharing plain variables.
> > > -Instead, such shared variables must be \co{sig_atomic_t}, lock-free
> > > -atomics, or \co{volatile}.
> > > +Instead, such shared variables must be \co{volatile sig_atomic_t} or
> > > +lock-free atomics.
> > >
> > >  On the other hand, because the handler executes within the interrupt=
ed
> > >  thread's context, the memory ordering used to synchronize communicat=
ion
> > > --
> > > 2.42.0
> > >
> > >
> >
