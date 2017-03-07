Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=aA9Ja1lDJpghspI+1SkUyaHBs0WCVxYHzVYROB/ZdHc=;
 b=Xq6B6t1O91Cpa/xJ+6srzQM9nQ4sxRT5nQ0EIueuiqM7gC/9xuzEhCv6J48+XSJsgL
 IoxO8XydPp4G9gjuBE8m8KHVeAtjnyugQFK+3wjaPC0A6t6fcBhuBSTq9kxDEYa0w4vQ
 j0DcXZGCnckjEhxZz8hXPfDMp2O3vxw4+/wV5FMOWae0kaZd+Ze8CiuN8idwN0ToUA0v
 5jjbCizRnfFXmbtxtSKdEzt8f0mJWpnyedbeYqfvkX78x0moBRPL8QltuxpwTY7Ud/pT
 zGWxX9e9BVrLNxkswHXM4i2kw2rLDhbKn5VwlASV+o/LUgDuxkZel5gsfNkyMP+iBWAL
 Vviw==
Subject: [PATCH 1/3] perfbook.tex: Disable 'microtype' for typewriter font
References: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e97be948-bb5c-929c-7752-08058d911b17@gmail.com>
Date: Wed, 8 Mar 2017 00:01:17 +0900
MIME-Version: 1.0
In-Reply-To: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ea338159985ecf9d28a91607111a76e593b4fed6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 7 Mar 2017 21:04:50 +0900
Subject: [PATCH 1/3] perfbook.tex: Disable 'microtype' for typewriter font

In commit 2c2645db78f0 ("Disable 'microtype' in code snippets"),
microtype was disabled in verbatim and verbbox environments.
Instead of patching those environments, this commit use
\UseMicrotypeSet{} command to exclude tt font from protrusion.

This change prevents protrusion of "-" within \co{} after line
break as was observed in Section 12.1.2.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 324c708..d532e65 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -13,9 +13,7 @@

 % Improves the text layout
 \usepackage{microtype}
-\usepackage{etoolbox}
-\AtBeginEnvironment{verbatim}{\microtypesetup{activate=false}}
-\AtBeginEnvironment{verbbox}{\microtypesetup{activate=false}}
+\UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts

 \usepackage{lscape}
 \usepackage{epsfig}
-- 
2.7.4


