Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6IdLnNqqIOx3C4W75h3fLgQgIz2c16LHEBD+9XvrQMA=;
 b=qlmKfFub5gTQyk/hdUiXFHLkhQ6esjE3PmLsFWDdl7F/a71ovmfAWHsDWj5SFXSVp0
 c1Qcl1Xfn9VLbbTvR/gyVtaAAPCi0kJ309lM9w9iNGBGasLKz7c4ftQQdFxXU0WfMETm
 euacJQyTdpLK31adlDBE8ZdnsOQI6Josu40ZVXKPRkPxMEY/glX248G/xq8xlnFx8N3d
 LT6ycgMPpUJCQiiL8DIUWEqPHsCd8T1Oij2ahAf9bC6r+8xjVsRwWLl3KDxJEEF3PgmG
 RNmkKa0rmQlQsPvmPOGeyZd7L2gtVub5xPvDCQ608XbhPGtaQAuisn5pfJVFJBvZCD8s
 ULHg==
Subject: [PATCH 2/2] defer/rcuapi: Move sidewaystable caption to top
References: <4cfc2b83-44b8-b1b8-056d-45f88f50c316@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <78a844fd-a4dc-c387-2b07-c25e8d606f7b@gmail.com>
Date: Tue, 24 Oct 2017 22:27:07 +0900
MIME-Version: 1.0
In-Reply-To: <4cfc2b83-44b8-b1b8-056d-45f88f50c316@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 72c667546d964d7fd40a1f21a6475c62e364e77c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 24 Oct 2017 22:15:27 +0900
Subject: [PATCH 2/2] defer/rcuapi: Move sidewaystable caption to top

Captions of sidewaystables can't be controled by float package's
styles. We need to move the caption in LaTeX source.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 6da4676..d4e434d 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -20,6 +20,8 @@ presents concluding remarks.
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.3}
 \centering
+\caption{RCU Wait-to-Finish APIs}
+\label{tab:defer:RCU Wait-to-Finish APIs}
 \footnotesize
 \begin{tabularx}{7.9in}{>{\raggedright\arraybackslash}p{1.08in}
     >{\raggedright\arraybackslash}X
@@ -115,8 +117,6 @@ Non-\tco{PREEMPT_RT} implementation &
 		    SRCU \\
 \bottomrule
 \end{tabularx}
-\caption{RCU Wait-to-Finish APIs}
-\label{tab:defer:RCU Wait-to-Finish APIs}
 \end{sidewaystable*}

 The most straightforward answer to ``what is RCU'' is that RCU is
-- 
2.7.4


