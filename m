Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uLYstHwWT4IKYjjewe5qA5CaabQ/99FiPoYFGvRnQK8=;
 b=hxTAe3CaVhwI0Dg2vxLEjzoH32/mIap3qT5NoWRK0LQg2dIyNv82+18uqOzaP8Wr/1
 7C/utr+nHJvoWZCOInGUXWQeD4v5iJ4clqTncy9hkXrDueKc2xDl+3qlOlYiOLN7WHWx
 9EwzqlakBssygBnoS6qNKcNNgVt/ujPg5dVu66zpdghC90Vvrz6ZT4Kz3D8SaL7Dylyd
 09rlybmwFihx+InZgJWf2S1I0dzgB2E5L9w5EoW5v/aTIzi6JbDXybSF+i7WVz5f84lg
 fh/Ecsy9jtwzl2l0A9lD59k/Ouk41Ryq1BDG2NmJzpku4n2Bz8pn/6rSfip3FyeqOprd
 wg6Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] advsync: fix wrong code example
Date: Sat,  2 Apr 2016 12:03:56 +0900
Message-Id: <1459566236-15362-1-git-send-email-sj38.park@gmail.com>
In-Reply-To: <alpine.DEB.2.10.1604021149350.22948@hxeon>
References: <alpine.DEB.2.10.1604021149350.22948@hxeon>
To: akiyks@gmail.com
Cc: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The code means `*(A + 4) = Y` but it is written as `Y = *A`. This commit
fixes the typo.

Suggested-by: Akira Yokosawa <akiysw@gmail.com>
Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index ee9312d..8e9c876 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1364,7 +1364,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-*A = X; Y = *A;
+*A = X; *(A + 4) = Y;
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
-- 
1.9.1

