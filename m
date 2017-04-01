Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=0eU/2Ts/Zkt2vmaWh2GIdN0AlMNFXBNpvmVo3e6btSk=;
 b=Lu8DuN1e49vU9h6A3LnoWSEYL8N/X9SM3Vi5olXEmtGEMQ3qgr30gmc0vUj5hSWmsy
 4uXwlK/mOp3/XRRYv28HC1CheBzxO/SLMU7lwQzrF19ozNiv6GXf178FwzGd13rLICpu
 jTc6rfwleSA6pVWMquyE+6MzJ74ohG72sJha47RPXBfdXfkD677pTddDftaBWIl19Rku
 37sOkrae+ty7ao3tsCEXHFmRxYj1EfzTicwP8LdDPr2uaR1jh2p941mCNESyt5PIdKF5
 flpC78seX+QA9n5KrgymAGjv+8Qek8D/5szFDM8lYFm50vNqwuCC1YgmLd1Mfth7FJno
 /BDg==
Subject: [RFC PATCH 04/12] advsync: More replacement to ACQUIRE
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2727c988-db7b-5f2c-0c2b-62703c6ad0b3@gmail.com>
Date: Sat, 1 Apr 2017 11:13:53 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d2a400201e3f0379be01a296ebefee74ae106410 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 30 Mar 2017 00:03:50 +0900
Subject: [RFC PATCH 04/12] advsync: More replacement to ACQUIRE

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 8471f0a..ae6ca9f 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2757,7 +2757,7 @@ These implicit memory barriers provide the following guarantees:
 		due to being unable to get the lock immediately, or due
 		to receiving an unblocked signal or exception
 		whilst asleep waiting
-		for the lock to become available.  Failed locks do not
+		for the lock to become available.  Failed ACQUIREs do not
 		imply any sort of barrier.
 	\end{itemize}
 \end{enumerate}
-- 
2.7.4


