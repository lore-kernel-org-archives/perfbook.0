Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XQcmuuI0y6tQ2sVLEOWVjXoxV7T6QPmr7J3CDh278dc=;
        b=oKFyabemKAX3FugtCyyk0SQY1kSnp1cQhAND48noNSJZ6wufYWRVdrjsSNMZIHZhuY
         XftFNtMKEUtvtW1fdmdLUZAyKOVpz6lmLhoFI1bQLI8nautjHE2G1dp1QwKzwx15ovUl
         kaHnw3wMv27ETo5is6jwfmYiehQFgRT+S7n04Qf1Vd5QK+GICX/IS+ttHcaLCh7CsuRO
         MgZzSK2a3aEQCAU2y0RTOcIhqwKsSGa2f0PpHmQeBgI3EnxajtTDZcxGPD4eTNKYYhF2
         QRgelZ9D3bIgJQemzoq6VyxZaABiFA/4w1UQuu3ZX8lcqLoAY8xm4j0mTwq2ts8oW7Jz
         y0Hw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] defer/hazptr: Fix a typo: updatesa -> updates
Date: Sat,  1 Jun 2019 09:54:24 +0900
Message-Id: <20190601005425.22065-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/hazptr.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index b491c59..be93342 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -332,7 +332,7 @@ object traversed.
 Therefore, hazard pointers's performance is far short of ideal.
 On the other hand, unlike naive approaches to concurrent reference-counting,
 hazard pointers do operate correctly for workloads
-involving concurrent updatesa.
+involving concurrent updates.
 Additional performance comparisons with other mechanisms may be found in
 Chapter~\ref{chp:Data Structures}
 and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.2483867,MagedMichael04a}.
-- 
2.10.0

