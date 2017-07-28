Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9sWf2l5b3Wh8xBG/cFV9E7Xoo5bEw6z/nRcX5+9Hess=;
 b=vECL1fePZnOdRMbFDAB2lmBFz3j8jVhgG+AXfj+XdfIaDXTtoZqB42Upvq7mTgOAJE
 ie/LZT1b71Zrf5FdyYVhUsFhBwVofR4Nl0roWyoh+1F4Za2rQPSzRQMu8RlwU4+cvHfv
 WOp2CN6nW13uyKKqS0iGA1TR/Nb4mW5wfG3m8/e5AoCMmkz34mKNfhRKWWKVqx6U7iIU
 xxwnb5833Hrk8nNRXWU+Oqdt4IzowP34P29gqy0cJWAfxC5ng/+yTfEGe3YVrjzuHdbg
 V2LSqvrMBJ4kgH+5zBqt71DWso1rcq/Yf+Z+a1Fvfz/IJKojnD6XMLlZWEcyrxi6M5Ue
 MH7g==
Subject: [PATCH 05/10] Define 'listing' environment for style guide
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ae5b59cc-a6ab-c0e0-51c1-de3b2f083829@gmail.com>
Date: Fri, 28 Jul 2017 19:01:28 +0900
MIME-Version: 1.0
In-Reply-To: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c73dfa97f5d383073fece910d9d0ede8bdab6e18 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 20 Jul 2017 23:42:40 +0900
Subject: [PATCH 05/10] Define 'listing' environment for style guide

Define an experimental floating environment for code snippet
to be used in style guide. It requires "floatrowpf" package
(customized floatrow).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index cda014c..629ecea 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -80,6 +80,9 @@
 \renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
 }{}

+\usepackage{floatrowpf} % Use customized floatrow
+\DeclareNewFloatType{listing}{placement=htbp,name=Listing,within=chapter,fileext=lst}
+
 \usepackage{bm} % for bold math mode fonts --- should be after math mode font choice

 \IfLmttForCode{
-- 
2.7.4


