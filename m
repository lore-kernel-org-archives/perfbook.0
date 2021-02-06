Return-Path: <SRS0=WFxL=HI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=zaeiE/QY/VUPzHctD2qGPsxBQFQEebBPfT9RToFCKxg=;
        b=QRoTHBpagZThy2C6QldC6crf9Y2IFfDaC7SPuPpb1p2Q2aKcFpu+lNDvJR4jC5g5go
         yiHlNgvN1lMTvr7o00VacZy8OcMZbOv6NN41zk5CYt491uqoTD+iI/gc4zjhzil4ADzD
         NyMG5IpxeqtJCOubWT1a4ZlscoAcERsmM3KP4aXTWS0jMbxYCZFLHSLZaIKaguiPsUXe
         n+hxI542mLbmG9A2Q029UQQB1vrcPdmVQVLANvkSutLi0tPuuQhmt/UkXsgphuJqJc4I
         /x3jyzInY6dq3kQuxUTI536MaoTS1QvaQgoOjwusMpPNq687uhIqC4aL+FnpF7toGBCb
         bGwg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer: Remove \OneColumnHSpece{} in sidewaystable
Message-ID: <3cfa5941-656f-6feb-f73f-e5de214ac891@gmail.com>
Date: Sat, 6 Feb 2021 19:21:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The adjustment for 1c layout causes the sideways table to have wrong
vertical margins.

Fixes: b03d63b42edf ("defer: Add Tasks Rude and Tasks Trace RCU to the API table")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index fb65621e..29680318 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -51,7 +51,7 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 \centering
 \caption{RCU Wait-to-Finish APIs}
 \label{tab:defer:RCU Wait-to-Finish APIs}
-\scriptsize\OneColumnHSpace{-.9in}
+\scriptsize
 \begin{tabularx}{8.5in}{>{\raggedright\arraybackslash}p{0.94in}
     >{\raggedright\arraybackslash}X
     >{\raggedright\arraybackslash}X
-- 
2.17.1

