Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=npBuTNofNDeBdDNM6lDCtLEv7cO45D41WxTK5SV6zF8=;
 b=YtncZUir6CQszkkvErzV8GaXQSQt/K/Q3hhrf7909DC4s4OoRpcb+SjZ24BAiV4xvl
 Xr0qTmKATWeuDr35Q3ARXZfL14cBGNSH70Oi0h5W6kY/TLhbmKANJlbTAKTdMtSNKgYF
 XQYL6Nr982fMqHuH6Z7NBDPE3a65i0pih7JkTXYd78DlWjrzUs0SzWWkEpWKDIoczcBv
 iQmIYbwbvB3JL/ZOyoZtj5K7up97zGHaxab7YoY4vk5AW4OuIreRThvyS4LCYh1AEtuX
 CjkRuwggtYKy3UUugaSdV4REYK+W/rsfjgcHueXSu1LrblGMQB4IyHHzWSp465ssJr97
 iVBw==
Subject: [PATCH v2 4/5] memorder: Update reference to memory-barrier
 primitives
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
 <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3db7c03e-a4c1-5219-ea53-d1b27df0e5fb@gmail.com>
Date: Sun, 17 Sep 2017 00:11:28 +0900
MIME-Version: 1.0
In-Reply-To: <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b08c836fef6b054125b74c77a2fddc3e53ade5bc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 16 Sep 2017 11:05:36 +0900
Subject: [PATCH v2 4/5] memorder: Update reference to memory-barrier primitives

This reference used to reside in appendix. Now it lives in
the same chapter and it should be made to a previous section.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index a6a33b6..596367d 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3899,7 +3899,7 @@ the compiler to eschew any optimizations that would have the effect
 of reordering memory optimizations across the barriers.
 The \co{smp_read_barrier_depends()} primitive has a similar effect, but
 only on Alpha CPUs.
-\IfInBook{See Chapter~\ref{chp:memorder:Memory Ordering} for
+\IfInBook{See Section~\ref{sec:memorder:Ordering: Why and How?} for
 more information on use of these primitives.}{}

 These primitives generate code only in SMP kernels, however, each
-- 
2.7.4


