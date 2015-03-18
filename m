Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:40765 "EHLO
 out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org
 with ESMTP id S1753627AbbCRAkO (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Tue, 17 Mar 2015 20:40:14 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])	by
 mailout.nyi.internal (Postfix) with ESMTP id 20DFC20ADE	for
 <perfbook@vger.kernel.org>; Tue, 17 Mar 2015 20:40:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=
 x-sasl-enc:from:to:subject:date:message-id; s=mesmtp; bh=kfGPOnT
 Y8noHi0Ql+hHqi+0re7M=; b=pjWIsINpi09M0h1hUeWf9kus35C65IxAe1wUFWs
 aBBfkv9/rUMtQQP8V7/2SniNzF6HZasrLOVly77m+Z6+vVgPRpKRt5gfqTpFMfyR
 24qk/79uxrWh8XLbHQdKkEckOvNsGZcrpsgPn6qkKmRkojRORxnyCmedGkhHowDW	5pOg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=	messagingengine.com;
 h=x-sasl-enc:from:to:subject:date	:message-id; s=smtpout;
 bh=kfGPOnTY8noHi0Ql+hHqi+0re7M=; b=tgT8u
 A9rNM/Cqisx4SxKW11K9ZD4cTJno4dh77nBNeZ+AZp05VSF90DngRjdYRCm28wNk
 oD/TnykKH1P77tmmyd2jbYQ++grh3iBPNJXrU4PJgCqgRjcl9vEfEhsQpbhTRlLb
 3w3pOcKvEV2HSA2HRvTGTem9QoBMbcpZHtD9ZU=
Received: from localhost (unknown [128.59.20.216])	by mail.messagingengine.com
 (Postfix) with ESMTPA id EBA546801DA	for <perfbook@vger.kernel.org>; Tue, 17
 Mar 2015 20:40:13 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
Subject: [PATCH] advsync/mb: s/targetted/targeted/
Date: Tue, 17 Mar 2015 20:40:13 -0400
Message-Id: <1426639213-9551-1-git-send-email-cota@braap.org>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index cc11323..e8666db 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1293,7 +1293,7 @@ STORE *X = c, d = LOAD *X
 \end{minipage}
 \vspace{5pt}

-	(Loads and stores overlap if they are targetted at overlapping pieces of
+	(Loads and stores overlap if they are targeted at overlapping pieces of
 	memory).
 \item	A series of stores to a single variable will appear to all
 	CPUs to have occurred in a single order, though this order
-- 
1.9.1

