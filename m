Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=MfM5It26w5Y6XzevqoEsz+zROMznks274pnAqumOBto=;
        b=m/4fjYSDYtl19ZP23993ur2tH+dzPVVEvIzWNBPSVu9GfMXiwWDLCDpTXJocaXI5v3
         HrrQdSripQzc7YzW4dW9Vhskbkzj+8uVzEIQ52ztT6emMOEvq/r950bPBuaotqZz3F6f
         izamR/3q+Lz+zhGzR76wG84C6QQ3WmkJnXaNEU774WVLt/O0c3t+NwTge1Fj4J1r1txr
         P4Kp1Y8AdXOyp0UBoTUih0aSw1zor8kJgLde/jZE+fY9hcfJHcWNUhZdHLVai7lwHRUn
         UtA+JORZlKnDPYxemJ+lZUGcnzF9VlLowQREroCIcCCNNYWWDdTsbhrxvEkYz1/n0TYx
         Mumg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] defer/rcuapi: Fix typo in Table 9.3
Message-ID: <0c37be8f-b406-9f93-32f7-42bd40a509d6@gmail.com>
Date: Wed, 20 Feb 2019 07:12:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d33317bade3316f46fe01bd7dec3f6c8b0bf9e09 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 19 Feb 2019 22:30:05 +0900
Subject: [PATCH] defer/rcuapi: Fix typo in Table 9.3

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 5620eb1..a98b5e8 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -801,7 +801,7 @@ Section~\ref{sec:defer:Maintain Multiple Versions of Recently Updated Objects}.
 			      \tco{hlist_next_rcu()}
 			      \tco{hlist_pprev_rcu()}} &
 	\tco{hlist_nulls_first_rcu()}
-	\tco{hlist_nulls_first_rcu()} &
+	\tco{hlist_nulls_next_rcu()} &
 	    \tco{hlist_bl_first_rcu()} \\
 \multicolumn{4}{l}{{\bf Add}} \\
 \multicolumn{1}{p{1.2in}}{\tco{list_add_rcu()}
-- 
2.7.4

