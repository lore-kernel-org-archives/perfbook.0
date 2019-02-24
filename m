Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s6E1Pe/ktyle6+UBBrbdxh+YqNRmmV5e8lWUKR6Zpnc=;
        b=vTtjKRd6yfCU0LaAy53Mv6vdy/nkWY1GIu/kn3HSBl5D3IsQYtPDuuNBFAKkhkpfbq
         eq+8fCrap42X9cj8jlVCAShMQU5bR6EvW+FlmfMwURzUPZDd1vX++1uQp+WOK/t6L3nL
         5Qq1yJl+zJSH5BmQwEh8fbgLBR0OTKTQK5goexfOoA16G4BhbmanZf1reIBQh1LuNzAF
         Sg9FtsrXUzVmwoIloI9dVXKaIGi/EgOqYH3fPnlRC5aatlz7K7EBS42M3bw/iqMLH4Sp
         a+iBhJVYzWkKkXg5CTDvsAxX7PLzu3lmuwYHI/5g/jGrM9LWSTMPiovC9M1tEPHhtmXs
         6M3Q==
Subject: [PATCH 2/8] Makefile: Fix recipe of target 'perfbook-msn.pdf'
References: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ab628d58-62ab-fc2b-faae-4f6d888d51b1@gmail.com>
Date: Sun, 24 Feb 2019 09:01:33 +0900
MIME-Version: 1.0
In-Reply-To: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2a6f16a97317ef5fc9f21edfa7351cef1d950e6d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 22 Feb 2019 20:39:24 +0900
Subject: [PATCH 2/8] Makefile: Fix recipe of target 'perfbook-msn.pdf'

Commit ff9ddf1a7a8f ("defer/rcuapi: Tweak Table 9.3 with
nimbusmononarrow font") botched target 'perfbook-msn.pdf'
and "lmtt" became the default monospace font.
This is because the second "\usepackage{nimbusmononarrow}
in the preamble does nothing.

This can be fixed by removing "\renewcommand*\ttdefault{lmtt}"
instead of adding the redundant "\usepackage{nimbusmononarrow}".

Fixes: ff9ddf1a7a8f ("defer/rcuapi: Tweak Table 9.3 with nimbusmononarrow font")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4547256..89abea2 100644
--- a/Makefile
+++ b/Makefile
@@ -173,7 +173,7 @@ perfbook-msr.tex: perfbook.tex
 	@echo "## This target requires font package nimbus15. ##"
 
 perfbook-msn.tex: perfbook.tex
-	sed -e 's/%msfontstub/\\usepackage{nimbusmononarrow}/' \
+	sed -e 's/\\renewcommand\*\\ttdefault{lmtt}//' \
 	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' \
 	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' < $< > $@
 	@echo "## This target requires font package nimbus15. ##"
-- 
2.7.4


