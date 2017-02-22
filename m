Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=L9lMiMpnaiEAQQkWiZncyQQ3o1uEZIFjOyi9I93haa0=;
 b=RXJssKU2+Azz72TINgw6/WJv5zvOh8230I0XIeHBuePi6wIQTAIAk/W17JLchRCKKs
 0xUkWpLgZzauIMsWb5h2uMDl4p3qh0mlM1ldpNV4NozDtqrHKTLRmSbYIHl6sbIDs+u7
 Nb2fJPN3zP6eYCZZK2h24WCUIx8/zvvx2/nGqdoog9V0nwoOEZk6CMa9vTiYOOdJMat6
 RoE1rrhuGHRCkT0dDPB7kzd1v3BUNW+5sJ/eukykCrLPCqpPFUK7fnNmxFzWjDVhGZfH
 JAGYh8cdaif7NunB3NhxyyxUSzdLglWakt96+fSrLngn5T+B9Qu4JXqyhNg+gDyYYLwo
 7kvQ==
Subject: [PATCH 1/3] bib/WFS.bib: Update info in Valois95a
References: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <09a46fb0-f7a9-a1b0-3b62-3551eb74727b@gmail.com>
Date: Wed, 22 Feb 2017 23:28:43 +0900
MIME-Version: 1.0
In-Reply-To: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cd3298034ccf5b92e6e2ce8a689077280562a980 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 12 Feb 2017 12:17:02 +0900
Subject: [PATCH 1/3] bib/WFS.bib: Update info in Valois95a

Update and append info from what is available at ACM digital
library.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/WFS.bib | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/bib/WFS.bib b/bib/WFS.bib
index d7efdf6..1337a7f 100644
--- a/bib/WFS.bib
+++ b/bib/WFS.bib
@@ -106,9 +106,13 @@ Linear or Sublinear Complexity"
 ,author="John D. Valois"
 ,title="Lock-Free Linked Lists Using Compare-and-Swap"
 ,Year="1995"
-,booktitle="Symposium on Principles of Distributed Computing"
-,pages="165--172"
+,location="Ottowa, Ontario, Canada"
+,booktitle="Proceedings of the Fourteenth Annual ACM Symposium on Principles of Distributed Computing"
+,series="PODC '95"
+,pages="214--222"
 ,doi="10.1145/224964.224988"
+,publisher="ACM"
+,address="New York, NY, USA"
 }

 @unpublished{MagedMichael95a
-- 
2.7.4


