Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DH6uocRqFmcWXI5Y3GcK40G7jWO5GfBgMVSXRUIItXU=;
        b=J0oHYIHl/5VJMQFIPeaxkAGELNmLJbh8MObolZmVIcykRZVRH30DtOm2Hkf3FLGoni
         rh0WAWmLsakxqLVkal+A3PdtJ3Ai1KQ1uXU8NShqeQlXWxCd/excwCLZM4VVZZf1okuA
         Dc9kUoE7GQWhzyaWQVxCVyarKHKR/qw8+7DZLfBG6Q56hyf5NbIDztuhT3+Mc3A+Fzjp
         G2cu3/pg3Udz/NBvs0PWZlGTA6Cw7lCCYq9pzkFdoa5pkRqNK/NmuMNKRWGYeWJpTH8O
         traqXhL3LtvhkKyr8LEjn4iw3HLyA/1bEVsPjjjmravpwT28Axna+xZSY/0NP+RU+I2w
         xf9w==
Subject: [PATCH 7/9] Enable 'single' frame around inline code snippets
References: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a16a9a38-0854-6354-d628-1766bd9dbdba@gmail.com>
Date: Sun, 23 Sep 2018 16:31:33 +0900
MIME-Version: 1.0
In-Reply-To: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b69a5a8bcb76b49c5f1f30ba31d7280a67c0b87d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 30 Aug 2018 23:01:03 +0900
Subject: [PATCH 7/9] Enable 'single' frame around inline code snippets

Inline code snippets can have frames by modifying the definitions
of VerbatimN and VerbatimU environments.

Definition of \lnlbl{} command for VerbatimN needs tweaks to
raise the position of anchor a bit to compensate extra vertical
space around frame.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 1dc72c2..3547f64 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -117,9 +117,9 @@
 {fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=2}
 \AfterEndEnvironment{VerbatimL}{\vspace*{-9pt}}
 \DefineVerbatimEnvironment{VerbatimN}{Verbatim}%
-{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=25pt,obeytabs=true,tabsize=2}
+{fontsize=\scriptsize,numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,obeytabs=true,tabsize=2,frame=single}
 \DefineVerbatimEnvironment{VerbatimU}{Verbatim}%
-{fontsize=\scriptsize,numbers=none,xleftmargin=15pt,obeytabs=true,tabsize=2,samepage=true}
+{fontsize=\scriptsize,numbers=none,xleftmargin=5pt,xrightmargin=5pt,obeytabs=true,tabsize=2,samepage=true,frame=single}
 
 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
@@ -242,6 +242,9 @@
 %\fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=2}
 \newcommand{\lnlblbase}{}
 \newcommand{\lnlbl}[1]{\phantomsection\label{\lnlblbase:#1}}
+\AtBeginEnvironment{VerbatimN}{%
+\renewcommand{\lnlbl}[1]{\raisebox{6pt}{\phantomsection\label{\lnlblbase:#1}}}%
+}
 \newcommand{\lnrefbase}{}
 \newcommand{\lnref}[1]{\ref{\lnrefbase:#1}}
 
-- 
2.7.4


