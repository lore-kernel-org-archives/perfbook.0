Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Rzif5n9uadq9NgZ8RTLaumArVDqK24y7dgCcQJRi7Wo=;
 b=cMPa3WYRPSldzLVR0ABPMkdWx96Og+VN2m2KPeWnGRhF9zIfn/GQCkv6gfy/Cf9aDK
 ZjX0yI7Pij/oUMGK/k29TzaGhdcAgaerwdaS/d+5c+Bjrpipx9P2uWXPIYIaONiehtBz
 jqMbH2Gh6L5LhwvMQBZsA/bjntGZATDR9ojoLuYhTJ4Iw6ee9biBKnTuye7/DmmQCJx7
 w39D4E+wgvtMhezoEtNiYyQC+yvRZYwYjzIJl6rzYHLbVba6855eK7bW3fwPW8GBn0FF
 452E8L7rQXLlzcs78GhW11tksYhu2vPDPv61BVo4c0h44oMrudfdjEoH6I8xZ8RvNHoB
 m1nA==
Subject: [PATCH 1/7] bib/hw: Update url note of JohnKnickerbocker2008:3DI
References: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <da3023ba-ee9a-de37-3952-1e89171a6ea7@gmail.com>
Date: Sun, 22 Jan 2017 23:58:49 +0900
MIME-Version: 1.0
In-Reply-To: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f4b945624fdafd8bd899dfd1cb653d5532c806dc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Nov 2016 13:09:43 +0900
Subject: [PATCH 1/7] bib/hw: Update url note of JohnKnickerbocker2008:3DI

The top page is still available, but links to articles are broken.
They can be obtained via "http://ieeexplore.ieee.org/".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index b535bdc..522b7cc 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -650,9 +650,11 @@ on Computer Architecture"
 ,Year="2008"
 ,Volume="52"
 ,Number="6"
-,note="Available:
+,note="URL:
 \url{http://www.research.ibm.com/journal/rd52-6.html}
-[Viewed: January 1, 2009]"
+[Link to each article is broken as of November 2016; Available via
+\url{http://ieeexplore.ieee.org/xpl/tocresult.jsp?isnumber=5388557}]"
+,lastchecked="November 13, 2016"
 }


-- 
2.7.4


