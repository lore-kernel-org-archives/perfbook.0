Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5488F3A63F7
	for <perfbook@vger.kernel.org>; Mon,  9 Mar 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065600; cv=none; b=NVlKt2B1uZ3uZfBKXxAH7n+QPOsm9HoFJssaA0kQ/9bwhF34FMxHZia+sw7iHmuKTp0WDMRGqMMtqXqsPJXHSzZ1Ak6WL0aToBVOK8LtxQI9Bvo+wr7S1+7nb+H8m8GdVTmERzYsEL1W237E0myA/0DAyDdAoPNNidO8IKRbXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065600; c=relaxed/simple;
	bh=vA3LbpuCGsCqr/w1MrLt3o1fdmXlfkXnDS7FEhnMPyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCSEr+H/nifZua37uiDT21m0YN+YHt8uLcOn12vzh3TYjU8YdEARB5QV3mL9A3uap1iZ9LGidCCI3DLcI40SCEKAqsZlo6mF6qZ0IgW5630utas4zqEFgucileO3uGQib7ZYwA450yUIotB8eidsc3AKkc0LQDet3BqwZ2wmtxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cj/IhZpG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cj/IhZpG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so7012648a91.0
        for <perfbook@vger.kernel.org>; Mon, 09 Mar 2026 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773065598; x=1773670398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5nmSYl8VV3LZRO8azoN0pAa2G6NTkA8bh7fSetFbmM=;
        b=Cj/IhZpGGlKJdLLbeTdpOJYugFsEYXhBFeAxUQgu5HN0mAnt1GhWaB1hXjTAA1bQ8V
         tPZ5Asxj88XDaD6bs7rRIeYShWvcPdWzy+FIWolHfWmdHL4GQ/YBTaIvFYrgcuhOlxRf
         YAhKeBx2KYwkiHRjSroEddCmN8vxLiGPtm4L0w+JD8shVcesnuuA+Y5TedD9KvhcrNlh
         fY7ssbKISYWN1v0MTFQlitxie0RI7BCk7PhBf5ZV8QR8TI1adlrDjaY3ndd0DD2/rYRb
         hon0QIJ0sl9FxZOgWyfOcYTLJGhbJKCqUiXFsTCIglhIVwIeB9JUQQOXxZ4lF6JHoPBm
         RQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773065598; x=1773670398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5nmSYl8VV3LZRO8azoN0pAa2G6NTkA8bh7fSetFbmM=;
        b=CkI+B0ryMf59OuDSTNWmQOykeChaYwEPHznODqE7Rhy/yz7EuD80KLQFhuwkFsy79K
         ZYZ2UYEovFBFa8DJjoD7Osyxxntg54C9SODBYcPDUn5p6tBbruHm43hNl/EZmReIbQvz
         U8y7TT7gf72ehr75JT4/IMCi1KGtDVkpn7W/s57sQPbOvloFRjPUpFpo9OkTB5tePl4k
         UBxX6T6Ccx5lONM8rNbfVc6FXebi+PZkZyhk3KNKdKeQ8ZWBhRTYJTjuEXS6DoKkfH0i
         JK2Qh0lKejCkUtGh2Akk+xU7S3UrtB+uZIIiZmyJtb4xFoAr5MxBZ65+2UlWt9axRKbX
         NYMA==
X-Gm-Message-State: AOJu0Yzr8lha9XKAhExbGXrXls5yNItouaKMfoutH4AkIuv1RIENCF8m
	ijhbPUN8gcikcX/JPfD5Z+NBRi6HpBwMMa+pgQXyOsj/YyQIYTii5SJXtTm0a+Sp1SuqDvfr
X-Gm-Gg: ATEYQzwk6fRj3xjmKKN/S3BXiOZflTOh5Io4qs/gLJOhFycIH0f7zELa6/5+HEeaEbY
	RqYaRhofh3dn7Za5EKoqB60Dpdc2V8KzJWPqeBdcg7LqECWWdcbBvOmGzfLsHH86qUUnPqBceeS
	wkhn6FcuYKDuXY4D5BFS8p3isY2osrqA4YGTlSxA/5tJJGMB6uVqAcieXPdlV7cJfoiX+8O4MtL
	ykl0AONyLaUfqBKwcMLjsCxNVdHkvuY+EDiqtb/5XoiAZSJlCdsqXjNjepV4/OB39F4K+MejJvo
	HcY3+CNnrZmCSY+BARjn5SY6U4712PBmgY+ZBWSHmofjDcFVX4MG6qp23TPuZD2EiroeoPqPmLS
	ldUB7fYC1gygyOfhGk/MDK82kwpUGqeLdK0BcqjTiCLYdqaRMYNDuZI1SDTkxdGc1dXRgw+/wCi
	7mQLbzr2zZv643TGH9C7e3CAiFSjWPZX35KzTwhUI=
X-Received: by 2002:a17:90b:2685:b0:359:9016:1e72 with SMTP id 98e67ed59e1d1-359be2f0424mr10045290a91.19.1773065598439;
        Mon, 09 Mar 2026 07:13:18 -0700 (PDT)
Received: from localhost.localdomain ([159.226.94.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbab6e4bsm5329220a91.0.2026.03.09.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:13:18 -0700 (PDT)
From: npc1054657282 <ly1054657282@gmail.com>
To: perfbook@vger.kernel.org
Cc: npc1054657282 <ly1054657282@gmail.com>
Subject: [PATCH] cpu/overheads.tex: Fix terminology typo in L3 cache description
Date: Mon,  9 Mar 2026 22:12:49 +0800
Message-ID: <20260309141249.394299-1-ly1054657282@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

