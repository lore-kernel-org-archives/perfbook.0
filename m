Return-Path: <SRS0=gDlb=Z5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WHYLxcoLUvGHPaKh5J0EfTOFV55qD4NIa/Nt0mqOLLA=;
        b=Jj0L5WGLPl+ZPpWVtdj0OVVe5aO7b4Pc6uiNaHoOpCf89OS+l6QBSZ+6yB66VPtlqT
         WuhfLLhS9NeEIeUGlgJlj8MOySPAihVvPqAYLdzhq2ixAthI1XgiZuQFXsge8F8Sh9vl
         zoGamNkpKyVmXSxwbnyltGe61RCZghO/V7eDVlKEpzbigDHXJDv+s7rLbJA8ekxj3R+j
         XmeEzzDLia5CO52MnSZMWPTEuYWwTH1U3Shc6ijSJe0mnrsIkAbpwiUD9Mf3pjxcfv2p
         TgpB3FO/u/2lxr8DR4fChMOleoykVxPB5ew344NkGMwc2yKH1d3PzqE0O6MSYjLZYGdP
         ULsA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Get rid of ACCESS_ONCE()
Message-ID: <826d9e91-0e6a-e498-b041-6eedf39a3404@gmail.com>
Date: Sun, 8 Dec 2019 08:43:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 77ced05dd5df0aa61358643ae359e8afb5e731fc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 8 Dec 2019 07:15:54 +0900
Subject: [PATCH] advsync: Get rid of ACCESS_ONCE()

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/advsync.tex | 2 +-
 advsync/rt.tex      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index ee99ec87..d860d2db 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -181,7 +181,7 @@ The linearizability criterion for NBS algorithms requires that reads from
 and updates to the array either use atomic instructions or be accompanied
 by memory barriers, but in the not-uncommon case where linearizability
 is not important, simple volatile loads and stores suffice, for example,
-using \co{ACCESS_ONCE()}.
+using \co{READ_ONCE()} and \co{WRITE_ONCE()}.
 
 An NBS set may also be implemented using a bitmap, where each value that
 might be a member of the set corresponds to one bit.
diff --git a/advsync/rt.tex b/advsync/rt.tex
index e5ec1bd9..a92b83d0 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1174,7 +1174,7 @@ void __rcu_read_unlock(void)		        \lnlbl[unl:b]
 		barrier();			\lnlbl[unl:bar1]
 		t->rcu_read_lock_nesting = INT_MIN;  \lnlbl[unl:neg]
 		barrier();			\lnlbl[unl:bar2]
-		if (ACCESS_ONCE(t->rcu_read_unlock_special.s)) \lnlbl[unl:chks]
+		if (READ_ONCE(t->rcu_read_unlock_special.s)) \lnlbl[unl:chks]
 			rcu_read_unlock_special(t);  \lnlbl[unl:unls]
 		barrier();			\lnlbl[unl:bar3]
 		t->rcu_read_lock_nesting = 0;	\lnlbl[unl:zero]
-- 
2.17.1

