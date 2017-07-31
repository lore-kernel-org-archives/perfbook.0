Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LSr4FJ3fOhxEvTENHVTSX5ba5q1/+b1S2GSZZ1HMm40=;
 b=Olj75xXWk3XuEGk3Kvy4L7Qhw2Jxl0pOQbsATLW6IBlQye2XFpVa5NIISIBZFfya78
 LSXHOsP06DNttUrkMNoAfAjMKB35Vu0qBFYQ8enAUfc3gK53dRiPgego+CEY5ZsrHj/7
 NrSMKmt8HrLKhQ/ay1K1cg2QI/vBpALR5m8+lNtJFYG0BoehygvvSIYRmB+cSfubjaKI
 +EOS94BXodMR2tENAWi9/BmpRNPJIWH5kT0/KLwYVxkOHfjYwCxWOniM3zSadALAxLsW
 RsezkRm/51WPCAbHlgpBFwhbMHxf34IbuTrh0Is5b4ACRHDt3DALXqCVhG0t44B+viIE
 wUfg==
Subject: [PATCH v2 3/8] Define 'listing' environment for style guide
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <28779f67-4afe-9a37-b583-2bf90bee3261@gmail.com>
Date: Mon, 31 Jul 2017 23:47:34 +0900
MIME-Version: 1.0
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 461d28b39c4d2ea05cda3fe4a256ee27677576fe Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 20 Jul 2017 23:42:40 +0900
Subject: [PATCH v2 3/8] Define 'listing' environment for style guide

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

