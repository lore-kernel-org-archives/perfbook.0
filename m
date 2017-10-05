Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rdtS2SZMlahv2sBdlIhXaqDk5u6OwvoWJRfkdrA2tVY=;
 b=TZO+nKNEC3rW7EGQf7mlneJkze3VZnkBjoU8eFwE6PDl2KFUooAilBMLACXnJjTh5w
 UjMwW5xzVpWuZWWa/umOjfhcqrcHmUFtI8AqtMs9D9VPAvoju7akpI3yxdaiVDbWArvF
 ksycBu1MPbtBXSdggeYZg24dByjMl1FS4tFeEm6AK0QB57s8Zz875R/C9DNdr2Ldz4YG
 eVs8H0C+CQriMs+byiC1uAwI9dw6YuiPjubvEiXGGEPgZX1LLiVLmQ+NY+yoE4U6AR1u
 CSSBQevdpcX5XdDAc86uxw231WReJwf57siOHjdDLOsmmWpouacrcyPFpg2KKDG55DJF
 X9lA==
Subject: [PATCH 10/10] styleguide: Reflect recent style improvements
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d15ca863-c275-68ae-3d16-2f2efbe1ce14@gmail.com>
Date: Fri, 6 Oct 2017 01:00:06 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2890e0069882321553c16aac213d4bb8d0a06fb7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 4 Oct 2017 08:18:50 +0900
Subject: [PATCH 10/10] styleguide: Reflect recent style improvements

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 58 ++++++++++++--------------------------
 1 file changed, 18 insertions(+), 40 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index bec700c..d7ee97d 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -181,29 +181,14 @@ Example:
   $45\degree$, rather than $45\,\degree$.
 \end{quote}

-\subsection{NIST Guide Yet To Be Followed}
-\label{sec:app:styleguide:NIST Guides Yet To Be Followed}
-
-There are a few cases where NIST style guide is not followed.
-Other English conventions are followed in such cases.
-NIST rules of
-Sections~\ref{sec:app:styleguide:Percent Symbol}
-and~\ref{sec:app:styleguide:Font Style}
-are deemed acceptable by the editor.
-Contributions in those areas should be welcome.
-
 \subsubsection{Percent Symbol}
 \label{sec:app:styleguide:Percent Symbol}

 NIST style guide treats the percent symbol (\%) as the same as SI unit
 symbols.
-In this textbook, no space is placed in front of a percent symbol.

 \begin{quote}
-\begin{tabular}{ll}
-  NIST guide:& 50\,\% possibility\\
-  Current convention:& 50\% possibility\\
-\end{tabular}
+  50\,\% possibility, rather than 50\% possibility.
 \end{quote}

 \subsubsection{Font Style}
@@ -235,12 +220,15 @@ For example,
   $\mathrm{e}^x$
 \end{quote}

-In this textbook, this rule is not much considered as of this writing.
-Most letters in math mode are italic regardless of what they
-represent. Exceptions are uppercase Greek letters, which are upright
-in math mode by default.\footnote{
-  See \url{https://tex.stackexchange.com/questions/119248/}
-  for the historical reason.}
+%\footnote{
+%  See \url{https://tex.stackexchange.com/questions/119248/}
+%  for the historical reason.}
+
+\subsection{NIST Guide Yet To Be Followed}
+\label{sec:app:styleguide:NIST Guides Yet To Be Followed}
+
+There are a few cases where NIST style guide is not followed.
+Other English conventions are followed in such cases.

 \subsubsection{Digit Grouping}
 \label{sec:app:styleguide:Digit Grouping}
@@ -670,7 +658,14 @@ Example with an en dash:
 \label{sec:app:styleguide:Numerical Minus Sign}

 Numerical minus signs should be coded as math mode minus signs,
-namely \qco{$-$}. For example,
+namely \qco{$-$}.\footnote{This rule assumes that math mode uses the
+  same upright glyph as text mode. Our default font choice meets
+  the assumption.
+\IfSansSerif{
+  One of the experimental targets ``1csf'' \emph{does} use a differnt font
+  for math mode figures as of October 2017.}{}
+}
+For example,

 \begin{quote}
   $-30$, rather than -30.
@@ -1399,28 +1394,11 @@ for examples of tables with complex headings.
 Other improvement candidates are listed in the source of this
 section as comments.

-% Capitalize initialism:
-%    Gnu Compiler Collection = GCC
-%    gcc should be used as a command name in \co{gcc}
-%    When mentioning GCC's C language, use `GNU C'
-%
 % Trademarks:
 %    As the Legal page covers trademarks, there is no need to
 %    use trademark symbol in the text. They seems to have been
 %    imported from original publications.
 %
-% Power or POWER?
-%    IBM's trademark page at https://www.ibm.com/legal/us/en/copytrade.shtml#section-P
-%    lists the following.
-%        PowerPC
-%        Power Architecture
-%        Power
-%        POWER
-%        POWER5
-%        POWER6
-%
-%    not Power5, POWER 5, nor Power-5
-%
 % Ugly line break by \co{}
 %                                 __
 %        atomic_store()
-- 
2.7.4


