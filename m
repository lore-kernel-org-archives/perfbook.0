Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A9C1684B4
	for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731320723; cv=none; b=VYgAtBtH4G493lra9baBJR3RJACrxol0HItu+xdrd87BfQCCo0uKCXmQ0ny24GSA1ptQR2G9jOxiTbpUGUwTSBHUUYPegAjkRuGMjGLNwz+aFYlR2X3T+t2LFfqEVbK0fEWfn8y2ZN4mI18/99N0BqleDdbs7M0ISnuckXeLUEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731320723; c=relaxed/simple;
	bh=eNYwZmGfvYLbqFnXk6FMvif+XnS4P804tWBfBfiK7aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOWZUWzbmmJH7Qjkxk/UZ1M6udse+wHqrVpysrsM5UaHLqHrJqoZAuI/h3I8e+WluevrbaadszE9tHfyNz5wGlFvKtB5YAvdsNQem2MYkv99yOLVhdmhuWLiA9onYuG+58/FunyEMctsTbadUBZMT8OChVWpCYp2XBJQzIhQa8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyiWhwnM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyiWhwnM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cebcf96fabso5483257a12.3
        for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731320720; x=1731925520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoojnGNUS57FNz8duieYz79In38QeDomRS36/krYVBI=;
        b=EyiWhwnMzcM+TC2BNHC2Bl7M48ObEj2nkHoP/hWwEbO0wijB0cMz+BtMZLaJJcqHpp
         LJlUYHpGtYLUCuTsMtfl6esPwIQCRuG5LmtPtpJkEH6KAwT3QifNgxXRksq35p0A2fo4
         QlIBPhxW7XXJZoueVxOdl4uAKs489tzLecLsdD5CwgCb2Q21hwv757SvkfLTxZdDXmtp
         KksACnMyeskn5sFDPaSR+Zc8ckfSj+vHJ9UklBdYTPN2IdFzeMKH92dQgOENQfEJ+PeJ
         /hIl6CG9XReil8bQcgVcMEqH/tXRvdv9qwn2lyR9L2OufE1MiqCVc6XVbwm7nFOERhna
         fP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731320720; x=1731925520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoojnGNUS57FNz8duieYz79In38QeDomRS36/krYVBI=;
        b=Del/FB9Av8U3c2zvqYS8yOlLz1O6QzJph/GMWWd76Q0BtJE9rK3qoT/9POXSIlF55l
         09d1cRUEsjN33XRE2I6tD8E7MquNx13fN9HV4eVWN6iRXazWLCFpFBqBsWj+yZ/XQhSH
         2xXIp6XJXxAm4mfG2rc8JSMWHP5wBAHqQPCQ24ZXMA3ACk9klXTeDB4A4hmSipIN3QMl
         JCcIqFP7pfCLoWSyXXdWwr/Wi2P7IJ1jQoCrp3QYeGsTv0aWhgErR4yNZU08nAc18/RZ
         z3q2AicL//4CIycB0+dpnUcZiovD21Z9WxDRCsBstoHph04VC+3DNa9LHDk/vWwsr2cz
         CjxA==
X-Forwarded-Encrypted: i=1; AJvYcCVrv9a87HwD5GjYqhhHg5xvCYnzBVoA57LT1G4pnYAIaCsa9buszdIwuXGePZkf6eW4IMUCR1LdTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOaME0O+QosdoFICgMP+IA4ZciU7YfQkZyLOFDTYABJuc1O1AB
	ryKjWBzcVS941WwVhl+7WJuMBG58M0PPRBUdz7CxLKd7HxETVwl1ykIYdMz0jUU5nrRz5vcpg0c
	T9qeg/kNJ9ZVfRtQOTzbWnlWMSjlgUKxJ
X-Google-Smtp-Source: AGHT+IGCbrLR+56B6pi+ezZVm8QdJbzTmCBZsRX1BD2UNW5o8I0QQLd45OJbZA+DrpfmH4XHJY+tBEP5YcOT8YC9aIc=
X-Received: by 2002:a05:6402:3492:b0:5cf:3d3b:2164 with SMTP id
 4fb4d7f45d1cf-5cf3d3b21d9mr2863737a12.27.1731320720161; Mon, 11 Nov 2024
 02:25:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
 <317b9b3f-9dc9-4a5f-9d47-8d5b9d32b55e@gmail.com> <CA+MhoaM4O-WFsc7pDBHiPoin0dqt0ZDLrZRq-SQ4z=i_T_5r+g@mail.gmail.com>
 <7C3222F1-80F2-4EA5-AB70-F9922DBE4210@gmail.com>
In-Reply-To: <7C3222F1-80F2-4EA5-AB70-F9922DBE4210@gmail.com>
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Mon, 11 Nov 2024 18:25:09 +0800
Message-ID: <CA+MhoaONCbUmE_UBo8Asm4sFJORGWG5d69pvU09BCFi1SGTUTQ@mail.gmail.com>
Subject: Re: A question about "4.3.4.2 A Volatile Solution" of perfbook
To: Alan Huang <mmpgouride@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

> Machine-sized means smaller than or equal to sizeof(long).

Got it, thanks very much for your help!
Best Regards
Nan Xiao

On Mon, Nov 11, 2024 at 5:38=E2=80=AFPM Alan Huang <mmpgouride@gmail.com> w=
rote:
>
> On Nov 11, 2024, at 17:30, Nan Xiao <xiaonan830818@gmail.com> wrote:
> >
> > Hi Alan and Akira,
> >
> > Thanks very much for your answers! I have another question from
> > "4.3.4.2 A Volatile Solution". In this section, it mentions:
> >
> >   1. Implementations are forbidden from tearing an aligned volatile
> > access when machine instructions of that access=E2=80=99s size and type=
 are
> > available. ......
> >
> > Then later it also mentions:
> >
> >   To summarize, the volatile keyword can prevent load tearing and
> > store tearing in cases where the loads and stores are machine-sized
> > and properly aligned.
> >
> > TBH, I am a little confused. Does volatile prevent load tearing and
> > store tearing for aligned and machine-sized data type only? Or as long
> > as the data type has related machine instructions, no matter whether
> > its data type is machine-sized or not, volatile can also prevent load
> > tearing and store tearing?
>
> Machine-sized means smaller than or equal to sizeof(long).
>
> Take a look at the implementation of WRITE_ONCE or READ_ONCE of linux.
>
> >
> > Thanks very much in advance!
> >
> >
> > Best Regards
> > Nan Xiao
> >
> > On Mon, Nov 11, 2024 at 4:39=E2=80=AFPM Akira Yokosawa <akiyks@gmail.co=
m> wrote:
> >>
> >> On Mon, 11 Nov 2024 15:45:22 +0800, Nan Xiao wrote:
> >>> Hello,
> >>>
> >>> Greetings from me!
> >>
> >> Hi!
> >>
> >>>
> >>> I am reading "4.3.4.2 A Volatile Solution" of perfbook, and come
> >>> across following summary:
> >>>
> >>>    To summarize, the volatile keyword can prevent load tearing and
> >>> store tearing in cases where the loads and stores are machine-sized
> >>> and properly aligned. It can also prevent load fusing, store fusing,
> >>> invented loads, and invented stores. ...
> >>>
> >>> At first I thought it means accessing volatile, aligned and
> >>> machine-sized data is atomic operation, so I wrote a small test
> >>> program to test on a "64-bit" Linux server:
> >>>
> >>> #include <pthread.h>
> >>> #include <stdio.h>
> >>> #include <stdatomic.h>
> >>> #include <stdint.h>
> >>>
> >>>
> >>> volatile uint64_t sum;
> >>> atomic_ullong atomic_sum;
> >>>
> >>>
> >>> void *thread(void *arg)
> >>> {
> >>>
> >>>    for (int i =3D 0; i < 100000; i++)
> >>>
> >>>    {
> >>>
> >>>        sum++;
> >>>
> >>>        atomic_fetch_add(&atomic_sum, 1);
> >>>
> >>>    }
> >>>
> >>>    return NULL;
> >>>
> >>> }
> >>>
> >>>
> >>> int main()
> >>> {
> >>>
> >>>    pthread_t tid[4];
> >>>
> >>>    for (int i =3D 0; i < sizeof(tid) / sizeof(tid[0]); i++)
> >>>
> >>>    {
> >>>
> >>>        pthread_create(&tid[i], NULL, thread, NULL);
> >>>
> >>>    }
> >>>
> >>>
> >>>    for (int i =3D 0; i < sizeof(tid) / sizeof(tid[0]); i++)
> >>>
> >>>    {
> >>>
> >>>        pthread_join(tid[i], NULL);
> >>>
> >>>    }
> >>>
> >>>
> >>>    printf("sum=3D%llu,atomic_sum=3D%llu\n", sum, atomic_sum);
> >>>
> >>>    return 0;
> >>>
> >>> }
> >>>
> >>> But the result seems not:
> >>>
> >>> $ gcc -pthread -O3 parallel.c -o parallel
> >>> $ ./parallel
> >>> sum=3D221785,atomic_sum=3D400000
> >>> $ gcc --version
> >>> gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)
> >>> Copyright (C) 2018 Free Software Foundation, Inc.
> >>> This is free software; see the source for copying conditions.  There =
is NO
> >>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PU=
RPOSE.
> >>>
> >>> So my understanding is: volatile doesn't guarantee the atomic
> >>> operation for aligned, machine-sized data, and we can only use
> >>> atomic_xxx data types and related functions to guarantee atomic
> >>> operations. Is my understanding correct? Or I misunderstood volatile?
> >>> Thanks very much in advance!
> >>
> >> Your code above does mostly the same things as Listings 5.1 and 5.2 in
> >> Section 5.1 "Why Isn=E2=80=99t Concurrent Counting Trivial?".
> >>
> >> "Atomic (or volatile) accesses" and "atomic increment operations"
> >> are quite different.
> >>
> >> Please read on!
> >>
> >>        Thanks, Akira
> >>
> >>>
> >>> Best Regards
> >>> Nan Xiao
> >>
> >
>
