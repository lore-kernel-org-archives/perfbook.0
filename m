Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37681 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751951AbdGaOwJ (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 31
 Jul 2017 10:52:09 -0400
Received: by mail-pg0-f65.google.com with SMTP id k190so15382899pgk.4 for
 <perfbook@vger.kernel.org>; Mon, 31 Jul 2017 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ay1yq+uoW4Cxx7UE0m0TwLevI0vhF01sw+HltMDi8n8=;
 b=hWAd1hJd88xaNxi6dMnkKbrm0wAVONo+Q71qJNNuBV1vT0xS9t/NKuEuRpUUsSyU7h
 2l+g/UsMU/3K4pjS/J96KilNt9nCe1V8U2p2KUKU2bUoSXDaLstXQpZssZuEQ97pbr0I
 PzY9fhbVTNn9V0t/HfLiUnaV+87MWVGqGxDbN2QahjF77KNuVVkjYzX/V/L+EW3JPiAm
 ASAODG559Zu7wk2MFrm+0iC3HVa8fKlzWsAxeK5BU6jZOXDkl2ljV5YbWy8zYy4I396D
 0uvmFxcnJOb3c0GLFB0RiwRNKflfp0ZTiL358udHjvVMKHg+yVctnCExYcN3HVuF7Ylr
 q8Yg==
Subject: [PATCH v2 7/8] styleguide: Add example of preferred table layout
 using 'booktabs'
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8b44aa0e-d0ee-be67-28fd-0fb9b6aa79ca@gmail.com>
Date: Mon, 31 Jul 2017 23:52:04 +0900
MIME-Version: 1.0
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 5845c0f3d977aa65f167bba16ceace693e47764a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 21 Jul 2017 22:31:43 +0900
Subject: [PATCH v2 7/8] styleguide: Add example of preferred table layout using 'booktabs'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 35 ++++++++++++++++++++++++++++++++++-
 perfbook.tex                       |  1 +
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index f84ade8..ac95364 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -758,7 +758,40 @@ look ugly.\footnote{
 Vertical lines should be avoided and horizontal lines should be
 used sparingly, especially in tables of simple structure.

-% TODO: Add example
+For example,
+Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
+can be tweaked by the help of ``booktabs'' package as is shown in
+Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System},
+with the caption at the top.
+
+\begin{table}[htb]\RawFloats
+\renewcommand*{\arraystretch}{1.2}
+\begin{floatrow}[1]\ttabbox[]{
+\small
+\begin{tabular}{@{}lrr@{}}\toprule
+				& 	 	& Ratio \\
+	Operation		& Cost (ns) 	& (cost/clock) \\
+	\midrule
+	Clock period		&           0.6	&           1.0 \\
+	Best-case CAS		&          37.9	&          63.2 \\
+	Best-case lock		&          65.6	&         109.3 \\
+	Single cache miss	&         139.5	&         232.5 \\
+	CAS cache miss		&         306.0	&         510.0 \\
+	Comms Fabric		&       5,000\textcolor{white}{.0}
+						&       8,330\textcolor{white}{.0}
+								\\
+	Global Comms		& 195,000,000\textcolor{white}{.0}
+						& 325,000,000\textcolor{white}{.0} \\
+\bottomrule
+\end{tabular}}{
+\caption{Performance of Synchronization Mechanisms of 4-CPU 1.8\,GHz AMD Opteron 844 System}
+\label{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
+}
+\end{floatrow}
+\end{table}
+
+Note that ruled lines of booktabs can not be mixed with
+vertical lines in a table.

 \subsubsection{Miscellaneous Candidates}
 \label{sec:app:styleguide:Miscellaneous Candidates}
diff --git a/perfbook.tex b/perfbook.tex
index 629ecea..16d30dd 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -82,6 +82,7 @@

 \usepackage{floatrowpf} % Use customized floatrow
 \DeclareNewFloatType{listing}{placement=htbp,name=Listing,within=chapter,fileext=lst}
+\usepackage{booktabs} % For better looking tables

 \usepackage{bm} % for bold math mode fonts --- should be after math mode font choice

-- 
2.7.4


