Return-Path: <SRS0=utkl=IG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vlYGW9O71+cdxz0eygBXbxubAB2LPDIRkbRTMQWYIf4=;
        b=Ud3ZZlHlQwcONYy8PvpH1VAy+PQORH87T36+kQ9qPjRRRc76xi+DG7MfPDoGj6zLm0
         IOwE315mVEOv8KRT5CXvU9Z3bF8tMsL7kfiRQ7WkfK8VEhUaFyBbeW2Ni6Pe4/OQYax2
         VU4Xfi7g46i5gIffoPsCecwmt/hd3s+NV6USRDDjOOfxs2+SzSCcaigHf1yR+mYK09EZ
         q2Sz36wGaUHCHhwBnBm2HDCGmbjx6wHZmksH9BKvIhQRPV86XIQZ1L1zSWr+Y16vGPns
         6tN0JdPi9Z7ODWs4TtLX8URnTAxb+//oVWZXaiIYjUnzyEmCTiG5Xjslxups+Xw0tOew
         zRCg==
Subject: [PATCH 1/4] bib: Add recent editions of textbooks
References: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0bded7bd-f781-923f-5e12-bdd5a9510029@gmail.com>
Date: Mon, 8 Mar 2021 10:54:18 +0900
MIME-Version: 1.0
In-Reply-To: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

o The Art of Multiprocessor Programming, Second Edition
o A Primer on Memory Consistency and Cache Coherence, Second Edition
o Advanced Programming in the UNIX Environment, 3rd Edition
o Programming Language Pragmatics, 4th Edition
o C++ Concurrency in Action, 2nd Edition

Other update/fix:

o Add doi to Dijkstra1971HOoSP
o Fix doi and other info in GeneAmdahl1967AmdahlsLaw
  (Previous info was of the reprint published in 2007)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib          | 10 ++++++++++
 bib/os.bib          |  7 +++++++
 bib/parallelsys.bib |  8 +++++---
 bib/syncrefs.bib    | 28 ++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 23e252d5..2ece29d6 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -948,6 +948,16 @@ Luis Stevens and Anoop Gupta and John Hennessy",
  doi="10.2200/S00346ED1V01Y201104CAC016",
 }
 
+@book{VijayNagarajan2020MemModel,
+ title="A Primer on Memory Consistency and Cache Coherence, Second Edition",
+ author="Vijay Nagarajan and Daniel J. Sorin and Mark D. Hill and David A. Wood",
+ publisher="Morgan \& Claypool",
+ year="2020",
+ isbn="9781681737119",
+ series="Synthesis Lectures on Computer Architecture",
+ doi="10.2200/S00962ED2V01Y201910CAC049",
+}
+
 @article{Kim:2014:FBM:2678373.2665726,
  author = {Kim, Yoongu and Daly, Ross and Kim, Jeremie and Fallin, Chris and Lee, Ji Hye and Lee, Donghyuk and Wilkerson, Chris and Lai, Konrad and Mutlu, Onur},
  title = {Flipping Bits in Memory Without Accessing Them: An Experimental Study of DRAM Disturbance Errors},
diff --git a/bib/os.bib b/bib/os.bib
index 5e902061..3ae9b617 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -30,6 +30,13 @@
  year="1992",
 }
 
+@book{WRichardStevens2013,
+ author="W. Richard Stevens",
+ title="Advanced Programming in the {UNIX} Environment, 3rd Edition",
+ publisher="Addison Wesley",
+ year="2013",
+}
+
 @Conference{MichaelYThompson1988LazyTLB,
  Author =  "Michael Y. Thompson and J. M. Barton and T. A. Jermoluk and J. C. Wagner",
  Title = "Translation Lookaside Buffer Synchronization in a Multiprocessor System",
diff --git a/bib/parallelsys.bib b/bib/parallelsys.bib
index d13dafc1..5423e25b 100644
--- a/bib/parallelsys.bib
+++ b/bib/parallelsys.bib
@@ -5,9 +5,11 @@
  Booktitle = "AFIPS Conference Proceedings",
  year="1967",
  pages={483--485},
- publisher={IEEE Computer Society},
- address={Washington, DC, USA},
- doi={10.1109/N-SSC.2007.4785615},
+ publisher={Association for Computing Machinery},
+ address={New York, NY, USA},
+ doi={10.1145/1465482.1465560},
+ location = {Atlantic City, New Jersey},
+ series = {AFIPS '67 (Spring)}
 }
 
 @article{Lilja93,
diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 8278583f..436e9292 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -269,6 +269,7 @@ Brent A Kingsbury",
  volume="1",
  number="2",
  pages="115-138",
+ doi="10.1007/BF00289519",
  note="Available:
 \url{https://www.cs.utexas.edu/users/EWD/ewd03xx/EWD310.PDF}
 [Viewed January 13, 2008]",
@@ -890,6 +891,15 @@ Symposium on Distributed Computing},
  Address = "Burlington, MA, USA",
 }
 
+@book{HerlihyShavit2020Textbook,
+ Author = "Maurice Herlihy and Nir Shavit and Victor Luchangco and Michael Spear",
+ Title = "The Art of Multiprocessor Programming, 2nd Edition",
+ Year = "2020",
+ isbn = "978-0-12-415950-1",
+ Publisher = "Morgan Kaufmann",
+ Address = "Burlington, MA, USA",
+}
+
 @book{MichaelScott2006Textbook,
  Author = "Michael Scott",
  Title = "Programming Language Pragmatics",
@@ -899,6 +909,15 @@ Symposium on Distributed Computing},
  Address = "Burlington, MA, USA",
 }
 
+@book{MichaelScott2015Textbook,
+ Author = "Michael Scott",
+ Title = "Programming Language Pragmatics, 4th Edition",
+ Year = "2015",
+ isbn = "978-0-12-410409-9",
+ Publisher = "Morgan Kaufmann",
+ Address = "Burlington, MA, USA",
+}
+
 @book{MichaelScott2013Textbook,
  Author = "Michael L. Scott",
  Title = "Shared-Memory Synchronization",
@@ -1019,6 +1038,15 @@ Symposium on Distributed Computing},
  Address = "Shelter Island, NY, USA",
 }
 
+@book{AnthonyWilliams2019,
+ Author = "Anthony Williams",
+ Title = "C++ Concurrency in Action, 2nd Edition",
+ Year = "2019",
+ Publisher = "Manning",
+ Address = "Shelter Island, NY, USA",
+ isbn = "978-1933988771",
+}
+
 @book{NormMatloff2011ParProcBook,
  Author = "Norm Matloff",
  Title = "Programming on Parallel Machines",
-- 
2.17.1


