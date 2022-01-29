Return-Path: <SRS0=GI3y=SN=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=Ot9VuqUQbIx7at+nkr/dw9c16lsp2jtyoGfnPU
	rDVvc=; b=ljVt6WDltZ6MDspJpfvcNjQOu1l6AYGNrHIGE3FI/LAWloot2s2GeO
	FvdH5ntC0a3a6tGdh+JtbRz2fUNh/AR7nHnWT4SZZoJ510e9Hw2SbxIwvGfPD8cd
	ouHLhkICKhRReSyobrkhx5pRWP1p8PhEZSPKG66FuneQhT+sdWNlCAS3odZo+T08
	WLwMMXlO8FKRnZw1i3o4ni1zU0gsi07xmSRjD28NPWr61y2cjl5oUQbzeelf9LHi
	ktxUU6PxcPHDCUOxuRnib6u6S6M67KtsgPaJm/U7UoC6fY8k61UIZOkDv1ZvKrWC
	3x2pK2Pw+zFL7qzsDDGrMJQQpEXPaveA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ot9Vuq
	UQbIx7at+nkr/dw9c16lsp2jtyoGfnPUrDVvc=; b=D3PQNDXVM53NYjmUgenTM2
	9Y4/sLhga1RvXeqqVMulW5SEsISbiv6X0T1WHIN2FeftkAKYm0uSWdlwhsoxaoUN
	pbsa5tGWQYahzAylmg25LJk9dAgdyCO+PWBoMaQCVPsQLfToH2gpbntx7ygWkMIm
	kep6n3av+RHAZqsk0Hm/LzCHc5jASGe+3xxsZvevoKuZgarEdadrLeeR8a5VzGa7
	lpVxmY9E3yvyDxuEVQyHdMXPplxdWiJPHqDkj70ZhEo3Yk34rl1Ac/8jHIRBT4nC
	v+Gaaje9hwu6ZBA8vTimOX13T9YXRnFRpHrN9MEPwEcCkXZkH982fKzk+j/M4fDg
	==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook] count: Fix typos
Date: Sat, 29 Jan 2022 23:18:15 +0100
Message-Id: <20220129221815.89451-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
Hi Paul,

I'm really enjoying the book and hope that I can contribute back a little bit in
the form of small fixes.  As this is my first patch to this list, please point
out anything I could improve in the future (e.g., granularity of patches).

Thanks
Johann
---
 count/count.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index d2b39904..f4e74c13 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -3237,7 +3237,7 @@ Summarizing the summary:
 	\Cref{fig:count:Atomic Increment Scalability on x86}
 	illustrates this point:
 	Atomic increment might be completely acceptable for a two-CPU
-	system, but be completely inadequate for an eight-CPU system.
+	system, but can be completely inadequate for an eight-CPU system.
 \end{enumerate}
 
 \begin{figure}
@@ -3251,7 +3251,7 @@ Summarizing still further, we have the ``big three'' methods of
 increasing performance and scalability, namely
 (1)~\emph{partitioning} over CPUs or threads,
 (2)~\emph{batching} so that more work can be done by each expensive
-synchronization operations, and
+synchronization operation, and
 (3)~\emph{weakening} synchronization operations where feasible.
 As a rough rule of thumb, you should apply these methods in this order,
 as was noted earlier in the discussion of
-- 
2.34.1

