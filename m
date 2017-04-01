Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33415 "EHLO
 mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750816AbdDACXu (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 31
 Mar 2017 22:23:50 -0400
Received: by mail-pg0-f66.google.com with SMTP id 79so20891463pgf.0 for
 <perfbook@vger.kernel.org>; Fri, 31 Mar 2017 19:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=nDrB8fkGNht/CcRDKLgYnBexZgLlWGN1TpL2pnk8gIo=;
 b=FCCJnG7jOqUOEg0RG/RnUGkKpH3xlYGj81cqyJT6tF+Te0okllkikQDAu8gyCREHL7
 WuvVtn/oNMWgqZMz/dG5ocmR5ho3KCi6C9Bkpf2fOcX/Xc0gNeRqgM2rwXsFsq1HiZbY
 YS8w1MvM9Q4IvdyOyxpp5q3Eq85qrrFuZcM/sXyF8zZghXTXH60zeTByLE19Qxm7Okj3
 WFLtZfgCkcu2SXYFA1JPLIXm+LgEbLfSuPVhNK9ktx6G8pGxbo/TPum5YDL1gyLnHawK
 r70HrEBRVcXBj1Om0NlDc/fjr4nKcFweva0w5o48j7Y3Rlo+ylz0kOuCC+TReDaj1tJx
 PCtw==
Subject: [RFC PATCH 12/12] advsync: Avoid indent after minipage
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6d3bfdb1-8896-544e-1077-2a6470dd725a@gmail.com>
Date: Sat, 1 Apr 2017 11:23:46 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 8aa4157fbed720fd3e8a259de620184003bf09da Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 1 Apr 2017 09:06:05 +0900
Subject: [RFC PATCH 12/12] advsync: Avoid indent after minipage

Also reduce \vspace{} param for even spacing in the result.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index d2ad7b8..5f8ea7f 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2787,9 +2787,9 @@ For example, the following:
   3 RELEASE
   4 *B = b;
 \end{verbatim}
+\vspace{1pt}
 \end{minipage}
-\vspace{5pt}
-
+%
 might well execute in the following order:

 \vspace{5pt}
-- 
2.7.4


