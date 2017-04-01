Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BVL3LPzA7HGJacYGB06rn4p6cj7v7FgtbUyvCfIkrkc=;
 b=lSztQV6CYIPAUSmX1xRDPBvP+i0Kngk7Sm5/QpOcaQbSJdDXYYrnXtAMeQlv9VFtqb
 nlIeNn+YiT8Mhyea/unaBa2FRJsI90cEe+s22K0JhWm6K5Uuabry558P0EEuMxy9hXrq
 fr+Kpwn3cbyAandbExuJJAlCeqQWMQVPMwEj71r5EaWdUjmlpy6hCROdAqbOtIj7co+L
 s8lO8rQMmTTleGd9kIud2OwMZzhHoq/XLdwmvOk5Dglu99jweBaFwDTS0ysRN4PGPtkI
 eHIzt6EhNwIZjqIWD0svO1S/+0z/20dhJvFG1ehu2C49fg8kCM/YpA/cPq6U4Nz7iaWf
 9rHA==
Subject: [RFC PATCH 01/12] advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 1)
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <507f8523-3128-fab1-f047-b70716765376@gmail.com>
Date: Sat, 1 Apr 2017 11:10:52 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c8b05232a7665495892fd11ec02e34b1b36b55ac Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 23:58:48 +0900
Subject: [RFC PATCH 01/12] advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 1)

This mostly corresponds to the former half of commit 2e4f5382d12a
("locking/doc: Rename LOCK/UNLOCK to ACQUIRE/RELEASE")[1] in Linux
kernel repository, but only replaces what is present in perfbook
now.

Note:"memory-barriers.txt" has more details not included here.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2e4f5382d12a

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 165b5cb..29d3af1 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1555,36 +1555,36 @@ There are a couple of types of implicit memory barriers, so called
 because they are embedded into locking primitives:

 \begin{enumerate}
-\item	LOCK operations and
-\item	UNLOCK operations.
+\item	ACQUIRE operations and
+\item	RELEASE operations.
 \end{enumerate}

-\paragraph{LOCK Operations}
+\paragraph{ACQUIRE Operations}

-A lock operation acts as a one-way permeable barrier.
+An acuire operation acts as a one-way permeable barrier.
 It guarantees that all memory
-operations after the LOCK operation will appear to happen after the LOCK
+operations after the ACQUIRE operation will appear to happen after the ACQUIRE
 operation with respect to the other components of the system.

-Memory operations that occur before a LOCK operation may appear to happen
+Memory operations that occur before an ACQUIRE operation may appear to happen
 after it completes.

-A LOCK operation should almost always be paired with an UNLOCK operation.
+An ACQUIRE operation should almost always be paired with a RELEASE operation.

-\paragraph{UNLOCK Operations}
+\paragraph{RELEASE Operations}

-Unlock operations also act as a one-way permeable barrier.
+Release operations also act as a one-way permeable barrier.
 It guarantees that all
-memory operations before the UNLOCK operation will appear to happen before
-the UNLOCK operation with respect to the other components of the system.
+memory operations before the RELEASE operation will appear to happen before
+the RELEASE operation with respect to the other components of the system.

-Memory operations that occur after an UNLOCK operation may appear to
+Memory operations that occur after a RELEASE operation may appear to
 happen before it completes.

-LOCK and UNLOCK operations are guaranteed to appear with respect to each
+ACQUIRE and RELEASE operations are guaranteed to appear with respect to each
 other strictly in the order specified.

-The use of LOCK and UNLOCK operations generally precludes the need for
+The use of ACQUIRE and RELEASE operations generally precludes the need for
 other sorts of memory barrier (but note the exceptions mentioned in the
 Section~\ref{sec:advsync:Device Operations}).

-- 
2.7.4


