Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA21B95B
	for <perfbook@vger.kernel.org>; Sun,  6 Apr 2025 02:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743905822; cv=none; b=NzgeVbbZggViy7ARwzfkyx/g4CnnFK7kgm1S0y7FbuXaHGUNGdP3BgTIbNLpXfdJAL2IRQNDRd7zMGvaDuqaa6btbJHwJnXp/hIhaBarj/qSaeQLLF8hVcQow1w9/J5ZE284l9LrylDW13s90vrAtORi67v8QCkJO9BK5Dyo+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743905822; c=relaxed/simple;
	bh=0jmp6u9sLmnbz25A02vlHBjfw6Hq9OQsHR5qy2gCkGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQqTMhy3lIRu5ELo89+Jfeh3iVywBVsiHSYpG+WH35NkCRNsrsrYSMLdDO9tIroqvYRZuUH8G5iPON4N/FVGPoEOk6DKX/fGrj/FF6eQSYsix2+dQF7B4EOuek+Opvedn9jb8WORi8ueTAN+K32bvPxFm9XnaZyZioer5bUPT8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dz86z4T2; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dz86z4T2"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ff1e375a47so31474297b3.1
        for <perfbook@vger.kernel.org>; Sat, 05 Apr 2025 19:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743905820; x=1744510620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nxnpRXzVvr8TaciLElFy5rY61HRL0VXJqIoqYYmCk4=;
        b=dz86z4T2Gxd/PBXrwgGC4Xg//mQnDRgE4dw1xKDUoTURJjWOq84Ai+72RRdSwDD5ok
         9vqw+JkhQV/KteCvZjyN+QOnZo9kORbsqy9bU1AzSczoRiRgek6Pz/9lccVoYEFrPGJt
         mgK0gM+KOx7oYQTzXjyYwegJnZIzKlV3Eo343TZP3+yBFvLyNMYWQlbPQ6FbU4DWWrzp
         NecMUUVIbqHfuyMcsRoBEdVYQomo6BZGDCamFIie8CANXK3H3ZI580qKmjmQhs4eSdVB
         4BeQI7IiO3x/K7ReLuB0AnQTD19dDrlUwoI2jLFRtUybd2TBoHQyHaRju/4A3X1v3UiD
         Aq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743905820; x=1744510620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nxnpRXzVvr8TaciLElFy5rY61HRL0VXJqIoqYYmCk4=;
        b=hBEQziqMTfySNN62eC5TX7QsIyrlzaV/vS8kRpUiMG983vRAMao41syZTdXBV8zxxI
         nBE/DRSZqngJ7Lk8ftTW+BUPflVI6lAGx3tOPChEfbSwH2OvlCg1CAC3w6B9pbMmG5y7
         PgPY5YK/t8g1FF5wHW8WB20PS/wv4TwKh1+HBfGJiujeFEOnQCfhLx8BiMGxdWdnnhRI
         ycQ5ZZCe1OwuVPE38HrnTkYrznpyxxmu4IyANa/A+RwtjhxSBM3YKsI9qKwXMOtOH3nb
         rfflf4v4r2aVNBZzJybqplRX5mEHdQlRYrZjuVpLqMxLMkAbirXYhZRq0dG+Y8/IyXus
         gGVA==
X-Gm-Message-State: AOJu0Yz2AgLmBLK6skm7hRlTJXGGRs7e6QP6PEf1xrNAJiwc7tP35msC
	fHkerm0K908QiN4piTNtSIUFTt2boIj7hyRg4q0jY+9rTIGlQQDH/RXhtUtJ5/NR5Y3OoWzE8tg
	noOblPuGTdEv2dh99lW2h0WfgZno=
X-Gm-Gg: ASbGnctolulVWkeBCZTk5k9Nhtu0yieLLZyfAu4hxqF268ovWYzqgFMaDAcpPOezwjy
	nAp0CuAPaVTnA5bUhMnqwP4qWbmmsyFJ/c/efIsz9iyZTuTXz+tHRmhKr6dZ3q6mI0ZA6j4omVm
	j2mHNO6h9Sqn7SlrythkAUWaLwDQ==
X-Google-Smtp-Source: AGHT+IG9ohWlOIZyBezmtH4PxYJBs3zdKh8Afo9eVX+mPZhaPqparwe168wqm/DBMrAx8bV/F3Zebrijl3c2EwTIA0w=
X-Received: by 2002:a05:690c:6c84:b0:703:b278:db3b with SMTP id
 00721157ae682-703e161dc69mr152375197b3.30.1743905819985; Sat, 05 Apr 2025
 19:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+MhoaP6ttZU8YVbL4_ugqVQe=rj7hn7_fNVcbqBXtZp+jgDHA@mail.gmail.com>
 <f0ec32c4-5369-438a-85e9-413b757a77d3@paulmck-laptop>
In-Reply-To: <f0ec32c4-5369-438a-85e9-413b757a77d3@paulmck-laptop>
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Sun, 6 Apr 2025 10:16:49 +0800
X-Gm-Features: ATxdqUEm8uCPJpuP7Sl1ivI4SGVtxznrXScZLygdwJk2sgl-QAYkStVmZPfVKBw
Message-ID: <CA+MhoaODjUSuDbLCf+waoJN-C-amuFisjGc_yiVXpb7jPRO7+g@mail.gmail.com>
Subject: Re: A question about "3.2.2 Costs of Operations" in perf book
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks very much for your time and detailed explanation!

> ... So, yes, a CAS operation happens to map to the single x86 cmpxchg ins=
truction, ...

Maybe a nitpick, but from the book, a CAS operation is not mapped to
the single x86 cmpxchg instruction, but a single x86 cmpxchg
instruction with "lock" instruction prefix, right? Though I am not
sure whether semicolon here matters or not: "lock cmpxchg" or "lock;
cmpxchg".

Thanks!

Best Regards
Nan Xiao

On Sun, Apr 6, 2025 at 1:19=E2=80=AFAM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Sat, Apr 05, 2025 at 07:07:17PM +0800, Nan Xiao wrote:
> > Hello,
> >
> > Greetings from me!
>
> And good to e-meet you!
>
> > I am reading  "3.2.2 Costs of Operations" in perf book, and come
> > across following words:
> >
> > > The same-CPU compare-and-swap (CAS) operation consumes about seven na=
noseconds, a duration more than ten times that of the clock period. ......C=
AS functionality is provided by the lock; cmpxchg instruction on x86.
> > > ...... Similarly, the same-CPU lock operation (a =E2=80=9Cround trip=
=E2=80=9D pair consisting of a lock acquisition and release) consumes more =
than fifteen nanoseconds,or more than thirty clock cycles. The Lock Operati=
on Is more expensive than CAS because it requires two atomic operations on =
the lock data structure,
> >
> > So my question is for the "lock" operation in the above paragraph,
> > does it mean "lock" instruction? Because the CAS functionality is
> > "lock; cmpxchg" on x86, a single "lock" instruction should consume
> > less time than "lock; cmpxchg". Or I misunderstood something? Thanks
> > very much in advance!
>
> Good question!
>
> To see the answer, please keep in mind that although this book's
> performance results are taken mostly from x86, the overall focus is
> independent of architecture.  So, yes, a CAS operation happens to map to
> the single x86 cmpxchg instruction, but on 32-bit ARM it would map to
> a sequence of instructions featuring load-linked and store-conditional
> instructions.
>
> With this in mind, the "lock" in Table 3.1 is not the x86 "lock"
> instruction prefix, but rather the acquisition and release of a spinlock.
> In the Linux kernel, spin_lock() and spin_unlock().  In userspace,
> pthread_mutex_lock() and pthread_mutex_unlock().
>
> For support for this view in the text, please see the sentences reading
> as follows:
>
>         Similarly, the same-CPU lock operation (a "round trip" pair
>         consisting of a lock acquisition and release) consumes more
>         than fifteen nanoseconds, or more than thirty clock cycles.
>         The lock operation is more expensive than CAS because it
>         requires two atomic operations on the lock data structure,
>         one for acquisition and the other for release.
>
> Does that help?
>
>                                                         Thanx, Paul
