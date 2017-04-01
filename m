Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36617 "EHLO
 mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750859AbdDACO4 (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 31
 Mar 2017 22:14:56 -0400
Received: by mail-pf0-f196.google.com with SMTP id r137so2884366pfr.3 for
 <perfbook@vger.kernel.org>; Fri, 31 Mar 2017 19:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=E2KscVPT0CmnGkdb3TgIarWn80EesbxrNihGU28V2gU=;
 b=Znx+f51D+zpxR6NOIUhnNTyfWXNij7311GcmjVj63yTei8mq2odACB3wAieoQ8F5Jw
 h3ro3PR741zLZ1oE2VWs2IVWJsUoQ9wBIPsBlg4tCsUTFwlb/B3WfooUCZKmM0nRTq/y
 tEp3RPfAOKKbxe5OSnEK3YgRfyknJODU5nVyUUPohEzMCL8/tF+DP1OqGjCDZsjEFVRL
 FcWYxF2C4fHIw96GdFzicY51WDtfXbD5iuLbBhK27CkNwONWRGu3lK2BH0D8cJ/jgbPK
 0iU8iqKAMCdi++nUB+FkLtZpxBnoCwOfmXOLqf1gxSxQuXtAzdnWWQy6r65tc2IxgJXx
 PYLQ==
Subject: [RFC PATCH 05/12] advsync: Add footnote mentioning LOCK/UNLOCK
 wording
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <de7e4cc8-c7bd-5d35-d6d2-3287a477990f@gmail.com>
Date: Sat, 1 Apr 2017 11:14:52 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 41b970ba205df9069ce9921211e6214a4c138354 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 00:16:07 +0900
Subject: [RFC PATCH 05/12] advsync: Add footnote mentioning LOCK/UNLOCK wording

The text of the footnote should be regarded as a stub.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index ae6ca9f..60d32b0 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1556,7 +1556,11 @@ because they are embedded into locking primitives:

 \begin{enumerate}
 \item	ACQUIRE operations and
-\item	RELEASE operations.
+\item	RELEASE operations.\footnote{
+		Note that there were times when ACQUIRE/RELEASE operations
+		were called as ``LOCK/UNLOCK'' operations in the Linux
+		kernel community. ``ACQUIRE/RELEASE'' is preferred in
+		discussing lockless techniques.}
 \end{enumerate}

 \paragraph{ACQUIRE Operations}
-- 
2.7.4


