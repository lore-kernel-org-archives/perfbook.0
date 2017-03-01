Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=uUqC3TrIk2+8othbno+qP6+9g01lvxHxYFRJSBrZOEA=;
 b=pDdbvVi/BIWjnNN/0pTsDalP0tcNoLTH/y5ezPp3EoBt1653r2OY8Xko9eu1eDmbbs
 eXfszv2dG8O8ljO7kUTNtGf1X4GDEGeLPSZatMHtUHbJ2hha01xcUbDSJTm6AodtNH2R
 OXsX+KpFC6yQ7rtYSYezNjAvo+zWdT5eD1huMG/Ic4Zw7eOuT/ZxtMR3axdouJ4mxb6k
 o7YtDBLCOd2Ad7rk611hm/otsrU+ks/f+sHZpRVDeuFEybdmw0FtmfZmKpMbNG6mpXu3
 wXPm8cm2pSeeb7v7o9+GDDypFvfoKrwpEpvvgo6GDH6iK9GaxOJOnFkPcYBmdGNvQVbA
 2zZQ==
Subject: [PATCH 1/2] Bibliography updates
References: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2a1c251e-1242-bd10-ec99-47d2f2c0b1fd@gmail.com>
Date: Thu, 2 Mar 2017 07:11:53 +0900
MIME-Version: 1.0
In-Reply-To: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3fc210e1d83433aec9cdf1576c28f440cda16e73 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 2 Mar 2017 00:03:04 +0900
Subject: [PATCH 1/2] Bibliography updates

Misc updates (doi, url, location, etc.) in the following entries:

  o Appavoo03a
  o Arcangeli03
  o Soules03a
  o Sarma04c
  o Herlihy93a
  o MauriceHerlihy90a
  o HerlihyLM02
  o CorbetRubiniKroahHartman
  o Olukotun96
  o RyanEccles2005HPCSNovice
  o RyanEccles2006HPCSNoviceNeeds
  o LorinHochstein2005SC
  o RyanEccles2005HPCSSmall
  o AndreasHaas2013CFRelaxedQueues

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib         | 10 ++++++++--
 bib/TM.bib          |  5 +++--
 bib/WFS.bib         |  2 ++
 bib/os.bib          |  3 +++
 bib/parallelsys.bib |  5 +++++
 bib/syncrefs.bib    |  1 +
 6 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 4614520..e6e93cf 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -459,6 +459,7 @@ B. Rosenburg and M. Stumm and J. Xenidis"
 ,Year="2003"
 ,Month="January"
 ,journal="IBM Systems Journal"
+,doi="10.1147/sj.421.0060"
 ,volume="42"
 ,number="1"
 ,pages="60-76"
@@ -480,9 +481,12 @@ Dipankar Sarma"
 ,Booktitle="Proceedings of the 2003 USENIX Annual Technical Conference
 (FREENIX Track)"
 ,Publisher="USENIX Association"
+,location="San Antonio, Texas, USA"
 ,year="2003"
 ,month="June"
 ,pages="297-310"
+,url="https://www.usenix.org/legacy/publications/library/proceedings/usenix03/tech/freenix03/full_papers/arcangeli/arcangeli.pdf"
+,lastchecked="February 27, 2017"
 }

 @Conference{Soules03a
@@ -493,11 +497,12 @@ Michal Ostrowski and Bryan Rosenburg and Jimi Xenidis"
 ,Title="System Support for Online Reconfiguration"
 ,Booktitle="Proceedings of the 2003 USENIX Annual Technical Conference"
 ,Publisher="USENIX Association"
+,location="San Antonio, Texas, USA"
 ,year="2003"
 ,month="June"
 ,pages="141-154"
-,url="https://www.ece.cmu.edu/~ganger/papers/k42Usenix.pdf"
-,lastchecked="November 14, 2016"
+,url="https://www.usenix.org/legacy/events/usenix03/tech/full_papers/soules/soules.pdf"
+,lastchecked="February 27, 2017"
 }

 @article{McKenney03a
@@ -603,6 +608,7 @@ Realtime Applications"
 ,Booktitle="Proceedings of the 2004 USENIX Annual Technical Conference
 (FREENIX Track)"
 ,Publisher="USENIX Association"
+,location="Boston, MA, USA"
 ,year="2004"
 ,month="June"
 ,pages="182-191"
diff --git a/bib/TM.bib b/bib/TM.bib
index 8afec90..4aa9e31 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -32,13 +32,14 @@ on Data Engineering: Transaction and Query Processing"
 [Viewed April 7, 2008]"
 }

-@article{Herlihy93a
+@inproceedings{Herlihy93a
 ,author="Maurice Herlihy and J. Eliot B. Moss"
 ,title="Transactional Memory: Architectural Support for Lock-Free Data
 Structures"
 ,Year="1993"
 ,Month="May"
-,journal="The 20\textsuperscript{th} Annual International Symposium
+,location="San Diego, CA, USA"
+,booktitle="ISCA '93: Proceeding of the 20\textsuperscript{th} Annual International Symposium
 on Computer Architecture"
 ,pages="289-300"
 ,doi="10.1145/165123.165164"
diff --git a/bib/WFS.bib b/bib/WFS.bib
index 1337a7f..e06f39e 100644
--- a/bib/WFS.bib
+++ b/bib/WFS.bib
@@ -39,6 +39,7 @@ Principles and Practice of Parallel Programming"
 ,booktitle="Proceedings of the 2nd ACM SIGPLAN Symposium on Principles
 and Practice of Parallel Programming"
 ,pages="197--206"
+,location="Seattle, WA, USA"
 ,year="1990"
 ,month="March"
 ,doi="10.1145/99163.99185"
@@ -226,6 +227,7 @@ Conference on Distributed Computing Systems (ICDCS)}"
 Lock-Free Data Structures"
 ,booktitle={Proceedings of 16\textsuperscript{th} International
 Symposium on Distributed Computing}
+,location="Toulouse, France"
 ,year=2002
 ,month="October"
 ,pages="339-353"
diff --git a/bib/os.bib b/bib/os.bib
index 19c3455..ae48960 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -987,6 +987,9 @@ on Operating Systems Principles"
 ,publisher="O'Reilly Media, Inc."
 ,year="2005"
 ,edition="Third"
+,note="URL:
+\url{https://lwn.net/Kernel/LDD3/}"
+,lastchecked="February 27,2017"
 }

 @unpublished{CorbetLWN
diff --git a/bib/parallelsys.bib b/bib/parallelsys.bib
index e9c4b5b..ce8b432 100644
--- a/bib/parallelsys.bib
+++ b/bib/parallelsys.bib
@@ -46,6 +46,7 @@ Support for Programming Languages and Operating Systems"
 ,Author = "Kunle Olukotun and Basem A. Nayfeh and Lance Hammond and Ken Wilson and Kunyung Chang"
 ,Title = "The Case for a Single-Chip Multiprocessor"
 ,Booktitle = "ASPLOS VII"
+,location="Cambridge, MA, USA"
 ,month="October"
 ,year="1996"
 ,doi="10.1145/237090.237140"
@@ -124,6 +125,7 @@ Symposium on Computer Architecture"
 ,Author="Ryan Eccles and Blair Nonneck and Deborah A. Stacey"
 ,Title="Exploring Parallel Programming Knowledge in the Novice"
 ,Booktitle="HPCS '05: Proceedings of the 19th International Symposium on High Performance Computing Systems and Applications"
+,location="Guelph, Ontario, Canada"
 ,year="2005"
 ,isbn={0-7695-2343-9}
 ,pages={97--102}
@@ -136,6 +138,7 @@ Symposium on Computer Architecture"
 ,Author="Ryan Eccles and Deborah A. Stacey"
 ,Title="Understanding the Parallel Programmer"
 ,Booktitle = "HPCS '05: Proceedings of the 19th International Symposium on High Performance Computing Systems and Applications"
+,location="Guelph, Ontario, Canada"
 ,year="2005"
 ,isbn={0-7695-2343-9}
 ,pages={156--160}
@@ -160,6 +163,7 @@ Distributed Systems"
 and Victor Basili"
 ,Title="Parallel Programmer Productivity: A Case Study of Novice Parallel Programmers"
 ,Booktitle = "SC '05: Proceedings of the 2005 ACM/IEEE conference on Supercomputing"
+,location="Seattle, WA, USA"
 ,year="2005"
 ,pages={35}
 ,doi={10.1109/SC.2005.53}
@@ -209,6 +213,7 @@ and Victor Basili"
 ,Author="Ryan Eccles and Deborah A. Stacey"
 ,Title="Software Engineering Issues for Small-Scale Parallelism"
 ,Booktitle = "HPCS '05: Proceedings of the 19th International Symposium on High Performance Computing Systems and Applications"
+,location="Guelph, Ontario, Canada"
 ,year="2005"
 ,isbn={0-7695-2343-9}
 ,pages={156--160}
diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 947f736..0a946d4 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -218,6 +218,7 @@ Brent A Kingsbury"
 ,author = {A. Haas and T.A. Henzinger and C.M. Kirsch and M. Lippautz and H. Payer and A. Sezgin and A. Sokolova}
 ,title = {Distributed Queues in Shared Memory---Multicore Performance and Scalability through Quantitative Relaxation}
 ,booktitle = {Proc. International Conference on Computing Frontiers}
+,location = {Ischia, Italy}
 ,publisher = {ACM}
 ,year = {2013}
 ,doi = {10.1145/2482767.2482789}
-- 
2.7.4


