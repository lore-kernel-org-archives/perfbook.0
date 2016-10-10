Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ge0fAGtXzzyBIUsuG7UjBn71YrJRmaIZUd/OVo3qiyk=;
 b=MV2zXqAsxVW08gXRPQjtcs6fnYb00T2X3qmHVC8qe7mrEo44AVBcYe+VENmry+jAav
 fBb/bPC0zekxXwngRpSFdtidISjAQEKam53dhQ5PGTxA9uT4+U26aCfK/dVuDIm0cB5R
 UBGiZQqRa+M5mqqkOBJ+g3rkptPyTAzJ+E5gSMO23y7p/JH1Kay1+6COqUsnJManf+tO
 0Ji2GYSaAvwjdOO5RCKdsqqO5C18toA2sfigGG9AS+tYZvhUH1gRhtEY3R1aVos0PaVe
 aDJwitZBkkYCJK5HlPrWd3OTAr2gsTa+e9iUWt+wx48cipq+Oq2ozwn7TFhlKP94RSCU
 8jhg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/8] together: Fix a wrong code line quotation
Date: Tue, 11 Oct 2016 08:07:32 +0900
Message-Id: <20161010230738.14452-3-sj38.park@gmail.com>
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
References: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/refcnt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/refcnt.tex b/together/refcnt.tex
index 587a067f7501..a7e6c7bd0332 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -306,7 +306,7 @@ process does no cross-module optimizations has the same effect.

 The \co{kref_put()} function on lines~16-28 atomically decrements the
 counter, and if the result is zero, line~24 invokes the specified
-\co{release()} function and line~24 returns, informing the caller
+\co{release()} function and line~25 returns, informing the caller
 that \co{release()} was invoked.
 Otherwise, \co{kref_put()} returns zero, informing the caller that
 \co{release()} was not called.
-- 
2.10.0

