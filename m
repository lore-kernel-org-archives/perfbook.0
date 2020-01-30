Return-Path: <SRS0=aoJh=3T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G1WweeE4Hv561KDlGMsvOB91YzuTIAg2nU+afmq2iPk=;
        b=fWlcfcyPSsWu4i1cTS5nJ0lTOojQa8sTP7a0xrRVS2C8mQLievIlaqYor/TuU0yuZP
         3vmQUNQj13KGl1l4mPfth8FJbdBf2Y3AXiUGIiz4hKk0KdxFdays78oxLG3omyMlBdN8
         AsB7pJEENWcl+IrJgRL4taobp+XbvXl+MNUSl8+vwtqLvLwh0bjKOvWUJAvm9UMr/nLR
         kAXAbdPxWUU9U1uVbuUw/YZ3IMQ0LQ6tH1z1F2xOh7L627/8MgueUxsKBRZeTyBzhFpD
         ESoFg6UH5BLrTXwf70yUrbohTyru2DlRa3UQbKrqmKcmMzlH9aQWoZL5BP85g7QJ01ub
         DlPQ==
Subject: [PATCH 5/6] howto: Tweak carriagereturn symbol at fvextra's auto line
 break
References: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <afd9ba96-70ca-0829-36bd-160d06b3ea72@gmail.com>
Date: Fri, 31 Jan 2020 07:41:28 +0900
MIME-Version: 1.0
In-Reply-To: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From beaf1394fd45862ed6ec56bd1d794463113b3049 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Jan 2020 16:10:24 +0900
Subject: [PATCH 5/6] howto: Tweak carriagereturn symbol at fvextra's auto line break

Also use "darkgray" as the color of symbols indicating the line break
to make it obvious that they don't belong to the command line.

Mention the option "-jN" of "make" in comments as well to tell readers
that parallel build is possible.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 13 ++++++++-----
 perfbook.tex    |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index de26a113..db538c05 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -400,12 +400,15 @@ The required list of packages for a few popular distributions is listed
 in the file \path{FAQ-BUILD.txt} in the \LaTeX{} source to the book.
 
 \begin{listing}[tbp]
-\begin{VerbatimL}[breaklines=true,breakafter=/,numbers=none,xleftmargin=0pt]
+\begin{VerbatimL}[breaklines=true,breakafter=/,
+        breakaftersymbolpre=\raisebox{-.7ex}{\textcolor{darkgray}{\Pisymbol{psy}{191}}},
+	breaksymbolleft=\textcolor{darkgray}{\tiny\ensuremath{\hookrightarrow}},
+        numbers=none,xleftmargin=0pt]
 git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
 cd perfbook
 # You may need to install a font. See item 1 in FAQ.txt.
-make
-evince perfbook.pdf & # Two-column version
+make                     # -jN for parallel build
+evince perfbook.pdf &    # Two-column version
 make perfbook-1c.pdf
 evince perfbook-1c.pdf & # One-column version for e-readers
 \end{VerbatimL}
@@ -432,8 +435,8 @@ Listing~\ref{lst:howto:Creating a Up-To-Date PDF}.
 \begin{VerbatimL}[numbers=none,xleftmargin=0pt]
 git remote update
 git checkout origin/master
-make
-evince perfbook.pdf & # Two-column version
+make                     # -jN for parallel build
+evince perfbook.pdf &    # Two-column version
 make perfbook-1c.pdf
 evince perfbook-1c.pdf & # One-column version for e-readers
 \end{VerbatimL}
diff --git a/perfbook.tex b/perfbook.tex
index 51e1f5e5..87c1eaa1 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -50,7 +50,7 @@
 \usepackage{examplep}
 % \usepackage[strings]{underscore}
 % \usepackage{underscore}
-\usepackage{pifont} % special character for qqz reference point
+\usepackage{pifont} % symbols for qqz reference points and carriagereturn
 \usepackage{gensymb} % symbols for both text and math modes such as \degree and \micro
 \usepackage{verbatimbox}[2014/01/30] % for centering verbatim listing in figure environment
 \usepackage{fancyvrb}
-- 
2.17.1


