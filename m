Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HFDtFCY/SCrKtzOwcToGC6ZqNOkNRXV4Xlrc63q7DdY=;
 b=n6neE+3c4XIhNtDeCa12oNrZVOtFzpnvEF5/8Oxox4a/FntOOtajtb+K35n3GTngk8
 62PgJf9/ZoFwI4GF1619Xgcgvb61OmsGBrlRCRE3nHGPKW+OjaoETYKf6UZGaOKypSlI
 WdIcTsAoJ0UsS8W9RsP6b9UZ4Fkiywrd7lLmaAKuMAPeBZ59gShFxN6UazkD5j+d7KLL
 YAs59z7dJNGAinGD9PimihSN3il12ij99zeMSK7jLTJOi3nPlnRNrvRxdg3gFB8nMRb8
 Wfi8AMDp8lJE4BUPv+yCZvbKnGZ/6y6e2sVz8/EdDu0CTM4s7mn0+rUXQ/9cgom8OiWm
 2pxw==
Subject: [PATCH 2/5] memorder: Parenthesize properly
References: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <02085dd5-dd45-7633-e34b-d2f35d4dc465@gmail.com>
Date: Fri, 27 Oct 2017 07:52:36 +0900
MIME-Version: 1.0
In-Reply-To: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e1debe2d8a47bae3f81721c576ec978abcee0bab Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 26 Oct 2017 22:34:44 +0900
Subject: [PATCH 2/5] memorder: Parenthesize properly

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 0ee4cad..7fa190a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -18,7 +18,7 @@ code that fails to use standard mechanisms, one important example
 of course being the code that implements these standard mechanisms,
 and another being performance-critical code that uses weaker
 synchronization (in fact, some have argued that weakness is a
-virtue~\cite{JadeAlglave2013-WeaknessIsVirtue}..
+virtue~\cite{JadeAlglave2013-WeaknessIsVirtue}).
 This chapter will help you gain an understanding of memory ordering
 sufficient to implement synchronization primitives and other
 performance-critical code.
-- 
2.7.4


