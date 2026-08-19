Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51837DAAE
	for <perfbook@vger.kernel.org>; Wed, 19 Aug 2026 03:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109896; cv=none; b=AJ/xwmasS/2r+v8sGUebe5w8gNQsESDVhN+zFPB8AnQiLLBHmWPianxhnhuTr9kc7myqQjTQKf4Rw0G/aWk/6fyen6dcghZC5FNtzCi2gkukUYy5Gk3DJkleyBZ4v+RSKRI+yXlU85Ubse9a7gdTVdNuG/plgCxLZwRtkbFveQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109896; c=relaxed/simple;
	bh=hzwISgu0R0HwYmKCEeqSJywOWut5Y4hmt0zCihCyDhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kqPuLPBLJKY9rmxH7rkZUe/lBejOneJA9Xv/AbzXG0Jfj0rGxmnJsbSGTwYbNx9gdhuvRQkRXJLeSma601Zs8+NNvjW8U2DNug4J0o7ngnAt/QqnHSbxQSwQBx4bBGXNHVDdxnIh1WP5ePkqPwQpebhD8UdHoOnkcBdqzaOEIpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6vG/Ot+; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6vG/Ot+"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so535420a12.3
        for <perfbook@vger.kernel.org>; Tue, 18 Aug 2026 20:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787109895; x=1787714695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeKCe/f+rR1HFxslDgp+3fB5uTdy+VacukHioUMZYHQ=;
        b=T6vG/Ot+ubILk2I9S2bB501y1zbv1VGV8izF+IEOYb4gCHhYK81bP+uwbJ4hq8m8Ou
         xMG87c/H1y0e0Ct2T/CIuiBG4Zbrq9QAQbJD5cLa0NvGr/ShR028buCDcIMd4XWVJgKB
         0BQBJ/rc06qI64tfYIKRBhvlpWdYv603//xXqvEEyMzpH/kIh1XEqIFFkihA5th8lY71
         SoE/jgMjh7fHrc1TXRwU93oO/9uxeaVM7+WColeLTBhz80buqZViFQ/AG3EjPQNdEAk4
         A9HrbzE1RMjkWWQE0kFVZ5mirfb1uGep9QdGc+lDxDiCGG11Kkdt08fVb1Wz17GN2G9T
         6dTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787109895; x=1787714695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeKCe/f+rR1HFxslDgp+3fB5uTdy+VacukHioUMZYHQ=;
        b=cyPbyLMZDcjX49KcPMH0SIQv9TKdiHfNkDehofBVHG8xTZ9/XeBNpH4s7EsWXqPEby
         PqOwXH1aFmOhvMAacu+lD8U2/E0p14udr/oJ33OQcPcgoqJ8G1U7HS0MixSSu7HeHiUe
         2R4pcIr0ZM/QT3oJnEwMvAfey25AW9LtH/FUrt0SJUt7+1VxbTJr7UMqmJABQmnlqWyL
         QTZWsJy1NBaNkTqyDoPC50zn/kq6JA2ygwW8lVint8VtCjZMT6hqXxl1lKaq7pNDV/8u
         eVrQ4Jpw53CgpOw8gQWuHJ4x+BH0tW3eyFH+DUnE52u0gfJ1934xXvouHEt7nDJEzqd+
         32zw==
X-Gm-Message-State: AOJu0YxoAnxbXdliFbn4xqwQN9HOAFr8xQkRkaiZSrL6v9Fy1kCqcDIg
	S5e187fDCLXPrOvtb/EtAgy/qhnfvK9Y0rsTEtyYfrbrtPkJ9W1PFWOe2V3+Wqx+
X-Gm-Gg: AR+sD11I+ermfzw83rUXk9Cz1yfwKuB68GUkoK1Vb4BzUk7Fe1TtfFxhXTLoBYXhO06
	lxyWakgxwel7moCDIU8VK7gl2nrShTtaz1tni21CI+M+xNq5qjA1GXFmisA/KE8fvOTP0TF1AvI
	q1bt26BPlxEGNaXVSXfTIlRIpvX83sGsY7pWdFCSy6O9sa7xTIABlmKNxfV+BPH8YT0XZlwdVCx
	/0UosIR5x5zlnFpTdlF03JoUEntwXrWfXcdNkKBRNUSsjllfKtjZpFdnGP182EzAdo+J4IPnZ9J
	ARA626a9yWAYDN72/zRsVsnaPOGT4S+YmZyrqQ036PlKpkwttP78WGYeDumi+w/d7tjptMN23eh
	5kwHLsVlwAiP/EnwTI/Dyw63xe8g4TvAViCsbp6v9TraL0Yc6Ud7RoM6KFnatrsHmRgmmzN3UuK
	K52dKR2o4WC5kZtI11bbK86hv+MR8Mv7qSB8b3gAZVLY2/C62MiMeELcuv9YBcAa+AXz1pcaIV6
	/zIsQA=
X-Received: by 2002:a05:6a00:3d0a:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-851d38635efmr2127050b3a.7.1787109894342;
        Tue, 18 Aug 2026 20:24:54 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d33b4ff5sm125549b3a.25.2026.08.18.20.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 20:24:52 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] datastruct/hash: Simplify hashtorture initial insertion
Date: Wed, 19 Aug 2026 11:24:32 +0800
Message-ID: <20260819032432.862450-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

Commit 1314f0a0 ("datastruct/hash: Speed up hashtorture initial
insertions") replaced random element placement with a linear scan
guarded by:

        if (elperupdater / 2 - j <= elperupdater - i || random() % 2)

The left disjunct is always true along the loop execution.  The loop
maintains the invariant i == j, starting from i == j == 0.  The guard
therefore reduces to elperupdater / 2 <= elperupdater, and each forced
insertion increments both i and j.  Thus random() % 2 is never
evaluated, and the loop has inserted the first elperupdater / 2
elements consecutively since 2020.

Simplify both perftest_updater_init() and zoo_updater_init() to plain
for loops, drop the unused counter j and random.h include, and update
the comment to describe the actual deterministic behavior.

This does not change the test behavior exercised since 2020.  The
randomized initial population was the only stochastic element in this
initialization path, while the concurrent update loop is a deterministic
round-robin over each updater's elements.  The perfbook description of
hashtorture ("RCU-Protected Hash Table Validation") lists invariant
verification, concurrent-corruption detection, resize correctness,
and performance-data collection as the documented coverage; none is
described as depending on the initial key distribution.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 CodeSamples/datastruct/hash/hashtorture.h | 41 ++++++++---------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
index 4bd8e247..4fbb7623 100644
--- a/CodeSamples/datastruct/hash/hashtorture.h
+++ b/CodeSamples/datastruct/hash/hashtorture.h
@@ -815,27 +815,20 @@ void *perftest_reader(void *arg)
 	return NULL;
 }
 
-/* Pre-load specified updater's portion of hash table. */
+/* Pre-load the first half of this updater's elements into the hash table. */
 void perftest_updater_init(int mylowkey, struct testhe *thep)
 {
 	long i;
-	long j;
 
-	i = j = 0;
-	while (j < elperupdater / 2) {
+	for (i = 0; i < elperupdater / 2; i++) {
 		thep[i].data = i + mylowkey;
 		thep[i].in_table = 0;
-		if (elperupdater / 2 - j <= elperupdater - i || random() % 2) {
-			perftest_add(&thep[i]);
-			BUG_ON(!perftest_lookup(thep[i].data));
-			j++;
-		}
-		i++;
+		perftest_add(&thep[i]);
+		BUG_ON(!perftest_lookup(thep[i].data));
 	}
-	while (i < elperupdater) {
+	for (i = elperupdater / 2; i < elperupdater; i++) {
 		thep[i].data = i + mylowkey;
 		thep[i].in_table = 0;
-		i++;
 	}
 }
 
@@ -1132,26 +1125,20 @@ void *zoo_reader(void *arg)
 	return NULL;
 }
 
-/* Pre-load specified updater's portion of hash table. */
+/* Pre-load the first half of this updater's elements into the hash table. */
 void zoo_updater_init(int mylowkey, struct zoo_he **zheplist)
 {
 	long i;
-	long j;
 	struct zoo_he *zhep;
 
-	i = j = 0;
-	while (j < elperupdater / 2) {
-		if (elperupdater / 2 - j <= elperupdater - i || random() % 2) {
-			zhep = malloc(sizeof(*zhep));
-			BUG_ON(!zhep);
-			strcpy(zhep->name,
-			       &zoo_names[ZOO_NAMELEN * (i + mylowkey)]);
-			zoo_add(zhep);
-			zheplist[i] = zhep;
-			BUG_ON(!zoo_lookup(zhep->name));
-			j++;
-		}
-		i++;
+	for (i = 0; i < elperupdater / 2; i++) {
+		zhep = malloc(sizeof(*zhep));
+		BUG_ON(!zhep);
+		strcpy(zhep->name,
+		       &zoo_names[ZOO_NAMELEN * (i + mylowkey)]);
+		zoo_add(zhep);
+		zheplist[i] = zhep;
+		BUG_ON(!zoo_lookup(zhep->name));
 	}
 }
 
-- 
2.43.0

