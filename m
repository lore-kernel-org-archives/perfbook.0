Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=OlRIOiGFIobcHNcJ2XAfILi8MgaFvQw0Y87NlKrBCRE=;
 b=agTKbQdzatJPAAHs5nL8OVBxHbv1ps9ryUP5hlgjMdhK8FtRqiOF+hZIMbUodV8dT/
 HxzTMRlNUlW3XB2r9NVafXsGrDE2B6KJRGbXvPN9DGNaPIzAB1Cr4WAkAiltK2RgkdtU
 GQcyMt0Xy2NLk1lIGaPBwczeZMQOeYucBdoHNU1n6lxnlC4bDX3oYf804C81uOq5UURe
 GDF5Knbo2Rrj5xY3PS8Q4B2bWpKeXFnkWBqp+QZOgUJUkk3fOoDG+tzyE3cRH3jQugJA
 2aGybVRZiaLPO7jYQyWlGyLJOHPeEIOu04OhS8MezA5Z06XykTCR/4k2I2ZYTY8ZSfif
 CAEg==
Subject: [PATCH 2/7] bib/syncrefs: Update BengHongLim94
References: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b9133ca7-47de-b089-2f4f-a2a78f0eb437@gmail.com>
Date: Mon, 23 Jan 2017 00:00:28 +0900
MIME-Version: 1.0
In-Reply-To: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 80704785f24340754b811f5ec79c0256345ac99a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Nov 2016 13:46:00 +0900
Subject: [PATCH 2/7] bib/syncrefs: Update BengHongLim94

This paper was later presented at ASPLOS VI in October 1994.
Update the bib info accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 0c07ee4..4f46fe5 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1129,12 +1129,21 @@ Multiprocessors"
 ,pages="51-63"
 }

-@unpublished{BengHongLim94
+@inproceedings{BengHongLim94
 ,author="Beng-Hong Lim and Anant Agarwal"
 ,title="Reactive Synchronization Algorithms for Multiprocessors"
+,booktitle="Proceedings of the sixth international conference on Architectural support for programming languages and operating systems"
+,series="ASPLOS VI"
+,location="San Jose, California, USA"
+,pages="25--35"
+,publisher="{ACM}"
+,address="New York, NY, USA"
 ,Year="1994"
-,Month="March"
-,Note="03/28/94 FTP hing.lcs.mit.edu /pub/papers/reactive.ps.Z"
+,Month="October"
+,doi="10.1145/195473.195490"
+,Note="URL:
+\url{http://groups.csail.mit.edu/cag/pub/papers/pdf/reactive.pdf}"
+,lastchecked="November 13, 2016"
 }

 @conference{Wisniewski94
-- 
2.7.4


