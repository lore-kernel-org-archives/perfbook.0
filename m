Return-Path: <SRS0=XMwo=HJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EGHNM3yDz0lj95fNLElV0Va3tIkH+HMc9AQRyvyg2es=;
        b=SqpLThnM1GcqhwynfnJ4859H65qreYkfCbe1Mj+/3CNyxrWYvp9m/Cl/Z1SykHYZbH
         slB7QiT/3q/MWKw4+K9ftiz+v5eUctwPHWAKfg4t1fVP9fPMZ9Xo+vswTHtNUOQPqLfv
         zm5OxIeSzHZkFbY0lZWvn356pMEmEJrAf5iRNsR79M2zfzWNMOf2DAZ0bF/bUGYDrEGU
         ei0GNf5V0gvMhgDKPiBph753Ig6b09rc6uD8KNaDxgfzf3Ndenccd/pPcv7dRxTsW0Ib
         P/Rdl7cuzgPiMOt9bH0CmqeCjnXc2V28I5lrbikotU48E6qW+84JzoJ+8BA1TtTjiqSg
         vk2g==
Subject: [PATCH 3/3] memorder: Substitute MIPS memory model reference
References: <21a2baaf-887d-8e98-eaad-f18948e9c377@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <33bbd170-4294-9eb8-9d53-91ab9f7e5810@gmail.com>
Date: Mon, 8 Feb 2021 00:27:09 +0900
MIME-Version: 1.0
In-Reply-To: <21a2baaf-887d-8e98-eaad-f18948e9c377@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Use an bib entry with live URL.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index c9c35b5b..362bff16 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4452,7 +4452,7 @@ CPU, including those to the same variable.
 
 \subsection{MIPS}
 
-The MIPS memory model~\cite[page~479]{MIPSvII-A-2017}
+The MIPS memory model~\cite[page~479]{MIPSvII-A-2016}
 appears to resemble that of \ARM, Itanium, and \Power{},
 being weakly ordered by default, but respecting dependencies.
 MIPS has a wide variety of memory-barrier instructions, but ties them
-- 
2.17.1


