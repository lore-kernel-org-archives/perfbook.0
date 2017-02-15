Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=rzxAXQMXYdXl8gYssWfBfArtcOxD9JocQwaovAfqb4g=;
 b=vNxG5xomPLHELLO6bU9c4FkxH7Ppbd/nxgC21XlQrAXOIqkXzVVwnrIj48Pgddru2w
 KiYZbp50wc1J4DDRUqrvl3RQlIJhZo/VeBLewtDY2A0ALL4JjnrpiCDHxA6YxjEpKiER
 hLEJ5cTJ3WN+0L45RToK3vNqlT37Zlbedpe8voRmqrCNEH8tfR7BpcBSW4/9TZX97epP
 JOiQEBLweXjaInqD+gaBMN9fZWGBBd6JcjOyGj/DV/k4A5zUd4fvgw99VeEdGb5+ddqs
 hg+iKfE5knYb+lFCiD8SrvcVwaaniYV03pJryrcx4zpFU4GSuqJWXt9jiE6Te/ThD3Im
 HIWw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Bibliography updates (append urls -- part 2)
Message-ID: <874fe02f-0887-55ad-4611-bc9af7fd5184@gmail.com>
Date: Thu, 16 Feb 2017 00:14:12 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 12c6802578e421628b996ee10cef6c3b3df47960 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 15 Nov 2016 00:01:02 +0900
Subject: [PATCH] Bibliography updates (append urls -- part 2)

This commit appends urls to the following entries:

  o PanagiotisMetaxas1999PDCS
  o McKusick88
  o Magnusson94
  o MagedMichael95a
  o McKenney98
  o McKenney04a
  o Rajwar01a
  o Rajwar02a
  o Soules03a
  o Sarma04c

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Here is another round of bibliography updates.
It consists of mostly the same type of updates as the previous one
(just appending urls).
The remaining updates will be submitted in 2 or 3 more rounds.
We are getting closer to the goal of bibliography updates ;-)

                                     Thanks, Akira
--
 bib/RCU.bib         | 8 ++++++++
 bib/TM.bib          | 5 +++++
 bib/WFS.bib         | 2 ++
 bib/os.bib          | 2 ++
 bib/parallelsys.bib | 2 ++
 bib/syncrefs.bib    | 2 ++
 6 files changed, 21 insertions(+)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 580b1a1..4614520 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -221,6 +221,8 @@ Problems"
 ,Year="1998"
 ,pages="509-518"
 ,Address="Las Vegas, NV"
+,url="http://www.rdrop.com/users/paulmck/RCU/rclockpdcsproof.pdf"
+,lastchecked="November 14, 2016"
 }

 @Conference{Gamsa99
@@ -494,6 +496,8 @@ Michal Ostrowski and Bryan Rosenburg and Jimi Xenidis"
 ,year="2003"
 ,month="June"
 ,pages="141-154"
+,url="https://www.ece.cmu.edu/~ganger/papers/k42Usenix.pdf"
+,lastchecked="November 14, 2016"
 }

 @article{McKenney03a
@@ -538,6 +542,8 @@ Michal Ostrowski and Bryan Rosenburg and Jimi Xenidis"
 ,volume="1"
 ,number="118"
 ,pages="38-46"
+,url="http://www.linuxjournal.com/article/7124"
+,lastchecked="November 14, 2016"
 }

 @Conference{McKenney04b
@@ -600,6 +606,8 @@ Realtime Applications"
 ,year="2004"
 ,month="June"
 ,pages="182-191"
+,url="http://www.rdrop.com/~paulmck/RCU/realtimeRCU.2004.06.12a.pdf"
+,lastchecked="November 14, 2016"
 }

 @phdthesis{PaulEdwardMcKenneyPhD
diff --git a/bib/TM.bib b/bib/TM.bib
index e8aa11a..04d45ad 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -103,6 +103,8 @@ Execution"
 ,year="2001"
 ,address = "Austin, TX"
 ,pages = "294-305"
+,url="http://pages.cs.wisc.edu/~rajwar/papers/micro01.pdf"
+,lastchecked="November 14, 2016"
 }

 @conference{Martinez02a
@@ -129,6 +131,9 @@ Operating Systems"
 ,year="2002"
 ,pages="5-17"
 ,address = "Austin, TX"
+,doi="10.1145/605397.605399"
+,url="http://pages.cs.wisc.edu/~rajwar/papers/asplos02.pdf"
+,lastchecked="November 14, 2016"
 }

 @incollection{HerlihyLMS03
diff --git a/bib/WFS.bib b/bib/WFS.bib
index 35713e7..d7efdf6 100644
--- a/bib/WFS.bib
+++ b/bib/WFS.bib
@@ -118,6 +118,8 @@ Linear or Sublinear Complexity"
 ,year="1995"
 ,note="Technical Report TR599"
 ,organization="Computer Science Department, University of Rochester"
+,url="https://pdfs.semanticscholar.org/cec0/ad7b0fc2d4d6ba45c6212d36217df1ff2bf2.pdf"
+,lastchecked="November 14, 2016"
 }

 @conference{MichaelScott96
diff --git a/bib/os.bib b/bib/os.bib
index b2762c7..7d48633 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -155,6 +155,8 @@ Kernel"
 ,address = "Berkeley CA"
 ,month="June"
 ,year="1988"
+,url="https://docs.freebsd.org/44doc/papers/kernmalloc.pdf"
+,lastchecked="November 13, 2016"
 }

 @article{Lee89
diff --git a/bib/parallelsys.bib b/bib/parallelsys.bib
index 2091bcd..e9c4b5b 100644
--- a/bib/parallelsys.bib
+++ b/bib/parallelsys.bib
@@ -327,5 +327,7 @@ Parallel and Distributed Computing and Systems"
 ,pages={570--576}
 ,publisher={IASTED}
 ,address={Cambridge, MA, USA}
+,url="http://cs.wellesley.edu/~pmetaxas/pdcs99.pdf"
+,lastchecked="November 13, 2016"
 }

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 21d2007..4a0b1be 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1142,6 +1142,8 @@ Multiprocessors"
 ,number="T94:07"
 ,month="February"
 ,pages="32"
+,url="http://dl.acm.org/citation.cfm?id=869729"
+,lastchecked="November 13, 2016"
 }

 @article{Zhang94
-- 
2.7.4

