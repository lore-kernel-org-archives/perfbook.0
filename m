Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VPP97oDNcZMjkQswSPEbvjIk2SSL8KbPDw7Xjw/Gyy8=;
        b=qqAjSdTFGrBKIu14WKpEAmuGieFTTb2sE1jdqCHuKDGYCjZfzELOJOjvOk4J2aVi7K
         O283I9TSMxtc9Iv1Da3wGzT9HupTbOIuX4tGAaEkJxSncujwWxIJ9WAbhU+b0TM0wn3M
         +R3EtcJGmDIgXEShX3py7MXJy18vfU9DV7+YESee4tWd9aVGDftmkQ2oo0wNT76aZn0J
         XZAPNS7drvEoRmqUwhGq/a2wspv98tZXHrrRKzDxcciz6MoSgMnFC/kiZ0EjNKGw38oS
         Fs3mIDDYo1qggsuvthfdg1ai2HTDGDMA99Vpm/dBC108V28rCvkHHWgwdS+xGVThCoCN
         HTwA==
Subject: [PATCH 3/3] locking: Fix reference to code snippet by "figure"
References: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2de7dca8-dbf1-471a-594e-032afa113ce5@gmail.com>
Date: Tue, 20 Nov 2018 00:21:50 +0900
MIME-Version: 1.0
In-Reply-To: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0d7e7b86bf743ee1646b705f246bc50e38d23803 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 19 Nov 2018 23:35:34 +0900
Subject: [PATCH 3/3] locking: Fix reference to code snippet by "figure"

They are the remnant of old style labeling of code snippets as
figures.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking-existence.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 3b62da0..ede3284 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -116,7 +116,7 @@ Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees}.
 	Consider the following sequence of events:
 	\begin{enumerate}
 	\item	Thread~0 invokes \co{delete(0)}, and reaches line~\lnref{acq} of
-		the figure, acquiring the lock.
+		the listing, acquiring the lock.
 	\item	Thread~1 concurrently invokes \co{delete(0)}, reaching
 		line~\lnref{acq}, but spins on the lock because Thread~0 holds it.
 	\item	Thread~0 executes lines~\lnref{NULL}-\lnref{return1}, removing the element from
@@ -172,7 +172,7 @@ This approach allows acquiring the proper lock (on line~\lnref{acq}) before
 gaining a pointer to the data element (on line~\lnref{getp}).
 Although this approach works quite well for elements contained in a
 single partitionable data structure such as the hash table shown in the
-figure, it can be problematic if a given data element can be a member
+listing, it can be problematic if a given data element can be a member
 of multiple hash tables or given more-complex data structures such
 as trees or graphs.
 Not only can these problems be solved, but the solutions also form
-- 
2.7.4


