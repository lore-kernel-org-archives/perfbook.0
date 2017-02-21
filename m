Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=FR9d2vT3U5XkbNYJ7KNShP7jVLyNz9Rd1XY5A/qSEVQ=;
 b=Imxn9JV7p2QGXWZjoKPiocRYFbZ9ip5M5eXP54mW2+lATvPpXAOQnFaLoG2FlX+nsv
 1FfxwJ7+9rDbTtzkNuMt/aXWT7LlqY5UXe9WlozIB8uiB4ZIGm6z+d/Nyob01PzSQ9bW
 FgSRdMSCapYj157hW1Ux9/eNtuKz0/UUrCpnIXIsHtoiibxLbmPhKABvggalgAz8RsBR
 SMRlq+rSRndh4yT0ACBiCEoFa1MRZLnv/nA1MynOon+KVjlD4fIAwaitH1iz/XEX0nM8
 1XuFACBpm+vLJyY/nB6zaKbGGNSiST/wU61fnh2TbkgUsBJJbRZ34Lfkb4XIGBNYENc+
 x0dA==
Subject: [PATCH 2/2] Bibliography updates (append urls -- part 4)
References: <a3c6603e-ad1d-4fac-436a-66bfc7f04f41@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <34cf8c2f-ac97-791b-3dd2-efb8753b515a@gmail.com>
Date: Wed, 22 Feb 2017 00:34:22 +0900
MIME-Version: 1.0
In-Reply-To: <a3c6603e-ad1d-4fac-436a-66bfc7f04f41@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2c92330c2d7283b75da814c04dd3b668af461ec2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 7 Dec 2016 23:35:51 +0900
Subject: [PATCH 2/2] Bibliography updates (append urls -- part 4)

This commit appends urls to the following patent entries:

  o LukeBrowning2005SimpleLockNUMAAware
  o BenJackson02
  o McKenney02d

Urls are those of Google Patent.
"number" fields are divided into "type" and "number" fields to
avoid redundant output of "Technical Report".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 04c405f..c702ac5 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1207,8 +1207,11 @@ Ramakrishnan Rajamony and Ronald Lynn Rockhold"
 ,institution="US Patent and Trademark Office"
 ,address="Washington, DC"
 ,year="2002"
-,number="US Patent 6,473,819"
+,type="US Patent"
+,number="6,473,819"
 ,month="October"
+,url="https://www.google.com/patents/US6473819"
+,lastchecked="December 7, 2016"
 }

 @techreport{McKenney02d
@@ -1217,8 +1220,11 @@ Ramakrishnan Rajamony and Ronald Lynn Rockhold"
 ,institution="US Patent and Trademark Office"
 ,address="Washington, DC"
 ,year="2002"
-,number="US Patent 6,480,918"
+,type="US Patent"
+,number="6,480,918"
 ,month="November"
+,url="https://www.google.com/patents/US6480918"
+,lastchecked="December 7, 2016"
 }

 @inproceedings{McKenney02e
@@ -1265,8 +1271,11 @@ Simple Locks in a Multiprocessor System"
 ,institution="US Patent and Trademark Office"
 ,address="Washington, DC"
 ,year="2005"
-,number="US Patent 6,842,809"
+,type="US Patent"
+,number="6,842,809"
 ,month="January"
+,url="https://www.google.com/patents/US6842809"
+,lastchecked="December 07, 2016"
 }

 @inproceedings{YossiLev2009SNZIrwlock
-- 
2.7.4


