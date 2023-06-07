Return-Path: <SRS0=lSB5=B3=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686138523; x=1688730523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fw/mMyp5YDqRiI63PTvPwuJfPEjxQj62Fxx7pgUSlAs=;
        b=WQbIbUcIuAaGD5hLMO9UniVNIuoWOu8GUYKx+w5CjL7dKfBS1/WkPMtNVGOZNy8Pd7
         Bj+qPz+EOa+ypDVAEvk/MWKjntM8AXOYjm+cMybuMlfcBLvOpva4sSgCMCng8LnvAJ3z
         cJ1rWmhYOIbot+GTnvPC9w5RbkTKFxznU2Z7CVd09ul59Eqak2FDlXubDebyJ42JMEU7
         M1HEt9f4cDKk1F0x+K+bnnBOnmXD0LJ5BEiXQ4fQSdeaDoq8gu0qjzyByO6B0DAhgsH2
         86xQ3DGZyLQFrtzqY3k/15Iyn7yyPvF4XMzsoBwJmzx36kLhxNce4v0FBFjOJXThISTX
         lzqw==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] advsync: Fix typos
Date: Wed,  7 Jun 2023 11:48:38 +0000
Message-Id: <20230607114838.4582-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 advsync/rt.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index 8e0347b0..c4d9c3c2 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1228,7 +1228,7 @@ read-side critical section and both the \co{rt_read_unlock()} and the
 This is necessary because non-realtime kernels' reader-writer locking
 functions disable preemption across their critical sections, and
 there really are reader-writer locking use cases that rely on the fact
-that \co{synchronize_rcu()} will therefore wait for all pre-exiting
+that \co{synchronize_rcu()} will therefore wait for all pre-existing
 reader-writer-lock critical sections to complete.
 Let this be a lesson to you:
 Understanding what your users really need is critically important to
@@ -1745,7 +1745,7 @@ These constraints include:
 \end{enumerate}
 
 \QuickQuiz{
-	I couldn't help but spot the word ``includes'' before this list.
+	I couldn't help but spot the word ``include'' before this list.
 	Are there other constraints?
 }\QuickQuizAnswer{
 	Indeed there are, and lots of them.
-- 
2.34.1

