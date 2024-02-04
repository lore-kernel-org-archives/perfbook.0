Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E6123770
	for <perfbook@vger.kernel.org>; Sun,  4 Feb 2024 16:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707065114; cv=none; b=afek7ymPty/iRvgHj+ydeUyrZNcVQYuPyMAam4VPHYuJo+/bkwhHPLBv9EeX3p7bSp0TzvlwE8w3PB0q8z4fHlWWqQzGq1lcGyhFtU9/G9PdU52VvWL9ZamrmmFdN8xOEafs6XiYlnqd7Sq6Mnx1dao7MwdAleOZAfDdnuSE/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707065114; c=relaxed/simple;
	bh=TtQIpSzX5qnk1xk4S6++AORy8bBrl7C1YzxJd1V1fXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=UAJGqGuj0D29f+02+ephm0iZrpLrOsQDZbklWbFe6KvUfAcp1lZeW3CHr7LroaltvBWjVBSS338xuYXXeGmhWj903PbJzysF/Y8LH3zTArfB7Sgp+gDbDWCQyCAkbCKSqKH4LVJecUP6lyoA4367taJimLhfaAAKpMgLRTYjh2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSTv/xMu; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSTv/xMu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d70b0e521eso27606245ad.1
        for <perfbook@vger.kernel.org>; Sun, 04 Feb 2024 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707065113; x=1707669913; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BRpilJyMnpqLk0aBEosc0Oo/UZtH2XjIuM/ft3zStLg=;
        b=nSTv/xMuCFMUrXli8Sf+rn2GtkY+FL9Xq0itxJ33H1OnH3EtE9ndn1XeeEXfjidIv5
         fSDbCjZNJzR7jE0CbUFG4Tt559M9519BJDVwZhk3GBtdBZCGW2pmAngtXEUL+kfom0+z
         rUD8nUZFubJZ/+3Ypaj2KFD6mfv//PPPoHKYh/BmSJx02lFOk4/OjkNrZVKLzFFNEFjQ
         W9kJqAyH9y72HYplBoNkfz7eFVXfA7kvcTxvi0UNGWUDBxUx9xkJDFODxxxofOonuMpi
         QQRLY8q9cnkFLSwOu/RI/aTTYIKc0au3RumGO8vGN4DFBQYLhaW7W9gNNf0sd8BzBN0D
         7K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707065113; x=1707669913;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRpilJyMnpqLk0aBEosc0Oo/UZtH2XjIuM/ft3zStLg=;
        b=D8CQTHQQBKod3Tto/nTMtrbdo+ek6mjZLoGUJQ189S5xr4CQBFMo/dUlBrN+VAVMwW
         8VLUliuSbldnE1zIJMKo44FmXWADYZMXQ9lVw7r9q/oa5stT4Jw1fffe8CMf3F2GXS0M
         GXEVU/pa0XOypOHmauqKLgU6BTaNSWqTYkZ6wIRAe515s9pmKqYIa4T2ntZDZhiM2Bty
         wm384KBUb+WYNQlkfdCW1+APM0VfN0vdKOvCFjM2W5zTJaF0BVBcuOPIpnw7J9Q26rYm
         GrKcnRBO40v4aP4oLm855UYijWeMBGluYyAd9KFCiH/J92LFO/y2xFi6d3Qs0FQnZsXx
         Umew==
X-Gm-Message-State: AOJu0YzMHJdQwFXs1N5R/+fzkWfSJ2Sw192Q36PJyxTErKon94etjt0E
	R23j/kGZZQtubY2PLgcKfH4YrGX1veV57EnEI2Y/6NoHqUHoFXqZ
X-Google-Smtp-Source: AGHT+IGLEHlaI4hzrFr7I2A0+CqWOP4gZmz097ELO3dMBw/cz5K0s1O4L6hqEuR0Jg1cP0VTvaAz2A==
X-Received: by 2002:a17:903:41cd:b0:1d9:9aed:cf30 with SMTP id u13-20020a17090341cd00b001d99aedcf30mr4491325ple.30.1707065112779;
        Sun, 04 Feb 2024 08:45:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWfELPzvmy2x6UJmK6YgC7LRqcw1/fo0xEs/PKfExiJVP28KvJth00TJmtLfq+qd0jhz6dfgruHkhLwgJvxrfK0E5QQDWxN0mo=
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id y2-20020a63fa02000000b005d880b41598sm5350014pgh.94.2024.02.04.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 08:45:12 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 4/4] appendix/whymb: Add missing unbreakable spaces
Date: Sun,  4 Feb 2024 08:45:02 -0800
Message-Id: <20240204164502.15124-5-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240204164502.15124-1-sj38.park@gmail.com>
References: <20240204164502.15124-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

Some sentences in whymemorybarriers.tex is missing unbreakable spaces
between 'and' and CPU numbers.  Add those.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index a7f97897..a4077814 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1495,7 +1495,7 @@ as we will see.\footnote{
 \label{sec:app:whymb:Example 1}
 
 \Cref{lst:app:whymb:Memory Barrier Example 1}
-shows three code fragments, executed concurrently by CPUs~0, 1, and 2.
+shows three code fragments, executed concurrently by CPUs~0, 1, and~2.
 Each of \qco{a}, \qco{b}, and \qco{c} are initially zero.
 
 \floatstyle{plaintop}
@@ -1559,7 +1559,7 @@ the assertion.
 \label{sec:app:whymb:Example 2}
 
 \Cref{lst:app:whymb:Memory Barrier Example 2}
-shows three code fragments, executed concurrently by CPUs~0, 1, and 2.
+shows three code fragments, executed concurrently by CPUs~0, 1, and~2.
 Both \qco{a} and \qco{b} are initially zero.
 
 \begin{listing}
@@ -1601,7 +1601,7 @@ mainstream computer systems.
 \label{sec:app:whymb:Example 3}
 
 \Cref{lst:app:whymb:Memory Barrier Example 3}
-shows three code fragments, executed concurrently by CPUs~0, 1, and 2.
+shows three code fragments, executed concurrently by CPUs~0, 1, and~2.
 All variables are initially zero.
 
 \begin{listing*}
-- 
2.17.1

