Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=i4bResOHuiStDH//zNDs+JHUehAZoUZouDVNn/otGVQ=;
 b=QDG+ixhhD9UzVWwvMsD2Kf4coxAiFxYZ+sLLxzEGZkfusL+N61V/62YC0bhwlo/mqa
 AdrXHiUtXiMk+LOXQ7rCuz6j6UUwcuVkn7G2vTP1eQ5J/4xMcfJD3zyOfLnXEYhNqgEQ
 OjH3XfLgOO0VXfk1Q4KACcVbgxWO6RXOAfVmhIvP+3Gxzx/JNhijH/TRhNfsGfh1n4yl
 /M58dx0R9hWDrTpQMKTMX5rgUjtuzCaJAvR9xrKnQhCVsDJSdrw0DOa7kATYAKRKb6lx
 KwqxMcolhtaxVhTMBGDZvtDxtWjd89ovD5NtHIOdiggOgBVVj5bsIlWr0meYbtkY2Ism
 PK9Q==
Subject: [PATCH 6/6] Makefile: Add notice of mathastext version for 1csf
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b658af34-658d-c751-a56d-34508f24832e@gmail.com>
Date: Wed, 19 Oct 2016 07:08:48 +0900
MIME-Version: 1.0
In-Reply-To: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ec360d66cdab86bbe98d544aca52aaec1e03518e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Oct 2016 19:35:37 +0900
Subject: [PATCH 6/6] Makefile: Add notice of mathastext version for 1csf

On Ubuntu Trusty, the version of mathastext package installed in
TeX Lve is 1.3c. It conflicts with hyperref package's \url and
\path commands and breaks their line-break behavior.
The issue was resolved in version 1.3i.
This commit adds a notice to the target "1csf" regarding this.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 2ccce9d..a73aadb 100644
--- a/Makefile
+++ b/Makefile
@@ -116,6 +116,7 @@ perfbook-msnt.tex: perfbook.tex
 perfbook-1csf.tex: perfbook-1c.tex
 	sed -e 's/setboolean{sansserif}{false}/setboolean{sansserif}{true}/' \
 	    -e 's/usepackage{courier}/usepackage[var0]{inconsolata}/' < $< > $@
+	@echo "## This target requires recent version (>= 1.3i) of mathastext. ##"

 # Rules related to perfbook_html are removed as of May, 2016

-- 
2.7.4


