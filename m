Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF0E5695
	for <perfbook@vger.kernel.org>; Sat,  5 Apr 2025 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743851252; cv=none; b=BNXSDAupiBbGUWMV0xMK2SuiZ0TgaflA+4tWJ0kZCO/UedEsvoumeT9PZTfkxt6mXE6S9GMWkMmmOcWd0ETeJH+u5AQXEu+soy5pyFjHkvPgBuLCowYAE/IHV7zv1JTfowEcS/v0lBwB/bxjIJDQGfe8/M5ufBzEQ2ctO91wEXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743851252; c=relaxed/simple;
	bh=CauXNe1yEfxebIMXyPhwNiFACOdNJGSNjGyLFe4BHgg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SMr3T8Q33Bx1G+UPdHHqCg6Reb+Q/KlxzW++by72f+W63bq4h/HYvmZ2h3zaHxgdwOfO7aNO4Kc1vA+weaFZebD7TQ0iuM1twpdx4qb6sFvBg9O0apsntZGzFwdtC7IGWLvYJFu0jpuUR8qtGHNlI7K2ERFKddo3vUQOtDZ9TXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxiCKmSD; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxiCKmSD"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6fed0620395so28528737b3.3
        for <perfbook@vger.kernel.org>; Sat, 05 Apr 2025 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743851250; x=1744456050; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=95jrs5pJyKDzz2kN1clXC0m7XQFrZ+XbqWqt829APa8=;
        b=BxiCKmSDA7+AVYCyPy/jrMB2Md9X+oj4+xkBIXkxHj73F21pRPzMcMDKouyBVcgSj9
         BadyDykvokGVLzlwdWsjt93oygmHZ30UVqyQUp7lpdylI9BIvU50O6HaUUm0QnPNxA+h
         3zhyN+cdiXJr0gPoPq7pN/BjiVartLYrUffeFOUrO1Gv9CSfsrGwNVpwq+w4Oas3rlxA
         btEjTXyTyKnu6RnUo94E2zcQ6zfFc6mroZKOV5tNnkBg53OkVgxhbjKNO1YSBj9Y9XUt
         +eK+CzRWlH8A8OKeWPqS6MlnvULAP36pHeCJZ0WHSSbziiHwNkUJRqpQ9LaHDeYDrCjG
         JSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743851250; x=1744456050;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95jrs5pJyKDzz2kN1clXC0m7XQFrZ+XbqWqt829APa8=;
        b=HOAc9yOS5CzvnmZHnq2XwRig0JOitQS5rDhBAIGxugqtQ7ygels9rrYvSjXBqbM4OO
         KM8F6IsZc7N1EdWFlLB0rXt3Kg8W7a/FdoZXjmE9vqxA7BiQcGwx5qHvvDcMixf5OL9e
         GWd0CpqO+fanCNFxUaGgQWAhhwASEP4vIHNZlEMzCpusbjFbqmxbRDmbOi9pfr2jKy09
         I7/K7Pg1LA6Lq9BCqomXqzuWCPEVBIceIWmzBBc8oqZn5IMeltVANb2E0u430MUGWVH0
         aMGH8rWTMxIB86ofHf6yQvNLBq3gEnUzqJFwOwN2rPuBJYciL16Oa1iY7zXMESCoC3Vk
         SnSw==
X-Gm-Message-State: AOJu0YxMWtejVcpZW14CKWI1n+8Oh1QUfBhMCnFaaIx9hyusZOtohDy9
	jsRx7UgbF+B1kCsT9aiqo2K23t6ILvaZz0IlFiDT0dJeTnPC1XpWNKM4xxJroyJQALatvcjuYGe
	yvDimzhHoXDnWfGC/CeHXgVikHypK75ty
X-Gm-Gg: ASbGncutpZVjk8eqvEmyIjcL7Y1U/LsETXamvtDMmwl+dMXEuvsXlSUuwMrEih2MgA+
	VGnc/Qbt/EFtn8bMSjozLtw+bUqoiyv53QUVJGu8Y1Qo8iUMpK0XnK0GapeP4fBZ09c4g2AGVmT
	rF/JZmw9Ff6rbYq38fR0H8Z5lPdQ==
X-Google-Smtp-Source: AGHT+IE2BKjkhW/A7C3vqZD8ZRVypt0lWr2MmZWN6ik9XlrZWgQfdvWEKShT6dOUbwB2y03iykAbHW2IrZ8Mb4yzsws=
X-Received: by 2002:a05:690c:6f87:b0:6fd:9f44:f3ab with SMTP id
 00721157ae682-703e3140075mr100262647b3.13.1743851249810; Sat, 05 Apr 2025
 04:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Sat, 5 Apr 2025 19:07:17 +0800
X-Gm-Features: ATxdqUHzoSxkpFaLsd1WtzSDQ74Jly2cZzxWF60qVWYQep3i9Q-36ETozNP0_ic
Message-ID: <CA+MhoaP6ttZU8YVbL4_ugqVQe=rj7hn7_fNVcbqBXtZp+jgDHA@mail.gmail.com>
Subject: A question about "3.2.2 Costs of Operations" in perf book
To: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Greetings from me!

I am reading  "3.2.2 Costs of Operations" in perf book, and come
across following words:

> The same-CPU compare-and-swap (CAS) operation consumes about seven nanose=
conds, a duration more than ten times that of the clock period. ......CAS f=
unctionality is provided by the lock; cmpxchg instruction on x86.
> ...... Similarly, the same-CPU lock operation (a =E2=80=9Cround trip=E2=
=80=9D pair consisting of a lock acquisition and release) consumes more tha=
n fifteen nanoseconds,or more than thirty clock cycles. The Lock Operation =
Is more expensive than CAS because it requires two atomic operations on the=
 lock data structure,

So my question is for the "lock" operation in the above paragraph,
does it mean "lock" instruction? Because the CAS functionality is
"lock; cmpxchg" on x86, a single "lock" instruction should consume
less time than "lock; cmpxchg". Or I misunderstood something? Thanks
very much in advance!

Best Regards
Nan Xiao
