Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=CjpdqCH+kx4D05ALjr8uTptkHuYQtkeNS6+tb9I9Rcc=;
 b=jU2n9MwrQ0CXUBJ8Q3BibEse6ifR+r9TfcElZVyywYfZcs4w9xRQ/Xr9qsQP7SzkcA
 OvYRySLOf3rBhFAuUQtJHZRVzENt+MsUhTp2uZDvmrIjMkM3Uq/4LN+wvU5ckZKcyl82
 V+6nx0o3bKalT1urpTCvZSni32DR/muMavEwh1nk2f2Yr7Eu+9W2T18b1MLIPKHep5/X
 S6qvbL3uXwvJOS02REn7n5JsFQkkyG3G9tHoNxL95C6HI/ohKfH7arQl86I4hz3LjD5o
 g7wvc9gzJm2d5YeeiINrE90J2VvehaU4XyOyVXMwQ46zWkew0fOTxa2BqwpxUDQWGMS1
 MaDQ==
Subject: [PATCH 2/5] bib/syncrefs: Mark url of DougLocke2002a as broken
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <09b9d5d0-7e39-1ebe-b4f9-991d9c8f0778@gmail.com>
Date: Wed, 8 Feb 2017 23:57:08 +0900
MIME-Version: 1.0
In-Reply-To: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fb3e4f63fcc50cfd9a4a9e4de75bfbf6d6b165c2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 7 Feb 2017 22:39:57 +0900
Subject: [PATCH 2/5] bib/syncrefs: Mark url of DougLocke2002a as broken

Also append a url of page capture at www.math.unipd.it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 898459d..d0f3270 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1002,9 +1002,11 @@ Georgia Institute of Technology"
 ,month="July"
 ,year="2002"
 ,day="16"
-,note="Available:
-\url{http://www.linuxdevices.com/articles/AT5698775833.html}
-[Viewed June 29, 2005]"
+,note="URL:
+\nolinkurl{http://www.linuxdevices.com/articles/AT5698775833.html}
+[broken, November 2016],
+page capture available at \url{http://www.math.unipd.it/%7Etullio/SCD/2007/Materiale/Locke.pdf}"
+,lastchecked="February 7, 2016"
 }

 @unpublished{Yodaiken2004FSM
-- 
2.7.4


