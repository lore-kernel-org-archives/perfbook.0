Return-Path: <SRS0=cfv5=E3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694405056; x=1695009856; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grivCWomooWcRBLaDDCYNQN4sH9p8EVDO/bmdVjASF8=;
        b=SP19GZzBbLtd86wDkfGxll8uUbxtITg1dWyuHw5DaPeVX1OdYtSw1GTheE8BeLRDP3
         ZIWQxf4AztO5FkfHcZYFdc+1hXJ55e/1ubwhNF0MK+prsmOoheT5772sN2/RoJDEj6nh
         6DFKVFFf4UpXN9qetk/6JHLY2s3iuSpJSe9KEiBu8ydfaCYmJGUhswlMcZDt6ys3D8Db
         8Af88UFXYpXmK4lkm3BZWKiQk9rAOwJPBvdWikYmgHKvrid5j2lcm5Q3S5Y9L65KISN8
         qNuKrLe4pKvOoGo63JG+RdWXkuXynd6hu2hY6V79A+yiqMsmdGCGKiIgdZq3iz8zD6ke
         p/cQ==
Message-ID: <1241d4bd-07c4-c358-9f89-760ac989065c@gmail.com>
Date: Mon, 11 Sep 2023 13:04:13 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] memorder: Shrink Figures 15.1 and 15.2 in 2c builds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Figures 15.1 and 15.2 look unnecessarily large in 2c builds.
Reduce their widths a bit by using \onecolumntextwidth.

This change doesn't affect -1c and -eb builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Figure 15.2 is now at the top of page 319.
Figure 15.1 still appears in its own page. Tweaking the position
of its definition in memorder.tex might help here, but it is not
urgent, I guess.

You can find other uses of \onecolumntextwidth in figure*
environment in memorder.tex.  I think it is a reasonable template.
\textwidth is good for a figure with tiny fonts such as Figures
15.5 and 15.6.

--
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 6cf136b8dc6e..1a4edf8bbb6d 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -151,7 +151,7 @@ description.
 
 \begin{figure*}
 \centering
-\resizebox{\textwidth}{!}{\includegraphics{memorder/locktrans}}
+\resizebox{\onecolumntextwidth}{!}{\includegraphics{memorder/locktrans}}
 \caption{Locking Intuitions}
 \label{fig:memorder:Locking Intuitions}
 \end{figure*}
@@ -262,7 +262,7 @@ description.
 
 \begin{figure*}
 \centering
-\resizebox{\textwidth}{!}{\includegraphics{memorder/relacqtrans}}
+\resizebox{\onecolumntextwidth}{!}{\includegraphics{memorder/relacqtrans}}
 \caption{Release-Acquire Intuitions}
 \label{fig:memorder:Release-Acquire Intuitions}
 \end{figure*}

base-commit: 2feb406642d90fac3fbbcc515d60d3573773a3f4
-- 
2.25.1

