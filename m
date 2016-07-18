Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=+s0zRfzNgfITTTfGEAU4CN6af330aJgrTPHee5xBsfc=;
 b=pxRmGea9SuJKVkMLD8mrX1BxDAid94KIOcWwSdwPKfAGU3hmAUXIyvwKnEPbymre6z
 xmnSq8+Uk6acMtjGJBb/WlIhZVu2Zbe5UnCBvhbA+nZdfi6kbL4S2dg79PqAa1CaZlC4
 sr7M5/1XM1ugzzF3WEC7gikbTeih+0j4FrXoMpuz+08VYmdrWiv4nFbx9Q6cvGqX6S29
 gamTlibP+2NR5SuC2QjC2ENqWqFAZM4VoMbzCnzfN51XSp9f06xnuMY/Zyf4YvV7+5G1
 AUrDnumiXr5USPy3PNT4rqYzJA+qJjcYwqC4hC+4/JSLnANklYG+fy8/J4iWhXtdbjxI BFwg==
Subject: [PATCH] qqz: Modify back link target at end of QQA to just after the
 end of QQ
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
 <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
 <20160717233606.GE7094@linux.vnet.ibm.com>
 <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f7cd9f02-0c3d-1c59-1e87-2838a81b7147@gmail.com>
Date: Mon, 18 Jul 2016 09:04:29 +0900
MIME-Version: 1.0
In-Reply-To: <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

 From 2441e281a03d846b9e326c02f21ba44754a3d1bc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 18 Jul 2016 08:28:00 +0900
Subject: [PATCH] qqz: Modify back link target at end of QQA to just after the
  end of QQ

This commit modifies the target of back link at the end of QQA
(white box) to just after the end of corresponding QQ in the main
text.
This change enables you to easily reach the text following a
(possibly long) QQ by clicking a white box at the end of the QQA.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
  qqz.sty | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index 0c97df9..6623d00 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -20,6 +20,7 @@
  %%          Akira Yokosawa <akiyks@gmail.com>   # improvement of cross-link
  
  \newcounter{quickquizctr}[chapter]
+\newcounter{quickquizctrE}[chapter]
  \newcounter{quickquizctrC}[section]
  \newcommand*{\theHNum}{\arabic{chapter}.\arabic{quickquizctr}}
  \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}
@@ -33,7 +34,11 @@
  \newcommand{\QuickQuiz}[1]{
  	\refstepcounter{quickquizctr}
  	\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}}
-\newcommand{\QuickQuizAnswer}[1]{\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}}
+\newcommand{\QuickQuizAnswer}[1]{%
+	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}
+
+	\refstepcounter{quickquizctrE}%
+	\label{QQE.\thechapter.\thequickquizctrE}}
  \newcommand{\QuickQuizEnd}{}
  
  % To create a macro referencing the previously defined quick quiz:
@@ -84,7 +89,7 @@
  	\noindent\textbf{Answer:} \\ }
  
  \newcommand{\QuickE}{%
-	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\ding{113}}
+	\hyperref[QQE.\QuickQuizAnswerChapter.\thequickquizctrC]{\ding{113}}
  	\vspace{1.5\baselineskip}
  }
  
-- 
1.9.1


