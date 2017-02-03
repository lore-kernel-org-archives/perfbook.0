Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=1gOLYbKc2ClR9Nn2I/ZjQzF8bM5/MvquvNFpswojVhw=;
 b=GtIIbUAzFH5NDJWNaGErb+q8fIM8/V1yxhEGbDzQ/MtwnXtXRMHUYsS3ZFWqnwaGln
 wquWJpoxpcs4Kyb0Lz5t4lXYmJ3bcLJcrYO0GHpIopDiaeqL8/wdbK+26FusF6uv+nrk
 vMiNwsiTSpYm35LZxvf0IQACHPzRro9WblFbuiNWM5GKd5VxqTDHBNSWm7s9AkdyHdUK
 G7jelMjq2iRnMfilerrZ+saq1GMgxLw9Ao9pfRnkMhT9S38/AjUdFICGbX9a4qBNeiRO
 rEITdcBPzwszCvUrnM736cOlb0PJt2sW9q9C1QEqBO3GILekreVjAb4UqJn6imwZjYmQ
 E83g==
Subject: [PATCH 5/7] bib/hw: Salvage url of CSIRACMuseumVictoria
References: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <932028f8-7205-c301-f4a4-0d059af5fa0b@gmail.com>
Date: Fri, 3 Feb 2017 23:09:23 +0900
MIME-Version: 1.0
In-Reply-To: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c1f9f4728d8f2ee87300a4fcdd7fef9fbc3de18b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 14 Nov 2016 09:43:31 +0900
Subject: [PATCH 5/7] bib/hw: Salvage url of CSIRACMuseumVictoria

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 8a9aab0..66502d7 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -112,9 +112,9 @@ year="1992"
 ,Author="{Museum Victoria Australia}"
 ,Title="{CSIRAC}: {Australia's} First Computer"
 ,year="2004"
-,note="Available:
-\url{http://museumvictoria.com.au/CSIRAC/}
-[Viewed: December 7, 2008]"
+,note="URL:
+\url{http://museumvictoria.com.au/csirac/}"
+,lastchecked="November 14, 2016"
 }

 @unpublished{CSIRACUniversityMelbourne
-- 
2.7.4


