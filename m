Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9371465BA
	for <perfbook@vger.kernel.org>; Sun,  5 Jan 2025 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075203; cv=none; b=q50W+VG3aXLaBJHCN38UjAHv5n0sA0A2GC2UP88LibaNG2wtXVZ4r8fGbYxM4rSiekAK2ornkUy6qrBMJQreR70La5+Nk49gnj1DFwRu/jZm/0Q9UR21Y3jCjq40B8aYmyO3MNzNwCC0QXiVhBDh1vOugmK14nprH7FIZdhBYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075203; c=relaxed/simple;
	bh=Xn0mBU+6Lzlbopd01KFgW59eR1d/iQ+7LvGyJaagwwQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=JOtC1wuzw2FaY0ZuJvOualAGbK/irYn2CTTM4bmRHxZz8VnzXBe2qyKRcFUiqoWj8pwT5b7xpcGGYl5MUc0+kMszzk7CrsAYbxMtLyVUncKpUkBSjteORPlAsMHVnPhGotSVBT+ndjFomS3bSK6QTF3xcZT4xvWiRrvHWy/3vPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JftsWmrn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JftsWmrn"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21669fd5c7cso193478285ad.3
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 03:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736075200; x=1736680000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2YHN7Zo9elaNpDOdYFpQZU4jPoZYZ8h6oVBAdmZtNE=;
        b=JftsWmrnttMRlR9zsbryBteYYPw5tyowOczynsog6FxZcnBnp4BH5i3E+n0CAoFVDA
         ouE1Gb/E0GdHeOUf6XEOJE6c+oOje7B8y7NsN3jQa+M3OAiMkY0MkdLtaBAEYSgVvAuO
         P//nUc2oNF0xgSUMJ+x/qnb1LXwhxh0VfCop871UNtrSsF/1Agk3P+NPyGIQTRmza3Vt
         9o85jrYBojGyyFzXssrIiSEoDIUiwh9QGMa9mwqDtLKVRPbFC2JF68zG3WbW8eOeicVG
         RrjxjtDsrb/eJAn6TQytciF+/gozhchTKqmLRST397aG++RXv8uhzIhchnyjmourpuXJ
         qAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075200; x=1736680000;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2YHN7Zo9elaNpDOdYFpQZU4jPoZYZ8h6oVBAdmZtNE=;
        b=B/xh2tMJVbjAdPW9ootRbzBGgZN4KqWdBUjxUSGXYwTW8u3USA4knqIijtNnDMxjtd
         qlCwjzZjdUH//7VfMgNCxD1jSCnKDcwUNdTnx9fmaPmFt5zBdvpCt/d7dF1xwTOx5+Ef
         baiD3qD+oMiZNRVYPUb3Ebw375iVg0w3H7hVw7hEWbxgfLiTLzXI71ZNiwK6fnVhq61M
         hQrBCpjzqEtSJu0bVGeKknLAJ2qGsFb+Ho4CYDXLHPt65pJlyRfQblx3/2ZQhcrd4e83
         +mpygWx7C35x8rgnh5Q2KI5BQtstdMqFTjI5mbACETDaO84aWvO82qNZuTw8l72FW3KM
         cdtg==
X-Gm-Message-State: AOJu0YyzHnErVFYNAhOezxdr1Msp6ToJSJXXsfTGUV7AnKeJvJEAdc+w
	eFjsZxNV/QrV4p01OwctXEqW+mZfGgXzf65tdKgyAZy/w/Xf1lfF
X-Gm-Gg: ASbGnctgKGO4PV2bfJSyDR82wQydIi9rXXqKJvg7gyKNaLOWM2mhYBABq2UDbDitx+O
	T+IiocNhiUBy1g5OSOvBIcLZ/ikAtfe9u21Jv/nQFAKdq1dF24ZOnklDMNTB8t+mlkXWDpNoEYY
	c+P64LpvXhRP9Yc8NcAFXy0Mm+kv+SizU21nUm60GF0EOdAGfVkVAdhS2vfNyP4BRdmGGvhoGt8
	yzpNTKD+PcyxyDvKW3SySs6N2LNb3D73nDhj6t/uqKlcHKgRjOiHzq5dY0tHfFE1BJoAFLBBdCD
	nFvFJo77eYcajQN2GIbcu5E=
X-Google-Smtp-Source: AGHT+IFjPdY1ZlqStrFQGDY7hjtlBhdDzmB+vH1HyPvuIW/2N9a+USqwOLALEllegyPxOjjfqywzjQ==
X-Received: by 2002:a05:6a20:728a:b0:1dc:bdbd:9017 with SMTP id adf61e73a8af0-1e5e0818bf4mr94137605637.40.1736075199958;
        Sun, 05 Jan 2025 03:06:39 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fcd22sm29491357b3a.167.2025.01.05.03.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:06:39 -0800 (PST)
Message-ID: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Date: Sun, 5 Jan 2025 20:06:38 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/6] CodeSamples: Make non-default combinations of
 cc and -O levels happy
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While testing commit f2596972845b ("CodeSamples: Fix liburcu-signal
support deprecation"), I observed build errors under Ubuntu 22.04.

Which prompted me to test various combinations of cc and optimization
levels in building under CodeSamples/.

This patch set is a collection of fixes/adjustments to make such various
choices happy.

Patch 1/6 is a preliminary change for ease of experimenting alternative
GCC_ARGS such as "-g -Wall -O0", "-g -Wall -O1", and so on, under
CodeSamples/.

Patch 2/6 fixes an issue around forward declaration of struct in .h file
failing to satisfy compiler's assumption of accessing them from inline
functions.  Looks like this matters with some of gcc versions in low
level optimization, but gcc of Ubuntu 22.04 hits this even at -O3.
Actual declaration of a struct seems to be needed in front of inline
functions who access such a struct.

Patch 3/6 adjusts indirection level of pointer arguments in xchg().

Patch 4/6 adds "static" to __inline__ functions.

Patch 5/6 fixes errors of duplicate symbols due to api.h being included
in multiple .c files linked together.  As a workaround, "#ifndef SUBOBJ"
is added in api-pthreads.h and a flag of -DSUBOBJ is added in Makefiles
to recipes of .c --> _sub.o.

Patch 6/6 removes variables whose final values are never used.
Recent clang is pretty strict on set-but-unused variables.

To test against clang, you need to redirect cc --> clang by, for example,
symlinking $HOME/bin/cc --> /usr/bin/clang or similar.

        Thanks, Akira
--
Akira Yokosawa (6):
  CodeSamples: Put $(GCC_ARGS) in cc argument list
  CodeSamples/datastruct: Move struct declaration from .c to .h
  CodeSamples/advsync: Add explicit type cast in xchg()
  CodeSamples/count: Add static to __inline__ function declarations
  CodeSamples: Add #ifndef SUBOBJ to api-pthreads.h
  CodeSamples/datastruct/Issaquah: Remove unused variables

 CodeSamples/advsync/q.c                          |  2 +-
 CodeSamples/advsync/wfenqueue.c                  |  2 +-
 CodeSamples/api-pthreads/api-pthreads.h          | 14 ++++++++++++++
 CodeSamples/count/count_end.c                    |  4 ++--
 CodeSamples/count/count_end_rcu.c                |  4 ++--
 CodeSamples/count/count_stack.c                  |  6 +++---
 CodeSamples/count/count_stat_atomic.c            |  6 +++---
 CodeSamples/datastruct/Issaquah/Makefile         | 14 ++++++++++----
 CodeSamples/datastruct/Issaquah/existence.c      |  6 ------
 CodeSamples/datastruct/Issaquah/existence.h      |  7 ++++++-
 CodeSamples/datastruct/Issaquah/existence_test.c |  3 ---
 CodeSamples/datastruct/Issaquah/tree.c           |  6 ------
 CodeSamples/datastruct/hash/Makefile             |  7 +++++--
 CodeSamples/defer/Makefile                       |  7 +++++--
 CodeSamples/defer/hazptr.h                       |  6 +++++-
 CodeSamples/intro/Makefile                       | 12 ++++++------
 CodeSamples/locking/Makefile                     |  6 +++---
 17 files changed, 66 insertions(+), 46 deletions(-)


base-commit: 41e6a800d630336b1d8e614b3d11281e42e880c7
-- 
2.34.1

