Return-Path: <SRS0=KNbq=QX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=h1c0BgJw4xB3URTbcTJ+x3utBwL2ppRqDONXrJ9bKHc=;
        b=I2hQn9H+ek+BAXXIx9nchC7pY5jDfdm1cxB4+CbkAgf5+WF71CpKVn9r+irkAbMfHe
         LucKlzKDeEv29bGWCicLP5p+X1JCFzaOROKt4mE+ujs7ZjTzZklNC/TMRyyAModY3nqf
         vZAerv2DzGik3RzWzvmQLmeA9YgvFjDAYorzdvlgeG6YlgJ1DmHKnfdr+81Dd4CpnHr+
         5wegTqujd+qXLSqB6ebw2g2ISvasQwn/QRQD0RSKDtooewqMLIWGMfqgFW4b0DyMYa/w
         C73rqX+5+EmphtdKDY4SADc2iomq0Nz4YobOvcI05QC9pqF2v3OyWpS2qoFQI7iHh6YF
         RxNw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] defer: Use \twocolumnwidth in Figure 9.24
Message-ID: <739396e3-6ade-95cf-07dc-098cd8066bde@gmail.com>
Date: Mon, 6 Dec 2021 12:01:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Using \columnwidth results in a too large figure in 1c and eb
builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 8d81a9d5..01342fda 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -416,7 +416,7 @@ was shown in the previous sections.
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{defer/RCUphasedstatechange}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{defer/RCUphasedstatechange}}
 \caption{Phased State Change for Maintenance Operation}
 \label{fig:defer:Phased State Change for Maintenance Operation}
 \end{figure}

base-commit: b88e3be21e3695740422a41933bb32ae51522f01
-- 
2.17.1

