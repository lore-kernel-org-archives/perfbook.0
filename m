Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MQQz7Vnf3DyD866l5kZS+RW6sM1bhW1gfLSd215/meI=;
        b=NU7p7xelIHAnyJuM9H3S4uGEiZnM61sWDlAAJOAuhpbeO8vMSsegWw74Oo6bzo9Imq
         NGS7KSQq5GujaFjIl59u7aCa0r4va0gw3O5JKRu9S47kk8fGESBsAUjxtQK99lpumuIz
         7Qo8sJkY9FGuuj8dIleCV2c080/mMhHdonkgC/8jWVnbXPhlwV6hckD5yOjqtFBoWRQd
         V6lqc82mfINC8JVkNnFsVUNrTA8m53uTFMN6WWwZgIcUvwCfgtvIoIXefIOVye1sCmAm
         4BhxnWF6h4VqPXEXC8sssfHiLMrIFRLDSbAKIBpDQgwL9eQ78SMh6zno1W6RNAKm+Mtj
         4i5w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/7] datastruct: Fix wrong line number
Date: Tue, 20 Nov 2018 09:00:51 +0900
Message-Id: <20181120000057.389-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 1dc2b49..fb8fc20 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1549,7 +1549,7 @@ Line~17 conditionally acquires the top-level \co{->ht_lock}, and if
 this acquisition fails, line~18 returns \co{-EBUSY} to indicate that
 a resize is already in progress.
 Otherwise, line~19 picks up a reference to the current hash table,
-and lines~21-24 allocate a new hash table of the desired size.
+and lines~20-24 allocate a new hash table of the desired size.
 If a new set of hash/key functions have been specified, these are
 used for the new table, otherwise those of the old table are preserved.
 If line~25 detects memory-allocation failure, line~26 releases \co{->ht_lock}
-- 
2.10.0

