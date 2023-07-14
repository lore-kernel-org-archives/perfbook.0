Return-Path: <SRS0=mW18=DA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689343762; x=1691935762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psbJudpoW9OGZCck23hC1nbj8LEezmGP3QW4Tdb5gwU=;
        b=CQoHxYFMC6Q/EqA+Ebs4HAktxBp/eibWC5nAd1GvOdjQshf1Ku8XxjpeocA1A6EJef
         dxX67MdDRHOLb1rDjyC8HvPnzaP+iAysuHCSEFuPTVewFcbMs5cJEsuAJu9FrZYbWuN2
         xg0Cs0hvMxwkRL8DHQMQev6ZJP/t+uaYixQlj8REWpoxIx1DTrUK9cjHJXgsXb5GGGs1
         BVhzaDlXoozglEtygdp2wPnfq2y5FMW7NvmHXt3vZ608pOtlxvGRX+6ExKNctpkHGGW3
         RwmyDPPlBPQJ2YBgCxzRliu2R6xGsP0Ft4s35ivqDZlY+Nq/C7mZbQsvhw9xndPu/lXj
         Bs/g==
Message-ID: <4ac5f652-6b9d-ebfb-0f06-4459d955819a@gmail.com>
Date: Fri, 14 Jul 2023 23:09:19 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] SMPdesign: Specify sans-serif font in pstricks
 figures
Content-Language: en-US
References: <f8a28118-e3e4-d3ef-faa6-6c874e5c463a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f8a28118-e3e4-d3ef-faa6-6c874e5c463a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The newtxtext package provides Helvetica-clone for sans-serif
font family.

As most other figures have sans-serif fonts with the help of fixfonts
scripts, use it in pstricks figures for consistency.

Compensate the slightly smaller look of the labels by using \large.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/DiningPhilosopher4part-b.tex | 3 +++
 SMPdesign/DiningPhilosopher5.tex       | 3 +++
 SMPdesign/DiningPhilosopher5PEM.tex    | 3 +++
 SMPdesign/DiningPhilosopher5TB.tex     | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/SMPdesign/DiningPhilosopher4part-b.tex b/SMPdesign/DiningPhilosopher4part-b.tex
index 1a90f8105d5c..2d1c307ef7c0 100644
--- a/SMPdesign/DiningPhilosopher4part-b.tex
+++ b/SMPdesign/DiningPhilosopher4part-b.tex
@@ -5,9 +5,12 @@
 \usepackage{pst-eps}
 \usepackage{multido}
 \usepackage{calc}
+\usepackage[helvratio=0.9]{newtxtext}
+\renewcommand{\familydefault}{\sfdefault}
 
 \begin{document}
 \thispagestyle{empty}
+\large
 
 \begin{TeXtoEPS}
 \begin{pspicture}(12,10)
diff --git a/SMPdesign/DiningPhilosopher5.tex b/SMPdesign/DiningPhilosopher5.tex
index 08e6931846e6..a892f11bc42d 100644
--- a/SMPdesign/DiningPhilosopher5.tex
+++ b/SMPdesign/DiningPhilosopher5.tex
@@ -5,9 +5,12 @@
 \usepackage{pst-eps}
 \usepackage{multido}
 \usepackage{calc}
+\usepackage[helvratio=0.9]{newtxtext}
+\renewcommand{\familydefault}{\sfdefault}
 
 \begin{document}
 \thispagestyle{empty}
+\large
 
 \begin{TeXtoEPS}
 \begin{pspicture}(12,10)
diff --git a/SMPdesign/DiningPhilosopher5PEM.tex b/SMPdesign/DiningPhilosopher5PEM.tex
index 25aee7a401a1..55db3773608c 100644
--- a/SMPdesign/DiningPhilosopher5PEM.tex
+++ b/SMPdesign/DiningPhilosopher5PEM.tex
@@ -5,9 +5,12 @@
 \usepackage{pst-eps}
 \usepackage{multido}
 \usepackage{calc}
+\usepackage[helvratio=0.9]{newtxtext}
+\renewcommand{\familydefault}{\sfdefault}
 
 \begin{document}
 \thispagestyle{empty}
+\large
 
 \begin{TeXtoEPS}
 \begin{pspicture}(12,10)
diff --git a/SMPdesign/DiningPhilosopher5TB.tex b/SMPdesign/DiningPhilosopher5TB.tex
index fcf96e9dee84..c2015991cd5e 100644
--- a/SMPdesign/DiningPhilosopher5TB.tex
+++ b/SMPdesign/DiningPhilosopher5TB.tex
@@ -5,9 +5,12 @@
 \usepackage{pst-eps}
 \usepackage{multido}
 \usepackage{calc}
+\usepackage[helvratio=0.9]{newtxtext}
+\renewcommand{\familydefault}{\sfdefault}
 
 \begin{document}
 \thispagestyle{empty}
+\large
 
 \begin{TeXtoEPS}
 \begin{pspicture}(12,10)
-- 
2.25.1


