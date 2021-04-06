Return-Path: <SRS0=TSuN=JD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=4I97uerfQWE6VYz1lDfbhiWdY/Z54LtD+yct9+YNJHU=;
        b=gKm9jPCC8F3yCjIV1YktIcnO7WW70j+CyDfcjt/7LDpS5DT+CG4uF6z53Kerpg1sjB
         zQ782wAESiEoUbH1mQsgAPfCSd7nEVrV0g58iYl8dVIZrP8hIgBuV9AGYkbREyUvxWCb
         fHwAwm0DIhxWI6IrCD7TxpBZg5x9O4bDebdu71BO1LvDXHAl9qWTTnITX37v45OHxZeJ
         s79sN9n+bqwG9CljC2BN5+CxjeGYEkDJoh0XfULxkiWkg5QoSTpnE2JkagpzC/XMazAj
         EzqAzkUTyjwxkDrvK9AGmfo7+io/DKNGPmW2nFqkoV3nneCFxpLGcXKPTihH5c/fGi3+
         +WkA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Makefile: Fix typo in target 'ebdf'
Message-ID: <975bb607-b6f7-a78f-40f4-c23bfd8fe440@gmail.com>
Date: Tue, 6 Apr 2021 18:50:02 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fixes: 283bf48cfa39 ("Makefile: Update rules to reflect help text")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 797adf6a..5f17b126 100644
--- a/Makefile
+++ b/Makefile
@@ -385,7 +385,7 @@ perfbook-ix.tex perfbook-1cix.tex perfbook-ebix.tex:
 
 perfbook-df.tex: $(PERFBOOK_BASE)
 perfbook-1cdf.tex: perfbook-1c.tex
-perfbook-ebef.tex: perfbook-eb.tex
+perfbook-ebdf.tex: perfbook-eb.tex
 perfbook-df.tex perfbook-1cdf.tex perfbook-ebdf.tex:
 	sed -e 's/setboolean{qqzbg}{true}/setboolean{qqzbg}{false}/' \
 	    -e 's/setboolean{indexon}{true}/setboolean{indexon}{false}/' < $< > $@
-- 
2.17.1

