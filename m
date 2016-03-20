Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fDW2nq715loXdKzdYFOH+2UZtCU2v1PwqgZCufFi/GE=;
 b=mg29RorNC53M8r5stsbKKySPSRMTFAY+xMqzNvDgT4dZJY7WxFGjdFY+wpzaRuJH6x
 QwCo0FWHgAfUVCJSAJmBzZhpLanwOj/C6DBh4WQpMJvo83j09bmnfB2yadboN7i9LdaA
 NVZRDfHlM/nfDl41fI5nvFRLbHyCabbZ+aW1HLAGImcBmyQyxpabiq94hsFH+TEhMhex
 qR35OkISs2kyIzc9vzA3E5nE3aRyJyy5jqt38NXk3QAfuTipd8FFkKStLvTFWOxV2T5T
 l5bEggTu0oVryAEv8l+tSWJHc28vm9lX5jAyrnnT8J5oA/6WeRui304+mLwioh59DUER
 Qkpw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/3] whymb: remove ARM's short multi processor history
 description
Date: Sun, 20 Mar 2016 09:24:21 +0900
Message-Id: <1458433461-20936-4-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
References: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A description about ARM processor says that history of multi processor
ARM CPU is about five years.  However, the sentence was written in
2010 by commit 864762cb5206f31b71757e4da8362d8c1c0e3b7c ("Add ARM to the
"why memory barriers" section.").  It's 2016 now.  Multi processor ARM
CPUs are common and its history is more than a decade.  The sentence can
be simply modified to say ten years rather than five years.  However, it
would be better to simply remove the sentence because  modifying the
word every year would be painful and a decade in computer industry is
not a short period though it may be arguable.  For the reason, this
commit removes the sentence.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 --
 1 file changed, 2 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 38ffad6..2eef059 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1949,8 +1949,6 @@ SSE and 3DNOW instructions into account.

 The ARM family of CPUs is extremely popular in embedded applications,
 particularly for power-constrained applications such as cellphones.
-There have nevertheless been multiprocessor implementations of ARM
-for more than five years.
 Its memory model is similar to that of Power
 (see Section~\ref{sec:app:whymb:POWER / PowerPC}, but ARM uses a
 different set of memory-barrier instructions~\cite{ARMv7A:2010}:
-- 
1.9.1

