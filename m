Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=g3CgTEIzYzsxrvFFXPenNTxvH71iPzacMSiiqJl/byQ=;
 b=uErUoVxtYaTYSjYmyhS5HfhEKnKpOrX0NZl9nlDvui3QGvdWURzVdLrNviljZk5TzW
 HCZsU1t7fZdLmw0ROcdI3DeNLrWOuWfqWqgUyFzWdlyi8bApLn8UjqJYw0mMsY17NAbT
 xlN0HVqJGHKdONltQkXmue8dPzNUcRjptQ9VyCgFLFMBJrEMGAp7u6ktkKzyC1+zr/Nv
 H6lTYsd/81XJ2TJLYIiEW1RJNHBdsuKujDUHPo4itxFR62PSeaRM/ceaV/Zca6Ry2fVL
 HM1M4Ss6A+GAFtyZjenkChmBvzdNN/xZICjjkN49zPSoEDOVPKqKrVq73h9qlSbzuFZE
 pSIQ==
Subject: [RFC PATCH 3/7] advsync: Make code snippet in deference to Herman
 Hollerith float
References: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e5f3b760-3cd0-41ae-b44d-815b99a1cc96@gmail.com>
Date: Sat, 25 Mar 2017 18:38:17 +0900
MIME-Version: 1.0
In-Reply-To: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a93a5669ea1a5200a59b255f33b32a77bfae8626 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 17:43:02 +0900
Subject: [RFC PATCH 3/7] advsync: Make code snippet in deference to Herman Hollerith float

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 496ace9..c26e931 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2609,10 +2609,13 @@ General barriers provide ``global transitivity'', so that all CPUs will
 agree on the order of operations.  In contrast, a chain of release-acquire
 pairs provides only ``local transitivity'', so that only those CPUs on
 the chain are guaranteed to agree on the combined order of the accesses.
-For example, switching to C code in deference to Herman Hollerith:
+For example, switching to C~code in deference to Herman Hollerith shown in
+Figure~\ref{fig:advsync:Example of Local Transitivity (Release-Acquire Pair)}:

-{\scriptsize
-\begin{verbatim}
+\begin{figure}[htbp]
+\scriptsize
+\centering
+\begin{verbbox}
    1 int u, v, x, y, z;
    2
    3 void cpu0(void)
@@ -2642,8 +2645,11 @@ For example, switching to C code in deference to Herman Hollerith:
   27   smp_mb();
   28   r3 = READ_ONCE(u);
   29 }
-\end{verbatim}
-}
+\end{verbbox}
+\theverbbox
+\caption{Example of Local Transitivity (Release-Acquire Pair)}
+\label{fig:advsync:Example of Local Transitivity (Release-Acquire Pair)}
+\end{figure}

 Because \co{cpu0()}, \co{cpu1()}, and \co{cpu2()} participate in a local transitive
 chain of \co{smp_store_release()}-\co{smp_load_acquire()} pairs, the following
-- 
2.7.4


