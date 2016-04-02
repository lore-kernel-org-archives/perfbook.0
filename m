Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2lEJtrFkgQWuFLjNKKUpEAwII5lO4633j6hsE2QivWY=;
 b=D27g7cN71mM7YUxF5yvCZeHEh1TTQy+eOXxcGC+vriFP5G126OyPAfuXO55jiPOm5k
 EntZCg96niQS0HR3Lrof+sI6xJZ22atuH23iCM/wUHlsSWu4OiCBGA/4+gDeCgLrb6kR
 PT7gp8Dt4eT5wujbY2/lTxtql+Okmi6RZh5cjmmdqMfNIjahgFWuD4POAHNlWaf4rNmH
 p4urNCrvLRou+KBxiM9F602LNi3We5D0QacI2WTcTf05LL0/HHwnEoqcNcg4A2LMh//S
 Pqevm+9gUAaJF0e+/rY4dM9WXAPTKlTWSjqUjtLI08FugY0phvsQla7nlC2ifpz33Xnk
 RhYg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 5/6] advsync: fix critical section bleed-in description
Date: Sat,  2 Apr 2016 09:28:30 +0900
Message-Id: <1459556911-11538-6-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: dhowells@redhat.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence in `Locking Examples` section says both LOCK and UNLOCK
allows preceding operations `bleed in` to the critical section.
However, it's wrong description.  LOCK allows only preceding operations
and UNLOCK allows only following operations to bleed in.  Looks like the
wrong description made by just a trivial mistake.  This commit fixes the
sentence to have correct description.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/memorybarriers.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index b1f49d3..1fe0953 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2232,8 +2232,9 @@ might well execute in the following order:
 \end{minipage}
 \vspace{5pt}

-Again, always remember that both LOCK and UNLOCK are permitted to let
-preceding operations ``bleed in'' to the critical section.
+Again, always remember that LOCK and UNLOCK are permitted to let preceding
+operations and following operations ``bleed in'' to the critical section
+respectively.

 \QuickQuiz{}
 	What sequence of LOCK-UNLOCK operations \emph{would}
-- 
1.9.1

