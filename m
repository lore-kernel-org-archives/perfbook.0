Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=P0XnmDe0eZMkRDnRf0nYqZbbe59UdfdBn91WFzcDaIY=;
 b=a7L4dBjcowScRmbGEorj3G7KyewZ/rAZ3mEGKennPQhULqcqaEhY4YueSlxDGhqs8j
 uKZJ9P3C6MSLownKydQ0w80LBvXywlf5aS9Nr456h9JcWX4dChSY8UuIIjHKyzMCCgrG
 WSVelKsZAAr4CfMclAXbBysRIHeEhA2V+XDqnUDTs1TBc8K51QsuBzuNTM0KaJyYNjRi
 Xfyj7/m/7V09B7pKt/5XAGKwIFHATDv64nsCx+c/AyAqnN2N0WZg9hb6QN46njIaTA0t
 KtjIc6V14P2UsWxpMHS3+2G1zR07XK8TRnm+/kIPVKyLRrnIFORH/mwDujSR3/2na2Lm
 OHFQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] debugging: Add reference to heisenbug discussion section
Date: Mon, 24 Apr 2017 00:52:20 +0900
Message-Id: <20170423155220.29222-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 7715cf806c24..e621ebdb540b 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1401,7 +1401,8 @@ This section describes a number of ways to do just that:
 Although producing an anti-heisenbug for a given heisenbug is more an
 art than a science, the following sections give some tips on
 generating the corresponding species of anti-heisenbug.
-These are followed by a discussion section.
+These are followed by a discussion section,
+Section~\ref{sec:debugging:Heisenbug Discussion}.

 \subsubsection{Add Delay}
 \label{sec:debugging:Add Delay}
-- 
2.10.0

