Return-Path: <SRS0=7ZAc=SC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M8PVMFdEBq/FY096VY1IpXMFWk/3YzfwX2fddPEnXG8=;
        b=jzogh7h0JzfFg45xlPt6mxuFNdOycoY2RMIMhaOe2fMX7fEH4DmP2wItoNP0HSZifb
         6AlHnltxlYKw2xWtjlXqTcjO9ZwfD3MwJX++JKYLw5DHhV2f8/huTSCQfrEam+v+YFej
         sIJr2Ysy0Pi3ZK7aBNpoVgiFzNk0yb7b1/nVjGADlO/NE8NYhfzTF5mxHm9RxUP3AYRN
         ck4uG6nH03dD74ZryWC2VismNPFYGGrdTuRup7Jv3Lzz9HdZpZ80m0+bcxHBDa8GdIkh
         Yenhrq0BzhSC+Yf0E5ChazjwALjWxh9/YYU2HOsMAF+N700A3+Axq9H36AY3sDxwHYmH
         A96A==
Subject: [PATCH -perfbook 2/6] locking, defer: POC of bold face page number in
 index
References: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b901ec66-9d48-3ddf-7ac0-360b97c68fc2@gmail.com>
Date: Tue, 18 Jan 2022 19:53:46 +0900
MIME-Version: 1.0
In-Reply-To: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Example uses of \IXB (for deadlock) and \IXBacrfst (for acronym RCU).

Note: Use of \IXB{} can conflict with a nearby normal \IX{}.
Such a \IB{Deadlock} tag in locking/locking.tex is removed.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcu.tex       | 2 +-
 glsdict.tex         | 1 +
 locking/locking.tex | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/defer/rcu.tex b/defer/rcu.tex
index e11d1f8b..7909fce7 100644
--- a/defer/rcu.tex
+++ b/defer/rcu.tex
@@ -35,7 +35,7 @@ primitives.
 These schemes' shortcomings raise the question of
 whether it is possible to do better.
 
-This section introduces \emph{read-copy update} (RCU), which provides
+This section introduces \IXBacrfst{rcu}, which provides
 an API that allows readers to be associated with regions in the source code,
 rather than with expensive updates to frequently updated shared data.
 The remainder of this
diff --git a/glsdict.tex b/glsdict.tex
index c2b2d050..3dafda06 100644
--- a/glsdict.tex
+++ b/glsdict.tex
@@ -193,6 +193,7 @@
 \newcommand{\IXAcrf}[1]{\glsuseri{#1}\Acrf{#1}} % put index via acronym dictionary (full form, upper case)
 \newcommand{\IXAcrfpl}[1]{\glsuseri{#1}\Acrfpl{#1}} % put index via acronym dictionary (full form, upper case, plural)
 \newcommand{\IXacrfst}[1]{\glsuseri{#1}\acrfst{#1}} % put index via acronym dictionary (first form)
+\newcommand{\IXBacrfst}[1]{\glsuserii{#1}\acrfst{#1}} % put index via acronym dictionary (first form)
 \newcommand{\IXacrfstpl}[1]{\glsuseri{#1}\acrfstpl{#1}} % put index via acronym dictionary (first form, plural)
 \newcommand{\IXAcrfst}[1]{\glsuseri{#1}\Acrfst{#1}} % put index via acronym dictionary (first form, upper case)
 \newcommand{\IXAcrfstpl}[1]{\glsuseri{#1}\Acrfstpl{#1}} % put index via acronym dictionary (first form, upper case, plural)
diff --git a/locking/locking.tex b/locking/locking.tex
index 851a1f00..c223d40c 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -11,7 +11,7 @@
 	  quoting}}
 
 In recent concurrency research, locking often plays the role of villain.
-\IX{Locking} stands accused of inciting \IXpl{deadlock}, convoying, \IX{starvation},
+\IX{Locking} stands accused of inciting deadlocks, convoying, \IX{starvation},
 \IX{unfairness}, \IXpl{data race}, and all manner of other concurrency sins.
 Interestingly enough, the role of workhorse in production-quality
 shared-memory parallel software is also played by locking.
@@ -107,7 +107,7 @@ unfairness, and inefficiency.
 \subsection{Deadlock}
 \label{sec:locking:Deadlock}
 
-\IX{Deadlock} occurs when each member of a group of threads is holding at
+\IXB{Deadlock} occurs when each member of a group of threads is holding at
 least one lock while at the same time waiting on a lock held by a member
 of that same group.
 This happens even in groups containing a single thread when that thread
-- 
2.17.1


