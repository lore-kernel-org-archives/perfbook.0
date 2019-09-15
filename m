Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pl1-f177.google.com ([209.85.214.177]:36711 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfIOWWA (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 15 Sep 2019 18:22:00 -0400
Received: by mail-pl1-f177.google.com with SMTP id f19so15901472plr.3
        for <perfbook@vger.kernel.org>; Sun, 15 Sep 2019 15:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=84/rIf1m13wqCttp6VBj9nkMFvPV4I/MOaMfhDg4jV4=;
        b=XHmqbNACFYXWTZHaCQdCZVR3SSQ27UK9U0YtWuoFEAGk/7A1VFS7TAjo7RbzTfBB4N
         jLvHIJDoSuYV3dPkoe27g/+vhShJ+jGNAGS5OdizoSfGd57zBszdX7XCcpE9uifIG6Wx
         3mtZg2C2XOcqm3FoFaMNH/sASCxuhvMkr7jaxjYHjQtrk5GiBXm0w9zDSKy7mCAsesF+
         fkeA6cWRxSq3tLSRuOPq4G/BrNJOLc38DKKu4rulosbYq4vL33UeCTaQ3PAZKQtgAah+
         atyiAeyCaoF7TyvHfoVwXVmDnZSBrWg8xRCsUh8+qufLh2JBpMMi/hx5GBoxP1RkPOSv
         B5nA==
From: Balbir Singh <bsingharora@gmail.com>
Subject: Fix pdflatex ToC
Message-ID: <aeaa1b9d-1917-a177-3396-da8dd736889c@gmail.com>
Date: Mon, 16 Sep 2019 08:21:54 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: paulmck@linux.vnet.ibm.com

From df15e226d96614ffbdedfd517f8a6d7afc1c0fee Mon Sep 17 00:00:00 2001
From: Balbir singh <bsingharora@gmail.com>
Date: Sun, 15 Sep 2019 21:14:53 +1000
Subject: [PATCH] Make hyperlinks colorful and a browsable pdf TOC

Without these changes the the PDF does not provide
a browsable TOC to choose for navigation, also add
a bit of color to the links to make them screen
friendly.

Also add synctex=-1 to prevent pdf readers like
evince from complaining to the pdflatex command
line

Signed-off-by: Balbir singh <bsingharora@gmail.com>
---
 perfbook.tex               | 1 +
 utilities/runfirstlatex.sh | 2 +-
 utilities/runlatex.sh      | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 85696333..a9a0d813 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -70,6 +70,7 @@
 \usepackage{multirow}
 \usepackage{noindentafter}
 \NoIndentAfterCmd{\epigraph}
+\hypersetup{pdftex, colorlinks=true, allcolors=blue}
 
 % custom packages
 
diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index 1a2a7a58..019d60d8 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -40,7 +40,7 @@ fi
 basename=`echo $1 | sed -e 's/\.tex$//'`
 
 echo "pdflatex 1 for $basename.pdf"
-pdflatex $basename > /dev/null 2>&1 < /dev/null || :
+pdflatex --synctex=-1 $basename > /dev/null 2>&1 < /dev/null || :
 if grep -q '! Emergency stop.' $basename.log
 then
 	grep -B 15 -A 5 '! Emergency stop.' $basename.log
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 289364d7..2a168a8d 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -51,7 +51,7 @@ identical_warnings () {
 }
 
 iterate_latex () {
-	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
+	pdflatex --synctex=-1 $basename > /dev/null 2>&1 < /dev/null || :
 	if grep -q '! Emergency stop.' $basename.log
 	then
 		grep -B 15 -A 5 '! Emergency stop.' $basename.log
-- 
2.20.1

