Return-Path: <SRS0=utkl=IG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JVLktneS9m7C67t8fWzbP6IpJ3SV2RZLPVcOduoBC8U=;
        b=DRnO0e93DROPFy4qrHvCCTTuOZacrabUu4xN6gvo9XRWZ+QeJiEZPg9WaHdAfaFblq
         huWAkUHcA79DgCF0b3WArFqmwWx0i+WmuRXH0XZ1OQAvY+NEg0NR5g8uejh/FPw3pmX5
         EO+q+M5nq7f1OzWdV245oZO8KZnVq00enLiKSp5n0EZGZ4FFv7SQmUjZpuIWLPXTUnl9
         YpX2cOn4z8vF+47bx/os1UP/+72tgGMbbEC52ojKx2v5FP7JCylyl5Lv/0UH4uhFPgKE
         M6kkh7syEmk0ZoMiplUURj3Hvo5Q35hEYnMDT95xiXLxefcpVUFg9sIuZ6GyFi6H4orp
         XoCw==
Subject: [PATCH 3/4] defer/rcurelated: Spell first names of Lehman and
 Weizenbaum for index
References: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c94439bd-f26e-f220-0ac9-fb03117f3356@gmail.com>
Date: Mon, 8 Mar 2021 10:57:15 +0900
MIME-Version: 1.0
In-Reply-To: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcurelated.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
index 32074e74..3fb791cf 100644
--- a/defer/rcurelated.tex
+++ b/defer/rcurelated.tex
@@ -10,13 +10,13 @@
 The known first mention of anything resembling RCU took the form of a bug
 report from
 \ppl{Donald}{Knuth}~\cite[page 413 of Fundamental Algorithms]{Knuth73}
-against \ppl{J.}{Weizenbaum}'s SLIP list-processing facility for
+against \ppl{Joseph}{Weizenbaum}'s SLIP list-processing facility for
 FORTRAN~\cite{Weizenbaum:1963:SLP:367593.367617}.
 Knuth was justified in reporting the bug, as SLIP had no notion of
 any sort of grace-period guarantee.
 
 The first known non-bug-report mention of anything resembling RCU appeared
-in \pplsur{H. T.}{Kung}'s and \pplsur{P.}{Lehman}'s landmark
+in \pplsur{H. T.}{Kung}'s and \pplsur{Philip L.}{Lehman}'s landmark
 paper~\cite{Kung80}.
 There was some additional use of this technique in
 academia~\cite{Manber82,Manber84,BarbaraLiskov1988ArgusCACM,Pugh90,Andrews91textbook,Pu95a,Cowan96a,Rastogi:1997:LPV:645923.671017,Gamsa99},
-- 
2.17.1


