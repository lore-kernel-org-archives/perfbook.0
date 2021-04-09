Return-Path: <SRS0=wSYu=JG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=3sqXNjqrEtVBu4xlLwiHKZZi/DH5fkZvTR0RiyWdqlg=;
        b=qFL5M8m3v50Y/Q6dEEgbTJJ120A2MmP9pSQaYbSqppHiSRSvL8+uDDwzUzk+Rg7GMz
         cA14pcVXOSB6pzC878rVJf2B+OQC/nHLn9EkSfdVAOv7F2L32KPN/eXXJ6mNb9Rij/8Y
         OXiPyxeU28999BC3Pqc7MQUPUOmGPxmVq2hs9V6lfHE0u9utWsVuTCn/55WFyF/PZAmh
         80Me7mpuJPOYyxozbeDHmjdgK4vIMtaOrFfvBfqn3B/GFrmAp7SgRAtLYrVImEgrnRLs
         m9QxdW+MxqJux6bCmVJktFglIFum7L1Jv+xb5OzMhg2bty++woVJD17rntyVm6eo0fm/
         TiMw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] advsync/rt: Use 'vs.~' instead of 'vs.\@ 'in
 section title
Message-ID: <51888d83-8f51-075b-7c7c-178c3abec3e0@gmail.com>
Date: Fri, 9 Apr 2021 21:05:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

hyperref complains about the use of "\@" in a section title:

    Package hyperref Warning: Token not allowed in a PDF string (Unicode):
    (hyperref)                removing `\spacefactor' on input line 1978.

    Package hyperref Warning: Token not allowed in a PDF string (Unicode):
    (hyperref)                removing `\@m' on input line 1978.

Fixes: 9facbec307ee ("treewide: Mark non-end-of-sentence full-stop of 'vs.' as such")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/rt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index f5e8e685..067927e9 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1975,7 +1975,7 @@ on \clnrefrange{upd:b}{upd:e}.
 This example shows how RCU can provide deterministic read-side
 data-structure access to real-time programs.
 
-\subsection{Real Time vs.\@ Real Fast: How to Choose?}
+\subsection{Real Time vs.~Real Fast: How to Choose?}
 \label{sec:advsync:Real Time vs. Real Fast: How to Choose?}
 
 The choice between real-time and real-fast computing can be a difficult one.
-- 
2.17.1

