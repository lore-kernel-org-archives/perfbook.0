Return-Path: <SRS0=8Nfx=2U=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lftrcBsoknwGhyaD9yo1kIbMMLrMTCu+oS7P4tTF5eE=;
        b=RC31indlLp93ejpM1bbg9QpwwgRs3GsgikLlxlkinSN0Mwc2c/sagfMb1UAvMoyZEy
         +hxiR8In7c3OwiaVA1E/pIAGTzNeTOJh1CYJmisuTuytJhts7Z+keY9IykE9aGL79jfk
         NAiUTT5VERPQaGmnihhycImU2Pebi9Q70FnaYCTGefPvktJtO+0Fgup5wRrxvPUKcKWl
         JpznqXrT74dsK8k9nkcKhEJoG5b7UV8PVzH5hHZvDnwP/t9y5P3oEn5LT9KpDPGty1cf
         HGd+DZ6hB/47OcqJ3uMaFN8KhDLJ01PX2vvT3XqhMUJWuDM3RkxRr0/4BBY7hVE7yUA0
         YiuQ==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook] memorder: fix a typo in Listing 15.25's caption 
Date: Wed, 19 Oct 2022 16:44:42 +0800
Message-Id: <20221019084442.8025-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: perfbook@vger.kernel.org, luyang.co@gmail.com, paulmck@kernel.org, akiyks@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Caption of Listing 15.25 should be "Z6.2 Release-Acquire Chain (Ordering?)"
instead of "Z6.0 Release-Acquire Chain (Ordering?)"

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul and Akira:

I guess there is a typo in caption of listing 15.25

Many thanks
Zhouyi
--
 memorder/memorder.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 28319bfb..0c96d43b 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2325,14 +2325,14 @@ prevents the \co{exists} clause on \clnref{exists} from triggering.
 
 \begin{listing}
 \input{CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o@whole.fcv}
-\caption{Z6.0 Release-Acquire Chain (Ordering?)}
-\label{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)}
+\caption{Z6.2 Release-Acquire Chain (Ordering?)}
+\label{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)}
 \end{listing}
 
 \QuickQuiz{
 	Suppose we have a short release-acquire chain along with one
 	load-to-store link and one store-to-store link, like that shown in
-	\cref{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)}.
+	\cref{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)}.
 	Given that there is only one of each type of non-store-to-load
 	link, the \co{exists} cannot trigger, right?
 }\QuickQuizAnswer{
@@ -2345,7 +2345,7 @@ prevents the \co{exists} clause on \clnref{exists} from triggering.
 	thereof, it is necessary to have at least one full barrier
 	(\co{smp_mb()} or better) between each non-store-to-load link.
 	In
-	\cref{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)},
+	\cref{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)},
 	preventing the \co{exists} clause from triggering therefore requires
 	an additional full barrier between either \co{P0()}'s or
 	\co{P1()}'s accesses.
-- 
2.34.1

