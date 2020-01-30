Return-Path: <SRS0=aoJh=3T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oU0igQKutJcgW+kls11ZNyGhhMUn/MgjQ+TsD8NvXcY=;
        b=jDqVwhqFOw7Q+kA0lBdDUoKY72pIlnpik1NISm92dPq3STukmJHFpbYybXNOIVw+Ox
         AB3o4lSp0KetpFp8jseRUw3cr741bjh2UrZscywnAAO4hVboGKd0CzYaopUiCJ3HqlQ8
         UZUF/wTLzUElGSEYU6//exnCNWxAUi2dnDHZsugvK2zzgn6/qI70CPveuMWjwT0V9m1l
         hvbW44nzCxM2xlNxrYn/92WgZx3++GJvkdTtONKpHKgH0hzz6YxueVt0s8cMteqBGCO4
         buWfh93jLulC25Hz+lWejdxyC1nU7mjD2bPE9FtbYzkPJ49xBOEuk7jye6hP8x2Y9aiI
         TItg==
Subject: [PATCH 3/6] howto: Reduce width of Listings 2.1 and 2.2
References: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dcff9692-9b8b-1f99-be0f-b4bfc3dc3f33@gmail.com>
Date: Fri, 31 Jan 2020 07:36:41 +0900
MIME-Version: 1.0
In-Reply-To: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2532ab50cc7ca8518e8faa790c46588ea6db11a3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Jan 2020 16:07:43 +0900
Subject: [PATCH 3/6] howto: Reduce width of Listings 2.1 and 2.2

As wide floats are hard to adjust their placement, reduce the
width of these listings by using the "breaklines" and "breakafter"
options enabled by the "fvextra" package.

Also move the floats to the recommended positions of next to the
paragraphs they are called out.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 54 ++++++++++++++++++++++++-------------------------
 perfbook.tex    |  1 +
 2 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 9d732692..de26a113 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -381,33 +381,6 @@ Other types of systems have well-known ways of locating files by filename.
 \epigraph{If you become a teacher, by your pupils you'll be taught.}
 	 {\emph{Oscar Hammerstein II}}
 
-\begin{listing*}[tbp]
-\begin{VerbatimL}
-git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
-cd perfbook
-# You may need to install a font here. See item 1 in FAQ.txt.
-make
-evince perfbook.pdf & # Two-column version
-make perfbook-1c.pdf
-evince perfbook-1c.pdf & # One-column version for e-readers
-\end{VerbatimL}
-\caption{Creating an Up-To-Date PDF}
-\label{lst:howto:Creating a Up-To-Date PDF}
-\end{listing*}
-
-\begin{listing*}[tbp]
-\begin{VerbatimL}
-git remote update
-git checkout origin/master
-make
-evince perfbook.pdf & # Two-column version
-make perfbook-1c.pdf
-evince perfbook-1c.pdf & # One-column version for e-readers
-\end{VerbatimL}
-\caption{Generating an Updated PDF}
-\label{lst:howto:Generating an Updated PDF}
-\end{listing*}
-
 As the cover says, the editor is one Paul E.~McKenney.
 However, the editor does accept contributions via the
 \href{mailto:perfbook@vger.kernel.org}
@@ -426,6 +399,20 @@ Other packages may be required, depending on the distribution you use.
 The required list of packages for a few popular distributions is listed
 in the file \path{FAQ-BUILD.txt} in the \LaTeX{} source to the book.
 
+\begin{listing}[tbp]
+\begin{VerbatimL}[breaklines=true,breakafter=/,numbers=none,xleftmargin=0pt]
+git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
+cd perfbook
+# You may need to install a font. See item 1 in FAQ.txt.
+make
+evince perfbook.pdf & # Two-column version
+make perfbook-1c.pdf
+evince perfbook-1c.pdf & # One-column version for e-readers
+\end{VerbatimL}
+\caption{Creating an Up-To-Date PDF}
+\label{lst:howto:Creating a Up-To-Date PDF}
+\end{listing}
+
 To create and display a current \LaTeX{} source tree of this book,
 use the list of Linux commands shown in
 Listing~\ref{lst:howto:Creating a Up-To-Date PDF}.
@@ -441,6 +428,19 @@ must be run within the \path{perfbook} directory created by the commands
 shown in
 Listing~\ref{lst:howto:Creating a Up-To-Date PDF}.
 
+\begin{listing}[tbp]
+\begin{VerbatimL}[numbers=none,xleftmargin=0pt]
+git remote update
+git checkout origin/master
+make
+evince perfbook.pdf & # Two-column version
+make perfbook-1c.pdf
+evince perfbook-1c.pdf & # One-column version for e-readers
+\end{VerbatimL}
+\caption{Generating an Updated PDF}
+\label{lst:howto:Generating an Updated PDF}
+\end{listing}
+
 PDFs of this book are sporadically posted at
 \url{http://kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html}
 and at
diff --git a/perfbook.tex b/perfbook.tex
index 757620ec..51e1f5e5 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -54,6 +54,7 @@
 \usepackage{gensymb} % symbols for both text and math modes such as \degree and \micro
 \usepackage{verbatimbox}[2014/01/30] % for centering verbatim listing in figure environment
 \usepackage{fancyvrb}
+\usepackage{fvextra}[2016/09/02]
 \usepackage[bottom]{footmisc} % place footnotes under floating figures/tables
 \usepackage{tabularx}
 \usepackage[hyphens]{url}
-- 
2.17.1


