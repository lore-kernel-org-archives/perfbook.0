Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=hrR8fNG6rV2n4RuPIvCjBSXtu7m0mg1kkKck447zm/E=;
        b=hIRnfpi74RW9ta8nF/+40yq80r9tg00JDGLdpXc+FCRkDyydCQGgeM0BqXBkTh/HfE
         /O0GzE9ut04AJaxy0LKtG9GdqBYl4lsEXqE8oUwF5wp/jMcWysP8f5L79de5riaxx6TX
         270hEt1oyIx1kCsDRq1VdVvhgbDv0fLIbGd/RGSJ7MR6VciSrl5vDAdn4TdZAyQOcEfn
         V/BemdOhfDgQlg98MH3nXZzniaReUoZT2KE+1KdqBa0i76ZCTtgCW9Zk/vou+RHBGymE
         H+/NyS4u57CDum9voxluCwTawe53OEl62YU0B2qkKqQ4b5thgrbptF3BsdUzcWSsuo5Q
         FxSw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] defer: Fix wrong code line
Date: Tue,  2 Oct 2018 11:32:31 +0900
Message-Id: <20181002023231.7280-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/hazptr.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 7550a8d..44928e9 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -56,8 +56,8 @@ out quite carefully in order to avoid destructive races with concurrent
 deletion.
 One implementation is shown in
 Listing~\ref{lst:defer:Hazard-Pointer Storage and Erasure},
-which shows \co{hp_store()} on lines~1-13 and \co{hp_erase()} on
-lines~15-20.
+which shows \co{hp_store()} on lines~1-14 and \co{hp_erase()} on
+lines~16-21.
 The \co{smp_mb()} primitive will be described in detail in
 Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}, but may be ignored for
 the purposes of this brief overview.
-- 
2.10.0

