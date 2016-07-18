Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=xDCNnehO7MHSH7JVG7gYkX6wZ0LygS3+mqDoPjbbsSs=;
 b=Xs57kwAna0SOQ/MVrs1lfv9hs1FmN4i+W9DZabf93XkYaFIFO45q89xvsp8dZrJNDJ
 bCfJj0JTUfbmNrpaURaEyuTy1+wSk1tDE4GGUvA3IW+WRg3YoDb/fubs5sBSaqPg2Jsf
 xDu74FlVqDPgYJwzonwN3Qf8A1+iw0qlMjBPQyFUal1bLoaMBvgSC27BmPIu4L+sLaWF
 20CarWtPh3bpGuBQ0D9t+t4zmkaPZXNFy2d5+NtW7wk9QLyeKJGv3IT1GuBj0BVZQHQK
 PSNZYbKaBLC0aAlJbApwQNMohqamp9j+j6KCu8R6GWvu31l05LXGz8yHXC+B8BNRIdQ4
 C25Q==
Subject: Re: [PATCH] qqz: Modify back link target at end of QQA to the end of
 QQ
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
 <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
 <20160717233606.GE7094@linux.vnet.ibm.com>
 <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
 <51abb1c5-e843-ef5c-0c7f-121281ba2631@gmail.com>
 <20160718152525.GK7094@linux.vnet.ibm.com>
 <db41c385-84b4-78ea-8c08-faea987f8175@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3c27b3c8-77e2-e672-290d-a4dca787681e@gmail.com>
Date: Tue, 19 Jul 2016 06:50:07 +0900
MIME-Version: 1.0
In-Reply-To: <db41c385-84b4-78ea-8c08-faea987f8175@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e51d65d2b5e10dcf4bd4f5970010c0cded292f0e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 18 Jul 2016 08:41:12 +0900
Subject: [PATCH] qqz: Modify back link target at end of QQA to the end of QQ

This commit modifies the target of back link at the end of QQA
(white box) to the end of corresponding QQ in the main text.
This change enables you to easily reach the text following a
(possibly long) QQ by clicking a white box at the end of the QQA.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 qqz.sty | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index 0c97df9..4505f8c 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -20,6 +20,7 @@
 %%          Akira Yokosawa <akiyks@gmail.com>   # improvement of cross-link

 \newcounter{quickquizctr}[chapter]
+\newcounter{quickquizctrE}[chapter]
 \newcounter{quickquizctrC}[section]
 \newcommand*{\theHNum}{\arabic{chapter}.\arabic{quickquizctr}}
 \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}
@@ -33,7 +34,10 @@
 \newcommand{\QuickQuiz}[1]{
 	\refstepcounter{quickquizctr}
 	\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}}
-\newcommand{\QuickQuizAnswer}[1]{\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}}
+\newcommand{\QuickQuizAnswer}[1]{%
+	\refstepcounter{quickquizctrE}%
+	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
+	\label{QQE.\thechapter.\thequickquizctrE}}
 \newcommand{\QuickQuizEnd}{}

 % To create a macro referencing the previously defined quick quiz:
@@ -84,7 +88,7 @@
 	\noindent\textbf{Answer:} \\ }

 \newcommand{\QuickE}{%
-	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\ding{113}}
+	\hyperref[QQE.\QuickQuizAnswerChapter.\thequickquizctrC]{\ding{113}}
 	\vspace{1.5\baselineskip}
 }

-- 
1.9.1


