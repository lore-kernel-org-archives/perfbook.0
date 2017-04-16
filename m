Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n8HkkBLDEScVpLIDI1wHNZJCFRyCmxPdGpvM8g6NWNI=;
 b=qBuNdv3xOY4l2M/aXZPEx5hNWGHERrHVyJMHMAfrn92MyUMZbkLcQ9kyL40rn2eYqo
 owe1oe6OoMwpGIi9qvJdTSYUOgQ6/n3aObyI4YGg1omIMULk/+oOXRC4hPbiRDAotxqz
 u8dQGm1if6Pjd9p2Crty/ZDGZJB7zlS62aTQiVJzeSVVQpAUMqNxJmFuCGYydXMF1zO6
 dGphXZUdMZdOCoJ3T907Y/+Mdk98dOQSK/gnuZqkeSJ+dAkZn3qhzyaig80QE7KKCXM8
 hlNOYb+JqBW2QUv1hz2ircHJFJ05jJc4IY+HGXmLJQhpYgY+USRxuyUqME79IvLosrpR
 p1qQ==
Subject: [PATCH 11/14] advsync: Rename Section 'Guarantees' to 'Minimal
 Guarantees'
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <18c416c3-e94e-bbac-2a22-831f9bf6dd50@gmail.com>
Date: Mon, 17 Apr 2017 07:24:56 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8b244f86f9f9c26e2de37624c5ad9064367c3332 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 15:53:34 +0900
Subject: [PATCH 11/14] advsync: Rename Section 'Guarantees' to 'Minimal Guarantees'

Also make it clear that this section discusses guarantees which
are free of memory barriers.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 0cd690b..6cf25a9 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1289,10 +1289,11 @@ x = LOAD *D, STORE *A = 5
 the second of which will almost certainly result in a malfunction, since it set
 the address \emph{after} attempting to read the register.

-\subsection{Guarantees}
-\label{sec:advsync:Guarantees}
+\subsection{Minimal Guarantees}
+\label{sec:advsync:Minimal Guarantees}

-There are some minimal guarantees that may be expected of a CPU:
+In our abstract memory model, there are some minimal guarantees of ordering
+that may be expected of a CPU without any need of memory barriers:

 \begin{enumerate}
 \item	On any given CPU, dependent memory accesses will be issued in order,
-- 
2.7.4


