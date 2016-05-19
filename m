Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=+3C3mHdsjRWjUlCCxGNi+1Ptfnsz2Nt6jeW9iTKvIhg=;
 b=GRkYqzi7B/EukV15/2jGMlM2Ej4n67xt25yP9EVs1xCS7cjlZ5ph2fkpV38vlawuW7
 sD+aWLMHvDzxeB9HgG6/DwOx3xPt3Q30y2SRgM1uUSUWgmy1AydctMrpPbmr7MT+BFK/
 9Htub6lfZaDeViT1FfsPAYVt2jtfgEyf3SmZsdM48mSZXd3qJyFb7ZrOYTSemNtO5sy9
 EfIMB9J/zxQEgsn0F+NY2dwl6o1tuPNlHRJkz+Cm2T4KSuHGYwyb+1cuQOHeVUbn4eal
 ttsx/aG2LGJL8ZiFV2RE84dw8gUvM2L3NiDNEwJubauqIkyKR0uDH6FfBQbJIRTWHUDX
 dj7w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] FAQ: Replace deprecated manual font install path
Date: Fri, 20 May 2016 08:20:48 +0900
Message-Id: <1463700048-10268-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

FAQ explains manual font installation with ~/.font/ directory though it
is deprecated[1].  This commit modifies the sentence to use alternative
path.

[1] https://wiki.archlinux.org/index.php/fonts#Manual_installation

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 FAQ.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/FAQ.txt b/FAQ.txt
index 6b13532..febc1df 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -4,8 +4,8 @@
 		fonts/steel-city-comic.regular.ttf. On most modern
 		Linux systems, this can be done easily from your
 		desktop environment, or by copying the file to the
-		~/.fonts directory. You may need to run "fc-cache" to
-		rebuild your font cache.
+		~/.local/share/fonts directory. You may need to run
+		"fc-cache" to rebuild your font cache.

 		Type "make" from the top-level directory.  If all goes
 		well, this will produce a file named "perfbook.pdf",
-- 
1.9.1

