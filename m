Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u53r9fjPidIFOS52tkvEoCXF6lh0Iq04eWn3pJ8WzIY=;
        b=WGaBKpo4h+j3cyWfw0H1qotAPf5yF3j1M5Wp9iDNaEgCMj1Gbz7WXauCKHe3YdQI0t
         d0+j0p5NirbthR/pYPgfGXmlIOpk/2KiXZkXe/Hcmy+tlg+QEA3GQI+cp4KIOcFq67an
         /TWyxE8LbuHvlKUDnXJwgfCQATCpwktalLRQ63oc6hy47/q003wPSItPu71LguGN9hw6
         kZew9EPWbqbOE0+jUD3sv35/Iz3q5HGgiOOJ4UvZ68hzS+yujPC2RdDgRSZFtRjNH4bs
         B9g6VrjUhZL4gapfaYHlxL3iSRQfXcp1CIRDU7RakrsNE5erG3EJLw3kMa9xUSeO4BiX
         UPXA==
Subject: [PATCH 4/7] FAQ-BUILD: Update for recent Fedora releases
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6306166b-4bd8-4a92-b540-7d11cca6ec97@gmail.com>
Date: Sun, 21 Jul 2019 09:08:47 +0900
MIME-Version: 1.0
In-Reply-To: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From 4ae74b9f60e29298d3d67736db9a2baa19655842 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 May 2019 00:22:28 +0900
Subject: [PATCH 4/7] FAQ-BUILD: Update for recent Fedora releases

Also remove info for Ubuntu Trusty.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 012a1d69..82cca6e8 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -44,9 +44,6 @@
 			texlive-science texlive-bibtex-extra
 			gnuplot-x11 xfig inkscape graphviz fig2ps
 
-		On Ubuntu Trusty, in addition to the above, you need:
-			texlive-humanities
-
 		On Ubuntu Bionic, the following list should cover
 		necessary packages (except for -doc packages):
 			texlive-publishers texlive-pstricks
@@ -57,16 +54,14 @@
 		compatible with updated Ghostscript (not limited to
 		Ubuntu Bionic). See #7 below.
 
-		On Fedora 28 and 27, installing the following set of
+		On Fedora 30 and 29, installing the following set of
 		packages suffices:
+			texlive-collection-plaingeneric
 			texlive-collection-binextra
 			texlive-collection-latexextra
 			texlive-collection-fontsextra
 			fig2ps graphviz inkscape
 
-		You need to install a version of a2ping compatible
-		with Ghostscript 9.22 or later. See #7 below.
-
 		On other Linux distributions such as RHEL/CentOS and
 		Scientific Linux, where support of TeX Live packages
 		is insufficient, manually installing TeX Live should
-- 
2.17.1


