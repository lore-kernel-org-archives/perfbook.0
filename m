Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ztGAyWov61VUEodVaajat7n48zTXvjPnOLcGh0miyxY=;
 b=mzVbtDiA+Xo6eNN209lZ5bbtWtnupMhBxOHMmEIKj3XVWoYNM/lKHBzANe63CPFCu3
 uVIXT4JIpcPUHZs+/TyhoLcT6BFUNKB5KRMDki3Te+DgqzNfbMFj3TVVnbRC8ZT95pna
 uZvnyMpWbzLeCHcTcbAAdSH1speDBc3FK+RZ3V+txnulMRj+3pZ/xhIzxUnaVFU25NTC
 3wt6Wykm3WNFaz4pz9AvktAM6q+bxPE6oSqp3qnyTdBHUfE3SEKLtD5RMUqpJARZ9gdg
 Zeb+WyOlq81RnIT/Uxud7RuuGEpMf/EJUMK4JRV/+EL34gwAGc3Gz0Ch1SAaJWohpBqI
 KqpQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 11/17] formal/dyntickrcu: Fix wrong function name quotation
Date: Wed, 21 Sep 2016 11:44:42 +0900
Message-Id: <20160921024448.24744-12-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index a36901e..e31996d 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -2197,7 +2197,7 @@ true if the CPU was in a quiescent state.
 \end{figure}

 Figure~\ref{fig:formal:Checking Dyntick Progress Counters}
-shows \co{dyntick_save_progress_counter}, which is called to check
+shows \co{rcu_implicit_dynticks_qs()}, which is called to check
 whether a CPU has entered dyntick-idle mode subsequent to a call
 to \co{dynticks_save_progress_counter()}.
 Lines~9 and~11 take new snapshots of the corresponding CPU's
-- 
2.10.0

