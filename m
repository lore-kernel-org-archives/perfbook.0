Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r2Xt587RKaO8goP3wVG1lG6GKB60Nf+EJ7n9jme2Wb8=;
        b=atM8PvKy9nmwAw+1da5+92h76ErbkKLY1rGEuPmr+v97UjvTw4fjbV459vy3TTnpur
         iFz+/sIlfeoXXGY/nKB5w6npgCYN7UVwE6SOe7v+qnXMknThA8JohNROk5yxzE56Red7
         Rh1KupO7gB++z9yY9VSqXDgR4+dy7ttGoWcfB4FvUirvF/JKXGLV5Y83cGQ/9hwCD5ER
         +rexu/OjvFQXktImUxlo56u9RI9ryU7aPqzdAPh0Yj5bFPqHu0/df5wc9EbFnL6g+puf
         3Sp0O71Qnldc6GZd3oUwCXDJ1HN6/IJJ09x79h37wBx5b3wOcaY9fCgG9tAfDwbJJ1/0
         XjcA==
Subject: [PATCH 1/4] formal: Make RCU litmus tests klitmus7 ready
References: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6e7b6748-eed8-cb33-cb97-7a6b60460a05@gmail.com>
Date: Fri, 30 Nov 2018 07:11:35 +0900
MIME-Version: 1.0
In-Reply-To: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cd34622c4250a6884b8b79c0f6a9b40eca4403a7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 29 Nov 2018 20:39:43 +0900
Subject: [PATCH 1/4] formal: Make RCU litmus tests klitmus7 ready

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/C-RCU-remove.litmus        | 14 ++++++++-----
 .../formal/herd/C-RomanPenyaev-list-rcu-rr.litmus  | 24 ++++++++++++++++------
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/CodeSamples/formal/herd/C-RCU-remove.litmus b/CodeSamples/formal/herd/C-RCU-remove.litmus
index 0dc806e..6084f12 100644
--- a/CodeSamples/formal/herd/C-RCU-remove.litmus
+++ b/CodeSamples/formal/herd/C-RCU-remove.litmus
@@ -2,20 +2,24 @@ C C-RCU-remove
 //\begin[snippet][labelbase=ln:formal:C-RCU-remove:whole,commandchars=\\\@\$]
 
 {
-	int *z=1; (* \lnlbl[tail:2] *)
-	int *y=2; (* \lnlbl[tail:1] *)
+	int z=1; (* \lnlbl[tail:2] *)
+	int y=2; (* \lnlbl[tail:1] *)
 	int *x=y; (* \lnlbl[head] *)
+	int * 1:r1; (* \fcvexclude *)
 }
 
-P0(int *x, int *y, int *z)		//\lnlbl[P0start]
+P0(int **x, int *y, int *z)		//\lnlbl[P0start]
 {
 	rcu_assign_pointer(*x, z);	//\lnlbl[assignnewtail]
 	synchronize_rcu();		//\lnlbl[sync]
 	WRITE_ONCE(*y, 0);		//\lnlbl[free]
 }					//\lnlbl[P0end]
 
-P1(int *x, int *y, int *z)		//\lnlbl[P1start]
+P1(int **x, int *y, int *z)		//\lnlbl[P1start]
 {
+	int *r1;
+	int r2;
+
 	rcu_read_lock();		//\lnlbl[rl]
 	r1 = rcu_dereference(*x);	//\lnlbl[rderef]
 	r2 = READ_ONCE(*r1);		//\lnlbl[read]
@@ -23,5 +27,5 @@ P1(int *x, int *y, int *z)		//\lnlbl[P1start]
 }					//\lnlbl[P1end]
 
 //\end[snippet][locationslabel=locations_,existslabel=exists_]
-locations [0:r1; 1:r1; x; y; z]
+locations [1:r1; x; y; z]
 exists (1:r2=0)
diff --git a/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus b/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
index bf88ee4..f0080c1 100644
--- a/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
+++ b/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
@@ -8,16 +8,26 @@ C C-RomanPenyaev-list-rcu-rr
 	int *w=x;
 	int *v=w;			(* \lnlbl[listhead] *)
 	int *c=w;			(* \lnlbl[rrcache] *)
+	int * 0:r1;			(* \fcvexclude *)
+	int * 0:r2;			(* \fcvexclude *)
+	int * 0:r3;			(* \fcvexclude *)
+	int * 0:r4;			(* \fcvexclude *)
+	int * 1:r1;			(* \fcvexclude *)
 }
 
-P0(int *c, int *v)			//\lnlbl[P0start]
+P0(int **c, int **v)			//\lnlbl[P0start]
 {
+	int *r1;
+	int *r2;
+	int *r3;
+	int *r4;
+
 	rcu_read_lock();		//\lnlbl[rl1]
 	r1 = READ_ONCE(*c);		//\lnlbl[rdcache]
 	if (r1 == 0) {			//\lnlbl[rdckcache]
 		r1 = READ_ONCE(*v);	//\lnlbl[rdinitcache]
 	}
-	r2 = rcu_dereference(*r1);	//\lnlbl[rdnext]
+	r2 = rcu_dereference(*(int **)r1);//\lnlbl[rdnext]
 	smp_store_release(c, r2);	//\lnlbl[rdupdcache]
 	rcu_read_unlock();		//\lnlbl[rul1]
 	rcu_read_lock();		//\lnlbl[rl2]
@@ -25,17 +35,19 @@ P0(int *c, int *v)			//\lnlbl[P0start]
 	if (r3 == 0) {
 		r3 = READ_ONCE(*v);
 	}
-	r4 = rcu_dereference(*r3);
+	r4 = rcu_dereference(*(int **)r3);
 	smp_store_release(c, r4);
 	rcu_read_unlock();		//\lnlbl[rul2]
 }					//\lnlbl[P0end]
 
-P1(int *c, int *v, int *w, int *x, int *y)//\lnlbl[P1start]
+P1(int **c, int **v, int **w, int **x, int **y)//\lnlbl[P1start]
 {
+	int *r1;
+
 	rcu_assign_pointer(*w, y);	//\lnlbl[updremove]
 	synchronize_rcu();		//\lnlbl[updsync1]
 	r1 = READ_ONCE(*c);		//\lnlbl[updrdcache]
-	if (r1 == x) {			//\lnlbl[updckcache]
+	if ((int **)r1 == x) {		//\lnlbl[updckcache]
 		WRITE_ONCE(*c, 0);	//\lnlbl[updinitcache]
 		synchronize_rcu();	//\lnlbl[updsync2]
 	}
@@ -43,5 +55,5 @@ P1(int *c, int *v, int *w, int *x, int *y)//\lnlbl[P1start]
 }					//\lnlbl[P1end]
 
 //\end[snippet][locationslabel=locations_,existslabel=exists_]
-locations [0:r1; 1:r1; 1:r3; c; v; w; x; y]
+locations [1:r1; c; v; w; x; y]
 exists (0:r1=0 \/ 0:r2=0 \/ 0:r3=0 \/ 0:r4=0)
-- 
2.7.4


