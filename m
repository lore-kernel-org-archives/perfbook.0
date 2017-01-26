Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=OlEDbEpQ/yV9yb0ejmlbc5o0JKiQwmYD6WUeISOqeJY=;
 b=cUkS65ufbR+EKZ576/DQxs6qNiJy5cMAPuqmQrPLe139Ly4IlSRDXtQ00IKtQb3+4K
 6aIQLM8WoIIjOVzHnn7+8V2JmF52oAGFU8z4wPVDx6hluE6u7snWXvhgCmfS+Dg/+gfT
 o/NQqcmHoYQt1kAImDJtztkoCFs/Lq/ysG12wrKpdoMFMqI/83rdmZLiGyvsrnKA3BRD
 GRuXmlcSNKIsgD2qymNAPlYNr2eSDNBQiz7TYhnRfviJToipd7mUepVFRA8z+CZrMFhr
 c0wwtpdphby8FhmQdoerQfIPBPZ87UyqFtA8HztcbZMPshZNoR0vk8vBJNoK1dAVeTGH
 IBzQ==
Subject: [PATCH 5/5] Increase floatpagefraction for 2c layout
References: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <37a554d4-9962-6bd3-2f1f-bca2083e29f5@gmail.com>
Date: Fri, 27 Jan 2017 00:23:12 +0900
MIME-Version: 1.0
In-Reply-To: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 15aea071f9a8ff33b0f97310b2afd4730d33afa1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 29 Dec 2016 18:27:31 +0900
Subject: [PATCH 5/5] Increase floatpagefraction for 2c layout

In 2c layout, it sometimes looks imbalanced when a floating
figure or table with the "[p]" option occupies a column while
its next column is flushed from top to bottom. This is because
"floatpagefraction" command is defined as .5 (a figure or a table
whose height is 50% or more of textheight can occupy a column).

To prevent such occupations from happening in 2c layout, this
commit sets floatpagefraction as the same as "topfraction" command
for 2c.

This change will reduce typeset freedom of TeX engine, and might
cause some floating objects to be placed further from where they
are referenced in the text. If this causes an undesirable result,
we might need to reduce the value of floatpagefraction.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook.tex b/perfbook.tex
index a3b2d84..324c708 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -136,6 +136,7 @@
 \setlength{\textheight}{8.25in}
 \setlength{\textwidth}{6.5in}
 \setlength{\columnsep}{0.25in}
+\renewcommand\floatpagefraction{.75}
 }{
 \setlength{\textheight}{8.25in}
 \setlength{\textwidth}{4.75in}
-- 
2.7.4


