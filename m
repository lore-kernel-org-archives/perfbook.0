Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V04P3tbvb44WPbbOPWurP4Y3ZkW2gpD8n6rmSx65nxs=;
 b=Srz8MyKeSMYcQOGCuCCW3Kj1qlbGhhHugYpI0JUz2fQ8t41zi0qu0Y6yUpDktHkuTZ
 UA7Q/2JeaxGU1iAcZ/fKBwKlmJfgf6rCar5X7f3FyqIqYn1RR85GBBSgSE+g9Qy54vFC
 ZQuu/J3LWEfN8PKQjd6ezpcpvEXRYUYrrEUgBLYa67JWAMI1FNYCWtje9HFXZNEuAv6z
 7WKb13oGkydILlaht7gEncQvsz9U+M3KWqhxVoH/GlzSpHonyDmFW3cZk0RU1qSJ2lds
 IgW8LBvPshRltcd1sIVVcInwuSTHPmwO+8slMt6NNJHeUs62MoxQJCxQpCs3+SEUH9QU
 NyQg==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 2/2] memorybarriercum.svg: fix typo
Date: Sun,  4 Nov 2018 19:18:39 +0800
Message-Id: <1541330319-14491-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
References: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fix typo in memorybarriercum.svg.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 memorder/memorybarriercum.svg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorybarriercum.svg b/memorder/memorybarriercum.svg
index ac9e5cf..71b69a5 100644
--- a/memorder/memorybarriercum.svg
+++ b/memorder/memorybarriercum.svg
@@ -212,7 +212,7 @@
              id="tspan5462-5"
              y="-981.5686"
              x="-13.718384"
-             sodipodi:role="line">... cumulativity guarantees CPU 0's store before CPU 2's store</tspan></text>
+             sodipodi:role="line">... cumulativity guarantees CPU 0's store before CPU 1's store</tspan></text>
       </g>
       <g
          transform="translate(0,53.92809)"
-- 
2.7.4

