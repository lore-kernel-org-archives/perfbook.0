Return-Path: <SRS0=FK0K=U4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AprXsXaxRfdhg5yk85IWexWM8QiDYzsl38RQ9cBJQ5w=;
        b=hsjZ62zlSSw9CyvDwdiaERRX4jSHedVCXfyUoIUba8gA8eYr18vE6sDktWNDISfwoH
         LusP0kSveXh2wEoA9FQbE+0zARa4glopLjIGaQGs+xCzB9wSvucNsfhCFyUzWHpKsTF7
         3ddwf394iQzhniHfSpTmrEZ7cfC5VtCZfJWhxCKmOTpy8D4FdUDyLIwl4UW1U1shSXLo
         DsqKvgmNsMTALetyZN6NLXpa128uJjcPSdzXEL+RmsAZTe4hH2qD75UFq8+TBzNMWlVf
         gqASp/RccY2Z1XOGSBXw7ScngkQLAfFeyp2u++lYKQIiIOfQA/+KPd1jwnVXb99vcElZ
         tteg==
Message-ID: <43f63fb8-f728-5459-fa88-60abb71d4770@gmail.com>
Date: Mon, 18 Apr 2022 19:05:06 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/3] indexsee: Add several 'See xxxx' entries for
 two-level index
Content-Language: en-US
References: <551bdf14-33c0-6876-6644-ff3494ad38f0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <551bdf14-33c0-6876-6644-ff3494ad38f0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 indexsee.tex | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/indexsee.tex b/indexsee.tex
index 1fc2d8b5..c7fea66b 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -1,22 +1,33 @@
+\index{Anti-Heisenbug|see{Heisenbug, anti-}}
 \index{Associativity|see{Cache associativity}}
 \index{Associativity miss|see{Cache miss, associativity}}
 \index{Bounded wait free|see{Wait free, bounded}}
 \index{Bounded population-oblivious wait free|see{Wait free, bounded population-oblivious}}
+\index{Cache-invalidation latency|see{Latency, cache-invalidation}}
+\index{Cache-miss latency|see{Latency, cache-miss}}
 \index{Capacity miss|see{Cache miss, capacity}}
 \index{Code locking|see{Locking, code}}
 \index{Communication miss|see{Cache miss, communication}}
 \index{Data locking|see{Locking, data}}
 \index{Direct-mapped cache|see{Cache, direct-mapped}}
 \index{Exclusive lock|see{Lock, exclusive}}
+\index{Full memory barrier|see{Memory barrier, full}}
 \index{Fully associative cache|see{Cache, fully associative}}
-\index{Memory-barrier overhead|see{Overhead, memory-barrier}}
+\index{Grace-priod latency|see{Latency, grace-period}}
 \index{Memory consistency|see{Consistency, memory}}
+\index{Memory latency|see{Latency, memory}}
+\index{Memory-barrier latency|see{Latency, memory-barrier}}
+\index{Memory-barrier overhead|see{Overhead, memory-barrier}}
+\index{Message latency|see{Latency, message}}
 \index{Process consistency|see{Consistency, process}}
 \index{RCU read-side critical section|see{Critical section, RCU read-side}}
+\index{Read memory barrier|see{Memory barrier, read}}
 \index{Read-side critical section|see{Critical section, read-side}}
 \index{Reader-writer lock|see{Lock, reader-writer}}
+\index{Scheduling latency|see{Latency, scheduling}}
 \index{Sequence lock|see{Lock, sequence}}
 \index{Sequencial consistency|see{Consistency, sequencial}}
 \index{Weak consistency|see{Consistency, weak}}
+\index{Write memory barrier|see{Memory barrier, write}}
 \index{Write miss|see{Cache miss, write}}
 \index{Write-side critical section|see{Critical section, write-side}}
-- 
2.25.1


