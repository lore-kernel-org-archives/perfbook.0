Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r8MgVlVcKVTH5NgTqD7bNEAa/Tgbug5gQ4n/X873V6Q=;
 b=GAmmtHJAA7xbHhPK1vY8kyz5RYOViJoMa0Y3B5gUnUK50j6JdrvG6IupTPo4iIxAtf
 8KnJ5KIhFqN7ln67Z714DdBuAHIQLguy5Xc9PqS/IuT+Byx7cFDRq4q6f6uVBWXNlcfO
 3jtTwgpGe26rWUDZy6vHDfQCnT2oyqENXsa4QYFeFyxHAO3PqhV3W3S1A8SF/TM566PY
 MpES4xD+YCfdVQoiS89NrLl5//BQQwWoqwxzJBKl8cjTrpOKR/1W+sMM7LLLzaFsq4Xe
 NTVSBkyZR85tzYhWv4h9yjxhPkblLWT3gPK2nad7yq1diWOQRbDMSp8Ahic7CyhHhrJH
 eEUQ==
Subject: [PATCH 5/5] FAQ-BUILD: Remove latex2html in package list
References: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <752604dc-8902-4901-8c77-531dc4187e08@gmail.com>
Date: Wed, 2 May 2018 13:20:50 +0900
MIME-Version: 1.0
In-Reply-To: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9a745e15ae38e8cfc329a365f2ff28112a19a5c3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 30 Apr 2018 23:50:23 +0900
Subject: [PATCH 5/5] FAQ-BUILD: Remove latex2html in package list

Update lists for distributions still supported.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index e0ae289..bf81a85 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -41,7 +41,7 @@
 			texlive-latex-base texlive-latex-extra psutils
 			texlive-publishers-doc texlive-fonts-extra
 			texlive-math-extra texlive-publishers
-			texlive-science texlive-bibtex-extra latex2html
+			texlive-science texlive-bibtex-extra
 			gnuplot-x11 xfig inkscape graphviz fig2ps

 		On Ubuntu Trusty, in addition to the above, you need:
@@ -51,14 +51,14 @@
 		necessary packages (except for -doc packages):
 			texlive-publishers texlive-pstricks
 			texlive-science texlive-fonts-extra
-			latex2html xfig inkscape graphviz fig2ps
+			xfig inkscape graphviz fig2ps

 		You might need to fetch a version of a2ping which is
 		compatible with Ghostscript 9.22. See #7 below.

 		On Fedora 26, installing the following set of packages
 		suffices:
-			texlive-a2ping fig2ps graphviz inkscape latex2html
+			texlive-a2ping fig2ps graphviz inkscape
 			texlive-collection-latexextra

 		Other systems might provide similarly named packages.
-- 
2.7.4


