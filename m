Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8021386D7
	for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731317425; cv=none; b=NJXc4ASBOeLFgwK4MwJ9NZjG4cqJBi+vT8Ogp+uwT3p9d6QoXTunCaVb1/xw+qxOBXHPL76mAnOnf6XYNfYwKTCXmKhoOleI42kb3P1PaxMg19Zt48Rld4135JS+R846NhZCojLWpXpPFZjrW8PRT7RrmyhmtixURVgv296zLyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731317425; c=relaxed/simple;
	bh=Vr/aOnBqL8Skojq2Imc9xDGG8C1B+NFqdklxzzAkV/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6RW0Od5AdBkMlHoHX7ML+oEDnXOmtP89BSk0dl/iN8Q1A34l1FQgDE7D3XbyF0h+qtqDRqVzw+I+PMQvvHZ052+EEB5vntDrWRRzTcH/q00iihJgc3bu0Qi8njEY3cR2knCT4LpEODPMSu2hAVI8PGxA9G9LccRLHguaiBbE60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jr8WiagJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jr8WiagJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so5659131a12.1
        for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 01:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731317422; x=1731922222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN16R1ia6a6mDvbW9Aboe3r8Znv14bdvUNBL6ObY80Q=;
        b=Jr8WiagJuxUMb6GJgB6lsm0bQMJhbm0T16s1SsFYx4enDnsrSBLIHzv9mNDOCqMs6S
         8eI3R5q1KwFl5mosLj6Y168A3yD7UlH2ntgPiOSXi47IEg0/S7m8BxMxSTOZ2KR4S0U0
         efIVmiRJSU9NpVB+I9/Z27bJ8YbwOp8JRksSJT8XhrANTdYYWe83LPvmDFCtPP/T0V/m
         tG5sXDC3cN1JdqBnCcTSTZAp/u/2VJCcrgtkka68EQUsLQmMNB/BwwNWTLQJRhQ5klVt
         iIwAFochsLgxP1dcB5JXl4d3MzTrIUr50FWR2WIZzoj+wujSigLLnXmFGYNfuTHR4131
         0x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317422; x=1731922222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jN16R1ia6a6mDvbW9Aboe3r8Znv14bdvUNBL6ObY80Q=;
        b=hT7NjCYe5zdBD6Hlr1zGtsH7lsGNBKv0Oz/WkaHuGXswTlKad4FrZJdxbONSx2ECta
         +VQT1g23v0+CCHVGdZ20Z1I9HoYFMZnG1Ps4VTady16qjA1KocFgUndQXKTXdXOmTpQr
         lWDw86IqANaZzbVtsqTHJvE8WU+jXi64i/neXX7u1uzQ1lGe7FmpAeg6cwnH/nCieB5A
         qK794yNtd8tTZgDI5t9IBh5oGnNxrMLvROnAe7P7aI7+N3DQRzgxp4UKQFcCc/4ANmjL
         7fcxCqv7x5B05qCXfHNMa8H0VamqXQg1cS9FJXZD7eIC1Dx1Crek2F30Yzi65h8fVDqJ
         bCBw==
X-Gm-Message-State: AOJu0Yw7PHFB3kmwv9FrLzCm5rvHAuoVZ26ResC14L3ZwWHnqNFlt9fF
	w4/FVo9qOVj2HoGccLUZNZ669f8hsqk5EEAB7vPvnFHvjHgK8DpQFM6iI8FI7BoAzCG6zKC+n2f
	XxNtpLJxbtqVX5IAQ+C6Z75bSm83lictV
X-Google-Smtp-Source: AGHT+IEYMN6gqe+nkqhRFbd2v9V7CGy6mF2c8n9jUfLuNLzw1UkRIPen9/GXzP1A6pG+nsA4Pug/HRprqu1poSDYt6E=
X-Received: by 2002:a05:6402:40ce:b0:5cf:1122:88bc with SMTP id
 4fb4d7f45d1cf-5cf11228de0mr8985140a12.20.1731317421326; Mon, 11 Nov 2024
 01:30:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
 <317b9b3f-9dc9-4a5f-9d47-8d5b9d32b55e@gmail.com>
In-Reply-To: <317b9b3f-9dc9-4a5f-9d47-8d5b9d32b55e@gmail.com>
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Mon, 11 Nov 2024 17:30:09 +0800
Message-ID: <CA+MhoaM4O-WFsc7pDBHiPoin0dqt0ZDLrZRq-SQ4z=i_T_5r+g@mail.gmail.com>
Subject: Re: A question about "4.3.4.2 A Volatile Solution" of perfbook
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan and Akira,

Thanks very much for your answers! I have another question from
"4.3.4.2 A Volatile Solution". In this section, it mentions:

   1. Implementations are forbidden from tearing an aligned volatile
access when machine instructions of that access=E2=80=99s size and type are
available. ......

Then later it also mentions:

   To summarize, the volatile keyword can prevent load tearing and
store tearing in cases where the loads and stores are machine-sized
and properly aligned.

TBH, I am a little confused. Does volatile prevent load tearing and
store tearing for aligned and machine-sized data type only? Or as long
as the data type has related machine instructions, no matter whether
its data type is machine-sized or not, volatile can also prevent load
tearing and store tearing?

Thanks very much in advance!


Best Regards
Nan Xiao

On Mon, Nov 11, 2024 at 4:39=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> On Mon, 11 Nov 2024 15:45:22 +0800, Nan Xiao wrote:
> > Hello,
> >
> > Greetings from me!
>
> Hi!
>
> >
> > I am reading "4.3.4.2 A Volatile Solution" of perfbook, and come
> > across following summary:
> >
> >     To summarize, the volatile keyword can prevent load tearing and
> > store tearing in cases where the loads and stores are machine-sized
> > and properly aligned. It can also prevent load fusing, store fusing,
> > invented loads, and invented stores. ...
> >
> > At first I thought it means accessing volatile, aligned and
> > machine-sized data is atomic operation, so I wrote a small test
> > program to test on a "64-bit" Linux server:
> >
> > #include <pthread.h>
> > #include <stdio.h>
> > #include <stdatomic.h>
> > #include <stdint.h>
> >
> >
> > volatile uint64_t sum;
> > atomic_ullong atomic_sum;
> >
> >
> > void *thread(void *arg)
> > {
> >
> >     for (int i =3D 0; i < 100000; i++)
> >
> >     {
> >
> >         sum++;
> >
> >         atomic_fetch_add(&atomic_sum, 1);
> >
> >     }
> >
> >     return NULL;
> >
> > }
> >
> >
> > int main()
> > {
> >
> >     pthread_t tid[4];
> >
> >     for (int i =3D 0; i < sizeof(tid) / sizeof(tid[0]); i++)
> >
> >     {
> >
> >         pthread_create(&tid[i], NULL, thread, NULL);
> >
> >     }
> >
> >
> >     for (int i =3D 0; i < sizeof(tid) / sizeof(tid[0]); i++)
> >
> >     {
> >
> >         pthread_join(tid[i], NULL);
> >
> >     }
> >
> >
> >     printf("sum=3D%llu,atomic_sum=3D%llu\n", sum, atomic_sum);
> >
> >     return 0;
> >
> > }
> >
> > But the result seems not:
> >
> > $ gcc -pthread -O3 parallel.c -o parallel
> > $ ./parallel
> > sum=3D221785,atomic_sum=3D400000
> > $ gcc --version
> > gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)
> > Copyright (C) 2018 Free Software Foundation, Inc.
> > This is free software; see the source for copying conditions.  There is=
 NO
> > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.
> >
> > So my understanding is: volatile doesn't guarantee the atomic
> > operation for aligned, machine-sized data, and we can only use
> > atomic_xxx data types and related functions to guarantee atomic
> > operations. Is my understanding correct? Or I misunderstood volatile?
> > Thanks very much in advance!
>
> Your code above does mostly the same things as Listings 5.1 and 5.2 in
> Section 5.1 "Why Isn=E2=80=99t Concurrent Counting Trivial?".
>
> "Atomic (or volatile) accesses" and "atomic increment operations"
> are quite different.
>
> Please read on!
>
>         Thanks, Akira
>
> >
> > Best Regards
> > Nan Xiao
>
