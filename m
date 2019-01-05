Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=PMuuhLdp1xRrGEIzXgrKGILrLS40giCyT5Nk025i34o=;
        b=qgMDLtr7+B5JoNXi5Th08l60P2H/FMyN8dDIYvHUwjepAx3L5Ep+AwwUgeOKKsG7Xo
         glAt1gxk8Jy/XRZq6IgEYXhmS1LaJy2DwAzO+G9VQZnFYKnx1T6kQCRT/GJqRacj964M
         qUHpygg1gDUETrHNzS65Djeaf/3fpmecAE6OCFfa8G7STvH3mZPfiaQ9PRAV1vpMFcAj
         s6FvWSua+QqPWgkfACPBldAWO0iQxiIQ65J3BxC0ArEVWpqjVzEdxEIJ5UEWBEoAmw4q
         OsVAH82eEliwJZuJsNf1f2CXz9B8su+Xy4lMWPVYQegx5EHm6dqMvQrmlEGbJDgRj/XL
         VRAw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] memorder: Fix typos
Date: Sun,  6 Jan 2019 04:19:56 +0900
Message-Id: <20190105191957.3050-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index cb4d037..56786fa 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -541,13 +541,13 @@ Blank cells indicate that no ordering is supplied.
 The ``Store'' row also covers the store portion of an atomic RMW operation.
 In addition, the ``Load'' row covers the load
 component of a successful value-returning \co{_relaxed()} RMW atomic
-operation, although the combined ``\co{_relaxed()} RMW Operations''
+operation, although the combined ``\co{_relaxed()} RMW operation''
 line provides a convenient combined reference in the value-returning case.
 A CPU executing unsuccessful value-returning atomic RMW operations must
 invalidate the corresponding variable from all other CPUs' caches.
 Therefore, oddly enough, unsuccessful value-returning atomic RMW
 operations have many of the properties of a store, which means that the
-``\co{_relaxed()} RMW Operations'' line also applies to unsuccessful
+``\co{_relaxed()} RMW operation'' line also applies to unsuccessful
 value-returning atomic RMW operations.
 
 The \co{*_acquire} row covers \co{smp_load_acquire()},
-- 
2.10.0

