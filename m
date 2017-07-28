Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KGQC0Va1js2+i/2ZJEfoxbPVnDuGcSAc/JhIct6lgC8=;
 b=TzXGWSqQZY3omktCOsM3FG8qaDmuNWRl7s6+3rYSpFbvnR4wy9CCnfJMhh+m0b5uG2
 yQeRcrx5mBCx/uS+tJt9qyPv2q4xG1gGe21AOe0CTy4TJzt9dmUcsP58/TLC94gAV/cw
 FNm2gQL1J/R1OI0ZP0l+gd1a6E26ahuzq7lfkSuNG+f56hLizvrPw/iekJlH6grajBcm
 CtAP9ddMyl6WeVTIIFadnAah8O2prtUFCd3gGb2VA8kbxotZX+0QEUDgR7jeow+7JhSy
 P8roLLqU0Lci9dD1SVn4/kZX+5NZLmEyJ9nJi1S1hh6ZK+TrvZXVDmjHqRX8q1vlhuJY
 wgpg==
Subject: [PATCH 10/10] styleguide: Tweak layout of 'Limitation' table
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <32b16a54-7071-0bc0-87b5-3381bb39e080@gmail.com>
Date: Fri, 28 Jul 2017 19:06:36 +0900
MIME-Version: 1.0
In-Reply-To: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cdfca8b81a7d4ee194272359d1775c0c343e0fbe Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 28 Jul 2017 16:46:48 +0900
Subject: [PATCH 10/10] styleguide: Tweak layout of 'Limitation' table

Move caption to top, and use nice ruled lines of "booktabs".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 17a74d7..3e5746b 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -389,15 +389,20 @@ Table~\ref{tab:app:styleguide:Limitation of Monospace Macro}
 lists such limitations.

 \begin{table}[tbh]
-\centering\footnotesize
-\begin{tabular}{lll}
+  \renewcommand*{\arraystretch}{1.2}
+  \begin{floatrow}[1]
+    \ttabbox[\columnwidth]{
+\footnotesize
+\begin{tabular}{@{}lll@{}}\toprule
   Macro &  Need Escape & Should Avoid \\
-  \hline
+  \midrule
   \co{\\co}, \co{\\nbco} & \co{\\}, \%, \{, \} & \\
   \co{\\tco}  & \# & \%, \{, \}, \co{\\} \\
+\bottomrule
 \end{tabular}
-\caption{Limitation of Monospace Macro}
-\label{tab:app:styleguide:Limitation of Monospace Macro}
+}{\caption{Limitation of Monospace Macro}
+    \label{tab:app:styleguide:Limitation of Monospace Macro}}
+  \end{floatrow}
 \end{table}

 While \verb|\co{}| requires some characters to be escaped,
-- 
2.7.4


