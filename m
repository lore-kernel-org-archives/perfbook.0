Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=f0fA0zBhzwjimLdBCFkxT6DBsX4uFoMgnY8mirx6qYk=;
 b=iJ3XCw2MgwICi/Ftg2gr6fOLSh7KguNQ8eSFXXnHzS5cgVmqHnOHfUhJONvgDM7+U7
 OBCYodZ2VRDe6v894yJ5RH0O/qs7ZYDs4gmXRy7Dc7lJq8UgITycHI01eByDFNBoK39g
 ++wFJs6x4nqVjQcYhpiOtvS3xVY/TQDNkLcFgNDUsEQPrvaJAKEvu1r1NEI8OLEhOYSb
 DZZMmiq4phH+06AEpB1Aqsjen2QwgU1ZDP5R1TLH55yl+iD/cfo5nAkXWumod/FtDVsi
 NOxrB9x2jU4mk+vx3D0Hqb5jNaTW0vSRAVhFDwBQjL7iEhGd8FEJpqJEIP5r5as4Hksp
 BYXA==
Subject: [PATCH 3/3] treewide: Adjust labeling of 'formal'
References: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7581dddd-b27c-02e2-17a7-9a7523c2718a@gmail.com>
Date: Wed, 16 Nov 2016 10:01:56 +0900
MIME-Version: 1.0
In-Reply-To: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 08d86c4db893e5b689c4d051b765006ce507c45c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 16 Nov 2016 09:35:25 +0900
Subject: [PATCH 3/3] treewide: Adjust labeling of 'formal'

"formal" was promoted to a chapter three years ago.
Adjust its labeling.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/rcuimpl/rcupreempt.tex | 2 +-
 debugging/debugging.tex         | 2 +-
 defer/toyrcu.tex                | 2 +-
 formal/dyntickrcu.tex           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/appendix/rcuimpl/rcupreempt.tex b/appendix/rcuimpl/rcupreempt.tex
index fbb41b8..3b9554c 100644
--- a/appendix/rcuimpl/rcupreempt.tex
+++ b/appendix/rcuimpl/rcupreempt.tex
@@ -1426,7 +1426,7 @@ a full grace period, and hence it is safe to do:
 Formal validation of this algorithm is quite important, but remains
 as future work.
 One tool for doing this validation is described in
-Section~\ref{chp:formal:Formal Verification}.
+Chapter~\ref{chp:formal:Formal Verification}.

 \QuickQuiz{}
 	What is a more precise way to say ``CPU~0
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 12235a0..0bffd66 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -968,7 +968,7 @@ is required to attain absolute certainty.
 	\end{enumerate}
 	Of course, if your code is small enough, formal validation
 	may be helpful, as discussed in
-	Section~\ref{chp:formal:Formal Verification}.
+	Chapter~\ref{chp:formal:Formal Verification}.
 	But beware: formal validation of your code will not find
 	errors in your assumptions, misunderstanding of the
 	requirements, misunderstanding of the software or hardware
diff --git a/defer/toyrcu.tex b/defer/toyrcu.tex
index 3b5a85c..aed8a03 100644
--- a/defer/toyrcu.tex
+++ b/defer/toyrcu.tex
@@ -648,7 +648,7 @@ checking of \co{rcu_refcnt}.
 	to determine which (if any) of the memory barriers in
 	Figure~\ref{fig:defer:RCU Update Using Global Reference-Count Pair}
 	are really needed.
-	See Section~\ref{chp:formal:Formal Verification}
+	See Chapter~\ref{chp:formal:Formal Verification}
 	for information on using these tools.
 	The first correct and complete response will be credited.
 } \QuickQuizEnd
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index a63d324..75eb93f 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -52,7 +52,7 @@ illusory.
 Near the end of February, Paul grew tired of this game.
 He therefore decided to enlist the aid of
 Promela and spin~\cite{Holzmann03a}, as described in
-Section~\ref{chp:formal:Formal Verification}.
+Chapter~\ref{chp:formal:Formal Verification}.
 The following presents a series of seven increasingly realistic
 Promela models, the last of which passes, consuming about
 40GB of main memory for the state space.
-- 
2.7.4


