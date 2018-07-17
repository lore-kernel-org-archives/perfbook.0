Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P8FVaxy+0h59+IL9NNuAdZXSICypcm7gFP6CBj3aE14=;
 b=IWPCt4rQjl1qCoUPc1XyT8aN2NHdNoM12j7ymvVfJ8sV1EkkUEtHD1YXXoeVUG4xwO
 UwbbdvhBffBhbXnugnhzY+MQ/UXen3VJVGJL7n6QtxtDleyVZMudSeQ3cNp8Vt9QG4Xx
 aBzj8IFYEHlG2TOKLT0lMKVIHzeoMPAX3CO6TtWPMtdMkymyQDC3sINkObnX7qHzXkm7
 4YcTCTKjl3o3x4XDYcbvQhyOGAf1GwBcyj/3+H0PCgcjTXrw1ZbmptyLl7CXtm+f+d5O
 UTFBGkxPw1rs664MJsfxIplHsCDcmCOiJDoUfd9ZLfzHxHW4/YJ47QnACa9APuKBCRCr
 pAFw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/3] locking: Fix wrong line number
Date: Tue, 17 Jul 2018 09:34:21 +0900
Message-Id: <20180717003422.27190-2-sj38.park@gmail.com>
In-Reply-To: <20180717003422.27190-1-sj38.park@gmail.com>
References: <20180717003422.27190-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 locking/locking.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 467208a..49d3e5e 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1659,7 +1659,7 @@ as shown on line~2.
 } \QuickQuizEnd

 Lock acquisition is carried out by the \co{xchg_lock()} function
-shown on lines~4-9.
+shown on lines~4-10.
 This function uses a nested loop, with the outer loop repeatedly
 atomically exchanging the value of the lock with the value one
 (meaning ``locked'').
-- 
2.10.0

