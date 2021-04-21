Return-Path: <SRS0=nUow=JS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WbrCKHaLOqJGiTQ0xrDutpNYKkNiw/vRWd5mz7DB0oo=;
        b=XGF3JhU5NSyBa2H+EGrEe0x9Cc4/iF6bMNKNyisXEOTWUSWcBCz/fJW3coNcY32fqy
         3iW0WdiZTAgsLMlNldRgO2xMqfk4RvgqCFpEzB7/Awzt3MIfMuDk1cIhoLg3FQsZZD/F
         Xt6hkqHON8dxOPWUN7Jna+8eQwxU55rYikl8FsLgDoS94wyz37pvjic46AYVXhYpsHkP
         KiOzcwi5Afkj5Iv3p4Whei0vVzk+L17caRR+amvkIl4F/zoxFO/CEej3A3UZiUk0txx+
         FUk2pcmtTXHN1FDrt+JeufplhqqJ9O8JjEt/1MC6fafrf+G6D5UQk9nnlv5naSW+ZQqu
         OkWA==
Subject: [PATCH -perfbook 2/4] synctex-forward: Skip database check when
 reverting
References: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <189c9c75-bed1-7241-b94d-b409deed62e5@gmail.com>
Date: Thu, 22 Apr 2021 00:27:32 +0900
MIME-Version: 1.0
In-Reply-To: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Reverting should finish without warning even if synctex database is
not present.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/synctex-forward.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utilities/synctex-forward.sh b/utilities/synctex-forward.sh
index 04bdc14d..f0fb4aa6 100755
--- a/utilities/synctex-forward.sh
+++ b/utilities/synctex-forward.sh
@@ -91,6 +91,12 @@ else
 	fi
 fi
 
+# skip database check when reverting
+
+if [ `echo $change | grep -c "revert"` -ne 0 ] ; then
+	exit 0
+fi
+
 # check if synctex database exists
 mainbase="${main%.tex}"
 if [ `ls -1 perfbook* | grep -c $mainbase.synctex` -eq 0 ] ; then
-- 
2.17.1


