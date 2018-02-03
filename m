Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=jhZb4Fs9PrbKU2q2V4Tt5kalEy8+Dtz1S8Nejjw5S9Q=;
 b=UB5Lza0ngocS2Up7MSDsMdbWQ/ZzK7XCMCqkYs9Dp8MwxbOEISFjmPsgyprg1aDrGH
 Fp3xwQ5XteemPRKKj66PZIR4m+XfWDbDMguMZ0nVgUvh0BBeIf9p0Q5ljoVB5htuqR22
 VmrI5pDgBInNaWrwo6dgBRqhp6lW9BZ1Rb9/Xs8kgeyJkRl2SM+PvFPp0WXGVSlLZ2wV
 TW1EEGdYlFHQFuamd5qhLBaAIni4Hko75tRivbMbRuGGQzd+PiU5/5lWuno2yuuzatYv
 DSQ3lmzgdGyvaV8Ppla4LG9GSqmEmlz47odz5d1zLekB/gLJeACX8NBV01A8oCj8Tf6v
 GFfQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] bib/QC: Fix url of 'NobelPrizeChemistry2017'
Message-ID: <8f138f22-8421-5600-6166-4e2feb4ef602@gmail.com>
Date: Sat, 3 Feb 2018 14:06:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6255a56b31fd895e0602f1c62a454c1efa61d821 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 3 Feb 2018 14:01:00 +0900
Subject: [PATCH] bib/QC: Fix url of 'NobelPrizeChemistry2017'

Use proper URL of the press release.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/QC.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/QC.bib b/bib/QC.bib
index ebef662..48cadd2 100644
--- a/bib/QC.bib
+++ b/bib/QC.bib
@@ -925,7 +925,7 @@
 ,month="October"
 ,day="4"
 ,year="2017"
-,note="\url{Cool microscope technology revolutionises biochemistry}"
+,note="\url{https://www.nobelprize.org/nobel_prizes/chemistry/laureates/2017/press.html}"
 }

 @unpublished{JohnTimmer2017ChemistryNobel
-- 
2.7.4

