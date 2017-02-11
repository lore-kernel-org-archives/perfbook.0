Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=KmIWcD7D84ix2elLNo1uf/djjGO07QbAh1IK7yLhHG8=;
 b=lnwoBtfQ4Jmr4hIoC0tomlKBmlZYjWyM8tmT2/5+aRw4CQLjy8ZcA7ElOBYGZB77qP
 SL4hF7h6SRCljqaWsP8SpMPy3QqS3VPBS9tz+Hv/Fn7IiprlYERLVwectmpIp/yVNaWk
 YXSbEPDHH9Q9E04cN5Ajmx+WzBnCis4jV7RQ6rz1O7TZUn6P+L/0YVCuD9RRxwHeFYAi
 BeFiQsTpWrcwDI29yWjVu+Rcffday+t+01wVRaV19wmgH7WBh6f2vjbP27SN80V9cNAv
 66LIAuNKhPkeksFrJUzkLptvpRGxkifk6O1nu37XjVlyEdcZLRQLhHuT96V+ZJ20Ble7
 m4NQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Bibliography updates (append urls -- part 1)
Message-ID: <ed1ed678-64ba-42eb-7cd8-ddbe26dbe79a@gmail.com>
Date: Sat, 11 Feb 2017 14:04:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 01b8573b84a1cab406c447914694078642f219c7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 Nov 2016 12:32:27 +0900
Subject: [PATCH] Bibliography updates (append urls -- part 1)

This commit appends urls to the following entries:

  o JadeAlglave2013-WeaknessIsVirtue
  o Craig93
  o AndrewDBirrell1989Threads
  o Ellis80
  o Gamsa99
  o JustinGottschlich2013TMdebug
  o HerlihyLM03
  o ChristophMKirsch2012FIFOisntTR
  o HMassalinPhD
  o PaulEdwardMcKenneyPhD

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This is round 6 of bibliography updates.
Each of them is simple addition of a url field, so I squashed
10 commits into a single patch.

                                           Thanks, Akira
--
 bib/RCU.bib      | 4 ++++
 bib/TM.bib       | 2 ++
 bib/WFS.bib      | 2 ++
 bib/os.bib       | 2 ++
 bib/swtools.bib  | 2 ++
 bib/syncrefs.bib | 9 +++++++++
 6 files changed, 21 insertions(+)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index fb188b9..580b1a1 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -233,6 +233,8 @@ Operating System Design and Implementation}"
 ,Year="1999"
 ,pages="87-100"
 ,Address="New Orleans, LA"
+,url="https://www.usenix.org/legacy/events/osdi99/full_papers/gamsa/gamsa.pdf"
+,lastchecked="November 12, 2016"
 }

 @unpublished{RustyRussell2000a
@@ -608,6 +610,8 @@ in Operating System Kernels"
 ,school="OGI School of Science and Engineering at
 Oregon Health and Sciences University"
 ,year="2004"
+,url="http://www.rdrop.com/~paulmck/RCU/RCUdissertation.2004.07.14e1.pdf"
+,lastchecked="November 13, 2016"
 }

 @unpublished{PaulEMcKenney2004rcu:dereference
diff --git a/bib/TM.bib b/bib/TM.bib
index 81d7ce2..e8aa11a 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -908,6 +908,8 @@ on MicroArchitecture, URL: \url{http://www.microarch.org/micro45/talks-posters/3
 ,Month="June"
 ,booktitle="5\textsuperscript{th} USENIX Workshop on Hot Topics in Parallelism (HotPar 2013)"
 ,address="San Jose, CA, USA"
+,url="https://www.usenix.org/system/files/conference/hotpar13/hotpar13-gottschlich.pdf"
+,lastchecked="November 12, 2016"
 }

 @inproceedings{Yoo:2013:PEI:2503210.2503232
diff --git a/bib/WFS.bib b/bib/WFS.bib
index a6f76b8..35713e7 100644
--- a/bib/WFS.bib
+++ b/bib/WFS.bib
@@ -210,6 +210,8 @@ Conference on Distributed Computing Systems (ICDCS)}"
 ,publisher="The Institute of Electrical and Electronics Engineers, Inc."
 ,pages="73-82"
 ,address="Providence, RI"
+,url="http://www.cs.brown.edu/people/mph/HerlihyLM03/main.pdf"
+,lastchecked="November 13, 2016"
 }

 @InProceedings{HerlihyLM02
diff --git a/bib/os.bib b/bib/os.bib
index 357b6a4..ff43dca 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -275,6 +275,8 @@ System Services"
 ,school="Columbia University"
 ,address="New York, NY"
 ,year="1992"
+,url="http://valerieaurora.org/synthesis/SynthesisOS/index.html"
+,lastchecked="November 13, 2016"
 }

 @conference{Pu95a
diff --git a/bib/swtools.bib b/bib/swtools.bib
index 1a470fa..6ee001a 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -441,6 +441,8 @@ Architectural Support for Programming Languages and Operating Systems
 International Workshop on Exploiting Concurrency Efficiently and Correctly }
 ,YEAR={ 2013 }
 ,PAGES={3}
+,URL={ http://www0.cs.ucl.ac.uk/staff/j.alglave/papers/ec213.pdf }
+,LASTCHECKED={ November 12, 2016 }
 }

 @inproceedings{JadeAlglave2013-cav
diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 717476d..21d2007 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -46,6 +46,9 @@
 ,volume="C-29"
 ,number="9"
 ,pages="811-817"
+,url="https://www.computer.org/csdl/trans/tc/1980/09/01675680.pdf"
+,lastchecked="November 12, 2016"
+,doi="10.1109/TC.1980.1675680"
 }

 @article{Pugh90b
@@ -207,6 +210,8 @@ Brent A Kingsbury"
 ,number="2012-04"
 ,month="June"
 ,pages="19"
+,url="https://arise.or.at/pubpdf/Fast_and_Scalable_k-FIFO_Queues.pdf"
+,lastchecked="November 13, 2016"
 }

 @InProceedings{AndreasHaas2013CFRelaxedQueues
@@ -724,6 +729,8 @@ Georgia Institute of Technology"
 ,month="January"
 ,day="6"
 ,number="35"
+,url="http://www.hpl.hp.com/techreports/Compaq-DEC/SRC-RR-35.pdf"
+,lastchecked="November 12, 2016"
 }

 @book{HerlihyShavit2008Textbook
@@ -1110,6 +1117,8 @@ Multiprocessors"
 ,number="93-02-02"
 ,month="February"
 ,pages="29"
+,url="ftp://ftp.cs.washington.edu/tr/1993/02/UW-CSE-93-02-02.pdf"
+,lastchecked="November 12, 2016"
 }

 @article{BengHongLim93
-- 
2.7.4

