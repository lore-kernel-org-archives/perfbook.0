Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1D3AC1C
	for <perfbook@vger.kernel.org>; Sun,  6 Apr 2025 04:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743914131; cv=none; b=NC92gUpUs/p2+VUxq4ZP7r0rH4hfVCxHlYod0qYUc24L7ij6015i/xweiHWY43sxembWSyyE4+0IHGIiVGvEqyIdGfApT6hrhh3gZTOxftEQmGzSXKDGRUauM2Szs2KGXqrT5dNB9xc/qybySEjHunl32yEKh9ID+DUg+gfgEs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743914131; c=relaxed/simple;
	bh=Cq0KT1I8Dq7ckLIGlH9YeA6wwMS3WreivU5JF0bheeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVsmHJfpzyMBKace9mJ0G2OXs+H+FZPUyk3An3Vy+/e0o6/8xHweWFJlZpRE8tKmkeIEYvxWGuwp3RKn2rxiP7lan5daKR2DrgF1935onBBOZa/Do5uu2DX9el0cjer5xxaNFtkUU2g2BrFVOt86v3Ch1IQalu7g54GOn1/cyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQAn7AYD; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQAn7AYD"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e643f234e08so2752272276.0
        for <perfbook@vger.kernel.org>; Sat, 05 Apr 2025 21:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743914129; x=1744518929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHxRmRu10lzwzOtcTBoodNZpXwOkJSU9tVT4cyjynxg=;
        b=ZQAn7AYD2oswBUO9g/5XHCYki772uQALcnZr5KhGXkSLPUaFyTdlwpXm0dkSiF7d0I
         a+GQnHAGXs8ttu046iVT4jusaTk/N7AC0iN+ayx0R+v/oTXIRAALO5teT8T6VoLxCzoG
         v6dbEHLT4xGPTchb6HHrwTNR5BPCMyPokKoNhn0fIxyigM9Jebo57PiSVBJJuNlfc4ny
         vlUfvMMFKmMPI8NoqrPx+XqAnY84+UmAkNYk8AmJ6lA1f1ZI4D6J3CZLF5pIwQlp4KBe
         7RK4Cz/wmcrKqpTULnXfZAnRwO5ScUEHojs+rK4+XXBbP3tSXJ/ftumBjR08v0Ampnvy
         upxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743914129; x=1744518929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHxRmRu10lzwzOtcTBoodNZpXwOkJSU9tVT4cyjynxg=;
        b=JRFIliz77rSM6li/A3WT3vSRt9M8jctvMqIusJKdrkI2YFMkkkXOQbIe94S/wlQfWN
         X5gu2JRw41yNeyVNLYUyvz4XZ2rY5ODs4mXaBwO3R0nYjBCf0jqVdHZiQXHM7I2lYcA0
         slZ1oAjt2wY1swifXWjoGyDFZjNOaE1Wns4+swjHLrE25pJPBVZxuPmOrTifvYbFccha
         lihhbQwk60WdIMSTEGviPJSpaV0GmMYux3DPfM0gfaSNGYNx3eRpI5atcXQz9zokFQMg
         PYpIGZJucWvU7OFthF58qOzkN68Kn4e4Xnalo3ACnn8LxNU823HGJsMLUpKJek+/6V7o
         mFYA==
X-Gm-Message-State: AOJu0Yzl7r7yDyfEOidfJFcH/0RQAbUbDHaHZxoYCkiM+YuaZq4PNAPs
	/3KrttJt9v/HR51d1SPCv17jGFmxXre5mR88FMZ7kia46uMjAp6sBSzrqHmyhWk4pV/2Fyl+05m
	rWhXIrU1VMX//dCMd0hbA65cT+nusYw==
X-Gm-Gg: ASbGncs4DcSOloSR5pMwtyUMKQW7ZEZIOU+AJ0vmA/H2yuGz82hy35HWks1LpcilIt8
	idyyDFpDg9HY4XZ2HVDzDUp68CNlf0p5xM8GVXwHim/YKiflExMxyn3KjmwbyM8Rkpv6Dzt4Nhb
	V1fEHOrX3scuya5OU9u0TfKKq0fA==
X-Google-Smtp-Source: AGHT+IHJVzLF/aJTLnl9OJ2v9fT/+lOpHS9IfKtzrqTBVS9+yuVTO+Ss1k9pjJrH+smoU4FbU4kMx8BoUyH9S/tbJpw=
X-Received: by 2002:a05:6902:228e:b0:e6b:7cdf:b0f4 with SMTP id
 3f1490d57ef6-e6e1c32c165mr13187652276.36.1743914129065; Sat, 05 Apr 2025
 21:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+MhoaP6ttZU8YVbL4_ugqVQe=rj7hn7_fNVcbqBXtZp+jgDHA@mail.gmail.com>
 <f0ec32c4-5369-438a-85e9-413b757a77d3@paulmck-laptop> <CA+MhoaODjUSuDbLCf+waoJN-C-amuFisjGc_yiVXpb7jPRO7+g@mail.gmail.com>
 <48feb842-73da-4177-92c9-399e44df0854@paulmck-laptop>
In-Reply-To: <48feb842-73da-4177-92c9-399e44df0854@paulmck-laptop>
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Sun, 6 Apr 2025 12:35:18 +0800
X-Gm-Features: ATxdqUG5YBb01LNghXTWnRYk3wRnoc_V3p3wUPsFXDhYsQAruDEapQCYXex6fdc
Message-ID: <CA+MhoaNGA0YszVANcEM0dTGAS-X5hy50qrt663wX0V9LZmZ-4Q@mail.gmail.com>
Subject: Re: A question about "3.2.2 Costs of Operations" in perf book
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Got it! Thanks again for your time and explanation!

Best Regards
Nan Xiao

On Sun, Apr 6, 2025 at 10:29=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Sun, Apr 06, 2025 at 10:16:49AM +0800, Nan Xiao wrote:
> > Hi Paul,
> >
> > Thanks very much for your time and detailed explanation!
> >
> > > ... So, yes, a CAS operation happens to map to the single x86 cmpxchg=
 instruction, ...
> >
> > Maybe a nitpick, but from the book, a CAS operation is not mapped to
> > the single x86 cmpxchg instruction, but a single x86 cmpxchg
> > instruction with "lock" instruction prefix, right? Though I am not
> > sure whether semicolon here matters or not: "lock cmpxchg" or "lock;
> > cmpxchg".
>
> Very much a philosophical point.  However, other x86 instruction
> prefixes are considered to be part of the following instruction, so I
> feel comfortable treating "lock;" as a prefix.  ;-)
>
>                                                         Thanx, Paul
>
> > Thanks!
> >
> > Best Regards
> > Nan Xiao
> >
> > On Sun, Apr 6, 2025 at 1:19=E2=80=AFAM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> > >
> > > On Sat, Apr 05, 2025 at 07:07:17PM +0800, Nan Xiao wrote:
> > > > Hello,
> > > >
> > > > Greetings from me!
> > >
> > > And good to e-meet you!
> > >
> > > > I am reading  "3.2.2 Costs of Operations" in perf book, and come
> > > > across following words:
> > > >
> > > > > The same-CPU compare-and-swap (CAS) operation consumes about seve=
n nanoseconds, a duration more than ten times that of the clock period. ...=
...CAS functionality is provided by the lock; cmpxchg instruction on x86.
> > > > > ...... Similarly, the same-CPU lock operation (a =E2=80=9Cround t=
rip=E2=80=9D pair consisting of a lock acquisition and release) consumes mo=
re than fifteen nanoseconds,or more than thirty clock cycles. The Lock Oper=
ation Is more expensive than CAS because it requires two atomic operations =
on the lock data structure,
> > > >
> > > > So my question is for the "lock" operation in the above paragraph,
> > > > does it mean "lock" instruction? Because the CAS functionality is
> > > > "lock; cmpxchg" on x86, a single "lock" instruction should consume
> > > > less time than "lock; cmpxchg". Or I misunderstood something? Thank=
s
> > > > very much in advance!
> > >
> > > Good question!
> > >
> > > To see the answer, please keep in mind that although this book's
> > > performance results are taken mostly from x86, the overall focus is
> > > independent of architecture.  So, yes, a CAS operation happens to map=
 to
> > > the single x86 cmpxchg instruction, but on 32-bit ARM it would map to
> > > a sequence of instructions featuring load-linked and store-conditiona=
l
> > > instructions.
> > >
> > > With this in mind, the "lock" in Table 3.1 is not the x86 "lock"
> > > instruction prefix, but rather the acquisition and release of a spinl=
ock.
> > > In the Linux kernel, spin_lock() and spin_unlock().  In userspace,
> > > pthread_mutex_lock() and pthread_mutex_unlock().
> > >
> > > For support for this view in the text, please see the sentences readi=
ng
> > > as follows:
> > >
> > >         Similarly, the same-CPU lock operation (a "round trip" pair
> > >         consisting of a lock acquisition and release) consumes more
> > >         than fifteen nanoseconds, or more than thirty clock cycles.
> > >         The lock operation is more expensive than CAS because it
> > >         requires two atomic operations on the lock data structure,
> > >         one for acquisition and the other for release.
> > >
> > > Does that help?
> > >
> > >                                                         Thanx, Paul
