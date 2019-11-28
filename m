Return-Path: <SRS0=65dD=ZU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FfG1jvO7Us7+wQ9xwIqsjhzHnfmP7s6RtEAmQFZVTNI=;
        b=O7jcMqBl3Iuv78C/Jyz2XmXkxNBq3GSn3PXtRiQBR75elkySatv1hbCeuaSq/FNEF1
         rehv81ggRzXnDGCjEHJVP5PRWY06ARxr4N/MVePMCbT+rWQIvKyBxVByo7jHwrWJUqdf
         MbpcJXtMY0ICHBOtUcNHe8uRJ8ntUQiPIQEMmWwF8nRe+HmIucKlVJ2mBU3s/xoH24ho
         yao4YiFMIuF+CryhzamprjsTMHAq2MAYz2weFwOn4DWGELXYwZNzimp38IGawuFd6Kyc
         +OLN7WfZsG3myQKHTY0EmgmNUxND8bTg1HkO24Ix4tBNYhEIfvvgk7AcPBWZw8z0fR1B
         X4zg==
Subject: [PATCH 3/3] toolsoftrade: Use 'quote' for made-up dialogue
References: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3dbff346-9eb9-65d4-8981-af435f42b902@gmail.com>
Date: Fri, 29 Nov 2019 07:27:54 +0900
MIME-Version: 1.0
In-Reply-To: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From df9bed4d21029054ed07c2b92b3dfdf84cd651b8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 29 Nov 2019 00:22:17 +0900
Subject: [PATCH 3/3] toolsoftrade: Use 'quote' for made-up dialogue

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index c9fee28b..470e0a93 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2350,10 +2350,12 @@ limiting or even entirely avoiding data races.
 \subsubsection{Avoiding Data Races}
 \label{sec:toolsoftrade:Avoiding Data Races}
 
+\begin{quote}
 ``Doctor, it hurts my head when I think about concurrently accessing
 shared variables!''
 
 ``Then stop concurrently accessing shared variables!!!''
+\end{quote}
 
 The doctor's advice might seem unhelpful, but
 one time-tested way to avoid concurrently accessing shared variables
-- 
2.17.1


