Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=RXSpU1qxyvNXYF2/QT6n3CqKxr5n0oMOtznObnZQ+kk=;
 b=FP2AquuGmIhOXB1IN0r2eOaR6KouidWIkE8OWfRpOufsuilffJze6rIJz7ynYXPu/K
 bvscY5wzkei4QH5awKacUpdWDotrgdjh8A3HHhJxPyEskr6qI0KfqsnRnNmxoMJv6sH5
 2i3d17Nj+X7+yq4E9LkUlrpaBAm/fOZwC5qLJSV8RwH50KDne/8ByJ3wHM1t3NsTXKxP
 rE1D111WT8yy33b9Y5maZQGXbXL3ir0wfRQRM7vBcyFslAKkpFXzcWpTELMpOIeAQCou
 uv2zMgr1CeZZPD6Vt9KCFViSRkQyBsLA/HniHeEKYblA1HLjMfTuEhR1eDKxsW5hxQme
 fXdQ==
Subject: [PATCH 2/2] bib: Replace UTF-8 chars with plain ASCII latex sequences
References: <2fba7d76-719e-8947-cbc0-ee25040f84f1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a8f2d45d-75d5-85e3-fe39-d01cd3205a81@gmail.com>
Date: Wed, 18 Jan 2017 00:24:41 +0900
MIME-Version: 1.0
In-Reply-To: <2fba7d76-719e-8947-cbc0-ee25040f84f1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9818f62d94a501d24bb073a6a2127cfe6f2afc10 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 8 Jan 2017 11:35:42 +0900
Subject: [PATCH 2/2] bib: Replace UTF-8 chars with plain ASCII latex sequences

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib      | 2 +-
 bib/TM.bib       | 2 +-
 bib/realtime.bib | 2 +-
 bib/swtools.bib  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index aed0adf..253cb2b 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -2396,7 +2396,7 @@ annual ACM SIGPLAN conference on Programming Language Design and Implementation"

 @unpublished{PaulEMcKenney2015RCUreqts2
 ,Author="Paul E. McKenney"
-,Title="{RCU} requirements part 2 — parallelism and software engineering"
+,Title="{RCU} requirements part 2 --- parallelism and software engineering"
 ,month="August"
 ,day="5"
 ,year="2015"
diff --git a/bib/TM.bib b/bib/TM.bib
index c08e9ff..f69370f 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -450,7 +450,7 @@ and Michael Scott}
 ,author="Mark D. Hill and Derek Hower and Kevin E. Moore and Michael M. Swift
 and Haris Volos and David A. Wood"
 ,title="A Case for Deconstructing Hardware Transactional Memory Systems"
-,institution="Department of Computer Sciences, University of Wisconsin–Madison"
+,institution="Department of Computer Sciences, University of Wisconsin--Madison"
 ,address="Madison, Wisconsin"
 ,year="2007"
 ,number="CS-TR-2007-1594"
diff --git a/bib/realtime.bib b/bib/realtime.bib
index c876d55..3e589e6 100644
--- a/bib/realtime.bib
+++ b/bib/realtime.bib
@@ -346,7 +346,7 @@

 @Conference{PaulEMcKenney2008OLS
 ,Author="Paul E. McKenney"
-,Title="‘Real Time’ vs. ‘Real Fast’: How to Choose?"
+,Title="{`Real Time' vs. `Real Fast': How to Choose?}"
 ,Booktitle="{Ottawa Linux Symposium}"
 ,Month="July"
 ,Year="2008"
diff --git a/bib/swtools.bib b/bib/swtools.bib
index f73d900..2877997 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -367,7 +367,7 @@
 }

 @inproceedings{NicolasPalix2011CoccinelleTenYears
-,author = "Nicolas Palix and Ga\:el Thomas and Suman Saha and Christophe Calvès and Julia Lawall and Gilles Muller"
+,author = {Nicolas Palix and Ga\"{e}l Thomas and Suman Saha and Christophe Calv\`{e}s and Julia Lawall and Gilles Muller}
 ,title = "Faults in Linux: Ten Years Later"
 ,booktitle = {Proceedings of the Sixteenth International Conference on
 Architectural Support for Programming Languages and Operating Systems
-- 
2.7.4


