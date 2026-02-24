Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDED237D11B
	for <perfbook@vger.kernel.org>; Tue, 24 Feb 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771945960; cv=none; b=ColmSsnt1XDoHVrgktihNNKdt7tpvrtS2xPr1CaAFHUwICXMF+5XgxdXNX2wRvhushwPdrTtbU54SVTgmuo/z2OBYeahWf0fet04KsMkAT8s568m9L8jyaK6APYmDoRHK8ucn8KRP6J0yPIpkl95wfq7cqGD3WGdopNYzyYlLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771945960; c=relaxed/simple;
	bh=h+aUq582bQSEr6++u5RBqjur/0qWvz6AMkqu8yoIwUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q/ksDTEm9sswo6i7NQylAjbBFPVJ9nkkO7RrEtzHtZBQN5H7iELhs/uImUv9EOF+s4lq2g9mhOrYB051Z65CCQaG0nGH3jKUiZTxT7oEolyJZFLBWM8ss+WYP/vvJjugf4mwAkMpWJlwWNSCtfIkSaZ8a4xao/t/EA9fIXabIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kkAg9BEC; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kkAg9BEC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771945956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KCjbt9uftwk9EFqlfq+v73bz3vBQafkNXXWFvmJ+eng=;
	b=kkAg9BEC2e8kXEBl/+C3oh/7QNvwf1xxWhJNZKnyOnyJkkmx7T9iIgXUl1CFUQ+xOMr5fC
	JqJOUz7orfYAf5oy3ExafI6GAabqeep3EFo2KspVMCRbNeD1kqpbro4VuN/LVVAAMNLvkq
	o4PfMig89jlTI8scUGv1hWgNG3fw10E=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer/whichtochoose: Fix typos and grammar errors
Date: Tue, 24 Feb 2026 23:11:37 +0800
Message-Id: <20260224151137.2740175-1-kunwu.chan@linux.dev>
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
 defer/whichtochoose.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 2b45ee5c..139c9636 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -114,7 +114,7 @@ which is why they are normally used on static data.
 	memory-allocation failure.
 }\QuickQuizEnd
 
-The ``Duration of Protection'' describes constraints (if any) on how
+The ``Duration of Protection'' row describes constraints (if any) on how
 long a period of time a user may protect a given object.
 Reference counting and hazard pointers can both protect objects for
 extended time periods with no untoward side effects, but
@@ -132,9 +132,9 @@ whether the reference acquisition can fail, resulting in a retry
 operation, which is the case for reference counting, hazard pointers,
 and sequence locks.
 In the case of reference counting and hazard pointers, retries are only
-required if an attempt to acquire a reference to a given object while
-that object is in the process of being deleted, a topic covered in more
-detail in the next section.
+required if an attempt to acquire a reference to a given object fails
+while that object is in the process of being deleted, a topic covered in
+more detail in the next section.
 Sequence locking must of course retry its critical section should it
 run concurrently with any update.
 
@@ -150,7 +150,7 @@ run concurrently with any update.
 	one traversal to another''.
 }\QuickQuizEnd
 
-The ``Reclamation Timing'' gives the minimum delay from the time that
+The ``Reclamation Timing'' row gives the minimum delay from the time that
 the last reader finishes with a removed object to the time that this
 removed object may be freed.
 Reference counting is the only technique capable of freeing immediately
@@ -290,7 +290,7 @@ But those wishing more detail should continue on to the next section.
 provides more-detailed rules of thumb that can help you choose among the
 four deferred-processing techniques presented in this chapter.
 
-As shown in the ``Existence Guarantee'' row,
+As shown in the ``Existence Guarantees'' row,
 if you need \IXpl{existence guarantee} for linked
 data elements, you must use reference counting, hazard pointers, or RCU\@.
 Sequence locks do not provide existence guarantees, instead providing
@@ -566,7 +566,7 @@ a mechanism resembling sequence locking.
 \subsubsection{Production Uses of RCU}
 \label{sec:defer:Production Uses of RCU}
 
-IBM's VM/XA is adopted passive serialization, a mechanism similar to
+IBM's VM/XA adopted passive serialization, a mechanism similar to
 RCU, some time in the 1980s~\cite{Hennessy89}.
 
 DYNIX/ptx adopted RCU in 1993~\cite{McKenney98,Slingwine95}.
-- 
2.25.1

