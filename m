Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316318;
	bh=X7RswHJ3PAv5e07PSq8VhI9+b2xUqFBGlkBSZ9GEag0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rRlsByfsv+CjQrKVr3UJR0yOyISdB8wqfELXjcSSETrybjs9Z/rSHaXEyzMWk1ZeC
	 BF17ZTzojD2AZySZtuu1QhOIc1zrJTQqHZV0Mk9RMfoERbnDTxbpWs2twA+s/r42yd
	 ZOL3zKZAcCz/neMYHs53cSDWbK+eYiM84VXbk01PTFIfAsksslBRkl31euORys23u9
	 Za+sOjwa1wyPeLKRirsP0D0PVviqlXUXXJUJJpNd5ezxCjgIGDZ/uqF1rTrFMiPlQ/
	 3WMIjFlsnTUKQqr8dcFYi+b9o29NfG8Egr1J6o1/tNABvjP/BL3Quz51Km0w7OoFce
	 rkLloXyZ5zXyA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 03/13] defer/rcuapi: Add missed unbreakable spaces
Date: Thu, 24 Nov 2022 10:57:53 -0800
Message-Id: <20221124185803.8150-5-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Add missed unbreakable spaces in defer/rcuapi.tex.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuapi.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 8ee54866..425c64ff 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -948,8 +948,8 @@ element in the middle of the list having multiple fields is atomically
 updated, so that a given reader sees either the old set of values or
 the new set of values, but not a mixture of the two sets.
 For example, each node of a linked list might have integer fields
-\co{->a}, \co{->b}, and \co{->c}, and it might be necessary to update
-a given node's fields from 5, 6, and 7 to 5, 2, and 3, respectively.
+\co{->a}, \co{->b}, and~\co{->c}, and it might be necessary to update
+a given node's fields from 5, 6, and~7 to 5, 2, and~3, respectively.
 
 The code implementing this atomic update is straightforward:
 
@@ -980,7 +980,7 @@ The following discussion walks through this code, using
 \cref{fig:defer:RCU Replacement in Linked List} to illustrate
 the state changes.
 The triples in each element represent the values of fields \co{->a},
-\co{->b}, and \co{->c}, respectively.
+\co{->b}, and~\co{->c}, respectively.
 The red-shaded elements might be referenced by readers,
 and because readers do not synchronize directly with updaters,
 readers might run concurrently with this entire replacement process.
-- 
2.17.1

