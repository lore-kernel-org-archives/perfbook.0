Return-Path: <SRS0=UsGV=3B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nph4zh99YYt3KkfJmTS3pxHhY1FB6PHHjAPA1rYLwGI=;
        b=khN+idbf+irxy6GD7AqZMI5VbWW6AuXB3ju1SG0ByhJM9mHZWHQRnDZeSFwKPGTGK9
         SiaimKJf5BErcWcgozxxh6WQUUaXySccGdb9xx9to29mpPoe0TtOnMdxZ4dOl1Cs4mGo
         uxKDQOW/WGeaVTAO0gKPx7bS7qXqHgp9YtqeezkVr6qGyIPTiniNh6KXYu34VdZ4jPXM
         obFkRNePDsT6sr1zKXKpuGXGCs/uTYVABSuoOKVYMb1VAj4ywEWN4Uj7tSIYXJyo+UOX
         qXxUmD+vGBCYMd9yYTfsVkqpzOnU3AB9ZoyrHM88XZOk0NoYUGLB3mP5EF9PdeeY4Hck
         zyGQ==
Subject: [PATCH 5/6] Use unbreakable endash in \clnrefrange{}{}
References: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <28bdfc6f-3929-cd9b-2f90-1c7fc2777869@gmail.com>
Date: Sun, 12 Jan 2020 13:12:27 +0900
MIME-Version: 1.0
In-Reply-To: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 58779425864798ce510aad617746f3b3360868bc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 11 Jan 2020 18:29:59 +0900
Subject: [PATCH 5/6] Use unbreakable endash in \clnrefrange{}{}

Using a shortcut macro "\==" instead of a plain endash ("--")
can prevent widowing of the 2nd cross reference.

NOTE:
cleveref's \crefrangeconjunction macro could also be changed as
well to change the behavior of \crefrange and \Crefrange commands.
However, such a change would end up in large under/over fill
where generated cross-references are more than a few characters
long.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 38272761..e8610a34 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -236,8 +236,8 @@
 }
 \newcommand{\clnref}[1]{\clnrefp{#1}{line}}
 \newcommand{\Clnref}[1]{\clnrefp{#1}{Line}}
-\newcommand{\clnrefrange}[2]{lines~\lnref{#1}--\lnref{#2}}
-\newcommand{\Clnrefrange}[2]{Lines~\lnref{#1}--\lnref{#2}}
+\newcommand{\clnrefrange}[2]{lines~\lnref{#1}\==\lnref{#2}}
+\newcommand{\Clnrefrange}[2]{Lines~\lnref{#1}\==\lnref{#2}}
 \newcommand{\clnrefthro}[2]{lines~\lnref{#1} through~\lnref{#2}}
 \newcommand{\Clnrefthro}[2]{Lines~\lnref{#1} through~\lnref{#2}}
 \newcommand{\pararef}[1]{Paragraph ``\nameref{#1}'' on Page~\pageref{#1}}
-- 
2.17.1


