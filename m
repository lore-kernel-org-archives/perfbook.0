Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vAAolsoElOymxvCytyzBfTBPHd+kgU1ayLGhpisuWJQ=;
 b=lwf48dvnf9uabn/5Yot6UFOnO5uiUma49aCcXsTCg2nIeIO/Cs4Es4Yr7AmHmcnmak
 pfnCPAzQAgeZXnT0ovYPmNUaHNs+hdfjG3vygGPS85f8yGEuj3YFWTCJkLyE2FkFjt32
 3+mfv0KBX8qbpgNUJR3dt9kvAZLxNFtn7tRkFFeOZLvQkdAZuz41z9sI2Dx+7HDLWLhI
 iEatWUuUON0x3QCb9vMLCTib0vnELAh3W4FNrZafHYwmKwcUT69qi2Itqcaz3OCTCFOu
 6vuLgG2zyKUUCzhB9jhU1b28MD4EuHuEPXI/ATQUArpHuR/lJy69gX7Ey10iMX4Y7Sqs
 ZrsA==
Subject: [PATCH 3/9] FAQ-BUILD: Add note on Fedora 28, 27, and other Linux
 distros
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8c7cb2a8-fcdb-7f63-b44b-59305f9f742b@gmail.com>
Date: Sat, 12 May 2018 13:16:43 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 093da12a7fea59ddddf2c1cac6a4ad878aed14af Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 00:40:03 +0900
Subject: [PATCH 3/9] FAQ-BUILD: Add note on Fedora 28, 27, and other Linux distros

Also remove out-of-date info on RHEL and Fedora.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index bf81a85..6faa705 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -56,27 +56,30 @@
 		You might need to fetch a version of a2ping which is
 		compatible with Ghostscript 9.22. See #7 below.

-		On Fedora 26, installing the following set of packages
-		suffices:
-			texlive-a2ping fig2ps graphviz inkscape
+		On Fedora 28 and 27, installing the following set of
+		packages suffices:
+			texlive-collection-binextra
 			texlive-collection-latexextra
+			texlive-collection-fontsextra
+			fig2ps graphviz inkscape

-		Other systems might provide similarly named packages.
-		For example, Doug Miller noted that the following list
-		of teTeX components worked for him on RHEL5:
+		You need to install a version of a2ping compatible
+		with Ghostscript 9.22 or later. See #7 below.

-			tetex tetex-afm tetex-dvips tetex-latex latex2html
-			texinfo tetex-fonts tetex-doc tetex-xdvi
+		On other Linux distributions such as RHEL/CentOS and
+		Scientific Linux, where support of TeX Live packages
+		is insufficient, manually installing TeX Live should
+		be a reasonable choice.
+		See: https://www.tug.org/texlive/quickinstall.html

-		For another example, Frederic Weisbecker reports that
-		the following packages allows perfbook to be built on
-		Fedora 19:
+		NOTE: In doing so, you might end up in having
+			redundant texlive packages of your choise
+			of distribution to satisfy dependency
+			of other packages.

-			texlive-latex texlive-collection-latexextra
-			psutils texlive-math* texlive-bibtex latex2html
-			xfig (and maybe also gnuplot-latex
-			texlive-publishers-doc texlive-fonts-extra
-			texlive-science).
+		Besides TeX Live, you need the following list of
+		packages:
+			fig2ps graphviz inkscape

 6.	I cannot build perfbook, and the perfbook.log file complains
 	about some obscure package being missing.  What do I do?
@@ -111,9 +114,9 @@
 	install those packages?

 	A.	The simplest approach is to upgrade to a recent TeX
-		distribution such as TeX Live 2016.  Upgrading your Linux
-		distribution (e.g. to Ubuntu Xenial) is one way to
-		upgrade TeX Live (to 2015 on Xenial), and might	have many
+		distribution such as TeX Live 2018.  Upgrading your Linux
+		distribution (e.g. to Ubuntu Bionic) is one way to
+		upgrade TeX Live (to 2017 on Bionic), and might	have many
 		other benefits as well.

 		However, if you prefer to manually install individual
-- 
2.7.4


