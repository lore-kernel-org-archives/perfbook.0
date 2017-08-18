Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2TXNhovL03BPCvKaAdQOFVw54a2+AdA8VJgeJz3Q/dE=;
 b=c4TKedEyCg5FMa7fJguEqUF9WVsX6qjP7DfynRqtE0O/ovOzWPcj/ntitZhtbl9ERv
 ZEogX6fRT4rxCIYlU1H7gtUQdNNWhsB4LLMsNXf9GwG+ZE+5N61xXVgdJ9kWot1E77Bx
 +meSfLwl/7l6qdVxCUJrKTruv1w7RFwvGGVz++taMNjNtYNSZv9LrlUJ1+Can9LqrdjY
 9SiK0Jyu60d8XGi39l+Lw2cdZu9JOjGLiJ3UZUhT1FD/RYdcD/ZJrfhLcOwmjsRpKPk/
 cu3BAUUnBc5KW9v6cxy7SvNTXZPuuSPewo1kjOKjLgpuyyn2JhtucZGYcQ+J76wYf8rL
 J9TQ==
Subject: [PATCH 1/4] Use 'fixltx2e' package
References: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8767b3fd-88bd-4c67-5b86-57b7db5995e1@gmail.com>
Date: Sat, 19 Aug 2017 08:31:03 +0900
MIME-Version: 1.0
In-Reply-To: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8dd783f1bcb1eb6ee24cd98596e8b9099b8c3251 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 18 Aug 2017 07:51:04 +0900
Subject: [PATCH 1/4] Use 'fixltx2e' package

"fixltx2e" package had provided several fixes to LaTeX core.
Those fixes were applied to LaTeX core in 2015 [1].
We need it to use "\textsubscript" in older LaTeX installation.
In later versions of LaTeX, this package is no-op.

[1]: https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-820009.1.12

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook.tex b/perfbook.tex
index 9f1644d..4590338 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -17,6 +17,7 @@
 \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
 \usepackage{etoolbox}

+\usepackage{fixltx2e} % for \textsubscript, nop on Tex Live 2015 and later
 \usepackage{float}
 \floatstyle{ruled}
 \newfloat{listing}{tbhp}{lst}[chapter]
-- 
2.7.4


