Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113; h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding; bh=Qx1Ha3MRF1E53j817lVj3qzzdQOMcqhQjfJAn3xubeQ=;
 b=oFbRmAgAoomQl6G0xSaKViXvZB/uBCoMfoJfyAXy7VmvfuD7MUDIBgW7n036wElJhp
 zSbqZTOhtmJpimTl4PrSvWtLMR/Hyk6laMk95vXkaWbQ1wQNF+YrCVKEVuzh0w9VDYyd
 j4B/IDWnYzGZqqlR2hqEsvINOqBSilCNvSDreTYrP1oukpULEyAm6t7NDCeU4/LRgQry
 HFHzCJV+IjBiFf0yBbpsHVVmEWyKBAjBMj4i50RkK9TDsYRDqBnfKtqm6Z363PTM7g1A
 0SwgEjdk/uAh999KBYwW2jjBXKtTxLPlq0MHzzxhjJrCg0Rh2dI8VdImywvK4BZfhmgc X1Xg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] defer/refcnt: Another typo fix
Message-ID: <75cf85b4-97e8-1425-911b-4f4713aff57e@gmail.com>
Date: Tue, 12 Jul 2016 00:36:29 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

 From ae44b15b34f4cba077d0c49e7416f66681895a3d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Jul 2016 00:33:08 +0900
Subject: [PATCH] defer/refcnt: Another typo fix

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
  defer/refcnt.tex | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index 8dfa8fe..76ebf4d 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -267,7 +267,7 @@ Figure~\ref{fig:defer:Pre-BSD Packet Routing List}:
  
  The problem is that the reference count is located in the object
  to be protected, but that means that there is no protection during
-the instant in time when the reference count itself if being acquired!
+the instant in time when the reference count itself is being acquired!
  This is the reference-counting counterpart of a locking issue noted
  by Gamsa et al.~\cite{Gamsa99}.
  One could imagine using a global lock or reference count to protect
-- 
1.9.1

