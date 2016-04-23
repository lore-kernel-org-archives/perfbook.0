Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33780 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751674AbcDWLoz (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 23
 Apr 2016 07:44:55 -0400
Received: by mail-pf0-f194.google.com with SMTP id e190so12400013pfe.0 for
 <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=lUH69uvvCePXUS6AOY36889fR2XcxJvnJobs6jGilB4=;
 b=uPG70UmFt6H9lwdg6UgwHDkq1LhcYmpwRpwzPc/vUvkDwojDuIRUyxPlrtU8eCDqre
 2JnAA1FixisJlaqs78kyliW+k95mB+UOF+ZJXac0cIJgAcYtZfbA+o1kMtPYzHiCvdXz
 +0RtywK04pyH3mjaKX1BZp2z+hGgcxVnYiHzBcND/SkSTKFPPNf0cAO9JEZoXMgYWmLV
 LOqDnL55eYYJgC87NjkXtSyB5LBk0QNM7AGCV5L5uJOl6vJz/XqYBww+asRVGileOx0d
 +wAQ9adHxQqOuvrcDqIGaANsIz1Z3WD3mPANPTQTgjQTYSMaNbnBWdOb2hPOzUZsER2v
 E6nw==
Subject: [PATCH v2 1/3] qqz: Improve accuracy of cross-links
References: <571B5FBE.6030005@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571B6033.80608@gmail.com>
Date: Sat, 23 Apr 2016 20:44:51 +0900
MIME-Version: 1.0
In-Reply-To: <571B5FBE.6030005@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From da7b4f7e910734102b8a4c54cb1e9b3ad599aa04 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Thu, 21 Apr 2016 21:29:57 +0900
Subject: [PATCH v2 1/3] qqz: Improve accuracy of cross-links

In commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
cross-links of quick quizzes and their answers were implemented.
However it uses the \stepcounter{} command, and direct references
of 'quickquizctr' counter is not output to the .aux file.
The symptom is when you click on a hyperlink in the resulting PDF,
you jump to a random nearby label such as that of Figure, Table,
or Section, etc. which happens just before the \label{} using
'quickquizctr'.

By using \refstepcounter{} instead and using 2 counters
'quickquizctr' and 'quickquizctrC' ('C' stands for 'Chapter'),
each of which is automatically reset at a new chapter and
a new section respectively, and defining \theHNum at the head
of qqz.sty, then redefining it within the \QuickQuizAnsers
command, matching QQ.n.m's and QQA.n.m's are output to the .aux
file correctly.

By applying this change, resulting hyperlinks become to jump to
places almost exactly where you'd expect.

This change may have the effect of increasing the required number
of 'pdflatex' invocations to get a final result. The following
commit will take care of it.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 qqz.sty | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index 7270468..438f515 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -15,7 +15,9 @@
 %%
 %% Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-\newcounter{quickquizctr}
+\newcounter{quickquizctr}[chapter]
+\newcounter{quickquizctrC}[section]
+\newcommand*{\theHNum}{\arabic{chapter}.\arabic{quickquizctr}}
 \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}

 \newcommand{\QuickQHeading}[3]{\label{#1.#3}\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}}
@@ -23,9 +25,9 @@
 \newcommand{\QuickQuizChapter}[2]{
 	\chapter{#2}
 	\label{#1}
-	\setcounter{quickquizctr}{0}}
+	}
 \newcommand{\QuickQuiz}[1]{
-	\stepcounter{quickquizctr}
+	\refstepcounter{quickquizctr}
 	\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}}
 \newcommand{\QuickQuizAnswer}[1]{\rule{7pt}{7pt}}
 \newcommand{\QuickQuizEnd}{}
@@ -37,6 +39,7 @@
 % There is probably a better way to do this, but this does work.

 \newcommand{\QuickQuizAnswers}{
+	\renewcommand*{\theHNum}{\arabic{section}.\arabic{quickquizctrC}}
 	\chapter{Answers to Quick Quizzes}
 	\label{chp:Answers to Quick Quizzes}
 	~ \\
@@ -46,11 +49,10 @@

 \newcommand{\QuickQAC}[2]{
 	\edef\QuickQuizAnswerChapter{\getrefnumber{#1}}
-	\setcounter{quickquizctr}{0}
 	\section{#2}}

 \newcommand{\QuickQ}[1]{
-	\stepcounter{quickquizctr} ~ \\ ~ \\
-	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctr} #1 ~ \\ }
+	\refstepcounter{quickquizctrC} ~ \\ ~ \\
+	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }

 \newcommand{\QuickA}[1]{\rule{7pt}{7pt} \\ ~ \\ \textbf{Answer:} \\ }
-- 
1.9.1

