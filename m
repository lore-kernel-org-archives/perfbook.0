Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=2Ebv94h5fqzDcjKF3wBfOHkGrO7ElyCwX0+3j0r1dwI=;
 b=YueUg1pNXRPlF+gc4FSvEZnWGZWP/jreclEVnh+9qcyTRN/7j2swz0vE74Db72TVaZ
 xhJTWiEYpOPuukctED6ajTZ3xfgXgwuMub5gaOc9wtiXMtfwGdkYvtosRZa2XJimEDw/
 JpzPqSSPL2maVzRQ/QAvUKK9DZtjxadw+tf9hNKR+/R79YGw8bo2qDvD3VK/yR99r+2h
 PYYxf9rG1RkBeRWWjTHV062iT9gB0q/gzhH7jP10hRfyiqfMbwo3+x5KrmzX6f/KMa89
 s/WDeDtH1bH6yTzaOtqCz0lr5IPocwAT3/LyfmtQXshTVi7xuHLJSBUljT/+ucld1/90
 FJNA==
Subject: [PATCH 4/8] bib/syncrefs: Add doi to Kontothanassis97a
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <71c01432-ecaa-d43b-269e-b44bd7cdf1ce@gmail.com>
Date: Mon, 30 Jan 2017 00:30:48 +0900
MIME-Version: 1.0
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ab76f3f9691060ea7b88561e6027a9ee65857f45 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Nov 2016 13:23:45 +0900
Subject: [PATCH 4/8] bib/syncrefs: Add doi to Kontothanassis97a

Also fix publication info to match what is found in ACM Digital
Library.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index aa2baad..073ada8 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -311,11 +311,12 @@ Symposium on Computer Architecture"
 ,author="Leonidas Kontothanassis and Robert W. Wisniewski and Michael L. Scott"
 ,title="Scheduler-Conscious Synchronization"
 ,Year="1997"
-,Month="January"
-,journal="Communications of the {ACM}"
+,Month="Feburuary"
+,journal="{ACM} Transactions on Computer Systems"
 ,volume="15"
 ,number="1"
 ,pages="3--40"
+,doi="10.1145/244764.244765"
 }

 @Conference{HubertusFrancke2002Futex
-- 
2.7.4


