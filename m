Return-Path: <SRS0=Bw3l=JL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RV36vEintzOfw92w2cSakVXh9SovLhjFUFGSQM/nNKI=;
        b=Q8G1Ig/F/pzHyOurQgcImt7S/TdGtWkCsG23E1XKm1JoPtL06bSJDw5cHglRtw/xSS
         ECEEdnOOEEtjt0YFLe7xybJWd56tPju/wk8p1m4iEubPWrA1lJ25WbqTyawS7YFrcg3E
         E/RCxkpRsjOOxLhcGKC2XvXjEa+vWZaOPd3fRlAcMdq4PKQDL6Y6Q3PlpVlfmatzwVYU
         girKj10YuqkXJkJ63f+qWdQ0hqrVepGcfDQRWvy7xczW5xo9PDTgl4y9edfr1CZfQ2Qn
         +MJbAMaA+uAhQrk4SKGUJA4Rah39r0ixGYtQayCLXQ3PW1SLPfY663BE2p6OnKvnjL7H
         v57Q==
Subject: [PATCH -perfbook 1/5] qqz.sty: Use \refstepcounter after leaving
 vmode in tcolorbox
References: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <32203b30-45a4-fdb1-b2e3-141ffb5afc90@gmail.com>
Date: Wed, 14 Apr 2021 19:54:53 +0900
MIME-Version: 1.0
In-Reply-To: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This avoids occasional missing destination of hyperlink with hyperref
v7.00j and later.
\refstepcounter is changed to be breakable in vertical mode, and if
it causes a page break the destination is discarded by tcolorbox.
This can be avoided by leaving vmode before using \refstepcounter.

This workaround was suggested by Ulrike Fischer in a GitHub issue
Akira opened [1].

By this change, some lines in the macro definitions need tail
comments to avoid unnecessary horizontal skips.

Also move \refstepcounter of \EQuickQuiz{} inside tcolorbox for
noqqz build.

While we are here, remove a redundant \hyperref macro in
\QuickQuizAnswer for noqqz build.  It caused a lot of warnings
from hyperref in -nq builds, which the log checker in runlatex.sh
ignores.

[1]: https://github.com/latex3/hyperref/issues/186

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 qqz.sty | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index 897d1ab6..0992c027 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -87,15 +87,14 @@
 \newcommand{\QuickQuizE}[1]{%
 	\refstepcounter{quickquizctr}%
 	\QuickQHeadingEnd{QQ}{QQA}{\thechapter.\thequickquizctr}}
-\newcommand{\EQuickQuiz}[1]{
-	\refstepcounter{quickquizctr}
+\newcommand{\EQuickQuiz}[1]{%
 	\begin{tcolorbox}[breakable]
-	\small\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}
+	\leavevmode\refstepcounter{quickquizctr}%
+	\small\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}%
 	{#1}
 }
 \newcommand{\QuickQuizAnswer}[1]{%
 	\refstepcounter{quickquizctrE}%
-	\hyperref[QQA.\thechapter.\thequickquizctr]{}%
 	\label{QQE.\thechapter.\thequickquizctrE}}
 \newcommand{\QuickQuizAnswerB}[1]{\QuickQuizAnswer{#1}}
 \newcommand{\QuickQuizAnswerM}[1]{\QuickQuizAnswer{#1}}
@@ -116,7 +115,7 @@
 \IfQqzBg{
 \newcommand{\QuickQuiz}[1]{
 	\begin{tcolorbox}[breakable]
-	\refstepcounter{quickquizctr}
+	\leavevmode\refstepcounter{quickquizctr}%
 	\small\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}
 	{#1}
 }
@@ -209,7 +208,7 @@
 \IfQqzBg{
 \newcommand{\QuickQ}[1]{
 	\begin{tcolorbox}[breakable]
-	\refstepcounter{quickquizctrC}
+	\leavevmode\refstepcounter{quickquizctrC}%
 	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} \\
 }
 
@@ -220,7 +219,7 @@
 }{\IfNoQqz{
 \newcommand{\QuickQ}[1]{
 	\begin{tcolorbox}[breakable]
-	\refstepcounter{quickquizctrC}
+	\leavevmode\refstepcounter{quickquizctrC}%
 	\QuickQHeadingPage{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC}\\
 }
 
-- 
2.17.1


