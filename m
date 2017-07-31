Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35954 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750987AbdGaOxB (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 31
 Jul 2017 10:53:01 -0400
Received: by mail-pf0-f194.google.com with SMTP id t83so1750815pfj.3 for
 <perfbook@vger.kernel.org>; Mon, 31 Jul 2017 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pYP2bXKLyJnoeElVRUmWxdZR/sHnjgRMqkAsH65csss=;
 b=IQwL0eLJjfgEKGoX2P663O/B15Gqt/pKuejQ5nelBxSFGlKQmnfHjcUte3a8Lr7Zs0
 IKku2jObALE1y1Mi9oBre7r9ymacPWlNTrhGQHfjdnK/VfcPnNEs9L0aU/fkOt1Taaq2
 LWFRerfch8QAMP+vdb0nGaApIRLpIJpQcUprGfeka5PtJ7K7Zk/S/0ZUqMYbctMBFgf+
 EL06Slh7yDKpRjhQCCa7UuJwdOezh6yTbDP37MYBuBFS6nz9yi84vAicSJWmCEBbgs/k
 6mLJsG1gwUrAJh3x8lgmriDPK7epnZKCwjuq/5qHqSmQ8KSdrWEIkLh9B8w6wqrQqdkF
 ppFA==
Subject: [PATCH v2 8/8] styleguide: Tweak layout of 'Limitation' table
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0be0e561-fb12-011b-14e4-13c6e76b8502@gmail.com>
Date: Mon, 31 Jul 2017 23:52:58 +0900
MIME-Version: 1.0
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From e35b5bc0c56f255caee91054f05a5dd7b824b5fa Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 28 Jul 2017 16:46:48 +0900
Subject: [PATCH v2 8/8] styleguide: Tweak layout of 'Limitation' table

Move caption to top, and use nice ruled lines of "booktabs".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index ac95364..6f5236f 100644
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


