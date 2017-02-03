Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ZoFQN9oSr4gUilsvm23C6gZb5R/qzQJyY8DSuXj1UMY=;
 b=E0UVvBrSklfWlH3lEerFrZKJb79jkoh/F8wQN1/ms671IBrKWpcvvzBd+W+a3RCf7Y
 Y11nznEiWpy9bshmNE5veXpKAL6cuC3+nbIno2bcDoTE+2wvS0iqO/2aaOW1jDM+3fxL
 FLU3Rc+46sALmEyjT++hFXUYayKYfeuvRHdqLwD0rG7FW6UPKQdXL4HaJi97XMsxdVGc
 uU0LEMV/02qdQDgqHnVi1yVb+3HDtE76OXAWxMjx+73ybIZyVKCgC7jtMV99p06WSrYA
 x5VN8qqupbHZEO8BLd3qB/f5H6XOx3cgK6ZGziHWyDbN2lFqg1gT5/EsH5xOaEoc8Tql
 DfiA==
Subject: [PATCH 6/7] bib/syncrefs: Replace broken url of radovic02efficient
 with doi
References: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <94e76085-a0be-282d-67a2-374a2a4cb265@gmail.com>
Date: Fri, 3 Feb 2017 23:10:22 +0900
MIME-Version: 1.0
In-Reply-To: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7732214fc631e5fd13718d6944833690082de123 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 14 Nov 2016 10:45:36 +0900
Subject: [PATCH 6/7] bib/syncrefs: Replace broken url of radovic02efficient with doi

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 66118db..81bb9e4 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1226,7 +1226,7 @@ Conference on Parallel and Distributed Computing and Systems"
 ,pages="1-13"
 ,address="Baltimore, Maryland, USA"
 ,month="November"
-,url="citeseer.nj.nec.com/radovic02efficient.html"
+,doi="10.1109/SC.2002.10038"
 }

 @inproceedings{radovic03hierarchical
-- 
2.7.4


