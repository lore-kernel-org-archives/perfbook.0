Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848B28BA9A
	for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551899; cv=none; b=W/s6yLsWQKNNtDSDwOchlXTOPiXNzErdqLBRgf0H5DraQNc5pUnFbjwAkUjFZa5EmlyhK7w0/ny1fleAnyOiTnLf32sYSj8mk76UT5XWt7K+6uBTdMq5KrJTN2w/34ml2+NbL2lj56ZCS/PGF+5uTwzLPwhR8SBZl1MQ5q1YrVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551899; c=relaxed/simple;
	bh=pFNSvvwv56Lg68vkmzOloUkf7/XXcv4wDDc2c9vVqcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9ENVz4soZHazOIrCTTBjWyPBXbTKNgfqmr1cr1AqnLG7NETonFZbzmA4JskuMcvZ36bMcNbb5vor8QwBkXUa30dX/7tSuezORgp6H1Qs9kv7TvdJh3TJ0Ii6P8+HcZe2Xjfau+eEpRxucltqgPgXAxpGt6ePGrE7xzmSXMOcW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN1bJfqj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN1bJfqj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c035f2afso3701275b3a.2
        for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 03:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749551897; x=1750156697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZT/KaljTD8+jWI+3RsiQD6nUYWLRkfC5gh7ns45uhg=;
        b=jN1bJfqjHnsrdUoinsCRhH6V+SZwtZKp1a5R6Bsz1fxPR+0ULbF/gQb3GDoTrTDkYv
         QumZH0bSqq4UNV9zku2f8hKpvvxLBBg6NQ45tflYstHFssq7o6Rxyzq5svZPeFeOMABQ
         mBqPdt3lreVHr/PyXJB/n6+viEP4viEgbVOzCdZpIW3sRFhXAqUyYdCnod2qL0r3H1pg
         7hXDJaVr2s/kyJmJgMXl5u2HSUhdsvEZPMEZH9PXqfZe3XYBeB4i3MxAeJYwkKopaSzp
         Ux/LrhP7pwiS47uzQLl4DlbC6ul79Cmhekdc1u+GohTm4yLOpL1Vajqc+dAR6KTcbZ/W
         fpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551897; x=1750156697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZT/KaljTD8+jWI+3RsiQD6nUYWLRkfC5gh7ns45uhg=;
        b=SWlHNY+mmKe9d44NPA63nqbZj2jpXF2upz9p6Z8s+KG9NPgGUK/RCD8nLdrqMxXsSs
         gOLuK3xceeYfszUTDx8lMUCFQQ/cejANLG9tbtcuTGJikcE7g1OSo7rOGydtbXNWKQc/
         mpQvacKQgTdjRRiP8arY7f0S4CtRvBcScl/x1Cf86zgvqgVUK5NjD/7DEtWAODkKhORw
         MsedslC/5g0HLj/VJwY1zDjyT6AS2lQ9rMmHnsIl/pyczI/ys+ikQCvebc1iMwz3GI50
         +eHgkLwE9G7yTeLbELcw9i/yqLzTgFSsB1oJvCXAOeeVmp9z1kXWn1wbgYEJjwYFv8vQ
         +izQ==
X-Gm-Message-State: AOJu0YwIMNYQQ8PNbhpk85jri/h+mJI9l958fpPcceybJnLZpm9ukO4J
	caKuWVrHTgQpM5CghUM4rPC+ziapX9O9cq9J8jl8dNcuLrUirAvOVE81
X-Gm-Gg: ASbGncutW3mUssfjSnu0bkeU+dFgGOU3OfHAoxp9cnLtKnt8spvqrCai4VMR7mt/1Or
	wyAx5g4Ru4WzKmvAWG1Wq7VR2P8/xtjpi4MUsOQ/o0gr1I9/bMlRgQYkWgDtLuVUiLxFDltDWXf
	BxiWATZcmgqcdiC10YqfT2pq2A3okPAY+PA6CXr13iR6CWmqXDn41U+0hXFaNxg6yeFeJr+tMca
	BJI3z6iY0sUUxVFMF5tJNJ0g6Z7I51xzVTRnfBq5wF2Q3rvXBZJd9ywmfrMn+C7mgFVwP0/nhxB
	2q5JPOo1W4eSTmZj8IrPu4ffoq6fi0AI7LIcYLldiPghW4M++4YGxWsWf4SJV9o4fwP2+fGhHXq
	ZfYh5rvf8qxb6HhH43gIG0OIgZyZ7DHUt
X-Google-Smtp-Source: AGHT+IGWZZ4uLV8QnCPwahWPPB9Ijk/k3zKUdfnL25Op+H8A08rpXYHHN2lj2oYy28Q5X8NJzqrnMQ==
X-Received: by 2002:a05:6a21:3394:b0:215:eac9:1ab5 with SMTP id adf61e73a8af0-21f78c36f19mr3696253637.20.1749551897175;
        Tue, 10 Jun 2025 03:38:17 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af382a8sm7109048b3a.21.2025.06.10.03.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:38:16 -0700 (PDT)
Message-ID: <a2823b8d-797d-4878-9d62-29e52ceb1e7c@gmail.com>
Date: Tue, 10 Jun 2025 19:38:15 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/5] formal/dyntickrcu: Add non-breakable spaces
 around \co{i} and \co{j}
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Protect single-letter variables "i" and "j" from unfortunate
line/column/page breaks such as:

                                        ... loop counter
    i has exceeded ...

and:

                                          ..., so that i
    counts entries ...

, so that they can be rendered as:

                                      ... loop counter i
    has exceeded ...

and:

                                            ..., so that
    i counts entries ...

, instead.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/dyntickrcu.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 2d118e69..efd1108d 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -469,7 +469,7 @@ a loop as follows:
 
 \begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-base:dyntick_nohz]
 \Clnref{do,od} define a loop.
-\Clnref{break} exits the loop once the loop counter \co{i}
+\Clnref{break} exits the loop once the loop counter~\co{i}
 has exceeded the limit \co{MAX_DYNTICK_LOOP_NOHZ}.
 \Clnref{kick_loop} tells the loop construct to execute
 \clnrefrange{ex_inc:b}{inc_i}
@@ -1003,15 +1003,15 @@ the loop in \co{dyntick_irq()} as follows:
 
 \begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irq-ssl:dyntick_irq]
 This is similar to the earlier \co{dynticks_irq()} process.
-It adds a second counter variable \co{j} on \clnref{j}, so that
-\co{i} counts entries to interrupt handlers and \co{j}
-counts exits.
+It adds a second counter variable~\co{j} on \clnref{j}, so that
+\co{i}~counts entries to interrupt handlers and \co{j}~counts
+exits.
 The \co{outermost} variable on \clnref{om} helps determine
 when the \co{grace_period_state} variable needs to be sampled
 for the safety checks.
 The loop-exit check on \clnref{chk_ex:b,chk_ex:e} is updated to require that the
 specified number of interrupt handlers are exited as well as entered,
-and the increment of \co{i} is moved to \clnref{inc_i}, which is
+and the increment of~\co{i} is moved to \clnref{inc_i}, which is
 the end of the interrupt-entry model.
 \Clnrefrange{atm1:b}{atm1:e} set the \co{outermost} variable to indicate
 whether this is the outermost of a set of nested interrupts and to
@@ -1026,7 +1026,7 @@ legal to exit another interrupt.
 \Clnrefrange{atm3:b}{atm3:e}
 check the safety criterion, but only if we are exiting
 from the outermost interrupt level.
-Finally, \clnrefrange{atm4:b}{atm4:e} increment the interrupt-exit count \co{j}
+Finally, \clnrefrange{atm4:b}{atm4:e} increment the interrupt-exit count~\co{j}
 and, if this is the outermost interrupt level, clears
 \co{in_dyntick_irq}.
 \end{fcvref}
-- 
2.43.0


