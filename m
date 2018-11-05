Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=Be2k0z4bTpQfbWvugkGfeeC8Eno50FV+QYTBFJCrnN4=;
 b=HUT0radsxr47bEL1XNuyt7rnw90KkyVfmhXFZWJFvH2TzAmKBukirmyKS8FgRDx/PL
 XDTqHM3UdZJxndjCGd1AC9Sdvj9xRphtDYcK0xoV4d63AE3Jv96ML/QPce9RQP9SLHpQ
 h0BmXweNjCh5qyGE5S/0gHsa92koFF2zB6OjpKiPry3OfBdi73BN0elsy0olf95fye9G
 ljr/dQdYnT/g0U//5ecv3u8aR67G3YCZF/XGyd8oxyt1A6Qoi5zxMWOx7nGHw+AOfgY6
 e3CnsNdWJYhkavSGbDVpITsP7QEClksOlUV88pZMgL6EIUFVu0ezEaQ+mPJK5q6/he46
 EYZQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] memorder.tex: Fix typos in description of litmus test
 C-ISA2+o-r+a-r+a-r+a-o
Date: Mon,  5 Nov 2018 18:29:42 +0800
Message-Id: <1541413782-2876-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This is the only patch for the second half of Chapter Memory Ordering. Please
take a look. Thanks.


Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 8e11e92..7f80612 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2899,11 +2899,11 @@ shows a three-step release-acquire chain, but where \co{P3()}'s
 final access is a \co{READ_ONCE()} from \co{x0}, which is
 accessed via \co{WRITE_ONCE()} by \co{P0()}, forming a non-temporal
 load-to-store link between these two processes.
-However, because \co{P0()}'s \co{smp_store_release()} (line~12)
+However, because \co{P0()}'s \co{smp_store_release()} (line~8)
 is cumulative, if \co{P3()}'s \co{READ_ONCE()} returns zero,
 this cumulativity will force the \co{READ_ONCE()} to be ordered
 before \co{P0()}'s \co{smp_store_release()}.
-In addition, the release-acquire chain (lines~12, 20, 21, 28, 29, and~37)
+In addition, the release-acquire chain (lines~8, 16, 17, 24, 25, and~33)
 forces \co{P3()}'s \co{READ_ONCE()} to be ordered after \co{P0()}'s
 \co{smp_store_release()}.
 Because \co{P3()}'s \co{READ_ONCE()} cannot be both before and after
-- 
2.7.4

