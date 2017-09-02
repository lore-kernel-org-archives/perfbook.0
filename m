Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=H8cD3PO+CBE0pZSTtWouiQMZkmR2JgvExIu8WxF7cIU=;
 b=Fz8uSJqLbGN2nb3AL4svwEqxFNt1GF8UTlbN9I9KUDbWT9ukbNFResugYHENRur0CS
 iRr4UT1XTlWyA0ge65PTCU9Fti81SI0S7Rbp69PGOa5H9TZHzX/AEw5hx6dxzUc/rUBv
 NCKdH9hEOq7e0nSAke0XerScGbjhGtlv0UsfT4epIHkcKp9CNSU+/hmy7x6L7rSgzZUD
 +o1ksqgvoYzKcUuxP2kfgsp8R2gXX0EqK6fJg380gqvSn/gj0H8dEP+m0xeAgMQZVq0D
 ZjUJwuhhitT5uErNd+c94/7Em1XrZW8m34d7pksqC6a4yL23LHbiqrmJWX2tPjZTTIqe
 POzg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] memorder: Express `value-returning RMW` more explicitly
Date: Sat,  2 Sep 2017 11:49:36 +0900
Message-Id: <20170902024937.4227-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence represents `Successful Non-Relaced Non-void RMW' row in
`Linux-Kernel Memory-Ordering Cheat Sheet` as `value-returning RMW` row.
Because it is far different expression, some reader may confuse.  This
commit remove the confuse by representing the row with exactly same
words.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 3e85eca..5e7176e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -507,9 +507,9 @@ The \co{*_acquire} row covers \co{smp_load_acquire()},
 \co{cmpxchg_acquire()}, \co{xchg_release()}, and so on;
 the \co{*_release} row covers \co{smp_store_release()},
 \co{cmpxchg_release()}, \co{xchg_release()}, and so on; and
-the value-returning RMW row covers \co{atomic_add_return()},
-\co{atomic_add_unless()},
-\co{atomic_dec_and_test()}, \co{cmpxchg()}, \co{xchg()}, and so on.
+the ``Successful Non-Relaxed Non-\co{void} RMW'' row covers
+\co{atomic_add_return()}, \co{atomic_add_unless()}, \co{atomic_dec_and_test()},
+\co{cmpxchg()}, \co{xchg()}, and so on.
 The ``Successful'' qualifiers apply to primitives such as
 \co{atomic_add_unless()}, \co{cmpxchg_acquire()}, and \co{cmpxchg_release()},
 which have no effect on either memory or on ordering when they indicate
-- 
2.10.0

