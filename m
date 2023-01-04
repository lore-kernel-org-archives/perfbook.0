Return-Path: <SRS0=Y4Pl=5B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXT7GJw9rDLnJW2a+meoJE9crR42LlOHxwbFUXjB0rA=;
        b=QFFW5GQjFi1CSmYnunGPuF+v4aT98n/s+iGkpadQn1GjP74pKpWRfCLzr5uR0qn48R
         g9mTRTV2oGPPF96/Nwe0id+9INL/0JL/jd5LlXsy+humQPVJW4P1IH/+NeqUfOmrEMaQ
         uhrNz/Z+R9hh3KKeLfwSMigkxYoP0pDhDK/fG26pCeBggj633PnLVC82NtOTYk72rPhy
         wbTWSxdsdJZyyp38zU1SghyiOfTdFvPrhMkxBDBrsgQJ5NaRpbTBRqeO/oyJpRDPMggK
         TrzehBGyUiOY3nAdwuq1eE1LMcsrnTj5GCByST0auB4/hUj1eGZNNio22XeERF9ZNXXZ
         yiFQ==
Message-ID: <f904443d-1e8a-fa48-2e42-4bd904a44ff3@gmail.com>
Date: Wed, 4 Jan 2023 18:34:14 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/3] epigraph: Emphasize quoted text and book titles
Content-Language: en-US
References: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

To make epigraphs look distinct from main text, tweak the look
of them in the following way:

    - Emphasize quoted text but not the entire source part.
    - Emphasize book titles in the source part, which is consistent
      with the convention in Bibliography.
    - Remove existing quotation marks from book titles.
    - Use small-caps shape and smaller font size for the source parts.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/questions.tex | 2 +-
 formal/spinhint.tex              | 2 +-
 glossary.tex                     | 2 +-
 howto/howto.tex                  | 2 +-
 memorder/memorder.tex            | 2 +-
 owned/owned.tex                  | 4 ++--
 perfbook-lt.tex                  | 2 +-
 qqz.sty                          | 2 +-
 together/together.tex            | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/appendix/questions/questions.tex b/appendix/questions/questions.tex
index d302e454498d..d5794dd26c67 100644
--- a/appendix/questions/questions.tex
+++ b/appendix/questions/questions.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{cha:app:Important Questions}{Important Questions}{qqzquestions}
 %
 \Epigraph{Ask me no questions, and I'll tell you no fibs.}
-	 {``She Stoops to Conquer'', Oliver Goldsmith}
+	 {\emph{She Stoops to Conquer}, Oliver Goldsmith}
 
 The following sections discuss some important questions relating to
 SMP programming.
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index e0659b498f12..afdd275e4364 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -6,7 +6,7 @@
 \label{sec:formal:State-Space Search}
 %
 \epigraph{Follow every byway / Every path you know.}
-	 {``Climb Every Mountain'', Rodgers \& Hammerstein}
+	 {\emph{Climb Every Mountain}, Rodgers \& Hammerstein}
 
 This section features the general-purpose Promela and Spin tools,
 which may be used to carry out a full
diff --git a/glossary.tex b/glossary.tex
index e1f8cb90e6fe..f70ab481e302 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -5,7 +5,7 @@
 \chapter{Glossary}
 %
 \Epigraph{Dictionaries are inherently circular in nature.}
-	 {``Self Reference in word definitions'',
+	 {\emph{Self Reference in word definitions},
 	        David~Levary~et~al.}
 
 \begin{description}
diff --git a/howto/howto.tex b/howto/howto.tex
index 3782492d8c70..9604eabe84de 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -56,7 +56,7 @@ that it has brought to us!
 		I don't know. \\
 	  Cat:
 		Then it doesn't matter which way you go.}
-	 {Lewis Carroll, Alice in Wonderland}
+	 {Lewis Carroll, \emph{Alice in Wonderland}}
 
 This book is a handbook of widely applicable and heavily
 used design techniques, rather than
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 571c1ba24919..d4d2446a1ad1 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -829,7 +829,7 @@ and traps.
 \label{sec:memorder:Tricks and Traps}
 %
 \epigraph{Knowing where the trap is---that's the first step in evading it.}
-	 {Duke Leto Atreides, ``Dune'', Frank Herbert}
+	 {Duke Leto Atreides, \emph{Dune}, Frank Herbert}
 
 Now that you know that hardware can reorder memory accesses and that you
 can prevent it from doing so, the next step is to get you to admit
diff --git a/owned/owned.tex b/owned/owned.tex
index 64db481b77a6..b5d9654b1571 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -8,7 +8,7 @@
 	  My own.
 	  My precious.
 	  Yes, my precious.}
-	 {Gollum in ``The Fellowship of the Ring'', J.R.R.~Tolkien}
+	 {Gollum in \emph{The Fellowship of the Ring}, J.R.R.~Tolkien}
 
 One of the simplest ways to avoid the synchronization overhead that
 comes with locking is to parcel the data out among the threads (or,
@@ -214,7 +214,7 @@ thread.
 %
 \epigraph{If the mountain will not come to Muhammad, then Muhammad must
 	  go to the mountain.}
-	 {Essays, Francis Bacon}
+	 {\emph{Essays}, Francis Bacon}
 
 The previous section described a weak form of data ownership where
 threads reached out to other threads' data.
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 32ca14116247..97cdd0d24af9 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -568,7 +568,7 @@
 \newcommand{\rt}{\mbox{-rt}} % to prevent line break behind "-"
 
 \let\epigraphorig\epigraph
-\renewcommand{\epigraph}[2]{\epigraphorig{#1}{\emph{#2}}}
+\renewcommand{\epigraph}[2]{\epigraphorig{\emph{#1}}{\scshape\footnotesize #2}}
 \IfEbookSize{
   \newcommand{\Epigraph}[2]{\epigraph{#1}{#2}}
 }{
diff --git a/qqz.sty b/qqz.sty
index e2e8e4ec3e6b..a3a9f22d1ba9 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -190,7 +190,7 @@
 	\label{chp:app:Answers to Quick Quizzes}
 	\Epigraph{The Answer to the Ultimate Question of Life, The Universe,
 		  and Everything.}
-		 {``The Hitchhikers Guide to the Galaxy'', Douglas~Adams}
+		 {\emph{The Hitchhikers Guide to the Galaxy}, Douglas~Adams}
 	\setlength{\parskip}{0.0pt plus 1ex}
 	\input{qqz}
 	\setlength{\parskip}{0.0pt plus 1.0pt}% return to default
diff --git a/together/together.tex b/together/together.tex
index bc68e571fa65..e54aa141847e 100644
--- a/together/together.tex
+++ b/together/together.tex
@@ -6,7 +6,7 @@
 %
 \Epigraph{You don't learn how to shoot and then learn how to launch
 	  and then learn to do a controlled spin---you learn to
-	  launch-shoot-spin.}{``Ender's Shadow'', Orson Scott Card}
+	  launch-shoot-spin.}{\emph{Ender's Shadow}, Orson Scott Card}
 
 % And the paragraph preceding this is also instructive:
 % ``I may be pissed off, but that doesn't mean I can't learn.''
-- 
2.25.1


