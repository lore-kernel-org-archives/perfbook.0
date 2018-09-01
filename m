Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n9acrAJVUeWQexiqNdwh04L8+mbWm9NfG1o7AgD6jiE=;
 b=AyKoIv4HZLr86NWLbb8+jgTy3dEudnf5pb+VU05H3huz5Z8FVIsZymH+WAvl41aic6
 RL03Ofh/jj3oy5859sw/gaTh36/6u7qreT82ffeaA2UeLRxkLJXD/4XIHE0xOacM+mne
 gSPiFULZtNoKuazGV4Ag8cgrdHrV11mqDc39MvnaGDcYUvPQa/hgDvOgMNjYioGknXFN
 XD6m9PzJHU1DRWPmnhcfnzvH5Nh/WgihnUidTC4ZcYL/kWNWz1PBbTECtbjOc5Pcl5nW
 N9rcNG1ZDOK0TCQ0yz1QQIF+RTfz+bWWLsipuBnee4DALseuUsK9BEubmsgwmjIfNsef
 5Z+w==
Subject: [PATCH 2/3] Suppress indent right after section-level epigraph
References: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1bddb83d-9e74-d26b-207e-5a15be124e42@gmail.com>
Date: Sat, 1 Sep 2018 09:14:47 +0900
MIME-Version: 1.0
In-Reply-To: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 80b06ac34477b84041fa5757d1c9755e9a7b8a47 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 31 Aug 2018 20:27:39 +0900
Subject: [PATCH 2/3] Suppress indent right after section-level epigraph

By the help of "noindentafter" package, indent right after the
section level epigraphs can be suppressed.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile     | 1 +
 perfbook.tex | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 3e9e2c2..a88553b 100644
--- a/Makefile
+++ b/Makefile
@@ -3,6 +3,7 @@ LATEXSOURCES = \
 	legal.tex \
 	glossary.tex \
 	qqz.sty origpub.sty \
+	noindentafter.sty \
 	pfbook.cls \
 	ushyphex.tex pfhyphex.tex \
 	*/*.tex \
diff --git a/perfbook.tex b/perfbook.tex
index e58d963..677c354 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -61,6 +61,8 @@
 \usepackage{siunitx} % for \num{} macro
 \sisetup{group-minimum-digits=4,group-separator={,},group-digits=integer}
 \usepackage{multirow}
+\usepackage{noindentafter}
+\NoIndentAfterCmd{\epigraph}

 % custom packages

-- 
2.7.4


