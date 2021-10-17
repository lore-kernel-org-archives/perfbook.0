Return-Path: <SRS0=LG5i=PF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dq9WwMn8vDZuQ9UQgN+Un7v5VDlAODKnicvSNjOnWcE=;
        b=MV/ZPxgpaSTBlfxGLmeaGcecGzB9DF4cUumU1H14GWvC5oqefZAJxQpG6uTpPsvXLd
         BvDhbuueXASUjdeGUboVXneU3gzw/X6//w2OREiWcI6o0YmgWZntZdYCU+Rb7OQwCwPW
         2HVH5RQgbe1nJhoLpAfUNb42cb8IFU37PA0gyvmLaRx49+xyHWcew0qo/rHQJuaPjGNR
         f5EjS3RwVS76y3Z81tcdt5cTfrjSck0PQ7J0SMyYNaGFxmnpuszvFEO01h1ZT+pVjrLD
         46Gqn3MSrxMCPSptGJrOEKp4isMtOiJWWE8dpl4c+9zySBPZO0FHkBT4K1IO5qlSJd9b
         eZdQ==
Subject: [PATCH -perfbook 3/3] Makefile: Promote epstopdf-rule.mk as the
 default
References: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d3b22dac-5987-875b-9f9d-0da4db428286@gmail.com>
Date: Sun, 17 Oct 2021 17:18:56 +0900
MIME-Version: 1.0
In-Reply-To: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

It turns out that recipes in epstopdf-rule.mk work reasonably well
and is quicker than those in a2ping-rule.mk on most build environments
tested so far.

So promote epstopdf-rule.mk as the default by inverting the conditional.

a2ping-rule.mk can still be enabled by setting a make variable
"USE_A2PING" as follows:

    make USE_A2PING=1

, when you need to compare the two sets of recipes.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6083cda4..0702fdb7 100644
--- a/Makefile
+++ b/Makefile
@@ -417,7 +417,7 @@ endif
 	@sh $(FIXANEPSFONTS) $@
 
 # .eps --> .pdf rules
-ifndef NO_A2PING
+ifdef USE_A2PING
   include a2ping-rule.mk
 else
   include epstopdf-rule.mk
-- 
2.17.1


