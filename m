Return-Path: <SRS0=cZgG=47=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NJ1H7cMyfbK05ttNcpQVE4CZwQB08UMzQexq7VpOQcM=;
        b=gJHeYjKm+rlNy4olJkxQHxK4YDEoGAFnZ42kVv/L+R8s4tBj1VyIJvXgklnGbuUAi/
         o9owbO2bBV7TcvM5IHm53rn2vr/wKYc7J65rMYUYYS55xsZyO2AfRs72E4ecnQwF6JG3
         wpL2oX3baLjjWX9B61tjMTCpbTaUTZqrbo0SKkgerLciA8NyO5y/OqDtlcqnoQdPdEA1
         tON6rdcem53L91Z0cSoHOh0a4pPF3VhauPO+ER4tNq7dzCJ3y1Uc+Exrs8jQ7J/V4Aqy
         wq9IKZl/a46PMVzSdHpyc7h2br/EsoLSbjtXJlw3dZhE+CLgfRBqRvoGo1JrbINKN9KI
         HkHQ==
Subject: [PATCH 2/4] memorder: Use \dots for ellipsis
References: <9bb674ac-62c8-f046-5ed1-412c9d200e6c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c5270038-771b-381e-5989-cbbe7d55ad4e@gmail.com>
Date: Sun, 15 Mar 2020 00:15:04 +0900
MIME-Version: 1.0
In-Reply-To: <9bb674ac-62c8-f046-5ed1-412c9d200e6c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e0dd23a84a67a2eee322e3d53ccfb5c2d362fd8c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 14 Mar 2020 19:08:32 +0900
Subject: [PATCH 2/4] memorder: Use \dots for ellipsis

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 63f1474b..5a9301d0 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1331,8 +1331,8 @@ in pre-v4.15 Linux kernels.
 
 	To sum up, current platforms either respect address dependencies
 	implicitly, as is the case for TSO platforms (x86, mainframe,
-	SPARC,~...), have hardware tracking for address dependencies
-	(\ARM, PowerPC, MIPS,~...), have the required memory barriers
+	SPARC,~\dots), have hardware tracking for address dependencies
+	(\ARM, PowerPC, MIPS,~\dots), have the required memory barriers
 	supplied by \co{READ_ONCE()} (DEC Alpha in Linux kernel v4.15 and
 	later), or require the memory barriers supplied by
 	\co{rcu_dereference()} (DEC Alpha in Linux kernel v4.14 and earlier).
-- 
2.17.1


