Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704D156225
	for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528089; cv=none; b=UDaeWDxvevO2tjmPGr0w4dAzzLTRaM9uqhFcLuRYc6ytZhsfmY7i2ibWLqX4YVscydMdrIbB1J6i2BrH7QJwQhBb5hW3NrC6r7fhAZibuAhcVGIfD7sCHavrkHNMFOuvuZ4g2IoWQSQBSxMEQ5zRsY45dyuWGHzbMu8NqpyR2nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528089; c=relaxed/simple;
	bh=PzVM2/9Q+vYtzG0J8dDFXULbOK1ceTu/MWjdlh+gbo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6FqVzFCZlokkiRU7SLMYOIYubdKMl+M+IK+dboi6XKt1lQm4lVyHx1/+KK1qp51pi30Ou7uWDXgvAKBDmTgSs+qqOmjSTjuVsDkPi2L8d2HsL4e4YPpRAHoJxhc83lZ+tkCDFaP6HrFh/+sDia/CrYoBA1N/A/7c4gmrfFg6IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBlI9oWi; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBlI9oWi"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6eed30536acso5052957b3.1
        for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 05:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734528086; x=1735132886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzVM2/9Q+vYtzG0J8dDFXULbOK1ceTu/MWjdlh+gbo0=;
        b=gBlI9oWibZoa6NqI8/kOlym3xmYCMh4m2txM7poeoqgfm3lMLMUfNQNpgXSaKSwAoO
         UhG373E10Tju7eKxk1PKk8LWVCrkSOxUP1eFN/RVDPhpce15CXQF6H7mT3O8cUyd/Z8v
         5F0TvsOn8o87P/kv8oqF8ZrGmOSHhZFbLqx4SW8CDw6cfRNTKZMiJI1cgOs1jb8Fd+gX
         94+F9IuHRgFuKrSj8TSEi1PtYhXyq6XhbdpogmUiYZhIo/w3Ljr4ZB8/kGYo4OPb/HH4
         iZ4LHPwQSjfmz2HhZq00iE2Ab5lCY+qtjj/wZ2tLsSjnnJk9t2s1zGIy3aKj5+2z/yw1
         e6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734528086; x=1735132886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzVM2/9Q+vYtzG0J8dDFXULbOK1ceTu/MWjdlh+gbo0=;
        b=gOQLirsAddP7c1doBE7BGtEWwWzv+y1koFG6VfkZlQLF43q7n6IE0mVPZhNDymjcMm
         uox9msi2KPwTyG+hhswIe8dR71StVkg3foI8EjhCEdp2u94GZ1Ewlxy0huWByJpMxu1O
         L/xKXd2WsKkRJDIdcHkSytpu5mBjgOtNdI5HYbQl+G1iReTzcWvW1P3szQ2s9RuEJpKY
         xJDG91I9lWUv05GrZXDXFGSo4F8BugeaK29VJb/RlDmh5VfnzkqqiIUWtDLQThjdG9YV
         xYdA6p2TFLQFCQpYovJfWTli9Rknp7t4xbij9YYRtm8j84RUc7lWYsQ0I7D8vlYNILfv
         28cw==
X-Forwarded-Encrypted: i=1; AJvYcCWLEwEdkIw1GNSiTv34IJrZxGREawTf1EtsKxXFia34ZS+HsyO+uitrWOCFJ0A7mLHEEW9AflmnMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpC2fEOF5MhX0pP4hLdIPhSYK5fWgkigAydwteOb27by7xo+XI
	S/7YoPNK5A/ULGswJTxiuyOot5UPJxpa6aXZH9e+/CsA/PNqeF12JUYo1gT+WGlT4RaEteAlX6g
	6sQxwYNGJ4TDtPTl+8OfWdtpssLK2Lw==
X-Gm-Gg: ASbGncsJDNdWeoJFFS2huz1vDsADLtfA4aTt33HZU1/LktvgUAG+bhp1mJ7xCbNxiZy
	NJ4NM6g8vmVmlbld+PbGYjUsg2Irut0aXwG9yYg==
X-Google-Smtp-Source: AGHT+IHS+2B7D5IoAtno29VshBgpGqzJukpYsveW8ymm6w6bwfkI2vdLIhVpTiTVEtocijKZGaTWzQ9R9C1D/m5ry0Q=
X-Received: by 2002:a05:690c:6c85:b0:6ef:4d12:12f1 with SMTP id
 00721157ae682-6f3d2679742mr8564857b3.5.1734528086279; Wed, 18 Dec 2024
 05:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
 <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com> <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
In-Reply-To: <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 18 Dec 2024 08:21:14 -0500
Message-ID: <CAJbg=FVZoWTk5VanWn6YG5-8y69ktDnzq91APMmnVEuHJi5v6w@mail.gmail.com>
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 9:05=E2=80=AFPM Daniel Xu <dxu@dxuuu.xyz> wrote:
> My understanding is that read_seqbegin() and read_seqretry()
> can execute at any time. That means the read side access of
> the sequence number can occur doing an increment.
>
> To prevent the reader from reading a partially written value,
> we need the WRITE_ONCE() to ensure the relaxed atomic
> write.

Hi Daniel,

This seems very odd to me. Assuming that the lock field is of an
atomic type, no reader will ever see a partial write.
By "atomic" I don't mean subject to atomic read-modify-write
operations, but simply that the hardware always completes a write to
the value before it is made visible to any observers. This should be
true for all aligned integral types in all modern architectures.

Also, I don't believe WRITE_ONCE() imposes any atomicity where none
exists. I'm not a Linux kernel developer, but from what I can tell all
it does is wrap a pointer with volatile, to ensure that the compiler
does not optimize-away the write. In this case I don't see how the
compiler can ignore seq->lock++ between a spin lock and a barrier.

--Elad

>
> Thanks,
> Daniel
>
