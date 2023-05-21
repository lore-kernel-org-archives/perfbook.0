Return-Path: <SRS0=EXSE=BK=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684686265; x=1687278265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwf1+Z7hwl+dEqFKM11uHVBHVVcdNOpRJ+A7vdyAws0=;
        b=ZcWMGueS/FW4LpGytxt8XeVbAymehEjl12w4z1P9uP3DhMc1n6w1049XpHl3hopJkY
         Oec6Zi6jrD6o0AM3t7ZEzJ3EpxyBm7GEvbYM15fT2+fwxctcXoOIH6NyIu+k1AJ6xnZV
         d4ma61WwjC7Uj9uDMZ1yhtn79RNGWDBTkdO6ehIC2bvwm7k3g0K0s62jRU4eGg66Zzt/
         lNi7lucevzHzu11Ev11yKugaQ3zzH8RbcCq//HsUuYSEI9KRoITL4CDrqv2MOcamaRyi
         Y0op/dmmmH3W/FhClzQPgkCmA0gBES63HVLoDIi+UDhJAfuROrpsRt8O4MAVkfvYLHUG
         8L6Q==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] formal: Fix references
Date: Sun, 21 May 2023 16:24:17 +0000
Message-Id: <20230521162417.3751-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The two references are misplaced, this patch fixes that.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 formal/dyntickrcu.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 42c0c55c..2d118e69 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1132,7 +1132,7 @@ This effort provided some lessons (re)learned:
 	In this case, the documentation effort located
 	a misplaced memory barrier in
 	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
-	as shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
+	as shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
 
 \begin{VerbatimU}
  static inline void rcu_enter_nohz(void)
@@ -1155,7 +1155,7 @@ This effort provided some lessons (re)learned:
 	This effort located one subtle bug in
 	\co{rcu_try_flip_waitack_needed()}
 	that would have been quite difficult to test or debug, as
-	shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
+	shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
 
 \begin{VerbatimU}
 -       if ((curr - snap) > 2 || (snap & 0x1) == 0)
-- 
2.34.1

