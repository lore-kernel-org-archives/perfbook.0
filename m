Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=p9sVg/vyYu92PPHWZAgbwRNkBqGc+/y1zceggEzwiSQ=;
 b=rPGtOGPmIQqu04ZBKAvl26FLou5PDQ3VdmOT/KreHPWJFtsJsA93Jrzm8XYJm/jh5M
 hYv7NBNxx3qV4IWyXNi5R4ocWyCLCegr5SSe+TZfR4af1diimKlpnpfI1NllwJx5N3ro
 MUWlqgtZw8pYrwL8jciz6xEjPmM8a8xWPaqPU0vt2Dwl4bhCaC6anJSndRaQGbmj/R6X
 X4GOcSTbrKPRfEnArtMrXOYnwxn9v5T3djI3XtDyC/KAfe39uOUjcJQatprOWpEJL1dJ
 T/J3J3IdhlaFYVpK1VY3vH3S8hX3k3LyYCJfnYoy6YG4qCftPx2AVvEzQK5C55XR23rn
 aVZw==
Subject: [PATCH 2/2] bib/syncrefs: Add doi to Hoare74
References: <b194a26a-355b-94f5-2bba-57269769d58e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9ce3ae6a-d341-7ec2-5e27-2c2ba9fc2d7c@gmail.com>
Date: Fri, 3 Mar 2017 21:29:46 +0900
MIME-Version: 1.0
In-Reply-To: <b194a26a-355b-94f5-2bba-57269769d58e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5a3db5ddd9458a1787bdf9bd554146079501df18 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 3 Mar 2017 21:20:05 +0900
Subject: [PATCH 2/2] bib/syncrefs: Add doi to Hoare74

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 0a946d4..c5d7372 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -268,6 +268,7 @@ Brent A Kingsbury"
 ,volume="17"
 ,number="10"
 ,pages="549-557"
+,doi="10.1145/355620.361161"
 }

 @article{Lamport74a
-- 
2.7.4


