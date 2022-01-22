Return-Path: <SRS0=LMFo=SG=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=InN5+vs+0VVO1LHi+0m9VSKV+drLvaMFUR8JTc4J2vQ=;
        b=pFtw+QBhIw7U/u5DiGdH9mgAecDA7VowVw3ybLI+fYBZNY1YufWM3VmmGjObCQuz3I
         G7Suq9tnmgyAXKHPx5f0s9OaUERqRRTeiDqtR+oS8II2xWDibqK6ljVIvxPW9V4uJifM
         E7tFgbig8CLL28ScNj0tGHsYfyq6GrBkLwfJRLGMDxJuFmsvQFsmEYRr/g74FG7+aMry
         U9NATt3m0/hDc4TDmPmTJo0B/eDrfwzxngA6VeOzFyjR900muoBk5zK/njqqj4u6ovSY
         4oGTGbE3P1X1t1YWQxGP35a/B5RKBoh6mKq9/0Ct0Wvr9vkPSYf/YlTbVwa1uqJ+X4u+
         V9dw==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook v4] RFC: make some bibliography items better
Date: Sat, 22 Jan 2022 17:46:11 +0800
Message-Id: <20220122094611.11332-1-zhouzhouyi@gmail.com>
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

I feel that each new version is much better than previous one.

Following is my new version, and I invoked "make" after the change,
further suggestions is very welcome.

Thanks again

Sincerely
Zhouyi
--
 bib/RCU.bib |  8 +++++---
 bib/TM.bib  | 15 ++++++++++-----
 2 files changed, 15 insertions(+), 8 deletions(-)

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
index e4412afd..0f222647 100644
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
@@ -963,15 +965,18 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
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
+ address={Vancouver B.C. Canada},
  doi="10.1109/MICRO.2012.12",
- note="The 45\textsuperscript{th} Annual IEEE/ACM International Symposium
-on MicroArchitecture, URL: \url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",
- lastchecked="November 13, 2016",
+ note="Presentation slides:
+  \url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",
 }
 
 @conference{JustinGottschlich2013TMdebug,
-- 
2.25.1

