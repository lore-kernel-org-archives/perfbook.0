Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gcsO2+r7EvQOEi3g1wvwKexNwRncIGDWg4P16qAsVzU=;
        b=YraYLr78b7zq2sgJ6zy1i/NY10eJIYWKoyz7IIoHamIjUsBPm5lyNN5CLzK/JB1xQt
         FAKoPwZ8NujRGvM+WLRpyD2Xy13d9MT+cfDcL+taUDzcymCmQXAu3kx8PawItz9CO+w6
         qQf3II4kxDlj4eUvTXR1h64drueRliRYpZA3QiZOYyBL56Ids/uIIef+RTsFDxKkT0Ld
         BN2OoU+K2InkEzCFv2L9MXGSald9qbQRfJGGqRggK+s67aQWMVy5u+0MGByjzNnUMFPa
         6WBIrp/nooVFS/muY9WyXCed3UuaBJ/xH4F2dOGzxFkqEr0YSqsp4PDV9IguAsMLdN+S
         30Cw==
Subject: [PATCH 1/8] defer/rcuapi: Force break between two API in Table 9.3
References: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <569ad396-1bd8-3a8d-28ca-4743b9f57f03@gmail.com>
Date: Sun, 24 Feb 2019 09:00:33 +0900
MIME-Version: 1.0
In-Reply-To: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 815908256598842f8d62259a0bd1398495fd859b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 22 Feb 2019 20:30:43 +0900
Subject: [PATCH 1/8] defer/rcuapi: Force break between two API in Table 9.3

The column width specified in commit ff9ddf1a7a8f ("defer/rcuapi:
Tweak Table 9.3 with nimbusmononarrow font") allows both APIs
in this cell to appear without a break between them.
Force the break by specifying a narrower column width for the
cell.

Fixes: ff9ddf1a7a8f ("defer/rcuapi: Tweak Table 9.3 with nimbusmononarrow font")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 644a937..93b9767 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -824,8 +824,8 @@ Section~\ref{sec:defer:Maintain Multiple Versions of Recently Updated Objects}.
 	    \tco{hlist_bl_set_first_rcu()} \\
 \multicolumn{4}{l}{{\bf Delete}} \\
 \tco{list_del_rcu()} &
-    \tco{hlist_del_rcu()}
-    \tco{hlist_del_init_rcu()} &
+    \multicolumn{1}{p{1.2in}}{\tco{hlist_del_rcu()}
+			      \tco{hlist_del_init_rcu()}} &
 	\tco{hlist_nulls_del_rcu()}
 	\tco{hlist_nulls_del_init_rcu()} &
 	    \tco{hlist_bl_del_rcu()}
-- 
2.7.4


