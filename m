Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PgCLt4LfI/W/ICgJuKJDJ6jnBl1vnDueKu9WfDQLgqQ=;
        b=lRU4HQlaVPuaZqP64l7veZV+SPFTKNGuhGFYNgnGyBL3k+15vE6ZsnJjR17LYtO7+2
         K0qEQoz0yi9GyOluS93xRCZYaWt43EMHKuY1n5e7/dvRSfyu9i4zzOwgnOgQtngST2sY
         OufgMEPtwvuqcVEUDo/sRS3cCpHrzJ621LBLcsvVrxxeUjl1WMKTtjnLLk5voRf/sCNR
         ZD83ltYoftg3l7HbjQjPN0c69mRXbNPRa5deXByI07ixieGeKUS5Yp3xNwmMSHIJ1BWG
         B/EM1Jvtpfh2QMltLVMJqJ20kaikOHeGh6MzzH6KdC5Z9GSBpEgXSUO3DCBoN+OBvNXP
         NVTw==
Subject: [PATCH 1/3] owned: Employ new snippet scheme
References: <1c49a5ed-290f-f81c-a768-b2d5d2450b43@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9aab89ea-ac22-6f48-fc7e-fe4bda4e5cf1@gmail.com>
Date: Sun, 25 Nov 2018 23:46:18 +0900
MIME-Version: 1.0
In-Reply-To: <1c49a5ed-290f-f81c-a768-b2d5d2450b43@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c28ee5d0a127fefa6e9e4bd2156039c0e5e6653e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Nov 2018 21:26:26 +0900
Subject: [PATCH 1/3] owned: Employ new snippet scheme

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 owned/owned.tex | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/owned/owned.tex b/owned/owned.tex
index d584e82..d0063d3 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -57,18 +57,13 @@ first-class citizen.
 Section~\ref{sec:toolsoftrade:Scripting Languages}
 introduced the following example:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 compute_it 1 > compute_it.1.out &
-  2 compute_it 2 > compute_it.2.out &
-  3 wait
-  4 cat compute_it.1.out
-  5 cat compute_it.2.out
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+compute_it 1 > compute_it.1.out &
+compute_it 2 > compute_it.2.out &
+wait
+cat compute_it.1.out
+cat compute_it.2.out
+\end{VerbatimN}
 
 This example runs two instances of the \co{compute_it} program in
 parallel, as separate processes that do not share memory.
-- 
2.7.4


