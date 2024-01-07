Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5713AC8
	for <perfbook@vger.kernel.org>; Sun,  7 Jan 2024 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChRyrsWO"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-28c7e30c83fso492588a91.1
        for <perfbook@vger.kernel.org>; Sun, 07 Jan 2024 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704646896; x=1705251696; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w6jihWJFY7NdNrLllIWSInzHZ6pDu6IIHglgF1j3zww=;
        b=ChRyrsWOTcmZg1f8qtbVW0HKfInPk1sKNrYFN9EdCOjNtnzzeC1Weu/5s+lKL+YK+V
         x1OnD2vG9N/R7XwCNPbEWqS4e9McPkaGwSLQhbb6+8344LXCPf3AoR5bD7pzy8y5KJ2J
         aM/bLW4nlYRXuj7D0snu3SyyozJ2/bMkB2QHjBh9ZN/62dnZgmIj1l0dPbkn2a2AaFfq
         E6lwjeGefET0L6/JDScNEgTfz2dwS4g8M/UWJi6qHSbzPDmjEZkmQwMIEzCM9QgZ7Dhc
         g3jPa7la4tprujao1DZ30H+TwiWLQSDWlV8AQnYAcpBQquhYdcjVqussHTkFElKnJ2Zu
         l8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704646896; x=1705251696;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w6jihWJFY7NdNrLllIWSInzHZ6pDu6IIHglgF1j3zww=;
        b=X3ni5k4Ad9hWulQhtAgXqlq+9KYc38ZhWzNm6dEy8RbDPA1gD90CAG0owY0/hxSk3m
         3cZNUuK9cHKgX1VoynoC5Rm48kEPP6ppsENESyc27dIaty5uRpANBfuK5CClnVqQrejX
         moo7H4w2waofja+XUnz7Ez6s7BAzl/lWw1HlTmUEXvxt/tMcuPvTEzI/rO1XJFdJwq/C
         0GffGcTgN+aFxNAtoCjH8M4dQkZDTgz7L/5GtCn+XefN+64IIfXD/exucgKtrZ8AXhGF
         oKRv49ZcDnkEX3LwBWSn5ePfUD1qnfb07SCw/kKWXSugM1+XQqQMbOhDNNjE1d83WMFD
         McFQ==
X-Gm-Message-State: AOJu0YwyxsT2iKyTO89jfBF4vBt4BI5DRvgie/tPak820pgcc5e1o+hh
	U5xXfcAK3jSFQda5wR0HSBw=
X-Google-Smtp-Source: AGHT+IEtlG58G0LlI3bj3u/f9EIGx/Mxus/7AG0DfD+DL6GAzZlbrEzx85U9jmqBTPKAD5DgJS+4zw==
X-Received: by 2002:a05:6a20:8f01:b0:199:9448:f9e4 with SMTP id b1-20020a056a208f0100b001999448f9e4mr198914pzk.1.1704646896373;
        Sun, 07 Jan 2024 09:01:36 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001d3f03c3460sm4608469plt.158.2024.01.07.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 09:01:35 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 3/3] appendix/toyrcu: Add missing parentheses for rcu_quiescent_state()
Date: Sun,  7 Jan 2024 09:01:22 -0800
Message-Id: <20240107170122.18010-4-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240107170122.18010-1-sj38.park@gmail.com>
References: <20240107170122.18010-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

Some sentences on toyrcu.tex is missing parentheses for
rcu_quiescent_state().  Add those.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 4083f9f0..a33ccdb3 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1447,13 +1447,13 @@ re-ordered with the \clnrefrange{gp1}{gp2}.
 	\begin{fcvref}[ln:defer:rcu_qs:read_lock_unlock:qs]
 	Doesn't the additional memory barrier shown on \clnref{mb2} of
 	\cref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
-	greatly increase the overhead of \co{rcu_quiescent_state}?
+	greatly increase the overhead of \co{rcu_quiescent_state()}?
 	\end{fcvref}
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:defer:rcu_qs:read_lock_unlock:qs]
 	Indeed it does!
 	An application using this implementation of RCU should therefore
-	invoke \co{rcu_quiescent_state} sparingly, instead using
+	invoke \co{rcu_quiescent_state()} sparingly, instead using
 	\co{rcu_read_lock()} and \co{rcu_read_unlock()} most of the
 	time.
 
@@ -1574,7 +1574,7 @@ certain types of library functions.
 	effect extended beyond the enclosing
 	\co{rcu_read_lock()} and \co{rcu_read_unlock()}, out to
 	the previous and next call to \co{rcu_quiescent_state()}.
-	This \co{rcu_quiescent_state} can be thought of as an
+	This \co{rcu_quiescent_state()} can be thought of as an
 	\co{rcu_read_unlock()} immediately followed by an
 	\co{rcu_read_lock()}.
 
-- 
2.17.1

