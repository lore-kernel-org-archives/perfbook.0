Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3UHIH18sn1TaPLDhilikZNl3lWi4YNyXdqZQ0wFgXVE=;
 b=XjEkknokTsU0yIG6qYBJ4axQ03EYoI9D1B4qeSbDyMcqa3iEXoWlH9+iE4E700jqr/
 e35GlIRL04cvMVDyFOfrooVPi/NNNh35m/+/5Ld2AJKkxjIsZ3H0SfvSDZfdzw+ba5HA
 xFXcjqHo90UgfMXZE+DvUUPfUyJ6f4i0NVihlNlB3JrpDX0TXFVdgXUNT1TfbLN5Fg75
 /DnSxdm6GAZ2BuXLChGMQwnHLYNNYXyJZjoAKEdM//KLLNvE0s2eFgYKpmzOnNN8seMs
 wbdVG/wDVhf8DW36tfHFwavdW0wB4hWLwt67ezSJbL/DICJ2eGPymFVzgTT7XfcvMGwZ
 mZTw==
Subject: [PATCH 3/3] Remove font family specifier in \Epigraph{}
References: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <022fa74a-8d71-74b3-d2c8-72506587612a@gmail.com>
Date: Sat, 1 Sep 2018 09:15:59 +0900
MIME-Version: 1.0
In-Reply-To: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 40c5e61208be1df272b99fa103b9d74ddbb1c379 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 31 Aug 2018 20:48:07 +0900
Subject: [PATCH 3/3] Remove font family specifier in \Epigraph{}

Now that section-level epigraphs are added, roman font of chapter-
level epigraphs looks inconsistent in sans serif font target.
Let's remove the font specifier in the definition of \Epigraph{}.

NOTE: This is a partial revert of commit 649eb172512a ("Makefile:
Add target '1csf' (one-column sans serif)").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 677c354..fb35c5a 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -187,7 +187,7 @@
 %\newcommand{\mytexttrademark}{\textsuperscript\texttrademark}
 %\newcommand{\mytextregistered}{\textsuperscript\textregistered}

-\newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}
+\newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}

 \input{ushyphex} % Hyphenation exceptions for US English from hyphenex package
 \input{pfhyphex} % Hyphenation exceptions for perfbook
-- 
2.7.4


