Return-Path: <SRS0=CZ29=SF=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7qRKkvvQcsTl1kcxfOAMLUy/99sxglif8udNvLC6oU=;
        b=BZ2KGOmK5iEPpJ15OQR5BY6AkkjQj0FC3a/2o+WwokQhc9S+ucm5nqiRcJNSadMX+i
         ypAAEAFz9oqy9KnhfKpcjq5LiLZuaSLzq5u3yFpWZZYQsIt5pm6wKtVN+YLBhkmjEU7Y
         kSjPG272SKtAwwl1l+mJTxkOe8l2vHehbUE01Ka+cyy8Fa71lzmhdJo4i6j17C1LCeh/
         l8VhO/5Pzq1uKoynol9l2ZmiabVLIMW7emmaWyYI9adeX8GN9V0peUPrp7InrKJStFZ6
         I2LDHpuqnoESRJ2RxmpChhSwh0Oy9o14C35n6YBa56JMdlROCQ9Aus8Q+U8xCHSNfLYJ
         dQjQ==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook v2] RFC: make some bibliography items better
Date: Fri, 21 Jan 2022 23:49:33 +0800
Message-Id: <20220121154933.11778-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

make following bibliography items better
1. "Relativistic Red-Black Trees"
2. "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded                                                             Execution"
3. "Architectural Support for Software Transactional Memory"
4. "Transactional Memory Architecture and Implementation for IBM System z"

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com> 
---
Hi Paul and Akira

I try to make some bibliography items better.
Also avoid include URL info when the item has DOI info. 

I have double checked the changes. 

Many thanks
Zhouyi
--
 bib/RCU.bib |  8 +++++---
 bib/TM.bib  | 15 +++++++++------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 3e2bf423..12c37619 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -2190,11 +2190,13 @@ lot of {Linux} into your technology!!!",
  author = {Philip W. Howard and Jonathan Walpole},
  title = {Relativistic Red-Black Trees},
  journal = {Concurrency and Computation: Practice and Experience},
- year = {2013},
+ year = {2014},
+ month = "November",
  issn = {1532-0634},
- pages = {n/a--n/a},
+ pages = {2684--2712},
+ volume = {26},
+ number = {16},
  numpages = {29},
- url = {http://dx.doi.org/10.1002/cpe.3157},
  doi = {10.1002/cpe.3157},
 }
 
diff --git a/bib/TM.bib b/bib/TM.bib
index e4412afd..87c7a95a 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -117,6 +117,7 @@ on Computer Architecture",
  Title = "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded
 Execution",
  Booktitle = "Proceedings of the 34\textsuperscript{th} Annual ACM/IEEE International Symposium on Microarchitecture",
+ series = {MICRO 34},
  publisher="The Institute of Electrical and Electronics Engineers, Inc.",
  month="December",
  year="2001",
@@ -372,7 +373,8 @@ Languages, Compilers, and Hardware Support for Transactional Computing},
 @inproceedings{BratinSaha2006MICRO,
  author = {Saha, Bratin and Adl-Tabatabai, Ali-Reza and Jacobson, Quinn},
  title = {Architectural Support for Software Transactional Memory},
- booktitle = {MICRO 39: Proceedings of the 39th Annual IEEE/ACM International Symposium on Microarchitecture},
+ booktitle = {Proceedings of the 39\textsuperscript{th} Annual IEEE/ACM International Symposium on Microarchitecture},
+ series = {MICRO 39},
  year = {2006},
  isbn = {0-7695-2732-9},
  pages = {185--196},
@@ -963,15 +965,16 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
  note="\url{https://paulmck.livejournal.com/tag/transactional%20memory%20everywhere}",
 }
 
-@unpublished{ChristianJacobi2012MainframeTM,
+@conference{ChristianJacobi2012MainframeTM,
  author={Christian Jacobi and Timothy Slegel and Dan Greiner},
- title="Transactional Memory Architecture and Implementation for {IBM} {System} z",
+ title= "Transactional Memory Architecture and Implementation for IBM System z",
+ booktitle="Proceedings of the 45\textsuperscript{th} Annual IEEE/ACM International Symposium on Microarchitecture",
+ series = {MICRO 45},
+ pages = {25--36},
  month="December",
  year="2012",
+ address={Vancouver B.C. CANADA},
  doi="10.1109/MICRO.2012.12",
- note="The 45\textsuperscript{th} Annual IEEE/ACM International Symposium
-on MicroArchitecture, URL: \url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",
- lastchecked="November 13, 2016",
 }
 
 @conference{JustinGottschlich2013TMdebug,
-- 
2.25.1

