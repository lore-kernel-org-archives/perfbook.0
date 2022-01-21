Return-Path: <SRS0=CZ29=SF=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmUIVjgWIH4S0MM1IhU8fA65R1hGCK+dLey7XPSYzzA=;
        b=ZEGO1FG/kN75Ao357fSo7YaP25Y8F+5DxhkCseB1DkyrdP+s4lerFbFshDm3A1lc1F
         d/9b9qnODshbAOg7xqBXr5QeKAoUxNBAzk9pikzZasp9+CADMw20qMUTWp/BUqr4OlcG
         EFpZPLPTMi3eBVgyH1KD2faCys5JzdSXvi9PoseK2jtnnjfIDvrHrck0ydCM7Cxguc7l
         LRzmr2zVriUPvOTqj3Ex1yqv8/WJAS2f4FVAjlc0wWv17TBlMemPQvkZxxOwIup+B079
         jRz3JZejk5QELmMY+7SXq0f8VxuMbVDPaxizIbFC8BHB7FlpkahxOHkiaS994bfUwUQo
         LFeQ==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] RFC: make some bibliography items better
Date: Fri, 21 Jan 2022 17:50:00 +0800
Message-Id: <20220121095000.30101-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com, luyang.co@gmail.com, perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

make 4 bibliography items better
1. "Relativistic Red-Black Trees" with url:
http://dx.doi.org/10.1002/cpe.3157

2. "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded
Execution" with url:
https://dl.acm.org/doi/10.5555/563998.564036

3. "Architectural Support for Software Transactional Memory" with url:
https://ieeexplore.ieee.org/document/4041846

4. "Transactional Memory Architecture and Implementation for IBM System z" with
url:
https://dl.acm.org/doi/10.1109/MICRO.2012.12

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul and Akira

I try to make above 4 bibliography items better.
I double checked the reference and have invoked make after the changes ;-)

Thanks
Zhouyi
--
 bib/RCU.bib |  7 +++++--
 bib/TM.bib  | 16 ++++++++++------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 3e2bf423..3bda6a56 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -2190,9 +2190,12 @@ lot of {Linux} into your technology!!!",
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
  url = {http://dx.doi.org/10.1002/cpe.3157},
  doi = {10.1002/cpe.3157},
diff --git a/bib/TM.bib b/bib/TM.bib
index e4412afd..5b9bea02 100644
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
+ note="\url{https://dl.acm.org/doi/10.1109/MICRO.2012.12}",
 }
 
 @conference{JustinGottschlich2013TMdebug,
-- 
2.25.1

