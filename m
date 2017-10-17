Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KRUNCqaPv+OxBfkWV4h6Z7BipaWThuVk2khBdq2z3iQ=;
 b=Q3fQs7RpE7CIdrUwY9JaoVUjarHi0MHKN8gru9FedIyTs00Nh/CM35xJA1QJR5kK25
 HgBMKU8DjFJUFqDZsHuAqjG2Lk8fdKAjLVWK5eMNJ5pUjO3fLWmN49SP6CM7kxswHvIC
 z5QaMtlCCaGKZwjx5mh6NYbJBxDncwy1jBDWivBF97rmferkPEi3srSONisDm79bNFK7
 0Sr5KHqwXeGU9sboK4kTHsoSrJ315+xLbM54VpQnjOGAWp9X/8Vcut4TEKj01Z8r9Woi
 fBwB8Zv6x+NrdVlSNHYGUBi4zROjSu8B6gUJR3oLazr8E8JeiCmIPPQPn+8gyJa1lcKI
 E7PA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/5] memorder: Close unclosed parenthesis
Date: Tue, 17 Oct 2017 11:20:51 +0900
Message-Id: <20171017022054.32680-2-sj38.park@gmail.com>
In-Reply-To: <20171017022054.32680-1-sj38.park@gmail.com>
References: <20171017022054.32680-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index e911e79..cc1497b 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4172,7 +4172,7 @@ For more on Alpha, see its reference manual~\cite{ALPHA2002}.
 The ARM family of CPUs is extremely popular in embedded applications,
 particularly for power-constrained applications such as cellphones.
 Its memory model is similar to that of \Power{}
-(see Section~\ref{sec:memorder:POWER / PowerPC}, but ARM uses a
+(see Section~\ref{sec:memorder:POWER / PowerPC}), but ARM uses a
 different set of memory-barrier instructions~\cite{ARMv7A:2010}:

 \begin{description}
-- 
2.10.0

