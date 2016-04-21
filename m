Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=JNNjH9DdwPbviYYu/ot+sV5D7C3IUyIs9eMcM8El9fo=;
 b=uzMuGpexheE6yGqvWew66VV6zO6dqeYikD7t57jCqqqeoVNbXieV61E88u643YZtf8
 i1Z6qjiGTDTrE/pdaffVheRFMSPOo19nndKKB7hjUClyo43p9ZtneC79MDTmb1SWSdIO
 /3eYgiwO8V/jU2+v8ano/sSkHC3oYyr+xjG5SGRvv8VzRsk41sKd1Boy1CD3M74xMyHv
 octiZrJT4Vq4qO2Eb9zIKCHH2NUcrZ0gnETHGFng9ggMYxag17iSf6L+pyqIGTDCsf5z
 BLp/dmt5mE33eNkoakiBiAoM1XeRcwPDlvOjZTRE1ZBlhF8yMNvj7zC2BIJoMbQISFNK
 fEiQ==
Subject: [PATCH 1/2] qqz: Improve accuracy of cross-links
References: <5718E390.1090309@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5718E40D.3030609@gmail.com>
Date: Thu, 21 Apr 2016 23:30:37 +0900
MIME-Version: 1.0
In-Reply-To: <5718E390.1090309@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b1b643edfe021163754c6aa83f81669bc544f386 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Thu, 21 Apr 2016 21:29:57 +0900
Subject: [PATCH 1/2] qqz: Improve accuracy of cross-links

In commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
cross-links of quick quizzes and their answers were implemented.
However it uses the \stepcounter{} command, and direct references
of 'quickquizctr' counter is not output to the .aux file.
The symptom is when you click on a hyperlink in the resulting PDF,
you jump to a random nearby label such as that of Figure, Table,
or Section, etc. which happens just before the \label{} using
'quickquizctr'.

By using \refstepcounter{} instead and using 2 counters
'quickquizctr' and 'quickquizctrC' ('C' stands for 'Chapter')
and defining \theHNum at the head of qqz.sty, then redefining
it within the \QuickQuizAnsers command, matching QQ.n.m's and
QQA.n.m's are output to the .aux file correctly.

By applying this change, resulting hyperlinks become to jump
almost directly where you'd expect.

This change may have the effect of increasing the required number
of 'pdflatex' invocations to get final result. The following commit
will take care of it.

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

