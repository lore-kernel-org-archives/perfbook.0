Return-Path: <SRS0=Bw3l=JL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YEG49qX1rXQGlHQVIZJ/Yj1Yk7MpW3frUR/lye3LRWM=;
        b=hNsnUALLShTby3g4giN98ZoJhoMahUPUjDnQr4IRMPW/KVuV7kGOXPJV1IJbtiZAVf
         KqjP2D8by7thC+ZtrbaxMugEe6+Xw/tLGdcRipVfErX5y73SagmYQASKESqI/JwKKiAo
         /ClVYmbj01dzJoPNYWv6Dls+1iwxNtO9SrGSOh94uogNtSsQw7Kapun7/2ypIW7cuLch
         Zgrasuf62Ev74fzuvN8l6dS+SfyeQDViVU22lHBWtkzHU42BmBUJSPd1onV2Io9EfqHD
         Fg04bYDJ/y2d6PyswWF5RtWm6DbOi+njyqyjUw2XkayKQxphDKJoaJ/r0jGmDDPOckOU
         xaDQ==
Subject: [PATCH -perfbook 5/5] qqz.sty: Add page reference to QQA Appendix as
 the same as -nq build
References: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f6d350bd-a514-ce2c-348f-7d133f7b98fe@gmail.com>
Date: Wed, 14 Apr 2021 20:12:12 +0900
MIME-Version: 1.0
In-Reply-To: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The page references in -nq build are nice to have.
Add similar refs in other build targets.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 qqz.sty | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index 9b1d4c35..4e1a138a 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -59,8 +59,16 @@
 \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}
 
 \newcommand{\QuickQHeading}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}}
+\IfNoQqz{
 \newcommand{\QuickQHeadingPage}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}%
 	\hfill\raisebox{0.5ex}{\footnotesize\fbox{p.\pageref{QQP.#3}}}}
+}{\IfQqzBg{
+\newcommand{\QuickQHeadingPage}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}%
+	\hfill\raisebox{0.5ex}{\footnotesize\fbox{p.\pageref{QQ.#3}}}}
+}{% draft build
+\newcommand{\QuickQHeadingPage}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}%
+	\hfill{\footnotesize{[p.\pageref{QQ.#3}]}}}
+}}
 \newcommand{\QuickQHeadingLight}[3]{\scriptsize QQ~\hyperref[#2.#3]{#3}\label{#1.#3}}
 \newcommand{\QuickQHeadingBegin}[3]{\scriptsize QQ~\hyperref[#2.#3]{#3}\label{#1.#3},}
 \newcommand{\QuickQHeadingMiddle}[3]{\scriptsize\hyperref[#2.#3]{{ #3}}\label{#1.#3},}
@@ -213,7 +221,7 @@
 \newcommand{\QuickQ}[1]{
 	\begin{tcolorbox}[breakable]
 	\leavevmode\refstepcounter{quickquizctrC}%
-	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} \\
+	\QuickQHeadingPage{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} \\
 }
 
 \newcommand{\QuickA}[1]{%
@@ -247,7 +255,7 @@
 	\par
 	\refstepcounter{quickquizctrC}%
 	\noindent
-	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }
+	\QuickQHeadingPage{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC}\\}
 
 \newcommand{\QuickA}[1]{%
 	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
-- 
2.17.1


