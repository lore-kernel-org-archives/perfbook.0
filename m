Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=nOmxXF3uXSgbzA9bR/Lh1egvIoFR5r8HUIQO8SvGVQM=;
 b=n8xSupQaArA0buPIzurbfJRXVxv6XRL163xCIoChbxaa69IJ+jiXFUqOmOZkotzsQR
 Qqxr7EWQxdjjmqVoJNHMLrDt2OtA2FoKjGwHHYb8YwnZu9hqZivJpZwNQSE1Z25crd82
 xXP6eW1zj+0Z4NAJ5ltZnbWY5mHIv40DaQBYSFNG/BuiK4DO8NxbLuUdTPR1q/XlTz+1
 oNnVxagzjCziZTgxzS/cYrDtKE/WbUNYmLRRNdaPKZpdf6eNAGZVexmalHA6qQ2me1cA
 jGXyJbfR3+HXM5TP+SpGNPnucKe8JpvYYRX4cC5176F8xmLS+RHH2UdqVEl53bAx5C2r
 TzIw==
Subject: [PATCH 4/7] bib/syncrefs: Salvage url of
 AdrianSutton2013LCA:Disruptor
References: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f88dc711-b6e3-d632-fe82-fc38d3b0109e@gmail.com>
Date: Mon, 23 Jan 2017 00:02:48 +0900
MIME-Version: 1.0
In-Reply-To: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 06d0de06efa17e44cf3f0a69939e981123ce59ee Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 17 Nov 2016 23:28:02 +0900
Subject: [PATCH 4/7] bib/syncrefs: Salvage url of AdrianSutton2013LCA:Disruptor

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 4f46fe5..9a58a25 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -643,7 +643,9 @@ Georgia Institute of Technology"
 ,month="January"
 ,day="30"
 ,year="2013"
-,note="\url{http://lca2013.linux.org.au/schedule/30168/view_talk}"
+,note="Presentation at Linux.conf.au 2013, URL:
+\url{https://www.youtube.com/watch?v=ItpT_vmRHyI}"
+,lastchecked="November 17, 2016"
 }

 @article{Desnoyers:2013:MSM:2506164.2506174
-- 
2.7.4


