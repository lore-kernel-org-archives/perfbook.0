Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=1IZDZq9PY3F2ywNG7WJDXor0gkUyOqTskSBMKy16W74=;
 b=XdYmSO8IOlxVuj2daljhk+ncFN2fK0yGtIXrDfGntF7ZyORKsUprahaKU4S4ngt/1F
 B30mSseAFPfhksU1sRkENUiRwqPnvZLFuuGbWbtNDF0VdVZUKy7pMptlqbNhO5Upuv9I
 uc8J9FzZhpgE1jP2Bh+yEQBDVFYC9ZEkWkAs7JZ+d3swa/mVC6b7O+fPvyN1TXIo0zbJ
 e4Zri8Wxw99VsLreKTlosN2Qmbm1rPWh6Wahaxu8Ea1mmniQWLzeTUoFqyPsnUQTRuHq
 +i+vymK2TAzScEC+pNm2WhIMeE6rozPSIopbegsd4CWl1kt0SvSojps3VWneN439AWPs
 FSuA==
Subject: [PATCH 8/8] bib/parallelsys: Fix typo of OpenMPI2008's title
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <38aebddd-dc69-4077-6ae3-8c457cf8ed6b@gmail.com>
Date: Mon, 30 Jan 2017 00:37:01 +0900
MIME-Version: 1.0
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f49e93ec4178feeb7b7fdbeb4291051541daf9de Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 19 Nov 2016 14:26:37 +0900
Subject: [PATCH 8/8] bib/parallelsys: Fix typo in OpenMPI2008's title

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/parallelsys.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/parallelsys.bib b/bib/parallelsys.bib
index 3346c9d..1f1b1f2 100644
--- a/bib/parallelsys.bib
+++ b/bib/parallelsys.bib
@@ -275,7 +275,7 @@ and Victor Basili"

 @unpublished{OpenMPI2008
 ,author="{The Open MPI Project}"
-,title="{MySQL Downloads}"
+,title="{Open MPI}"
 ,Year="2008"
 ,Month="November"
 ,Day="26"
-- 
2.7.4


