Return-Path: <SRS0=Ut+l=NQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=08WfqT5uy6V0u0n191Wjau6O4XcYkJl+0k6PwqFc6tY=;
        b=KZSUKeS1k/AIGEtKB7ZCRTrwthUfy9/RA9DR/U++/KZQAS9Rb6jMpYbuOZROeGaZg2
         hsjaOCmMBMGtUcYNPmckF8lKK9UaB6BIK9XXQMBgENY5wycN+WSZviv2VkXbkCKE1Hyj
         ACXPpkUTCHdfkKVLW+ZkSr9o4LGffnI7w8rmDi243wuCGy6wWzx9boIziRAOrip4os4I
         /PT9tg+Q9kXB1LFUBnG7YlGAsGtu4JB/CetQ98N1oqNmww2lOiv+f1otIjXKQqzwuhgC
         Vw5ho87+7e4zM0roAPYMNrFV3dMt23yQ/51srESC2a43gyG3gzrma8fTzl3YbG0Mm7/G
         6ABA==
Subject: [PATCH -perfbook 4/5] Adjust label of Appendix E 'Answers to Quick
 Quizzes'
References: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1b0a6bdf-f65e-9aad-f223-559396817c24@gmail.com>
Date: Wed, 25 Aug 2021 18:42:15 +0900
MIME-Version: 1.0
In-Reply-To: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Use the pattern of "chp:app:xxx" so that the regex added in
punctcheck.pl can recognize it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 10 +++++-----
 qqz.sty         |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 00522f84..96fa8d3a 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -139,7 +139,7 @@ This chapter is followed by a number of appendices.
 The most popular of these appears to be
 \cref{chp:app:whymb:Why Memory Barriers?},
 which delves even further into memory ordering.
-\Cref{chp:Answers to Quick Quizzes}
+\Cref{chp:app:Answers to Quick Quizzes}
 contains the answers to the infamous Quick Quizzes, which are discussed in
 the next section.
 
@@ -151,8 +151,8 @@ the next section.
 
 ``Quick quizzes'' appear throughout this book, and the answers may
 be found in
-\cref{chp:Answers to Quick Quizzes} starting on
-\cpageref{chp:Answers to Quick Quizzes}.
+\cref{chp:app:Answers to Quick Quizzes} starting on
+\cpageref{chp:app:Answers to Quick Quizzes}.
 Some of them are based on material in which that quick quiz
 appears, but others require you to think beyond that section, and,
 in some cases, beyond the realm of current knowledge.
@@ -167,8 +167,8 @@ of parallel programming.
 \QuickQuizB{
 	Where are the answers to the Quick Quizzes found?
 }\QuickQuizAnswerB{
-	In \cref{chp:Answers to Quick Quizzes} starting on
-	\cpageref{chp:Answers to Quick Quizzes}.
+	In \cref{chp:app:Answers to Quick Quizzes} starting on
+	\cpageref{chp:app:Answers to Quick Quizzes}.
 	Hey, I thought I owed you an easy one!
 }\QuickQuizEndB
 %
diff --git a/qqz.sty b/qqz.sty
index 86b50c79..a1687293 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -187,7 +187,7 @@
 \newcommand{\QuickQuizAnswers}{%
 	\renewcommand*{\theHNum}{\arabic{section}.\arabic{quickquizctrC}}
 	\chapter{Answers to Quick Quizzes}
-	\label{chp:Answers to Quick Quizzes}
+	\label{chp:app:Answers to Quick Quizzes}
 	\Epigraph{The Answer to the Ultimate Question of Life, The Universe,
 		  and Everything.}
 		 {\emph{``The Hitchhikers Guide to the Galaxy'', Douglas~Adams}}
-- 
2.17.1


