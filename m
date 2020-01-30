Return-Path: <SRS0=aoJh=3T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kmig+qCuwYOCL/nBpYh+fCZpaUU6OI25nLFrgRwxVzk=;
        b=riNOg3DcDAn/VcuOeTLREiHf8u++Zl69isZ95Z7PdjH29KGsySTxWPzj9m4APazhXB
         O9OUeTVODaSau6M9B4iwx49jrlWLnDrU1yMJSq8jP7CjH50qEp+O1d88Tvul2Hc+0wZB
         XpIuCu4opg+0GupE+e4pmnOH1NIyJ8niCFwC7I1qhA1Nn7q6ImRNM83mhcBz9dYZiYdj
         BcCcCbp9cZNdmn8TXgrVDnOo3uTTQnZ7QaEX8/faWsWO6udIUStCWMBqnHF5Y7I3UdFv
         LeqCGt36HjtTeFhzN4cogLPQqRvqZdzKA9Yt/pwnybxpizOMGdfXyT54t0Sz+Xvg/3w8
         rnDw==
Subject: [PATCH 4/6] FAQ-BUILD: Add 'fvextra' to the list of packages in item
 10
References: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8618c4c5-379c-efb0-dcdd-c35d8c7c372c@gmail.com>
Date: Fri, 31 Jan 2020 07:39:23 +0900
MIME-Version: 1.0
In-Reply-To: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 02048d49fdfaa3a25fef817fa64bdac7dfafd752 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Jan 2020 16:08:31 +0900
Subject: [PATCH 4/6] FAQ-BUILD: Add 'fvextra' to the list of packages in item 10

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 27780759..98cfb57b 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -178,13 +178,14 @@
 		On upstream TeX Live (assuming user mode installation):
 			tlmgr install newtx
 
-10.	Building perfbook fails with a warning of buggy cleveref/listings
-	or version mismatch of titlesec/draftwatermark/epigraph.
-	What can I do?
+10.	Building perfbook fails with a warning of buggy cleveref/listings,
+	version mismatch of titlesec/draftwatermark/epigraph/fvextra, or
+	missing fvextra. What can I do?
 
 	A.	They are known issues on Ubuntu Xenial (titlesec),
 		Ubuntu Bionic (cleveref), TeX Live 2014/2015 (listings),
 		TeX Live releases prior to 2015 (draftwatermark),
+		TeX Live releases prior to 2017 (fvextra),
 		and TeX Live releases prior to 2020 (epigraph).
 		This answer assumes Ubuntu, but it should work on other
 		distros.
@@ -195,6 +196,7 @@
 		http://mirrors.ctan.org/macros/latex/contrib/listings.zip
 		http://mirrors.ctan.org/macros/latex/contrib/draftwatermark.zip
 		http://mirrors.ctan.org/macros/latex/contrib/epigraph.zip
+		http://mirrors.ctan.org/macros/latex/contrib/fvextra.zip
 
 	    2.	Install it by following instructions at:
 		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
-- 
2.17.1


