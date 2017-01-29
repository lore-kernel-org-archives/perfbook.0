Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=MCLU5e1a3zTP2pNbDayQ91wSlzhKvDk2V2y351ii0ns=;
 b=Is9gYBKDXHNKfUwrcSiT+b3CspqCwEjd8BBPvOSj4gsvG8mvLwe3GJ8SwLBmweN+24
 l9xi1LLdgT7RhKW+ErXf1hHUYZy73lEH3UEB2kb2sm2hgOA4cnLiHNMJf00NdlASgTTY
 LFeo7yKom2XmH4lWi5xJhH5YZwbd0q6MRQvnxD1oipPO0LivnsazrsOf3oGivZRwxirl
 60diO9KF1vgAqPwBEcurTZmdKJUUNzxwoW0o5PgPIEeHyAY+SOVt3V8H7rZjBO5m3NRT
 2uzQV1+tlJ7mseu5K/IT2H4/PkyCfZNeExMRntggy7XZQMk07snthaBhTuRJ8MwqfOn/
 r7Ng==
Subject: [PATCH 5/8] bib/TM: Fix doi of DBLomet1977SIGSOFT
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <349b6b93-25e4-6ebf-2b08-862998700797@gmail.com>
Date: Mon, 30 Jan 2017 00:34:10 +0900
MIME-Version: 1.0
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 88436828ca2e23c48dbecf883284b6d081a1c668 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Nov 2016 15:25:47 +0900
Subject: [PATCH 5/8] bib/TM: Fix doi of DBLomet1977SIGSOFT

Also append redirect info in case the redirection stop working.
They are ignored by alphapf style.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/TM.bib | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/bib/TM.bib b/bib/TM.bib
index f175966..9ec6214 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -7,12 +7,15 @@
 ,Number={2}
 ,issn={0163-5948}
 ,pages="128--137"
-,doi={10.1145/390017.808319}
+,doi={10.1145/390019.808319}
 ,publisher={ACM}
 ,address={New York, NY, USA}
-,note="Available:
+,note="URL:
 \url{http://portal.acm.org/citation.cfm?id=808319#}
-[Viewed June 27, 2008]"
+"
+,lastchecked="June 27, 2008"
+,redirected="http://dl.acm.org/citation.cfm?id=808319"
+,redirectchecked="November 13, 2016"
 }

 @conference{CMohan1992LessOptimism
-- 
2.7.4


