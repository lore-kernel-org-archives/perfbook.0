Return-Path: <SRS0=IApJ=TF=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GtbqUzOMTbt2mSm3cj2Lm30SptJSm/EuaPYw2n1hNm0=;
        b=F3igLYMncE1EkZVWGaHD6IcskumHUkNydR2+e8ektkJ81LjKGzqF2Uis3lUSfCF1y0
         tFJJFjWCrt1Qc7Qvm4OqOH2VRLAM0xrUvnbk0xZNk0iBNvltB7ulEIck/PSkQDnTna8I
         WxNSv9rzvooNncTJ+j8pZd/5kcWiF4DileTG4CchurLScIBo1jy4bHlZkZgYyqQ+nRHj
         q4aslXJVtpeFVo+FFXLR3xWMKBIxepTE4J6dPXkd/fghL5H67QEo8tRLBT8/9niQXGzO
         MJ9GDLgJE+Mo/nykYAXRFaqNYGXSzoRvc3p7Xm/Fx0ZFhfWGmOhKa3Ac+XJDhalHVQBV
         5k4w==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] future: formal: Fix an indefinite article
Date: Tue, 22 Feb 2022 10:18:57 +0800
Message-Id: <20220222021857.4002-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In section formal regression test, "an question" should be "a question" instead.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul,

I think in the first paragraph of section formal regression test,
"an question" should be "a question" instead.

I am very interested in this section. I have published a paper
related to formal methods 17 years ago, you may like it ;-)

"A formal description of SECIMOS operating system"
https://dl.acm.org/doi/10.1007/11560326_22

Many thanks
Cheers
Zhouyi
--
 future/formalregress.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/formalregress.tex b/future/formalregress.tex
index e33c5161..279f4596 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -11,7 +11,7 @@
 
 Formal verification has long proven useful in a number of production
 environments~\cite{JamesRLarus2004RightingSoftware,AlBessey2010BillionLoCLater,ByronCook2018FormalAmazon,CaitlinSadowski2018staticAnalysisGoogle,DinoDistefano2019FBstaticAnalysis}.
-However, it is an question as to whether hard-core formal verification
+However, it is a question as to whether hard-core formal verification
 will ever be included in the automated regression-test suites used for
 continuous integration within complex concurrent codebases, such as the
 Linux kernel.
-- 
2.25.1

