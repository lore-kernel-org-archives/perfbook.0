Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE23E3DAB
	for <perfbook@vger.kernel.org>; Mon, 13 Jul 2026 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936659; cv=none; b=XhGlDMvdAppx5PSt9bVVpmPY9OsVj7X3wT7jOdoVkYtsKo4h4cpvhDYjgIxEzYltGP26QM4Oi4X1+pmyLjoGzBID8IabBTkc3YCiNXgij8Z5b6SC1edGzFzPxZqU6YFlDH6QEmzCV66D5x8Q/davgqv2vaC1IInYspnpSaFeKHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936659; c=relaxed/simple;
	bh=W6mrml2CeiErIEx/rpG59wnpU+zZG8yNEZB/YncuOJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIgec9CJKaFSHt+TGP7PHO8+uVsKdHpiQ++t5Sg1F4Bl5L8bxv0X+ERLsnU6OIZ/E8IoW7h5MbWdQsFgkKp4jLa9KTiQbTpM4X/hnyfBTdBAcTL4MVUzDw+n/vyiXw8v2TuVgMEy6xOPn8tTsIuuX0Z9BeORmiw1xypAeNizA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4Fd6S7i; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4Fd6S7i"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38101f85591so2815495a91.1
        for <perfbook@vger.kernel.org>; Mon, 13 Jul 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783936655; x=1784541455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkdK4NyX7FMreqjjwknHAnyMxWAPwrwIwNlc0y9u9tI=;
        b=a4Fd6S7ibHs+XyhT6wk7R7y8zpx0dfW5TY0ublW+IoiNYVWwOj/ow84KARCRiqG6SP
         Xkk07vonO0VTBH1hwhZNr/v8UOnkYNqGceSIxDNwVcGQGjLcES+tmOr6fO/kKNjSr3bQ
         tPZBq27hVykzNEF/lz5xlPx6YPMRlod2i1602kBo/f1NlpOwTMj1Lw660j0pccTAySzv
         RfqeFANdTElfTK2Jh2G2/mUMSfivzTmrgl0h+Umc4bKjl2hS0OIc7+8j2iXSCgfzrWhR
         C1VY5Y4YA4q7gwcuebHXASf4FHNqFjMovozTorp55sFt/HTydyJkBEyOPAslVRSQCkAs
         3oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936655; x=1784541455;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkdK4NyX7FMreqjjwknHAnyMxWAPwrwIwNlc0y9u9tI=;
        b=aqBhdDTm5cnlSH/EEpFWyuOs2QDMB++X+Yuvp6y75SsbeJlEcLECC5EOscbdsqRXKQ
         tUimF8I+bVVRni9FHDxfA8jzc0WExvGYORMtMjyZ/207B3xpywfeTDK39PXhZqGdHlR0
         OMICyYMR3GvF9T9/nFnff9Xx9wO+c+5t5iI6cVOaSl3HWHzqgdxja4HOvDvlPcZnspVI
         5r0ppuM+L+ZXnt6HEsA/tkBe73IlEzhzHfrJwrz93dJXYn8r5jZ7sxeI2BomOYedq7I3
         XxWOPp37/kPmubzjuTFS08uNO7IPEJPE1MnLtqAMWAgMFuWdo6fMOZDriQWfXF7IoC2R
         nvMQ==
X-Gm-Message-State: AOJu0YyejCBdQGS7+MrZPQXMq472sqnBoN8Oe5apwqkX5O7DZx2jFCRA
	TARHmOnrsLoocx9IV7wi/+p+xf7of9WTtHahSE2T2fO561qxh+ZyHjQE6W1ucw==
X-Gm-Gg: AfdE7cmr2NSgZtPSqvM7U2CbXzDdNmnE8kHpOCVhX9yIOf+1OOi9ZK3bLUf0siY9bGO
	sJjDUf40xB5lzYx3Ly2QEIiLAYCUStcIgER2YKV1JC42LkoaitrOodzZCioR/iV51hFgklhT5fm
	AIRXMc88UFwE43SFsOVN0ZYRxMfSKxmW0yplMhiE88Y5+g4acsc0Cqz8GQE9WXkscsjlDgvOyWz
	RnMVsSx37p76tCTRJpN16LQFtV0WCq/G5ijwWN3ESGhG2U1MNpymFb/V8t8rGNE3dBgegtfmA0w
	bfvh+RC75mP4D87GOKad8lvaDPMoelinfYAG+QBhoI+u5YR1j4IKiQgCfVmEF12UBOvPOHXGVAm
	FJnBNKEEzzYyFMwF/7O2Cpv+7FEtJCN+cSgX/UjIlYxVIARPHDkbmKBrP/C5RO9SCOUIwdoIf4P
	oX0axm5dju8dMLp0Ux+VVQLMHsu4l+I5MaaouR0ubbfsa5K5hCGHZ/RKEvbQ==
X-Received: by 2002:a17:90b:5903:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38dc834de8fmr6624416a91.15.1783936655021;
        Mon, 13 Jul 2026 02:57:35 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e0e033de6sm402392a91.13.2026.07.13.02.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:57:34 -0700 (PDT)
Message-ID: <0f2f0b9d-e70c-45e6-a16b-f426745971e5@gmail.com>
Date: Mon, 13 Jul 2026 18:57:33 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/3] toolsoftrade: Minor fixes
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bca22163-1a29-4680-a037-f895cf38d630@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bca22163-1a29-4680-a037-f895cf38d630@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

  - Add "()" to function name.
  - Fill in line counts for potential infinite loop.
  - Typo ("as as exemplified ..." -> "as is exemplified ...").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index c864c484..39c7aa4b 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1509,7 +1509,7 @@ transformation reduces register pressure.
 But if some other thread changes \co{global_ptr} from non-\co{NULL}
 to \co{NULL} between \clnref{B1,B2} of the transformed code, the
 two comparisons will be against different variables, possibly passing
-\co{do_low} a \co{NULL} pointer.
+\co{do_low()} a \co{NULL} pointer.
 Prevent this by using \co{READ_ONCE()} as follows:
 \end{fcvref}
 \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
@@ -1732,7 +1732,8 @@ Because \clnref{A1} does a plain load and because the compiler knows that
 compiler could quite reasonably decide to check this variable only once,
 \setlnpref{B}
 resulting in the code shown on \clnrefrange{B1}{B3} of the listing.
-Once entered, the loop on will never exit, regardless of how
+Once entered, the loop on \clnrefrange{B2}{B3}
+will never exit, regardless of how
 many times some other thread stores a non-zero value to \co{need_to_stop}.
 The result will at best be consternation, and might well also entail
 severe physical damage.
@@ -1794,7 +1795,7 @@ indicates this with the mythical \co{nonvolatile_atomic_load()} operation.
 \setlnpref{B}
 However, those working on real-time code must take care because finite
 load fusing is permitted, which can lead to finite loop unrolling,
-as as exemplified by the four-way unrolling on \clnrefrange{B1}{B7} of
+as is exemplified by the four-way unrolling on \clnrefrange{B1}{B7} of
 the listing.
 Although this loop unrolling does not cause a functional failure, the
 unrolled loop might cause the \co{do_something_quickly()} function to be
-- 
2.43.0


