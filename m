Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC93AEF47
	for <perfbook@vger.kernel.org>; Mon,  9 Mar 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063591; cv=none; b=I1nq4ViLWtTh7FdMGVO82Mkfj8TBcqhxfY4ASXSuv5o9jLzdq65D+cHjTSDnL950HnZBVOhS+7cXO6AeaHVoWZ1ClrmUK3OaHwiYEMRYGvVhKrijmeAzaOEw2KOiQxBTxBdvVOCwjT7FYo1OtzChpKVTWaAZwAHo7rM4CB9jXZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063591; c=relaxed/simple;
	bh=u3hJxOBe6a+IMhJKBdZ/WVxdlnQmMzMOgzP9so3DO+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VAerxWSqzoDHATzNShkhlObd4XJMtReN6sCStMswPSgNa+iR3nmk5jMUHurNRJaJKtoxnXhHj9UI3Crd/JqDkGe6iweTZUl7LhTqPmSMlSZXeP9oysJ9GO1/JFTfDxpxuF5zqLfBFBC/IPXUwCg0ErvNUaCOkCfhRHmhEyC3bZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imbwmp+6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imbwmp+6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82976220e97so2829923b3a.3
        for <perfbook@vger.kernel.org>; Mon, 09 Mar 2026 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773063588; x=1773668388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4iXEHD7VZrDJqlsWosx3YDitHzPbTdSVs1OzitcmTM=;
        b=imbwmp+6wFX+HB6YrMYCny+ZOrdW8B6bhSRkuoo23B4WSdP8WYTT82HDf43SwReI/w
         DylG7Vv0VBaIviMFW+ZbC9k+r3HjFHNg982biMCBsM9qLh2SiiA86IDxXRU7GwoTEqEo
         3vSGGg5g7lgR6hk5ubL/2HfqszqNpipzgSvNC03jecDPPQb3uU02hLGSwW3NsxPbnwC/
         c/MwMJgKxJLDthkIdtdRPTgA920gi+wC/LYoDylmVVj+KURTqhWJv9NDQNkc99peq/To
         M57/ulEBNRONOnSJhr83ZZcvnfcZRAY4DksqXuY+5qZbT/cxangaosV98hGkXI7USfUd
         1D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773063588; x=1773668388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4iXEHD7VZrDJqlsWosx3YDitHzPbTdSVs1OzitcmTM=;
        b=LiN1CNoaiNAY0nrbdHaHyLkaXd87Ed5MByEAKHYG4iA0ZNtMQ+Cb/N7CCkKrBcrizA
         A1ttmu5Q4+vOq0B74J1S0zxsgBkKLhyqDYbkqTDTPgzWlInJMTnc6+x2mSEnPRDvyLgd
         qkkt6yQkxO+QWuhzicDPHolZD9Sp2TlVno8nZqDD2XUYZSCmvi8sUeyoPoqBC8fDPRac
         2lqOWtoRx07kiOTWcimugAWuzbg+9HnfQHcEXiL5ttzyi31dU06+crZx6YcSnNacBBfq
         htu6mRwYyBk7+MO60TzX/MU8PCixSeXKV0onIUlmjtW4bOcy2L8KfRbLT1MBpSWMJRT8
         fmEw==
X-Gm-Message-State: AOJu0Yx3+ONaejZZ/gCcgiql3WZ+HWwlAUpisIfmIRqSiInkGYOngGXe
	vcWhJghQd+nUoXq6p7T02VG8gLtejHrdUKatDFswIvspC6WNGIr6T0Ir31s7guBA0ic=
X-Gm-Gg: ATEYQzx7Ihm4eUZvYxl2XaoU4qtPuihrQg0KAqZh6BkW1Pt34+30l5QLfnqdGI89sz4
	KwXGw2LdgOeWKZtPHRsWBOnOUEdlDZbiPfE29Kn6FUDoItoGlsBfO64Quk8GWb8PQZtSBAZD+8+
	NGOETPh2bi1FEhyGkgYefOhGD8NYNXCG4V14rvimqmsCdj2M916+YZ2xX71q7N79rzPSlfmZaRt
	er9QnOQVB1WxxqH198IVoJITIQ+PKFAzyxN0O+SGqlzvKEPb7ayRUqwCJyqPjyoWDN9cN3TC67m
	tJYIriVXd58qeKLwMZyT6vzSoMiCRsXN0vRUY/CHFRVIsBK2syQLMmzaDg3BvYVyqRLwI0AARnW
	fWWTnA7JnozfJxoo8ffVwTyIer99lX86YhZAnGyeYuVexgOSE3GRJ4tsEZSQzO5cvZBU+xZTafO
	/PjvDxHTjtmww1rZ4EzQG8NDbM6UpYjDGcKsapoJ8=
X-Received: by 2002:a05:6a00:22c4:b0:827:2a46:685b with SMTP id d2e1a72fcca58-829a2f7cc0fmr9812853b3a.46.1773063587928;
        Mon, 09 Mar 2026 06:39:47 -0700 (PDT)
Received: from localhost.localdomain ([159.226.94.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b6ecsm10608371b3a.22.2026.03.09.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:39:47 -0700 (PDT)
From: npc1054657282 <ly1054657282@gmail.com>
To: perfbook@vger.kernel.org
Cc: ly1054657282@gmail.com,
	npc1054657282 <56855941+npc1054657282@users.noreply.github.com>
Subject: [PATCH] cpu/overheads.tex: Fix terminology typo in L3 cache description
Date: Mon,  9 Mar 2026 21:39:39 +0800
Message-ID: <20260309133939.393067-1-ly1054657282@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: npc1054657282 <56855941+npc1054657282@users.noreply.github.com>

In the description of L3 cache organization, the text incorrectly
referred to "bucket" as "Line" in parentheses. Based on the
accompanying table, this should refer to the "Sets" column.

This commit changes "(``Line'')" to "(``Sets'')" to match the
table headers and standard cache terminology.

Signed-off-by: npc1054657282 <ly1054657282@gmail.com>
---
 cpu/overheads.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index b3bf5196..b3cadd06 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -551,7 +551,7 @@ this system.
 Third, again referring to the figure, the caches are organized as
 a hardware hash table with a limited number of items per bucket.
 For example, the raw size of the L3 cache (``Size'') is almost 40\,MB, but each
-bucket (``Line'') can only hold 11 blocks of memory (``Ways''), each
+bucket (``Sets'') can only hold 11 blocks of memory (``Ways''), each
 of which can be at most 64 bytes (``Line Size'').
 This means that only 12 bytes of memory (admittedly at carefully chosen
 addresses) are required to overflow this 40\,MB cache.
-- 
2.47.3

