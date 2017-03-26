Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=DRdU1wZtf4GoY+uAnYX7S/Zsnv+6SVfvTnGZdjzpM4k=;
 b=SOtgi0SAy22qvh5NtGZZj/jvfgHWmlIExYlACCb9YJdEaHUrflvyjtsZJgtLGdI/zd
 BtFiOq4UOGD20mR/WRDcA2uy8v3U9t63IrJj2b0Yjj1McmMOP2KLzUyPJJkPO8jvbtl/
 FcM2MVsRp+Mn4F2JWWJN4ykk/Hzmq11OWjMD5MvMC+GUNO+pxoNPU2tUVRto8c1IknNl
 kDcoPpsPN71kuCBCO0wWBEQbEjzkSTgQiWM+QUQ2fv370cMcU3KTNH1A9lFCAXyWGt6s
 ynKm+KbgBEmrm/231KEVu/PaIckHT3mQbuuYeDKeUvnMVzaURLYDktJEfFtaLwrBb/bN
 gCsA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] bib/QC: Replace UTF-8 encoded chars with escaped codes in
 ASCII
Message-ID: <c7ea071a-a2cb-8279-762a-ec75bd9fe3d1@gmail.com>
Date: Sun, 26 Mar 2017 18:21:59 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From bb2058728b0b9d979b93cc0e0b3ff65a7906d450 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 17:44:22 +0900
Subject: [PATCH] bib/QC: Replace UTF-8 encoded chars with escaped codes in ASCII

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

In yet to be cited bibliography database recently added, I found
several entries with UTF-8 encoded characters.
This patch is to replace them with escaped codes of LaTeX.

Another option is to enable UTF-8 awareness by using "inputenc" package
with "utf8" option. The problem is BibTeX does not support UTF-8.
It is said that combination of "biblatex" and "biber" can bridge
the gap. I'll see if it is feasible for perfbook, but with a lower
priority.

Any help in this respect from someone on the list is welcome!

                                    Thanks, Akira
--
 bib/QC.bib | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bib/QC.bib b/bib/QC.bib
index 551bdbb..d51ecb1 100644
--- a/bib/QC.bib
+++ b/bib/QC.bib
@@ -277,7 +277,7 @@
 }

 @article{LeonidDubrovinsky2012640GPaDiamondAnvilCell
-,title = "Implementation of micro-ball nanodiamond anvils for high-pressure studies above 6 {Mbar}"
+,title = "Implementation of micro-ball nanodiamond anvils for high-pressure studies above 6\,{Mbar}"
 ,author = "Leonid Dubrovinsky and Natalia Dubrovinskaia and Vitali B. Prakapenka and Artem M Abakumov"
 ,journal = {Nat. Commun.}
 ,volume = {3}
@@ -425,7 +425,7 @@

 @article{TroelsFRonnow2014QC-D-WaveNoSpeedup
 ,title = "Defining and detecting quantum speedup"
-,author = "Troels F. Rønnow and Zhihui Wang and Joshua Job and Sergio Boixo and Sergei V. Isakov and David Wecker and John M. Martinis and Daniel A. Lidar and Matthias Troyer"
+,author = "Troels F. R{\o}nnow and Zhihui Wang and Joshua Job and Sergio Boixo and Sergei V. Isakov and David Wecker and John M. Martinis and Daniel A. Lidar and Matthias Troyer"
 ,journal = "Science"
 ,volume = {345}
 ,issue = {6195}
@@ -725,7 +725,7 @@

 @unpublished{BradJones2017IBM-QC-Crowder
 ,Author="Brad Jones"
-,Title="It’s the 1940s again: {IBM's} Scott Crowder on the infancy of quantum computers"
+,Title="It's the 1940s again: {IBM's} Scott Crowder on the infancy of quantum computers"
 ,month="March"
 ,day="13"
 ,year="2017"
@@ -734,7 +734,7 @@

 @unpublished{TomSimonite2017QC-MS-Chemistry
 ,Author="Tom Simonite"
-,Title="Chemists Are First in Line for Quantum Computing’s Benefits"
+,Title="Chemists Are First in Line for Quantum Computing's Benefits"
 ,month="March"
 ,day="17"
 ,year="2017"
-- 
2.7.4

