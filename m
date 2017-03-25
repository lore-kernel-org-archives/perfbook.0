Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Dbk6CzHDvk1W7P4yf6rHVW/4m+pHL3SwiB0SUcUMT6s=;
 b=XMGbq0UCzkoORRWWg+KnP66AJkaF+qDV2osYVkV+EyhHIRv7RbqNeGeD83HgiiR1jT
 xxTaoRosn+D75YVTn4EoL19aqdYMHQHy1z1oSBwh0n3Nhh8FeotJCN+y1vFuYCQWutZd
 dUTDH3i5BO7ZzwZZNI+XRbC59FASX3y7kvm7+EutUL3x8VO7xT5WVz2Imu4+0TiEBktM
 RVI2op9kz/X9B632JR0RMbyEskdt1i+Zqn0j/55d2R05QsROThJHG79FcF4iIGZ2nBMg
 NYUTJEdLsSyI/CkjY4UaSwgkIyIIQ+o5HcD/G3w9BtQUM+xbUVhPRkNAxAPB21Q1fuPx
 7OAg==
Subject: [RFC PATCH 6/7] advsync: Properly use nbsp in initial values
References: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4aee7f24-10c5-5438-47d3-0bcc5a1d48b0@gmail.com>
Date: Sat, 25 Mar 2017 18:41:14 +0900
MIME-Version: 1.0
In-Reply-To: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5491d5d9aad320ba08b304bea3085cc0a02c9390 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 17:46:04 +0900
Subject: [RFC PATCH 6/7] advsync: Properly use nbsp in initial values

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index da464fd..b6665b6 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2544,7 +2544,7 @@ as shown in Figure~\ref{fig:advsync:Speculative Loads Cancelled by Barrier}.
 ``Transitivity'' is a deeply intuitive notion about ordering that is not
 always provided by real computer systems.  The following example
 demonstrates transitivity with initial values of
-{\tt \{X = 0, Y = 0\}}:
+{\tt \{X~=~0, Y~=~0\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -2580,7 +2580,7 @@ also return~1.
 However, transitivity is {\em not} guaranteed for read or write barriers.
 For example, suppose that CPU~2's general barrier in the above example
 is changed to a read barrier as shown below with the same initial values of
-{\tt \{X = 0, Y = 0\}}:
+{\tt \{X~=~0, Y~=~0\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
-- 
2.7.4


