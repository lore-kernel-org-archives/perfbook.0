Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=xq9/bmZBuvXg6iPRmyoUM4UHR0TS95iqfQj1qCtl5VQ=;
 b=wN7gt0qoBVsgEmLlcvuNBzd9Yb3jvaLYh+5ag+UXzC+FPrPE7p1tXyTerZCBS/j8Iv
 59V+UptJb4RRn2M8uUyglVLAwnPGKT2gQ9hmw+1+aL4ndsuh72MrqR4dE4yUbqQQchy6
 da7cI1x0+hiJHnwKCucsIFr0w5gyEbczhIl2az9kMUXvBgzMPLEzKghjllLjYFlB9ujH
 6r3GMbo6sTvG3wvlb9Q+9qUvlA7BU3innACgZ14yoVqjusWFWCAQtNBgYv/5osO24sS5
 oPc3l84aGyIoEju1ktXmdyEHBUNscUVCBorwp1MDd4mguYWnBWXPSIlQeERFU2nsHWl3
 M94Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] FAQ: remove duplicated prerequisite packages
Date: Fri,  8 Jan 2016 01:59:17 +0900
Message-Id: <1452185957-16022-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Prerequisites for fedora has duplicated entry. This commit removes the
duplicates.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 FAQ.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/FAQ.txt b/FAQ.txt
index a698d3d..9af9cc0 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -30,7 +30,7 @@

 			texlive-latex texlive-collection-latexextra
 			psutils texlive-math* texlive-bibtex latex2html
-			xfig latex2html xfig (and maybe also gnuplot-latex
+			xfig (and maybe also gnuplot-latex
 			texlive-publishers-doc texlive-fonts-extra
 			texlive-science).

-- 
2.5.0

