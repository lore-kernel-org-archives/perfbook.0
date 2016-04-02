Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l8OetMJ7UA792Hk+l9EeE5oQIfM4vNTLssDucijus3s=;
 b=WuhPYRgF2Sf0gJgak1N8t2mXZbR4iFvO+pmTb1K4S0Tq1thB4yF5gwisgGAd+6doE0
 YLxlVyxRUtBquGg5izu8qGOKkhcAM63W08wc21mdbiiSDDTy0I5GjL7/lgcpyBg48vH+
 0EKk4TiUH4VCuC5JPfwgyoNOpGtzqbtZtzHZCYElto/70KQgLolk7XVElZR7BNAapJ3u
 +KEOJkahRSVy15wszUolNE75U+qlV4pVbmcYEDh/FwWOqHMDT1FyNnAtjDqL9YKkMlwe
 Fuzs9AZslx7PaYTlDhOIJGTfatZ4gG7ESycEcuvof9mferQJaCR5dEU2vkQaUSb5+ITT
 dq4Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 6/6] advsync: fix wrong reference to section ``MMIO write
 barrier''
Date: Sat,  2 Apr 2016 09:28:31 +0900
Message-Id: <1459556911-11538-7-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: dhowells@redhat.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence references ``MMIO write barrier'' subsection though the
section does not exists.  Unfortunately, there is no section for MMIO
write barrier though appendix ``Why Memory Barriers?'' says about
mmiowb() subtly.  For the purpose of the sentence, it could be
alternated with reference to ``Device operations'' subsection because it
describes about the exceptional case.  For the reason, this commit
updates it to the reference to ``Device Operations'' subsection.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 1fe0953..b511f51 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1559,7 +1559,7 @@ other strictly in the order specified.

 The use of LOCK and UNLOCK operations generally precludes the need for
 other sorts of memory barrier (but note the exceptions mentioned in the
-subsection ``MMIO write barrier'').
+Section~\ref{sec:advsync:Device Operations}).

 \QuickQuiz{}
 	What effect does the following sequence have on the
-- 
1.9.1

