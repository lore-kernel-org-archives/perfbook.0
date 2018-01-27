Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iz0ZqVM9+UJnCpot3b6e83Z0x/i3u0OVureecopP27k=;
 b=DT/YKjHG3uwa5r151yVbU3kdNhebquP0BEUSU4D6pwb6y5P4cAbQaMG45PzJsuljkm
 uVue+VHdeH6iymkQ/y8fOX2d+tXiCc/clWaxtYLwbB8823BuAJTpGzxKMS7k6b+u+JFD
 bclt/n539fxCzwn54J0FyFBogrt7hqzqPnk3g9qTjWyhPTJKncFVksZTxMuRFpnR/+dQ
 BIf7sTmhLVhCE/Bg8eyXjQdt6Re/9pHnHvoyNa9mI6TqmhilfDPE8v76LMBi7cMWpzC8
 3V54oR3hW0uuZRHv4s5VyLddxUB005zch7ip7FkaZg0DJiiTBVoKjozjdG+6uqj+5CqU
 tkMw==
Subject: [PATCH 3/4] future: Fix embedded font name in .eps files
References: <46894f44-5b60-886f-2321-67c1b9b51c97@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2b88992f-22e7-580a-ee93-de4d01b03df2@gmail.com>
Date: Sat, 27 Jan 2018 18:58:27 +0900
MIME-Version: 1.0
In-Reply-To: <46894f44-5b60-886f-2321-67c1b9b51c97@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3976a1258fea7b1be19bbfba91a78f1603bb9be0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 27 Jan 2018 12:51:29 +0900
Subject: [PATCH 3/4] future: Fix embedded font name in .eps files

"NimbusSanL-Regu+g" is not a proper font name.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/be-lb-n4-rf-all.eps | 4 ++--
 future/be-lw-n4-rf-all.eps | 4 ++--
 future/latencytrend.eps    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/future/be-lb-n4-rf-all.eps b/future/be-lb-n4-rf-all.eps
index e0ad1aa..5482a3f 100644
--- a/future/be-lb-n4-rf-all.eps
+++ b/future/be-lb-n4-rf-all.eps
@@ -249,7 +249,7 @@ gsave
 0.100 0.100 scale
 0 setgray
 newpath
-(NimbusSanL-Regu+g) findfont 100 scalefont setfont
+(NimbusSanL-Regu) findfont 100 scalefont setfont
 1.000 UL
 LTb
 450 300 M
@@ -459,5 +459,5 @@ grestore
 end
 showpage
 %%Trailer
-%%DocumentFonts: NimbusSanL-Regu+g
+%%DocumentFonts: NimbusSanL-Regu
 %%Pages: 1
diff --git a/future/be-lw-n4-rf-all.eps b/future/be-lw-n4-rf-all.eps
index afdf069..a9aa12e 100644
--- a/future/be-lw-n4-rf-all.eps
+++ b/future/be-lw-n4-rf-all.eps
@@ -249,7 +249,7 @@ gsave
 0.100 0.100 scale
 0 setgray
 newpath
-(NimbusSanL-Regu+g) findfont 100 scalefont setfont
+(NimbusSanL-Regu) findfont 100 scalefont setfont
 1.000 UL
 LTb
 630 300 M
@@ -591,5 +591,5 @@ grestore
 end
 showpage
 %%Trailer
-%%DocumentFonts: NimbusSanL-Regu+g
+%%DocumentFonts: NimbusSanL-Regu
 %%Pages: 1
diff --git a/future/latencytrend.eps b/future/latencytrend.eps
index 5db0682..676578b 100644
--- a/future/latencytrend.eps
+++ b/future/latencytrend.eps
@@ -249,7 +249,7 @@ gsave
 0.100 0.100 scale
 0 setgray
 newpath
-(NimbusSanL-Regu+g) findfont 100 scalefont setfont
+(NimbusSanL-Regu) findfont 100 scalefont setfont
 1.000 UL
 LTb
 570 300 M
@@ -449,5 +449,5 @@ grestore
 end
 showpage
 %%Trailer
-%%DocumentFonts: NimbusSanL-Regu+g
+%%DocumentFonts: NimbusSanL-Regu
 %%Pages: 1
-- 
2.7.4


