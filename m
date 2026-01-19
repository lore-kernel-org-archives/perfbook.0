Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CE3659EE
	for <perfbook@vger.kernel.org>; Mon, 19 Jan 2026 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835540; cv=none; b=IBVvisaMVQTRXtAAli3N8ApIc4b0WbsrFQL8F59+WpSE8UgYqPMjTB+cadG7mrAdaMAzZ6pII804Q0ArnGaFwAxbovxuR+nqSXmeDHRhYROkcjwticj0Bg6V+a4eJpXVfdLy5dyOSL34mQoMPkW7rhtjMd9Roah8ktKzxxckvHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835540; c=relaxed/simple;
	bh=5rTG+OYsqB8WZsSEfJJBlrpsSZ7oT3XdlKfAXqwT/f0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f7npxB41MX/LWvlx+lM4HC17vrtp3Q+7tdk+4XRVvMEZ0l658ZhCPDkzFqvV2GU4CQyfGbCBzii7FFeBM5RzuQiLbtwu9TEjPGJuogQoHN6C0StI6L8EH4TzLKuWX7oqc0yvSwvRw2p7izKNc8KY2K53+1MFZtRW4awc4dvKa5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IpWyeUc+; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IpWyeUc+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768835535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fIj2EJokyaaZyv8e46PMhoY2OBU9HGdEEQf5+/R1LQw=;
	b=IpWyeUc+iYySrKAyp1uoGfXpRwPNWm78P023M9daVVvjyPthKLKnRgQtzF5JUFIwLC7OIS
	GKDTUkBHI6MMyW92o8XhX0i4VOu27QsxQ6Xxq9yarzvKEPl9VCANchF4tf1Pzq7b70e59u
	htedVwc8pH69UtwWD7DVSEnnXEi+nJM=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer/hazptr: Fix line number reference in Section 9.3 Hazard Pointers
Date: Mon, 19 Jan 2026 23:11:30 +0800
Message-Id: <20260119151130.2886564-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The text incorrectly stated that 'line 8 finds' the pointer condition,
but in Listing 9.4, line 7 contains the if statement that performs
the check, while line 8 contains the return statement.

This commit:
1. Adds a label (htr:check) to the if statement on line 7
2. Updates the text to reference the if check (htr:check) instead of
   the return statement (htr:race1) for the condition check
3. Clarifies that the if check finds the condition and the return
   statement returns the value

This makes the description more accurate and reflects the actual
code execution flow.

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 CodeSamples/defer/hazptr.h | 2 +-
 defer/hazptr.tex           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
index bdeb5c15..2d5a098f 100644
--- a/CodeSamples/defer/hazptr.h
+++ b/CodeSamples/defer/hazptr.h
@@ -74,7 +74,7 @@ static inline void *_h_t_r_impl(void **p,		//\lnlbl{htr:b}
 	void *tmp;
 
 	tmp = READ_ONCE(*p);				//\lnlbl{htr:ro1}
-	if (!tmp || tmp == (void *)HAZPTR_POISON)
+	if (!tmp || tmp == (void *)HAZPTR_POISON)	//\lnlbl{htr:check}
 		return tmp;				//\lnlbl{htr:race1}
 	WRITE_ONCE(hp->p, tmp);				//\lnlbl{htr:store}
 	smp_mb();					//\lnlbl{htr:mb}
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 22fca499..50ff0996 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -69,8 +69,8 @@ Finally, if it fails due to racing with an update, it returns a special
 }\QuickQuizEnd
 
 \Clnref{htr:ro1} reads the pointer to the object to be protected.
-If \clnref{htr:race1} finds that this pointer was either \co{NULL} or
-the special \co{HAZPTR_POISON} deleted-object token, it returns
+If \clnref{htr:check} finds that this pointer was either \co{NULL} or
+the special \co{HAZPTR_POISON} deleted-object token, then \clnref{htr:race1} returns
 the pointer's value to inform the caller of the failure.
 Otherwise, \clnref{htr:store} stores the pointer into the specified
 hazard pointer, and \clnref{htr:mb} forces full ordering of that
-- 
2.25.1

