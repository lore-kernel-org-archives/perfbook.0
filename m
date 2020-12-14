Return-Path: <SRS0=Howp=FS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=BglHSJXtgn2uHFSDQ3/zoE7MQ2ls3xwR2NKk/ePdcls=;
        b=UCCGqxMIwc59nkmeVEZF5Usw9yRdKT/ixEh7C81XzCH4Xe2TGTFoyiV0M95wdPuHna
         flrEAQL7wAdJdC1aSU9U40fCqXfr8GoeiHLLP5n/bhvUbpNvwNIYkoRLKR+EbEAHOFtm
         XVHPS14/0JSYGljcwtB8di2kjPOqwK9Aqu8OKjdyM95WOMjFVE2Enxj4dwsnVaL5MKpY
         gOTN+XgDRJu3aoadL5X2pYPn4hUpMNZoEouqD1UyQ8M8gfc3hCf07taSkhdtOiJM/stP
         /8ne9j0xg3nNctbc0A1BZl6Qt/bkzwZpE8I0DFKLtc4GVGgm5vOVXvUbiDCpLvVnbAyD
         n9Gw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] memorder: Reword 'memory-barrier shootdown' ->
 'system-wide memory barrier'
Message-ID: <34246c02-de82-cb41-2f86-6443b3870f14@gmail.com>
Date: Mon, 14 Dec 2020 20:29:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Motohiro Kanda <kanda.motohiro@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5b917177f7c6c3ee1678689a6c19c352f9f60ef5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 14 Dec 2020 19:55:28 +0900
Subject: [PATCH -perfbook] memorder: Reword 'memory-barrier shootdown' -> 'system-wide memory barrier'

As Motohiro pointed out in his translation comment [1], memory barriers
can not be shot down.  Motohiro assumed that it was a typo of
"cache-memory shootdown".

However, in this case, each CPU is only required to issue a memory-
barrier instruction (to wait for ongoing cache activities to complete)
in response to the IPI rather than to flush some cache memory.

This paragraph has since been updated to mention the sys_membarrier
syscall added in Linux kernel v4.3 [2].

Let's borrow the term "system-wide memory barrier" from the commit log.

[1]: https://sites.google.com/view/kandamotohiro2/perfbook-d/perfbookappendixc
[2]: https://git.kernel.org/linus/5b25b13ab08f

Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 93d18dc5..28b5e433 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4070,7 +4070,7 @@ all reading CPUs to see the writing CPU's writes in order.
 This software barrier could be implemented by sending inter-processor
 interrupts (IPIs) to all other CPUs.
 Upon receipt of such an IPI, a CPU would execute a memory-barrier
-instruction, implementing a memory-barrier shootdown similar to that
+instruction, implementing a system-wide memory barrier similar to that
 provided by the Linux kernel's \co{sys_membarrier()} system call.
 Additional logic is required to avoid deadlocks.
 Of course, CPUs that respect data dependencies would define such a barrier
-- 
2.17.1

