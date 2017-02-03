Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=kHJ/+kfV4h8dDqFiffAlGUVMljdsURNYeVZyeSYQC/Q=;
 b=Ig1VOrq/5NU0yqFv820nya6PxZHCT5r7+GWbaYIQYO8/nGsXnd5Q6cRoBsVR0Z4B+O
 jYyUSPueC+mYg4ApB6fFMNxYH0tMptyjwpD4mhWmed4DgHRRvn6MBIom9fv/qU2VLjs2
 6z0/621ZfjdlQW29QTV5FhVKTyt/PxBip7efbaH6PG+5TzkDGigHnHGOmvHQFpEq1WAk
 IkAM9dn1MQnWhyMFOxz/NcvAOUBU4cx+JtCQ2WBnX9Go4fE2ZhWifSWfmhOD8OLP/eN5
 k+n8KC1ycla2JusgPnWl10sfCWEFqdEw0BH935xBHKgcy4Xin86IoRAAsIlmuW8hBDnB
 HeDg==
Subject: [PATCH 3/7] bib/RCU: Salvage broken url of McKenney01a
References: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <37bfd251-2c29-ce54-65f4-bb0521977c49@gmail.com>
Date: Fri, 3 Feb 2017 23:07:41 +0900
MIME-Version: 1.0
In-Reply-To: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 314a1b978a24a034fd38290c5588577c7d4ca24f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Nov 2016 16:01:57 +0900
Subject: [PATCH 3/7] bib/RCU: Salvage broken url of McKenney01a

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index ccb2d66..6d1e0c9 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -286,10 +286,11 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Booktitle="{Ottawa Linux Symposium}"
 ,Month="July"
 ,Year="2001"
-,note="Available:
-\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
+,note="URL:
+\url{https://www.kernel.org/doc/ols/2001/read-copy.pdf},
 \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
-[Viewed June 23, 2004]"
+"
+,lastchecked="November 13, 2016"
 }

 @inproceedings{Cha:2001:CCC:645927.672375
-- 
2.7.4


