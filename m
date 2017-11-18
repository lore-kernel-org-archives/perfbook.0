Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rv+poWtk3ABNIeQu7QQimzdbsYVwLip829peeExU/Hk=;
 b=qLb3ovbApB+9URzK/PjNE8QCpRkiprV8DcBtCpfX9gCHbe/Fx37+kzbzEwFJsXEulU
 EPh1UliP3JTVFdvDQnLNkmR71LnRQFf6qNgtfw74N/NCSptZZbNMcnDgEwknoxBE5JQR
 379H6j7wU0cCxqTkaHz4TLmt0lSgD+L28CexRm/YvKIMCaZHLk9UAOO+jiweOUxzvQLA
 VLCgBlgl6uCZ24k2s+u4gBu+F1OIaIq/epEHf0RAGA2oku3LNOkENL+Jc54MfSMOpJcP
 zLtjnFPKyd3GMtrdYukmD7C06iPUi2t86OFI1iwEtOiii6L6xpdI0LfC5P9hLJ7gj8Qx
 oUfA==
Subject: [PATCH 3/3] memorder: Fix trivial typo
References: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c2a30f43-d49c-807f-ffe0-e51bf1b3d639@gmail.com>
Date: Sun, 19 Nov 2017 00:07:02 +0900
MIME-Version: 1.0
In-Reply-To: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a2d0cd80fb99a15bd5265f12863ac8f0183f9a9b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 18 Nov 2017 23:39:26 +0900
Subject: [PATCH 3/3] memorder: Fix trivial typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 68dc09b..d11df62 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -10,7 +10,7 @@ Causality and sequencing are deeply intuitive, and hackers often
 tend to have a much stronger grasp of these concepts than does
 the general population.
 These intuitions can be extremely powerful tools when writing, analyzing,
-and debugging both sequential code and parallel code that makes
+and debugging both sequential code and parallel code that make
 use of standard mutual-exclusion mechanisms, such as locking and
 RCU.
 Unfortunately, these intuitions break down completely in face of
@@ -38,7 +38,7 @@ follows up with more detail on what representative hardware platforms
 actually do to unwary parallel programmers.
 Finally, Section~\ref{sec:memorder:Where is Memory Ordering Needed?}
 provides some rules of thumb for what situations require parallel
-programmers to take special action to preserver memory ordering.
+programmers to take special action to preserve memory ordering.

 \section{Ordering: Why and How?}
 \label{sec:memorder:Ordering: Why and How?}
-- 
2.7.4


