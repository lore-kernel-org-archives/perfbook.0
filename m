Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TPzERfzF0zRnuxnyuztUvpiqrp5Ljw2BvWngwBzArrk=;
 b=BUPdby1gzCMr3WEwH8YRoWJUKa9CVhqd631oiBjog0jcn/5X59DKRy6QQepzhich9N
 gCRTvKdh3j5TGhKyeIVvmHMHsL2bht44npiGXJ/5PRfE079+JKbXib4oiTbiLjyF+fcC
 6btleD6gukh/bEZwtyOSVKzm4VwC4JtaztFHKRkAU1y/A75gf9kUUSJvLn9dO1PcVQAU
 bM43T2u9USn/hHwPONtgI3k09ow5enr9VAttvpWO97kdbyHGfYh8tU39WHaq6Zk0XE/E
 iUmelD+phxYaVilRNMlPumEQdjo6cTeMyA55spTmdGKSXqLbM4L+diiRfAik3n9EMldE
 JOpg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/8] together: Add a missing comma
Date: Tue, 11 Oct 2016 08:07:34 +0900
Message-Id: <20161010230738.14452-5-sj38.park@gmail.com>
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
References: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/refcnt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/refcnt.tex b/together/refcnt.tex
index 22d0a8d1d08e..cf23ba729d01 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -129,7 +129,7 @@ reference count need be checked for zero only very rarely.
 Simple counting protected by locking (\makebox{``-''}) is described in
 Section~\ref{sec:together:Simple Counting},
 atomic counting with no memory barriers (``A'') is described in
-Section~\ref{sec:together:Atomic Counting}
+Section~\ref{sec:together:Atomic Counting},
 atomic counting with acquisition memory barrier (``AM'') is described in
 Section~\ref{sec:together:Atomic Counting With Release Memory Barrier},
 and
-- 
2.10.0

