Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mWgTKpvw41CWMzP1CUrijacyqrl5/Q5SjREfMLzkbVU=;
 b=RHakb5oAjdLvrUMom0WlaO/OsyszhqWzgkovk10opY9xXCBLeaw9eOkyXU78zkT1Pp
 q8lQvT5kUzt9rfXonrDbzPttq6iVKjxfy/JgqbRkAFPYLKnsyIB5dXmEZLIK6GXAhmaF
 WSv0DCSNQ0y5R5jbB272ZXjTqdy9uOApoE26aq4u2K4vigQpJ4rZbXlmm9pO+9taEIY5
 T0JNbjhCkLEMjO0+WrQQN9RFPM01XT6nHdx5zTYqxufvrwpKWfLbkgambHekLS6mogza
 QvL7fCtOVdjov/yD1SvXC5utsiBO7HSlA9HMkm/FD3YniNB1O3AasxL2ZYnazADHyvN9
 RKmw==
Subject: [PATCH] Promote 'ruled' style as default of 'listing' environment
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
 <20170808223314.GK3730@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <51e05fb2-c89d-0cd5-d69f-968b5f61e0b8@gmail.com>
Date: Wed, 9 Aug 2017 07:44:39 +0900
MIME-Version: 1.0
In-Reply-To: <20170808223314.GK3730@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 74a0c53cb677deafcb68b9a22efcffd08b724f74 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 9 Aug 2017 07:40:41 +0900
Subject: [PATCH] Promote 'ruled' style as default of 'listing' environment

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 3 ---
 perfbook.tex                       | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index f869360..829a9c2 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -636,9 +636,6 @@ For code snippets, the ``ruled'' style would be our choice.
 Listing~\ref{lst:app:styleguide:Sample Code Snippet (Ruled)}
 is an example using the style.

-\floatstyle{ruled}
-\restylefloat{listing}
-
 \begin{listing}
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
diff --git a/perfbook.tex b/perfbook.tex
index f622708..8f166ec 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -18,7 +18,7 @@
 \usepackage{etoolbox}

 \usepackage{float}
-\floatstyle{plain}
+\floatstyle{ruled}
 \newfloat{listing}{tbhp}{lst}[chapter]
 \floatname{listing}{Listing}
 \usepackage{lscape}
-- 
2.7.4


