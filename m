Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nRxcBbREtpkAQwgYrUY6mFNwgzNZfJZdlqsAG+6I3mk=;
        b=Cm9KFd7KgxzMjA4wV5QCPe555fO98jwDsu9v5vP1ZoZkqMdt0ULuOIRrrNosWIEw7J
         2+6zV/0rOq2TKGQNswdhrQuVdSLDhy5GuqNFe3Le9etk96jHKIeKzQ7DiBhApKsxbycv
         0YmKV5lsubMxLEociapDNp/G0eqtbwvQSNAIrYBdNEPA9GI10mgqvxHADw1jy81NqRr7
         E6lMddXLbvhaH1+jj4YZnmh46aQQYQ0qtIE1U2xxqE9nQ6Z4BuFUjuOBI841iiWe0xol
         VVczYXzpRpEPo+GCHYGxEZN4Y7LpP3g8Nj/GHpfkoA7urJCZTQDYNSrsbibZViJ/tE9a
         ZH1A==
Subject: [PATCH -perfbook 04/11] Add \ignorespaces command to \IfEbookSize and
 \IfSansSerif
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <82871fad-83e9-6d46-7e6c-d01a558d8dd5@gmail.com>
Date: Tue, 17 Aug 2021 19:21:27 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Using \IfEbookSize or \IfSansSerif macro in the middle of a paragraph
can cause extra white spaces around it.
Fix this by adding the \ignorespaces command in their definitions.

Also update the conditional text in styleguide.

As the other conditional macros aren't used in this manner, they are
not modified for the moment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 5 +++--
 perfbook-lt.tex                    | 6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 9bb9683f..24e891a3 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1013,8 +1013,9 @@ namely \qco{$-$}.\footnote{This rule assumes that math mode uses the
   same upright glyph as text mode.
   Our default font choice meets the assumption.
 \IfSansSerif{
-  One of the experimental targets ``1csf'' \emph{does} use a differnt font
-  for math mode figures as of October 2017.}{}
+  Experimental targets with sans-serif fonts such as
+  ``1csf'' and ``ebsf'' \emph{do} use a differnt font
+  for math mode figures as of August 2021.}{}
 }
 For example,
 
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 62959e04..b1c4f780 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -117,13 +117,15 @@
 \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
 \newboolean{ebooksize}
 \setboolean{ebooksize}{false}
-\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}{#1}{#2}}
+\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}%
+  {\ignorespaces#1\ignorespaces}{\ignorespaces#2\ignorespaces}}
 \newboolean{afourpaper}
 \setboolean{afourpaper}{false}
 \newcommand{\IfAfourPaper}[2]{\ifthenelse{\boolean{afourpaper}}{#1}{#2}}
 \newboolean{sansserif}
 \setboolean{sansserif}{false}
-\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}
+\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}%
+  {\ignorespaces#1\ignorespaces}{\ignorespaces#2\ignorespaces}}
 \newboolean{lmttforcode}
 \setboolean{lmttforcode}{true}
 \newcommand{\IfLmttForCode}[2]{\ifthenelse{\boolean{lmttforcode}}{#1}{#2}}
-- 
2.17.1


