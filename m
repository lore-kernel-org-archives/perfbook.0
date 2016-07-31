Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=I1D55dsgMBHgnUkEMlrbdcX2UzYXoyxaD00n+Ze3m2s=;
 b=aRg/k8qm/1xKTTpNC1t0ClMBvgIDZkfJyUaUUVjuX4STFkwsjQEDRjqJ/PvJdKRpzB
 IwxO5qCvdHcbo4drHlPn9cNwlg5CTywpnuRH0t7w50LBcEc82Bk8OpztTDso0M2eldJ0
 INgBzefJkO1KrpBZ9qaT2GVUT2mZ+h4o7MTYucu5F6HD1sl3x8WILCNOwECPqrM1qZ8h
 ClRrlwfYijq9U2NCkDC46ioMM0uDghO6PNRWKGBYvjzoDfhjlazlZ2GWCoJQkR+8osfI
 vjuMggVl9Tk5n3fli0vLXsS3BVixH2RsuFN84NSgE2oxGgdjK/OAXBBM2fU8Nl/pW4WS
 MhHg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] datastruct: Fix code citation typos
Date: Mon,  1 Aug 2016 08:18:15 +0900
Message-Id: <1470007095-7503-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 datastruct/datastruct.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index da735ae..4807223 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1089,7 +1089,7 @@ may be freed.

 The \co{->ht_idx} field on line~16 indicates which of the two sets of
 list pointers are being used by this instantiation of the hash table,
-and is used to index the \co{->hte_next[]} array in the \co{ht_bucket}
+and is used to index the \co{->hte_next[]} array in the \co{ht_elem}
 structure on line~3.

 The \co{->ht_hash_private}, \co{->ht_cmp()}, \co{->ht_gethash()},
@@ -1543,7 +1543,7 @@ Otherwise, line~19 picks up a reference to the current hash table,
 and lines~21-24 allocate a new hash table of the desired size.
 If a new set of hash/key functions have been specified, these are
 used for the new table, otherwise those of the old table are preserved.
-If line~25 detects memory-allocation failure, line~26 releases \co{->htlock}
+If line~25 detects memory-allocation failure, line~26 releases \co{->ht_lock}
 and line~27 returns a failure indication.

 Line~29 starts the bucket-distribution process by installing a reference
-- 
1.9.1

