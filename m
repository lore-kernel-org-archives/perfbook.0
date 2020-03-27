Return-Path: <SRS0=2js+=5M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JeWRKaLi181c72lTh2O+BPNbm8b5sLEe8dflbFWD/8E=;
        b=J6x171vJcfxX629flQO7eZAr5iay2Z30HVAfKOr4H8tjmdfS/A3Pg9ssVvgh9RJJv/
         Hn7WMjWdlUhu6gR/p/e++WRtrNB7twaW6SZjdoZCxIKg+8H6BvQHRW+Idr0mfLAVwwJL
         vfYlXt4TW+JsKuHZyXDKC03Dky3KE1451BY6BL2KnKX/GT840MXK+7z+TIkHtFwf/DqP
         ehbI2GkXG0O8nMoMIJRhAP96dkghz2jAKdZNVYrFEC1qn1DoFRm1O8s0qt0BE1Md78LC
         F9gPN2S9vFOFeNDEnKsP/zTh30Z++SQpmQADT8e//yadNBrFWMAShSEbOS3vNBHBGOFO
         ZfUA==
Subject: [PATCH 3/4] toolsoftrade: Fix trivial typo (api-pthreads.h)
References: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <16c421b1-e723-4c34-e75b-36ad129e0660@gmail.com>
Date: Fri, 27 Mar 2020 20:28:53 +0900
MIME-Version: 1.0
In-Reply-To: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9ed9db213b9c687df6f0143e4eec93bfbecddd72 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Mar 2020 00:19:24 +0900
Subject: [PATCH 3/4] toolsoftrade: Fix trivial typo (api-pthreads.h)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 8fdd2f52..8869a79d 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -240,7 +240,7 @@ process.
 It is therefore customary to wrap \co{wait()} into a function similar
 to the \co{waitall()} function shown in
 Listing~\ref{lst:toolsoftrade:Using the wait() Primitive}
-(\path{api-pthread.h}),
+(\path{api-pthreads.h}),
 with this \co{waitall()} function having semantics similar to the
 shell-script \co{wait} command.
 Each pass through the loop spanning \clnrefrange{loopa}{loopb}
-- 
2.17.1


