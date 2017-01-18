Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=Cy/8XM/EOn079ZW8nLUcMsO2jOIJnBz+LLQ7AGgQ76A=;
 b=Oe/OjThnUkWFEB7lQNf/LVfO2c7YN6SHPtGjJ67p+D0Y55Yt1beXjjpGaJPEkvG0h9
 xbK/o6M20no0TAdU3Rf0T6FXPgxaZ6RW/EwzrvOA0uYTRUDDzYf+I07w6zqI0ySDALer
 ymLA9YoH1kJkL6lAsrhnklw18WaF6OeWPkBWI2DYMfDKDk5AxsYEpdGCQM3Z1YZw1r35
 r1WZ4PPvf7BVwJHcC9p+IGWg+fBM09ZLfHdbyohHcQMU/4Uqlg74x3ba07AwTS7kRnJY
 6m1CL3uZsXc0I76+j0SGvsRGWoOWRgfuiXRccn1D2FKKeOIUox4CgFz5hl9+1HF8/1iJ
 Do1A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] bib/TM: Salvage url or replace with doi
Message-ID: <549f772d-3292-e860-e0d5-8d68a86a3bd5@gmail.com>
Date: Thu, 19 Jan 2017 00:33:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4a8befacf6cf23d0452d4071d34025cec1fd1671 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 19 Jan 2017 00:22:24 +0900
Subject: [PATCH] bib/TM: Salvage url or replace with doi

This commit salvages broken url or replace with doi of
the following entries in TM.bib:

  o DaveDice2009ASPLOSRockHTM
  o CliffClick2009AzulHTM
  o Ali-Reza-Adl-Tabatabai2009CppTM
  o ChristianJacobi2012MainframeTM

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

So, I changed my mind. Instead of bombarding you with pull requests of long
branches, I picked up a few commits that actually fix broken urls.
I suppose such a small batch of fixes would be much easier for you to review
and apply.
If this approach is preferable, I'll submit small batches one by one. Just
appending doi or url should have lower priority than actual fixes.
Please let me know what you think.

                                                   Thanks, Akira
--
 bib/TM.bib | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/bib/TM.bib b/bib/TM.bib
index f69370f..7114806 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -585,9 +585,7 @@ Cain and Peng Wu and Stefanie Chiras and Siddhartha Chatterjee"
 for Programming Languages and Operating Systems (ASPLOS '09)"
 ,pages="157--168"
 ,address="Washington, DC, USA"
-,note="Available:
-\url{http://research.sun.com/scalable/pubs/ASPLOS2009-RockHTM.pdf}
-[Viewed February 4, 2009]"
+,doi="10.1145/1508244.1508263"
 }

 @conference{HansJBoehm2009HOTPAR
@@ -642,7 +640,9 @@ for Programming Languages and Operating Systems (ASPLOS '09)"
 ,title="And now some Hardware Transactional Memory comments..."
 ,month="February"
 ,year="2009"
-,note="\url{http://www.azulsystems.com/blog/cliff-click/2009-02-25-and-now-some-hardware-transactional-memory-comments}"
+,note="URL:
+\url{http://www.cliffc.org/blog/2009/02/25/and-now-some-hardware-transactional-memory-comments/}"
+,lastchecked="November 4, 2016"
 }

 @unpublished{Ali-Reza-Adl-Tabatabai2009CppTM
@@ -650,7 +650,9 @@ for Programming Languages and Operating Systems (ASPLOS '09)"
 ,title="Draft Specification of Transactional Language Constructs for C++"
 ,Year="2009"
 ,Month="August"
-,Note="\url{http://research.sun.com/scalable/pubs/C++-transactional-constructs-1.0.pdf}"
+,Note="URL:
+\url{https://software.intel.com/sites/default/files/ee/47/21569} (may need to append .pdf to view after download)"
+,lastchecked="November 12, 2016"
 }

 @unpublished{JoeDuffy2010RetroTM
@@ -882,7 +884,8 @@ for Programming Languages and Operating Systems (ASPLOS '09)"
 ,month="December"
 ,year="2012"
 ,note="The 45\textsuperscript{th} Annual IEEE/ACM International Symposium
-on MicroArchitecture \url{http://www.microsymposia.org/micro45/talks-posters/3-jacobi-presentation.pdf}"
+on MicroArchitecture, URL: \url{http://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}"
+,lastchecked="November 13, 2016"
 }

 @conference{JustinGottschlich2013TMdebug
-- 
2.7.4


