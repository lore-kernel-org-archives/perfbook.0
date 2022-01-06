Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E6viYtvIVNOY4dnUKTEg2JI+g6GdvkFBbiN5ACQCm8M=;
        b=SNoiNWHBos6oyeHv9OJIFM+gNhdxkC+2Q/ztMrSv0zyGrStOMYUqVqqcBtCnhFB6/l
         1kcBAKikD9HBI130R3hb1RMdqzuzvrUUKUWWrdvIwi5Z0W6DPw3ad+qRITlyLISIGAlz
         o9B5z/y5BCaLtEn/rLFs/IAfPu5Gj2HbNBVri7afN4FtEuM5tzyG4HgzpFN4/qppljrH
         hRXuEB1YHzwLQlzkAUirFlTYlgrhXdzMK5dsWZ4fSctuyLOBD2PVeaf7WhrtYK7LaT2/
         VJe76W26YWaeCprfwFJGoCtkgso24PuwDjj43kr0yiaUJRh7LiJcl+H93dfBCTVZACKy
         Obaw==
Subject: [PATCH RESEND -perfbook 02/10] index: Add tags for 'existence
 guarantee'
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4e40ee07-86d0-ebe3-3c08-5b8ac5993abe@gmail.com>
Date: Thu, 6 Jan 2022 16:35:15 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex       | 4 ++--
 defer/rcuusage.tex            | 4 ++--
 defer/whichtochoose.tex       | 2 +-
 locking/locking-existence.tex | 2 +-
 together/refcnt.tex           | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index b2ebabf5..8f4655bc 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -415,8 +415,8 @@ bucket from being freed during the time that its lock was being acquired.
 	What are some ways of preventing a structure from being freed while
 	its lock is being acquired?
 }\QuickQuizAnswer{
-	Here are a few possible solutions to this \emph{existence guarantee}
-	problem:
+	Here are a few possible solutions to this
+	\emph{\IX{existence guarantee}} problem:
 
 	\begin{enumerate}
 	\item	Provide a statically allocated lock that is held while
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index c663be0b..f69201bb 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -588,7 +588,7 @@ element being freed and reallocated as the same type of structure
 while they are referencing it, but must prohibit a change in type.
 This guarantee, called ``type-safe memory'' in
 academic literature~\cite{Cheriton96a},
-is weaker than the existence guarantees discussed
+is weaker than the \IXpl{existence guarantee} discussed
 in \cref{sec:defer:Existence Guarantee},
 and is therefore quite a bit harder to work with.
 Type-safe memory algorithms in the Linux kernel make use of slab caches,
@@ -702,7 +702,7 @@ top of the existence guarantees described in the next section.
 \label{sec:defer:Existence Guarantee}
 
 Gamsa et al.~\cite{Gamsa99}
-discuss existence guarantees and describe how a mechanism
+discuss \IXpl{existence guarantee} and describe how a mechanism
 resembling RCU can be used to provide these existence guarantees
 (see Section~5 on page 7 of the PDF), and
 \cref{sec:locking:Lock-Based Existence Guarantees}
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 4782c036..e54ad1df 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -261,7 +261,7 @@ provides more-detailed rules of thumb that can help you choose among the
 four deferred-processing techniques presented in this chapter.
 
 As shown in the ``Existence Guarantee'' row,
-if you need existence guarantees for linked
+if you need \IXpl{existence guarantee} for linked
 data elements, you must use reference counting, hazard pointers, or RCU\@.
 Sequence locks do not provide existence guarantees, instead providing
 detection of updates, retrying any read-side critical sections
diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 38e432a2..d0ee690c 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -8,7 +8,7 @@
 \epigraph{Existence precedes and rules essence.}{\emph{Jean-Paul Sartre}}
 
 A key challenge in parallel programming is to provide
-\emph{existence guarantees}~\cite{Gamsa99},
+\emph{\IXpl{existence guarantee}}~\cite{Gamsa99},
 so that attempts to access a given object can rely on that object
 being in existence throughout a given access attempt.
 
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 292bdbd1..56c6baa9 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -31,7 +31,7 @@ use in concurrent software, including:
 	might seek help from another thread that already has a reference.
 \item	In some cases, hazard pointers may be used as a drop-in
 	replacement for reference counters.
-\item	An existence guarantee is provided for the object, thus preventing
+\item	An \IX{existence guarantee} is provided for the object, thus preventing
 	it from being freed while some other entity might be attempting
 	to acquire a reference.
 	Existence guarantees are often provided by automatic
-- 
2.17.1


