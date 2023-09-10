Return-Path: <SRS0=1fyB=E2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694309258; x=1694914058; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YnPXBBkyqJWNK52DbBqyKDsSIdw1Z8o8kQw4XhVE2A=;
        b=VfQGSwJaRoz+VpnK7jD9gCNRl5RiJjxbtrHUBjldfCsUWIkKe5uh/sCGEz46bh6p9G
         ePCjFpuN/gsH6TUzkrSt5B5fCElthBg+i/m7r49iAzrGwoVa3XUWkiXn/dP6oqQKm2N9
         8PHPOapWT1IWGcz97CReSTMlTc0D8bee6l1jJU/tyXbncqhvbEhwhuqI+QbUWL0GdEZa
         clFcUGBgCC/I4LglWGirC96aQgCdBMTQwJAAXx4L0Oqp30Ntl32sx0HjRz7x6NYBA9It
         lXAvH9u/04xlf9QaRBPKPoelSCa1mYnfHXxEqZQZ8dSBv7t5Eh64NNM3Dg6LhEVPplmp
         deUA==
Message-ID: <a467db6f-c2ff-39bb-c606-cef301b8977e@gmail.com>
Date: Sun, 10 Sep 2023 10:27:35 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] memorder: Shrink ifthen.pdf for -1c and -eb builds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

ifthen.pdf is tall and using \columnwidth makes it exceed paper
height in -1c and -eb builds.

.45\textwidth gives reasonable size figures in all layouts.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 947e09c9f885..c5958a02a274 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -449,7 +449,7 @@ on
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{memorder/ifthen}}
+\resizebox{.45\textwidth}{!}{\includegraphics{memorder/ifthen}}
 \caption{If-Then Nature of Memory Ordering}
 \label{fig:memorder:If-Then Nature of Memory Ordering}
 \end{figure}

base-commit: 645f2734592176abc2f1eb87dcd1474b78ba9d2d
-- 
2.25.1

