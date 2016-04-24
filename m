Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=awB3U+X6tCwklmbCOyXs9kNnLeQeWDZaeYcnHM3D9B4=;
 b=j/54QTuDGOnkJc6eYoqRDWr0REceXc/yycqx1cI2PVaOLJK4bxQ2hdrXkqRVdFIeX9
 RVG2rYVGzMSjvHd4sIsIDO6vxKDWP3fIUL+512hSbVrd0wAZI7pcfmOtKoTjaKsNwDUA
 vApvVoOrn9xEu4Um8F5aWjQ3ACaUuVqdW9rju/nHw59cBduINW+xpJ+SybNuajr46W1E
 WnO/OxIIih+e0RPJFCgxVlUdepaVzCh0FxnPf5/hU2qL8e8Iu2FqLZ8c1+lWO/zxg/5c
 acSouAFEvP+MAEsPCnFDCfbOp3ao6ROJo+LEHOci4dDoE/bB2JipUy1HF3NZYOTfIeDm
 qSJw==
Subject: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
References: <571C1843.1060906@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571C1C8F.9000602@gmail.com>
Date: Sun, 24 Apr 2016 10:08:31 +0900
MIME-Version: 1.0
In-Reply-To: <571C1843.1060906@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, pbonzini@redhat.com, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6ecb00b37832372d18cdc7ff5eaea9a53eab3cb9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Sun, 24 Apr 2016 08:19:20 +0900
Subject: [PATCH v3 1/3] qqz: Improve accuracy of cross-links

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
of 'pdflatex' iterations to get a final result. The following
commit will take care of it.

This commit also updates the copyright notices in the header,
including the name of Paolo Bonzini who authored the commit
mentioned above.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 qqz.sty | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index 7270468..08229b8 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -12,10 +12,16 @@
 %% \QuickQuizAnswers -- to dump out all questions and answers in new section.
 %%
 %% Copyright (C) IBM Corporation, 2008
+%% Copyright (C) Paolo Bonzini, 2015
+%% Copyright (C) Akira Yokosawa, 2016
 %%
 %% Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
+%%          Paolo Bonzini <pbonzini@redhat.com> # cross-link questions and answers
+%%          Akira Yokosawa <akiyks@gmail.com>   # improvement of cross-link

-\newcounter{quickquizctr}
+\newcounter{quickquizctr}[chapter]
+\newcounter{quickquizctrC}[section]
+\newcommand*{\theHNum}{\arabic{chapter}.\arabic{quickquizctr}}
 \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}

 \newcommand{\QuickQHeading}[3]{\label{#1.#3}\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}}
@@ -23,9 +29,9 @@
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
@@ -37,6 +43,7 @@
 % There is probably a better way to do this, but this does work.

 \newcommand{\QuickQuizAnswers}{
+	\renewcommand*{\theHNum}{\arabic{section}.\arabic{quickquizctrC}}
 	\chapter{Answers to Quick Quizzes}
 	\label{chp:Answers to Quick Quizzes}
 	~ \\
@@ -46,11 +53,10 @@

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


