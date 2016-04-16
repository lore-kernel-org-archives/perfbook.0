Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=WyIpqUFhAaiHaHcSrPxsMZY3Dl1jrUIkQOKF8r8VyZQ=;
 b=BwSXmrRtCgoqF+qRePQb/RadK7YXuZaiDWGn8gf/Qp2z920xSynxLLycbV5ZX5nH2P
 pLOKSP3t1lRfLh6+Qz6l8ArZvNGYEPr4zRsgz53EbzOMrEnXKJ1gYWzZpHwQ6zSOi+KT
 nRAdjLTzMsWydFamd26jgdIfbwcShLSe4tisueFQFe7Tct9zglqEhZ4BNN5qCJciolS4
 tuBykefGIeFJcr/IUUEFBO2UpmUgbEaQwwTN6/b5kMXIgPtdkL3OPOhVuwiyGQE6b282
 itDdN7AHc9PFEEwDYyDJbnrW+Z6jxVFm6ggkNUF+EhkvtCiV/5KtB9w/4Lh0OIctCOZ5
 AT6w==
Subject: [PATCH 1/3] advsync: Fix a trivial typo
References: <5711F2CF.1030907@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5711F3B5.6080505@gmail.com>
Date: Sat, 16 Apr 2016 17:11:33 +0900
MIME-Version: 1.0
In-Reply-To: <5711F2CF.1030907@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dd4bfd425504ccef4226bc782394255c3dc4777a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Fri, 15 Apr 2016 21:59:40 +0900
Subject: [PATCH 1/3] advsync: Fix a trivial typo

In commit 5795796caa89 ("advsync: Another fix to use latex reference
feature consistently"), I made a typo. This commit fixes it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index e527def..965718c 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1508,7 +1508,7 @@ Read memory barriers imply data dependency barriers, and so can substitute
 for them.

 $\dagger$ Note that read barriers should normally be paired with write barriers;
-see Secton~\ref{sec:advsync:SMP Barrier Pairing}.
+see Section~\ref{sec:advsync:SMP Barrier Pairing}.

 \paragraph{General Memory Barriers}

-- 
1.9.1


