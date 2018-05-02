Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bQvI6X2pO1nRExx3mXZZEQuwln8dt9AxW06buRJT3Ow=;
 b=iybO3k/PF3PSVLt4vg8KS4yLoCwQK90qaJ/RNTiXqAp+cLkFbg/KGvNjEXu6C1KOpe
 IAnX5g4tACTbfqNYUnYSt1LlsW+kriCoeinGH3ZLEn+TixThixmS6eBrJbUONRdudUy4
 zdhYKjLcjqNBydK05DtSWNVoyL+jDhTo071tPgCBISveXX1ROHBWu0zvRC4zEOi4rA2y
 Voo134RGCZRor5vgD0kk4DLqYG0qzUloeP1WzyzoOR4KwyyMybngUrruBnMBJf0DZZos
 dQQBJAO+nGJJ2h5pMaaOof9w7FANx2SAmDW3NYIQp4ZOdYnCzTSh7KN+pxBjx/r7tk8l
 xg0Q==
Subject: [PATCH 3/5] FAQ-BUILD: Add note on Ubuntu Bionic
References: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8d2fb0cb-df72-5e39-0ff1-58c6eb2d5190@gmail.com>
Date: Wed, 2 May 2018 13:18:38 +0900
MIME-Version: 1.0
In-Reply-To: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 37b458d896098180c42291fc05467ca33ce00609 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 28 Apr 2018 00:55:58 +0900
Subject: [PATCH 3/5] FAQ-BUILD: Add note on Ubuntu Bionic

Ubuntu Bionic has incompatible combination of a2ping (2.77p) and
Ghostscript (9.22) at the moment.
It also has slightly different texlive packages from Ubuntu Xenial.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index ea2c57f..e0ae289 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -47,6 +47,15 @@
 		On Ubuntu Trusty, in addition to the above, you need:
 			texlive-humanities

+		On Ubuntu Bionic, the following list should cover
+		necessary packages (except for -doc packages):
+			texlive-publishers texlive-pstricks
+			texlive-science texlive-fonts-extra
+			latex2html xfig inkscape graphviz fig2ps
+
+		You might need to fetch a version of a2ping which is
+		compatible with Ghostscript 9.22. See #7 below.
+
 		On Fedora 26, installing the following set of packages
 		suffices:
 			texlive-a2ping fig2ps graphviz inkscape latex2html
-- 
2.7.4


