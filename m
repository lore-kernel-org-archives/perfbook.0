Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+hlUSqIVsYYeUb83yihAAgjSsQKqhDrF9j0dLFjNB98=;
        b=Cscsn6RRlpOiid8RSDVG8hubRuloaW7Ds1S0aRZnRVvJPFjn4FVywpSh0Uwb3J7a4r
         j5DTxNdR2znr7YYs0mP9gQHbfYsLzUa0Lc+NDknLxKG6k0OQSSSzoi+8zyg1cKj3oSGe
         V49PDjwdQNxP1RBK+ASbq0LcbzRhbrlXfYdf82WFVHArDpOxL5lIjeiiHPMVhXKLeV/b
         crJTY+8UhaXmpxt+fUeyJAGfFaFxOrrYcckEJJNyZQuH6xLH5LP+PlbVl03WXShiGF5M
         GLuhstGHLXW+YMMZ44ZsvgLFnfh7nKOiPpbYhOKqIz37tnxyiwcZO/zBZbE862QcFL6E
         jbxA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 6/7] formal/axiomatic: Fix a typo: s/Figure/Listing
Date: Tue, 20 Nov 2018 09:00:56 +0900
Message-Id: <20181120000057.389-6-sj38.park@gmail.com>
In-Reply-To: <20181120000057.389-1-sj38.park@gmail.com>
References: <20181120000057.389-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/axiomatic.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 4a3bd0c..58513eb 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -279,7 +279,7 @@ the \co{herd} output.
 \begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 A litmus test for a more complex example proposed by
 Roman Penyaev~\cite{RomanPenyaev2018rrRCU} is shown in
-Figure~\ref{lst:formal:Complex RCU Litmus Test}.
+Listing~\ref{lst:formal:Complex RCU Litmus Test}.
 In this example, readers (modeled by \co{P0()} on
 lines~\lnref{P0start}--\lnref{P0end}) access a linked list
 in a round-robin fashion by ``leaking'' a pointer to the last
-- 
2.10.0

