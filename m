Return-Path: <SRS0=onBR=PQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z+XtMCOwiT+hlbMs2+xy1bwOBLgCnRpNMw/r+aWvW3o=;
        b=l+DGD2QtDnRbR76XWwz05CkI8swgGcatmTa+WlMckuwOEK0EYcNJNQ5XvqzkTMlHZO
         Gym77ulvwNe6Rwv/XA/LglyJ/1LC0VF1rgWBafRfTI03VweLrDovIx/RUc1Eog1qLUmn
         LUmK6LG78uWGZr25DHygyqI/3qjTTSsEWQ1cpoJU1+6s9mYPIp67Mlql5nemflXLSfFK
         3xVbUOs9yZA/hecSxPTCipAr/GZjRFxPaisxBZCPgkj2RggunaZm77/WnHkGl7D3Hob9
         vhjExjTXTLVMp8gra7aEozwT7YOlRPZVoBYsM6U4g6X3RzLLbsBC9kkwgoQBdieDrgFV
         002w==
Subject: [PATCH -perfbook 1/5] Shrink Figures 9.27 and 14.3 in 2c builds
References: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1e6842a6-92fe-678c-a2ad-8f85d08cce22@gmail.com>
Date: Thu, 28 Oct 2021 09:14:24 +0900
MIME-Version: 1.0
In-Reply-To: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

\textwidth is too large for them in 2c builds.
Use \onecolumntextwidth defined in the preamble instead.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/rt.tex     | 2 +-
 defer/rcuusage.tex | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index b82153d9..69b80ec6 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -133,7 +133,7 @@ it can alert the hospital staff.
 
 \begin{figure*}
 \centering
-\resizebox{\textwidth}{!}{\rotatebox{90}{\includegraphics{cartoons/realtime-lazy-crop}}}
+\resizebox{\onecolumntextwidth}{!}{\rotatebox{90}{\includegraphics{cartoons/realtime-lazy-crop}}}
 \caption{Real-Time Response:
 			     Notification Insufficient}
 \ContributedBy{Figure}{fig:advsync:Real-Time Response: Notification Insufficient}{Melissa Broussard}
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index f61daa09..977ffdaf 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -855,7 +855,7 @@ longer any readers still referencing it.
 
 \begin{figure*}
 \centering
-\resizebox{\textwidth}{!}{\includegraphics{defer/RCUspacetime}}
+\resizebox{\onecolumntextwidth}{!}{\includegraphics{defer/RCUspacetime}}
 \caption{RCU Spatial/Temporal Synchronization}
 \label{fig:defer:RCU Spatial/Temporal Synchronization}
 \end{figure*}
-- 
2.17.1


