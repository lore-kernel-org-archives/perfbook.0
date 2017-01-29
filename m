Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BkDiDzWJcxHY6kAzkKICK7sK5cRC8btIPqyrnogLpKk=;
 b=O6WgIbaZ6DPwqNe0wovtrAQWmzp5+ezrNF/XsHwObg61yyRoOSOi++J3vq25eIXd2t
 Q62nsnA+r35oOY2tnPjd90nMPen6WdRhUdi9O4k/V14zwQlZsPR/EP3X2Ffu5OY9fPzF
 I9hBha7bdj2LekTW7slLcL9wHY1cK6X7B/xtlMrk02sRmG8i9IKUmpUUNxbnXvspq7nN
 TkhovmJs9LRhCnc/JkvrEzhjAB8F25DtTS6gHBXNPd7JdLcbXC+slbzkwOh5tIyU0jC0
 H6x9JuPk36AUqqzwacmTQGBrvUm+rbO4/lORwO5g2zUz3JaRMvwzRqD7Vjmx6msByQix
 oEmw==
Subject: [PATCH 2/8] bib/swtools: Fix url of SaeedDehnadi2009SheepGoats
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <31de3349-5d5a-52f8-2776-c498b5d2a7f3@gmail.com>
Date: Mon, 30 Jan 2017 00:28:21 +0900
MIME-Version: 1.0
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b823ed348c5c8f8abb075886c6ac3d30ab06ed48 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 Nov 2016 15:39:31 +0900
Subject: [PATCH 2/8] bib/swtools: Fix url of SaeedDehnadi2009SheepGoats

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/swtools.bib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bib/swtools.bib b/bib/swtools.bib
index 7a2241d..cbf0612 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -276,7 +276,8 @@ Retracted in July 2014:
 ,numpages = {13}
 ,publisher = {Psychology of Programming Interest Group}
 ,address = {University of Limerick, Ireland}
-,url={http://www.ppig.org/papers/21st-muller.pdf}
+,url={http://www.ppig.org/papers/21st-dehnadi.pdf}
+,lastchecked="November 12, 2016"
 }

 @unpublished{RegBraithwaite2007FizzBuzz
-- 
2.7.4


