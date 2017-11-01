Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:52655 "EHLO
 mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S933507AbdKAWJ2 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 1
 Nov 2017 18:09:28 -0400
Received: by mail-pg0-f42.google.com with SMTP id a192so3260787pge.9 for
 <perfbook@vger.kernel.org>; Wed, 01 Nov 2017 15:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X0eQqibtVlk3yVZ+hSw8lsBDOpRePl2KWOwMPff8N+w=;
 b=Ftuv6njDHm6MExWaLHU6s4pL1BIRA3WJOuaHHzUV7icv5aTj/PMZU3JJFzVrlVy0mj
 mEFolH8UI3cDQlZKxPhrCR1mJF5o2aI6SiXusc1xMkhgcshri2fXDXg3Gxl/4u/dvt2L
 SRjIQmH/wk6sdmfOEC4WyC+6x1S30qmWSY+fiY7q6dSFoCASCOn0adRmpaGr6BVoYfB1
 TPK48II28Pnc3rRLCsW5IZ0zve/UDETyrq1JZGJtijHqqQgkVsVN4cWMopN9Zx3mNlDR
 gAfkkFBYJ7unlhQRvM5Xj6c9DRg9Dx/QwIFD2iufrz46JAos/DnB5XFptG3lEvCa+EYo
 L32A==
Subject: [PATCH] locking: Use helper macro in Table 7.1
References: <0337637d-91f3-df97-7dd0-2f7b66676145@gmail.com>
 <20171101145145.GR3659@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e1024867-a2d4-1b6c-72aa-24c716ebc2f1@gmail.com>
Date: Thu, 2 Nov 2017 07:09:26 +0900
MIME-Version: 1.0
In-Reply-To: <20171101145145.GR3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From af9e5f272a12304067120b79a86d6673b605b7b3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 2 Nov 2017 07:02:07 +0900
Subject: [PATCH] locking: Use helper macro in Table 7.1

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 025320b..12a0240 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1314,28 +1314,17 @@ or even milliseconds.
 \begin{table}
 \renewcommand*{\arraystretch}{1.2}
 \newcommand{\x}{\textcolor{gray!20}{\rule{7pt}{7pt}}}
+\newcommand{\rothead}[1]{\begin{picture}(6,65)(0,0)\rotatebox{90}{#1}\end{picture}}
 \small
 \centering
 \begin{tabular}{lcccccc}
 	\toprule
-	& \begin{picture}(6,65)(0,0)
-		\rotatebox{90}{Null (Not Held)}
-	  \end{picture}
-	& \begin{picture}(6,65)(0,0)
-		\rotatebox{90}{Concurrent Read}
-	  \end{picture}
-	& \begin{picture}(6,65)(0,0)
-		\rotatebox{90}{Concurrent Write}
-	  \end{picture}
-	& \begin{picture}(6,65)(0,0)
-		\rotatebox{90}{Protected Read}
-	  \end{picture}
-	& \begin{picture}(6,65)(0,0)
-		\rotatebox{90}{Protected Write}
-	  \end{picture}
-	& \begin{picture}(6,65)(0,0)
-		\rotatebox{90}{Exclusive}
-	  \end{picture}
+	& \rothead{Null (Not Held)}
+	& \rothead{Concurrent Read}
+	& \rothead{Concurrent Write}
+	& \rothead{Protected Read}
+	& \rothead{Protected Write}
+	& \rothead{Exclusive}
 	\\
 %				  NL   CR   CW     PR   PW   EX
 	\cmidrule(r){1-1} \cmidrule{2-7}
-- 
2.7.4


