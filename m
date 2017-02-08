Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=rsVo/3uxXsHuIG756C9cB/LikbLuUDRHXHXZKYqO8H0=;
 b=SqMedE1d5sj/WUF/p6H1en9eAcXGkzNFuSSCB8e7/TDhtHcWfCGqaIN5t1DAsEpTr9
 pNmx39wJFekZgPmPiik8nAHFnYlPPT+RDh9CyyFTAVbZh6dzXs+TyYRcRh8OPKhB5MkV
 Gj6WKxAKrvg2+uQ8NK+cVFZj71fMhqwDo1hbLwsf90qh3XVxgHtwqxTf3RRbJmz3B2ql
 S3kCVpXmJT7Cdi7NcZcYl0aTFpcl2CyMBsZUVJXUgBS9f66fLdio8lzj/Vi7hxvBwBLW
 BobR84gCCcess/gr7msInxuAwbaVqntjRSEQjPx1sa1viWxcEv4KraDgBYIVSGPnoyUd
 Q/mg==
Subject: [PATCH 3/5] bib/syncrefs: Mark url of Victor2002a as broken
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8e78d75a-735a-5911-ee3f-115fb70a19b4@gmail.com>
Date: Wed, 8 Feb 2017 23:58:21 +0900
MIME-Version: 1.0
In-Reply-To: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1e17a6828496b9ec9b66275e803bbe99ed059aa0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 8 Feb 2017 00:35:01 +0900
Subject: [PATCH 3/5] bib/syncrefs: Mark url of Victor2002a as broken

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index d0f3270..717476d 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -991,9 +991,9 @@ Georgia Institute of Technology"
 ,month="July"
 ,year="2002"
 ,day="10"
-,note="Available:
-\url{http://www.linuxdevices.com/articles/AT7168794919.html}
-[Viewed June 29, 2005]"
+,note="URL:
+\nolinkurl{http://www.linuxdevices.com/articles/AT7168794919.html}
+[broken, February 2017]"
 }

 @unpublished{DougLocke2002a
-- 
2.7.4


