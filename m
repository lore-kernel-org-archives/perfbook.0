Return-Path: <SRS0=xThF=W7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=0DocDQEEC+ocqgAIP8Ps2ZUkWJixvzFTkgL3bizc8SA=;
        b=IViPSH3WEACZA5tCVJDa1wOefj6mxyM7fvBxbmi0ZOiRFkiRevJA+JWZWi/KVxhBwX
         ZyWArynaBrg0Go3M7ibgYvRgIwSb0kghyIv3uXgM4vL8qbOk/B1kukOYJSmlEjv0sp5v
         KDzoTDb0O+WYWhQuu/rNPstL7SRVeV2GHjZGL+4Q1wK23sxitbJrnZ7YyFHe70BeFPCU
         /H0HvvOmmCN7d9aHEPEWeLWey8/yDOkPcWsOyM4yGRdJO1a0lHrxw8Oik8N3Jt8vN+Lz
         1SpNELJ7hc+B5h4NidhvBweVT9CwsJOTag0ul/LRvhpzdswnEqg5e24eIDc6Kb5quFNC
         lNkQ==
Message-ID: <9c889180-5bc3-9588-808b-d598e919c9f3@gmail.com>
Date: Fri, 24 Jun 2022 23:34:19 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2 -perfbook 1/2] defer/whichtochoose: Use parnotes for
 footnote in tabularx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Due to conflict between LaTeX Packages hyperref and tabularx,
both of them attempt to tweak the internal code of \footnote{}
command, normal footnotes don't work in tabularx.

This made Paul use a primitive approach for the footnote added in
commit 1760abb74224 ("defer/whichtochoose: Note possibility of
membarrier() for hazptr").

Alternative way for footnotes inside tabularx is to use the
"parnotes" package, whose implementation is orthogonal to hyperref
and tabularx.

This commit employs this approach and uses the command \parnote in
tabularx, and encloses the footnote-printing \parnotes command in
a minipage to prevent the footnote text from centered.

As hyperref is not aware of parnotes, there is no crossref to the
footnote text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Change in v2
  - Send from the account that matches SoB.

Notes of v1:
--
Hi Paul,

I'm not sure if you are happy with the addition of yet another
LaTeX package dependency, but I just wanted to show you this is
possible.  There might be other places where "parnotes" fits.

The trick of minipage for preventing centering should work in
your primitive approach.

It's up to you to take this one or not.

        Thanks, Akira
--
 defer/whichtochoose.tex | 13 +++++++------
 perfbook-lt.tex         |  1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 3c8cc2dccaef..95b355a1c471 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -217,7 +217,9 @@ But those wishing more detail should continue on to the next section.
 	Reader Per-Object Traversal Overhead
 		& Read-modify-write atomic operations, memory\-/barrier
 		  instructions, and cache misses
-			& \tco{smp_mb()} *
+			& \tco{smp_mb()}\parnote[*]{This \co{smp_mb()} can be
+				downgraded to a compiler \co{barrier()} by using
+				the Linux-kernel \co{membarrier()} system call.}
 				& None, but unsafe
 					& None (volatile accesses) \\
 	Reader Forward Progress Guarantee
@@ -253,11 +255,10 @@ But those wishing more detail should continue on to the next section.
 	\bottomrule
 \end{tabularx}
 }
-
-~
-
-* This \co{smp_mb()} can be downgraded to a compiler \co{barrier()} by
-using the Linux-kernel \co{membarrier()} system call.
+\begin{minipage}{\onecolumntextwidth}
+	\vspace*{1ex}
+	\parnotes
+\end{minipage}
 \caption{Which Deferred Technique to Choose?
 					     (Details)}
 \label{tab:defer:Which Deferred Technique to Choose?  (Details)}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index d70dde66f725..9cde2e4d42e5 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -75,6 +75,7 @@
 \usepackage[split,makeindex]{splitidx}
 \usepackage[nottoc]{tocbibind}
 \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in]{idxlayout}
+\usepackage{parnotes} % for footnotes in tabularx
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table

base-commit: 1760abb742247869ac06cee18289f0a36d4d973b
-- 
2.25.1

