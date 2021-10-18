Return-Path: <SRS0=U37W=PG=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fTeN2+7W8vMKoHuvXibkrgdCikljkX6HhS27yXD1Z1s=;
        b=lHO7O7n1rkW4uwVjZlPkPzyJL7Bz0/1hDhmArTbh6AoPYBakRlke3JV/HvikV3JzCo
         tE8XuBeC2zQJbwYaTg5plELVObh/c/BgLu3PjHhDCrXNZGFMHSdpBIJeaGzRjlYG6SUk
         YgXn6Y4uDZ3HGqoKT6WRxImcxMRw5dKh8GTcPluuBokNTh472+EXBnmYnn3sRJO1kget
         vpnsJEmkyjFaeI2lNoEHykTX9WKQtiSkxeXx5s9FXAuyAU19vA6TAzolEDmGT29cJHhU
         o5SiS8HeZtU/YyHBleDfiNy8IGVk6s1C99sHdFiTbenuGLdsTvu2JCTW/uPwpWcAQEkG
         IlVg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/5] toolsoftrade: Add arguments in 'WRITE_ONCE()' example
Date: Mon, 18 Oct 2021 10:44:36 +0200
Message-Id: <20211018084439.7112-2-sj38.park@gmail.com>
In-Reply-To: <20211018084439.7112-1-sj38.park@gmail.com>
References: <20211018084439.7112-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence explaining common things between 'READ_ONCE()' and
'__atomic_load_n()' provides arguments, but the explanation for
'WRITE_ONCE()' doesn't.  This commit makes it also consistently provides
the arguments.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index b2694da2..bc332aba 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -544,7 +544,7 @@ primitives.
 	\cref{chp:Advanced Synchronization: Memory Ordering}.
 	In the meantime, \co{READ_ONCE(x)} has much in common with
 	the \GCC\  intrinsic \co{__atomic_load_n(&x, __ATOMIC_RELAXED)}
-	and \co{WRITE_ONCE()} has much in common with the \GCC\ 
+	and \co{WRITE_ONCE(x, v)} has much in common with the \GCC\
 	intrinsic \co{__atomic_store_n(&x, v, __ATOMIC_RELAXED)}.
 }\QuickQuizEndE
 }
-- 
2.17.1

