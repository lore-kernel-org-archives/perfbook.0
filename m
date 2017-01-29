Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=z335eJVMdvkCL2YYOxpaHfzJdi8h945VFFAvGs8+P80=;
 b=Qpfn6wMpDwF8XbicJAurWk7XGOo9P0agbY917AucXt2xpE1KzqZmqSFBROEpuqDn0F
 LQYObV7NXy/NurlLpZ9QiOA+YARc8GQ5DzUrLrk8INpRCEHQKdH6sD8/pxTn/zg5ISPP
 nfGlHVZg7SCCFg2nmrTujG0ZvbcNLaR6VHsLArI3BXGJwAMIVQv4RhQMO6441KQrQ97l
 hY80w7J/txhVMLMkQTOyt4qyvRL7V8efjAOSMf3X3WkhMmvoDQ17wwTAYBAMpUGIydzz
 Pwh4seHY5qi+YYmPjtM8C/N0TSanydw/lzDOVNCyEq4q6gWw+dhRCd7FX0H0fihl2n+i
 9S6Q==
Subject: [PATCH 6/8] bib/TM: Correct url of YujieLiu2011ToxicTransactions
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0b26ef7e-be9b-08af-cb33-7569514f3825@gmail.com>
Date: Mon, 30 Jan 2017 00:35:03 +0900
MIME-Version: 1.0
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d72467f0d44b847f4bddd358bd741755d4539000 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Nov 2016 15:43:04 +0900
Subject: [PATCH 6/8] bib/TM: Correct url of YujieLiu2011ToxicTransactions

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/TM.bib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bib/TM.bib b/bib/TM.bib
index 9ec6214..07b39e2 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -847,7 +847,8 @@ for Programming Languages and Operating Systems (ASPLOS '09)"
 ,day="5"
 ,publisher="ACM SIGPLAN"
 ,location="San Jose, CA, USA"
-,url="http://www.cs.purdue.edu/transact11/web/presentations/Pohlack-slides.pdf"
+,url="https://www.cs.purdue.edu/transact11/web/papers/Liu.pdf"
+,lastchecked="November 13, 2016"
 }

 @inproceedings{EgeAkpinar2011HTM2TLE
-- 
2.7.4


