Return-Path: <SRS0=SzHY=RY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=v6S2At1yxwNFuAdwDgg/ek10Ql75AxWK2/n7nj82Jz4=;
        b=J9WgjnCxwvc3uzycNLWm3eqg2bqtzFLPLR4xJrIllckPv5ejoHib0zRW7DQsRnb+37
         fpEefyOm831BKLWxUfoZ+Sq3u8PzPwUbaswQm8TDo5JFZqpjSQzisy7sZIb8QP58bS2O
         bvd9gz2RxPBl9cYRxkxofuKAFofEYFTXk2GGVKfbRDjFYbyMephOR78V4xccjUeqSDuA
         W9owQFKDoHaJMtKsY7X78FWs6yqJao0DUlAsoKDhQi1OXaGO7rVjmgg8Oq3BVQAFz5Et
         U4rqyzBfR4KnGHV6KIeQRPqu4MCoOlhXof5SfBNUYVCmGar2gayhodAomzbXEcGz1er0
         17ZA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/4] defer/rcuintro: Add indexing tags to RCU Core
 APIs
Message-ID: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
Date: Sun, 9 Jan 2022 08:57:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 2b72e49b..39f33650 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -195,13 +195,13 @@ its fundamentals.
 The full API is covered in \cref{sec:defer:RCU Linux-Kernel API}.
 
 Three members of the core APIs are used by readers.
-The \co{rcu_read_lock()} and \co{rcu_read_unlock()} functions delimit
+The \apik{rcu_read_lock()} and \apik{rcu_read_unlock()} functions delimit
 RCU read-side critical sections.
 These may be nested, so that one \co{rcu_read_lock()}-\co{rcu_read_unlock()}
 pair can be enclosed within another.
 In this case, the nested set of RCU read-side critical section act as
 one large critical section covering the full extent of the nested set.
-The third read-side API member, \co{rcu_dereference()}, fetches an
+The third read-side API member, \apik{rcu_dereference()}, fetches an
 RCU-protected pointer.
 Conceptually, \co{rcu_dereference()} simply loads from memory, but we
 will see in
@@ -211,12 +211,12 @@ one case) the CPU from reordering its load with later memory operations
 that dereference this pointer.
 
 The other three members of the core APIs are used by updaters.
-The \co{synchronize_rcu()} function implements the ``wait for readers''
+The \apik{synchronize_rcu()} function implements the ``wait for readers''
 operation from \cref{fig:defer:Deletion With Concurrent Readers}.
-The \co{call_rcu()} function is the asynchronous counterpart of
+The \apik{call_rcu()} function is the asynchronous counterpart of
 \co{synchronize_rcu()} by invoking the specified function after
 all pre-existing RCU readers have completed.
-Finally, the \co{rcu_assign_pointer()} macro is used to update an
+Finally, the \apik{rcu_assign_pointer()} macro is used to update an
 RCU-protected pointer.
 Conceptually, this is simply an assignment statement, but we will
 see in

base-commit: 2b732c65e2a322eef7d27f65826330c9b93db2e0
-- 
2.17.1

