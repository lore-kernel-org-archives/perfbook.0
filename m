Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=mtHOh6VVecnTj7Nk1yzyi+0yhyVL+ZCzIWQdCVWIkSQ=;
 b=Bht8qDa4SZs6K7i2WMCJ7v4CVzJCoxNR80MK4i/b+cHYXy5xxJKAhceqVO27dUlmdN
 kmqx1wKoS4jcDj2FFxulljFlct0Bag5JAFT/PxP0ZucSLXZWj98+VVZdWPvxuc28FG8T
 xpijDY5lGut8eazjreJiykgh87jMXCZsJpjZGdfB41jXPHyliAqUhZnWB1EtNLEWuNbI
 IC5XMSDO+WtlX25iPKnq9bMFtJBcrWpZQQMLNO6SrIrb/UDfYmtUQeQ3APqYslFPGcV+
 33ivU26rxUkUbtDiZftgUYkCNekFWOd3W/CiPHCVr94ItOys3P9jjodMR/mBlRZqr/AF
 ciYg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] FAQ-BUILD.txt: Update Fedora requirements
Date: Sat, 26 Aug 2017 18:33:14 +0900
Message-Id: <20170826093314.17614-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fedora 24 has officially entered End of Life[1].  This commit updates
necessary pacakges information for Fedora 24 to Fedora 26.

[1] https://fedoramagazine.org/fedora-24-eol/

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 FAQ-BUILD.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 2bd37f1..1fa581d 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -46,9 +46,9 @@
 		On Ubuntu Trusty, in addition to the above, you need:
 			texlive-humanities

-		On Fedora 24, installing the following set of packages
+		On Fedora 26, installing the following set of packages
 		suffices:
-			fig2ps graphviz texlive-epstopdf inkscape latex2html
+			texlive-a2ping fig2ps graphviz inkscape latex2html
 			texlive-collection-latexextra

 		Other systems might provide similarly named packages.
-- 
2.10.0

