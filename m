Return-Path: <SRS0=NSf6=RQ=gmail.com=maplewish117@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJ8mdME++Cykr4jtjOCg8eRqi1lqGHmVtRSCr1R6PE0=;
        b=mxxXsM82MCKYjBfA4Q8o+dmvuOCt0HdhvhDjCHaTH+CQcEXNJWwZB+YAO+0RssGZKJ
         ckrkG6EW7sR45OXoZz33fpHLaPAEA9zuOTZLsV9/IXCmopNPQSQq8PNTlq6Uem8/vekM
         XcFiwdTrSrjRVIUS2hCg1Zb3zyMGOj3uLMR5rXDyltY/Revsj4VdXK7H20ouZ2wCLvlf
         MgUjA7VgqWzbA+nPDi+j66K8s4Y9tj0F3Lh3syQ/iWssu4B4FVVf/AIkPizIux9VgvyC
         fhpPxuF+987UMena7bzyFw7Bs5Tqzbrc4ePji568YmGpYEJZcvfMJifuw55i/Y79t1eT
         sSjQ==
From: Xuwei FU <maplewish117@gmail.com>
Subject: [PATCH] Fix svg in chapter7: change incorrect "Lock B" in `qsort` to "Lock C".
Date: Fri, 31 Dec 2021 17:29:38 +0800
Message-Id: <20211231092937.45331-1-maplewish117@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: Xuwei Fu <maplewish117@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: Xuwei Fu <maplewish117@gmail.com>

Signed-off-by: Xuwei Fu <maplewish117@gmail.com>
---

Hi, paul.

In Chapter7's "Local Locking Hierarchies", 
 the "Lock B" in `qsort` is confusing, qsort 
 should acquire "Lock C" rather than "Lock B".

In this patch, "Lock B" in `qsort`  in svg is 
 changed to "Lock C".

   Thanks, Xuwei

--
 locking/LayeredLockHierarchy.svg  | 2 +-
 locking/LocalLockHierarchy.svg    | 2 +-
 locking/NoLockHierarchy.svg       | 2 +-
 locking/NonLocalLockHierarchy.svg | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/locking/LayeredLockHierarchy.svg b/locking/LayeredLockHierarchy.svg
index 05f0682f..49773940 100644
--- a/locking/LayeredLockHierarchy.svg
+++ b/locking/LayeredLockHierarchy.svg
@@ -334,7 +334,7 @@
              id="tspan3715-6-2-5"
              x="42.601532"
              y="70.638107"
-             style="font-size:4.93888903px;stroke-width:0.26458332">Lock B</tspan></text>
+             style="font-size:4.93888903px;stroke-width:0.26458332">Lock C</tspan></text>
       </g>
       <text
          id="text3717-3-7-3-9"
diff --git a/locking/LocalLockHierarchy.svg b/locking/LocalLockHierarchy.svg
index e4100879..bbe3bc92 100644
--- a/locking/LocalLockHierarchy.svg
+++ b/locking/LocalLockHierarchy.svg
@@ -321,7 +321,7 @@
              id="tspan3715-6-2-5"
              x="42.601532"
              y="70.638107"
-             style="font-size:4.93888903px;stroke-width:0.26458332">Lock B</tspan></text>
+             style="font-size:4.93888903px;stroke-width:0.26458332">Lock C</tspan></text>
       </g>
       <text
          id="text3717-3-7-3-9"
diff --git a/locking/NoLockHierarchy.svg b/locking/NoLockHierarchy.svg
index f892037d..7479ee62 100644
--- a/locking/NoLockHierarchy.svg
+++ b/locking/NoLockHierarchy.svg
@@ -298,7 +298,7 @@
              id="tspan3715-6-2-5"
              x="42.601532"
              y="70.638107"
-             style="font-size:4.93888903px;stroke-width:0.26458332">Lock B</tspan></text>
+             style="font-size:4.93888903px;stroke-width:0.26458332">Lock C</tspan></text>
       </g>
       <text
          id="text3717-3-7-3-9"
diff --git a/locking/NonLocalLockHierarchy.svg b/locking/NonLocalLockHierarchy.svg
index 264f6f14..fb686d23 100644
--- a/locking/NonLocalLockHierarchy.svg
+++ b/locking/NonLocalLockHierarchy.svg
@@ -321,7 +321,7 @@
              id="tspan3715-6-2-5"
              x="42.601532"
              y="70.638107"
-             style="font-size:4.93888903px;stroke-width:0.26458332">Lock B</tspan></text>
+             style="font-size:4.93888903px;stroke-width:0.26458332">Lock C</tspan></text>
       </g>
       <text
          id="text3717-3-7-3-9"
-- 
2.27.0

