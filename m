Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4A34CFAE
	for <perfbook@vger.kernel.org>; Tue, 24 Feb 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922883; cv=none; b=PvTeprn2bHybht329dGj3pTizFpdcW5mZ6WszMhLJu83VouEufMBk/GJzD1xsE4N3Ks9GyHfBO7ZZhVsVaM496V2ME/1OGgP/LIaIAYOew6CHXdC8KbMi7Kb8LS1/bu11yZ0HP5GTXb+dtyL8NS0PDRm2F+5kSFWEY1PSb1s5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922883; c=relaxed/simple;
	bh=UifnNHtVfQrkyu1ThFdWViTk15COtXc+LOLzFhQ87jg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b9fTATmLn8Ubefd/luCiesea0sHxTWLIFmHe7CRfiNkWgWZJFa19gdXpAIiWD/Kw8okRCe6D2GIdgjktCaAWrZUIvdxkgWPOc17sUZmN/dnu4h1TJb41SYG0UeAtNaFA381+1zn2QJ5iMX43TzsvnCZXh/4gX/xvDIGBLChTyXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d9ceU+zs; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d9ceU+zs"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771922879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PSi4qev/TK8OV0YOUhVgi2Ttl3PVGohqDfy+G4nux1Y=;
	b=d9ceU+zsYv5JDFc8C0t+3/ISBkmaJVUuvLLc55wAsaVfivUrbX2B7kZjUKZcyOMhZva/em
	4luGax5pXcMyIUQ4QYhn5TEmP94TmILI9uU0sp/WW+LsHFtT3+EHnoiFMzzC4PglCgfm0c
	JtjXG5YQAF92uumNwzpDM0d0wf1h5tQ=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer/rcuapi: Fix srcu_down_read() release entry
Date: Tue, 24 Feb 2026 16:47:05 +0800
Message-Id: <20260224084705.2568789-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 defer/rcuapi.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 9b34f838..e44f21e4 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -327,7 +327,7 @@ Acquisition &
 \tco{srcu_read_lock_notrace()} &
 	\tco{srcu_read_unlock_notrace()} & \\
 \tco{srcu_down_read()} &
-	\tco{srcu_down_read()} & \\
+	\tco{srcu_up_read()} & \\
 \bottomrule
 \end{tabular}
 }
-- 
2.25.1

