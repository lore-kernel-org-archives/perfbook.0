Return-Path: <SRS0=LMFo=SG=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ObkHSnjqffFQJIU+kJQe7iScl3mbKyfNx+BmN5pRDZA=;
        b=eoFf+ALVpWac5OZFDtlBdvCbXw5jL2CACC7tKkxkyksvC7KXkyfJilhPGKnAFBQCuR
         zVZvAZn64odxaqO2JB0wrz+EQ992iFum8cUJUGUAxZyyRYe7KA+MqzUz+foNIWeFZzDs
         Xq54pYAYPy0ERLrY37fvq2UqbpL2qFecBHUE9OiaeXYvrKwLyZDqWEbaCCpP6Ku3WZC6
         GpL0WzF7pa/mix4jEpGtfGTVxr5vGPDnQ0bYnjjNvydj6lLIcMEfyKcFGWokZR8CLSeX
         rSGOe7lT3G/V7WXTkbMX8cvkbkbnQ65RNKf8kSq6+ELoSgzVEaQ/7rjavHktkwPceF2/
         y0hg==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook v3] RFC: make some bibliography items better
Date: Sat, 22 Jan 2022 11:35:15 +0800
Message-Id: <20220122033515.3260210-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

make following bibliography items better
1. "Relativistic Red-Black Trees"
2. "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded Execution"
3. "Architectural Support for Software Transactional Memory"
4. "Transactional Memory Architecture and Implementation for IBM System z"

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com> 
---
Thank Akira for your valuable advice!

I learned a lot during the process, thank you!

Following is my new version, further suggestions is very welcome ;-)

Many thanks

Sincerely
Zhouyi
--
 bib/RCU.bib |  8 +++++---
 bib/TM.bib  | 14 +++++++++-----
 2 files changed, 14 insertions(+), 8 deletions(-)

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
index e4412afd..d468c691 100644
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
@@ -963,15 +965,17 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
  note="\url{https://paulmck.livejournal.com/tag/transactional%20memory%20everywhere}",
 }
 
-@unpublished{ChristianJacobi2012MainframeTM,
+@conference{ChristianJacobi2012MainframeTM,
  author={Christian Jacobi and Timothy Slegel and Dan Greiner},
  title="Transactional Memory Architecture and Implementation for {IBM} {System} z",
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
+ note="\url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",
 }
 
 @conference{JustinGottschlich2013TMdebug,
-- 
2.25.1

