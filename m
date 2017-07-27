Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=M8VzOT7Xcu+IpUFBpKv+KemOpvXIvCq+YS59W8OD6K4=;
 b=YDSkED2wiG9zx6lfEkULDiYKjwewgCfhEXFYne6A8setbmPUnWYZfn2GGhSM4Nf7qe
 +Lug1aqbr1pGRXb8wZ/U1Bjyuz0wKfzC4jL2sn7YTePqQtctkAXrHAVgE2/e4eX8r0dn
 sYdUf0hvi3z+BiwyC2CR8c3KqnX7YGC7kdS9MH7IX/ZuZVqrCoeDkV73fr0NBG5/JCC8
 N+6BhJLBMcEc087Zun0auFrNkFZiqpNKQT/blK1w3C3OdkvuoYQDz9uTflSSggBBnIAu
 35HVmf3oU0507+irWUqd/2/nUnJWk8r+DK85DN5XnDBhM/zUpB7WnSEkE6Z5PcQE9nFX
 pppQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Fix typo in MP litmus test
Message-ID: <8ac841a3-b0d5-de98-6956-9914cfbe28e9@gmail.com>
Date: Fri, 28 Jul 2017 06:50:38 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 467d89c42ab562e73f891830976ccc0c8726eeed Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 27 Jul 2017 21:51:56 +0900
Subject: [PATCH] advsync: Fix typo in MP litmus test

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 894de6d..6754ba5 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -609,8 +609,8 @@ loads and stores.
 17   int r2;
 18   int r3;
 19
-20   r2 = READ_ONCE(*x0);
-21   r3 = READ_ONCE(*x1);
+20   r2 = READ_ONCE(*x1);
+21   r3 = READ_ONCE(*x0);
 22
 23 }
 24
-- 
2.7.4

