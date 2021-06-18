Return-Path: <SRS0=6PvR=LM=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ztcuzIDwwAiJb0a9gEW0yWkqT8Ap88wWMAtL/TkWX74=;
        b=nnYAN+RC6hHKqbMU2bmkgk9MB2H/LKtcH1mSZqz/1RNJtTfaE8ClXGN/5HEXqpKC9g
         JuB3mHWF5YhMVqMgRgVnPSyPmcQYk5nwHUYzdN/2gZ4AfMAM92sEf0gC+LfiYh9EQI37
         yXYAq2bDXml3+AdTqOwWn5BCp0/4vBk/+8QnY305xMQMIOfsxsVGTK2uSwPWwrYnZL38
         19MuipBuc4FKB3tGXSUHtywYiPvSUFovcqs576WN73n9IKBnB2jFiU7eROLGeWO/7+uM
         n/51O1Db5brWchJksEs+NUU2WTfOADVkrnvqJAErIRKhEatwYtv43b8WOdAN9idtQhmU
         oOdg==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook] cpu: add conj 'than' to a defective sentence
Date: Fri, 18 Jun 2021 12:17:49 +0800
Message-Id: <1623989869-17490-1-git-send-email-zhouzhouyi@gmail.com>
To: 340442286@qq.com, paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I guess '... represents a reasonably large system with no fewer
448 hardware threads' is a defective sentence, it needs a conj: 'than'.

Sorry for bothering you if I am wrong, because my English is not quite
good :-)

Thanks
Zhouyi

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com> 
---
 cpu/overheads.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 4aeae6c..28462d4 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -354,7 +354,7 @@ thousand clock cycles.
 	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	on
 	\cpageref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
-	represents a reasonably large system with no fewer 448~hardware
+	represents a reasonably large system with no fewer than 448~hardware
 	threads.
 	Smaller systems often achieve better latency, as may be seen in
 	\cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System},
-- 
2.5.0

