Return-Path: <SRS0=U37W=PG=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Zm+VovgZh2sspm/yEbiQRtsxnRsucmfZUFS7IhKh1g0=;
        b=VHQsDf9gp0VE1cCPerBPzUtKQSysqSzwB1dcXieyaH/TRedh4UsrW0WiG+MoC+iSnt
         RtZG9c0AjP2bliNCt4QEDREv7o9eqPufYC7BfCaDNkqSUt7mdeqICuboCB10KQOBAOXi
         Yys3dUiWMRiru/eVUYgpMwBMqQ5QFrFJ59TM/PmyNfSgIzbWScZAJcexjUMMaZUvdZXs
         GQr04jtqax/573ZtO32fYkpVN84au7Po9PeHDda+4yuyPvKSRsuS17SLWuqxA8rWEr6p
         H+IMHNd8Rwo1zORgL4IptDDdDP3jFFZ3dZNtGKBTbztffkHRqpDiPm3lNhPghxmnn1H5
         9HsQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/5] toolsoftrade: Consistently wrap 'volatile' with '\co{}'
Date: Mon, 18 Oct 2021 10:44:37 +0200
Message-Id: <20211018084439.7112-3-sj38.park@gmail.com>
In-Reply-To: <20211018084439.7112-1-sj38.park@gmail.com>
References: <20211018084439.7112-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence is wrapping 'volatile' with '\co{}' for most cases but one
case.  This commit makes it consistently wrap the keyword with the
macro.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index bc332aba..f0fb360c 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -803,7 +803,7 @@ rights to assume that the value of \co{goflag} would never change.
 	most of the accesses are protected by a lock (and thus \emph{not}
 	subject to change), but where a few of the accesses are made outside
 	of the lock.
-	Using a volatile declaration in this case would make it harder
+	Using a \co{volatile} declaration in this case would make it harder
 	for the reader to note the special accesses outside of the lock,
 	and would also make it harder for the compiler to generate good
 	code under the lock.
-- 
2.17.1

