Return-Path: <SRS0=QxR5=6T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=bgvgXuKoqEhN7ZFL1q8lgz44kq6i4zJJSc2Qx4rH2SA=;
        b=s2drfAffysHuQAVNDP5gMEZkFl6wG0GjjlM/x13om0sPNGfEbZNlPVmyIIpUqtQCH5
         p/lAESWxbwmQtUnk6VpQBWjJQXjYNC36PUE2xsOc5ze7rgD0yk73+9Z1UA6GClea2NRg
         WmOEAs0NUBkRT8+1LIBr635EgEuJy+EtRam9tfo5o3H3AnZi2+KW4BEQOtwaGEEzDNfZ
         Ftz3Wk3BDVOmzW6ERQY2WXBigwnZ1ngSDF2deGVxZn7owQvENEe/sr9q0itRKr93wri9
         cKcDqqhtvxGdipib8UEwpUsA7wYJam8xgI9eFfdzcnPf5lt7SC5wzNGJJKK8TxKkS/wl
         u1ig==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] FAQ-BUILD: Update on Fedora 32 and Ubuntu Focal (20.04 LTS)
Message-ID: <3a8f2529-b9b2-2e04-b8a0-7cc222a9b74e@gmail.com>
Date: Tue, 5 May 2020 11:44:09 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dc6e6935624f890ed3b0820b34981ec4ded4fdf8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 5 May 2020 11:24:53 +0900
Subject: [PATCH] FAQ-BUILD: Update on Fedora 32 and Ubuntu Focal (20.04 LTS)

Fedora 32 has the same base package of texlive as Fedora 31 did
and building perfbook needs manual update of "epigraph" and a2ping.

Ubuntu Focal (20.04 LTS) compiled its texlive package as of mid-
February 2020 and no manual update is necessary.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index ffb380f2..2eeb9fbb 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -48,7 +48,7 @@
 		Ubuntu Xenial has a buggy version of LaTeX package
 		"titlesec". See #10 below to update.
 
-		On Ubuntu Bionic, the following list should cover
+		On Ubuntu Bionic and Focal, the following list should cover
 		necessary packages (except for -doc packages):
 			texlive-publishers texlive-pstricks
 			texlive-science texlive-fonts-extra
@@ -57,9 +57,9 @@
 		Ubuntu Bionic has a buggy version of LaTeX package
 		"cleveref".  See #10 below to install the latest one.
 
-		You need to fetch a version of a2ping which is
-		compatible with updated Ghostscript (not limited to
-		Ubuntu Bionic). See #7 below.
+		On Ubuntu Xenial and Bionic, you also need to fetch
+		a version of a2ping which is compatible with updated
+		Ghostscript. See #7 below.
 
 		On Fedora, installing the following set of packages
 		suffices:
@@ -104,7 +104,8 @@
 		Copy "a2ping.pl" as "a2ping" into a directory which
 		precedes /usr/bin in your PATH setting.
 
-		a2ping 2.84p should be available in TeX Live 2020 or later.
+		a2ping 2.84p is available in TeX Live 2020 or later
+		(Including TeX Live 2019/Debian).
 
 8.	When I try to build perfbook, it hangs after printing a line
 	reading "pdflatex 1".  How can I fix this?
@@ -131,8 +132,8 @@
 		For other optional font packages, upgrading TeX Live
 		to 2015/Debian (Ubuntu Xenial) or later should suffice.
 
-		Upgrading your Linux distribution (e.g. to Ubuntu Bionic)
-		is one way to upgrade TeX Live (to 2017/Debian on Bionic),
+		Upgrading your Linux distribution (e.g. to Ubuntu Focal)
+		is one way to upgrade TeX Live (to 2019/Debian on Focal),
 		and might have many other benefits as well.
 
 		However, on modern TeX Live, installing -fonts-extra consumes
@@ -251,16 +252,17 @@
 
 		    https://bugs.ghostscript.com/show_bug.cgi?id=700988
 
-		Let's hope Fedora will catch up soon.
-
 		Installing upstream Ghostscript 9.50 (or later) should
 		work with you, but see #7 above to get a compatible a2ping.
 
 		"make neatfreak; make" will rebuild all the figures.
 		The "-jN" option should accelerate the rebuild.
 
-13.	After updating texlive packages on Fedora 31, build fails with
-	the message from bibtex saying:
+	    Note:
+		Fedora 32 has a fixed version of Ghostscript (9.52).
+
+13.	After updating or installing texlive packages on Fedora,
+	build fails with the message from bibtex saying:
 
 		I found no \bibdata command---while reading file perfbook.aux
 		I found no \bibstyle command---while reading file perfbook.aux
-- 
2.17.1

