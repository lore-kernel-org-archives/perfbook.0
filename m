Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=zzEjp92lRyRpIPAd1E+1A1fAAqfOKTh/Dijmvtn5fVw=;
 b=XCisl5ZGK6OOf6yeEu9e+9J3Ydh7Wl3JuHBYPokmN1IDCy3BxUcOyLAXJLDlMG8MNe
 YgUnuhy3xzp2o7/RwdUAsjba6DO3tB8VdYGc8KOizxwhsZzEhY7Mpmg3uqHD1jI5k19W
 nEQrby38vJo7zGbB4f6gV4LNbNtwo5+oyrOQIPZ8Zef/4AzH4U4+8IS5s6AIQhT0hEfv
 H5nT0pC6upjBG5bsbTMuOb4fhc8EHSfTUFDkJd3wibg1pdBV7P0wrbLBEdF3e2L472sq
 AWRmNbvtdCWADNhqPA/99YUSkullcSdAIW4Iy9cb4h9o59Jkkz3ahqqIAP3HKWBRwdNj
 JdDg==
Subject: [PATCH] runlatex.sh: Band-aide fix of false positive in font check
References: <0b0668b6-76b8-2490-9777-1e0aa0e10280@gmail.com>
 <09228564-927a-0300-9f7c-7c86915092c0@gmail.com>
 <20160519194651.GV3528@linux.vnet.ibm.com>
 <27cce515-fa2c-f32e-fb35-ae0439a11207@gmail.com>
 <7c8fa167-70f1-9d01-d3db-2c2de2b6161f@gmail.com>
 <20160520041308.GB3528@linux.vnet.ibm.com>
 <169da448-5839-5b48-555f-19ef2d358722@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3aea7e70-9953-114e-4b3f-63a8bab23dd4@gmail.com>
Date: Fri, 20 May 2016 21:01:56 +0900
MIME-Version: 1.0
In-Reply-To: <169da448-5839-5b48-555f-19ef2d358722@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 847855f817eaf1778d0c6a4bc6fb58f9541ba6f0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 20 May 2016 20:45:14 +0900
Subject: [PATCH] runlatex.sh: Band-aide fix of false positive in font check

inkscape's font embedding seems to depend on the version of cairo.
This commit restricts the check in runlatex.sh to a specific
version of cairo (1.13.1).
When more info is available on the version range we can check in
this way, the restriction can be loosened.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 9ae9021..0be1229 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -113,12 +113,15 @@ echo "'$basename.pdf' is ready."
 # to avoid redundant run of bibtex and pdflatex
 touch $basename.bbl
 touch $basename.pdf
-if ! grep -q -i "steel city comic" cartoons/*.pdf
+if strings cartoons/r-2014-Old-man-and-Brat.pdf | grep -q -i "cairo 1.13.1"
 then
-	echo "#######################################################################"
-	echo "## Steel City Comic font is not found in the resulting PDF!          ##"
-	echo "## Some speech balloons in the cartoons have been rendered awkwardly. ##"
-	echo "## See item 1 in FAQ-BUILD.txt for the solution.                     ##"
-	echo "#######################################################################"
+	if ! strings cartoons/r-2014-Old-man-and-Brat.pdf | grep -q -i "steel city comic"
+	then
+		echo "#######################################################################"
+		echo "## Steel City Comic font is not found in the resulting PDF!          ##"
+		echo "## Some speech balloons in the cartoons have been rendered awkwardly.##"
+		echo "## See item 1 in FAQ-BUILD.txt for the solution.                     ##"
+		echo "#######################################################################"
+	fi
 fi
 exit 0
-- 
1.9.1


