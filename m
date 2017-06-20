Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4lwwW7oV0vlGTr3dWM8NKq5n8NZQRqJY4cjPmF1QCd4=;
 b=Wq97w/GlPGzNKo6msDwt8Iq7wUxRDphWJgTx5ZXzA4OVHdWUMP0gF7i8hG7GtuG3E2
 26e9ltvqNsyIKBmENINBVCWb0Ql9GBkjS30MFyNfGP12mEBW1zXeR8Q4j46wAstyyc9Z
 voELtn6zikFryct9MSGW7ybgLmnBEEcYjmdt+2AIOHTZWqYJ82oAcitMTnC9JDrRRRYy
 9/1dIp+TxdU4sYJ+/LtoLcu2p+1qGhdJXXboTphwQoVwsBGjtBtW6zmuV1cEvuyQe12i
 vopsAzx3tVQ6ePQoc1W7/QPDPZOUFTcuV1K0wQ4upuAF1wVTXGiaRmi1UOm4835tGbXM
 xBAw==
Subject: [PATCH 1/3] toyrcu: Adjust reference to prerequisite chapters
References: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <054c50ee-ea43-5f25-8b85-9c89b8a5e3eb@gmail.com>
Date: Tue, 20 Jun 2017 23:27:53 +0900
MIME-Version: 1.0
In-Reply-To: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ac7a508e515ec6aba4f0f45405b50440304864c6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 17 Jun 2017 17:11:53 +0900
Subject: [PATCH 1/3] toyrcu: Adjust reference to prerequisite chapters

This reverts the 1st hunk of commit afff91238e3d ("Fix Toy RCU
section references") with an nbsp change.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 5e74afa..79fbe33 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -10,10 +10,9 @@ but rather for clarity.
 Nevertheless, you will need a thorough understanding of
 Chapters~\ref{chp:Introduction},
 \ref{chp:Hardware and its Habits},
-\ref{chp:Tools of the Trade}, and
+\ref{chp:Tools of the Trade},
 \ref{cha:Partitioning and Synchronization Design},
-as well as the previous portions of
-Chapter~\ref{chp:Deferred Processing}
+and~\ref{chp:Deferred Processing}
 for even these toy RCU implementations to be easily understandable.

 This section provides a series of RCU implementations in order of
-- 
2.7.4


