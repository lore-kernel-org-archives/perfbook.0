Return-Path: <SRS0=bx9V=YP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6tgFPaaVsDGDXlS8oLC4m9bCtg2WlYGmIZMxiWoXrCo=;
        b=uVpGmIR6KKYQ1aumI/nKvWX1CUxltgmL8rNah7pOxuScV2jyoXashGWtGDuZPyt10m
         fcFeipYAINwjCU7TyYl/j2/r/d0NFI+1DKRrzqgxt4f0IsgwIMcUkRppwhrOmS2Dve7I
         /A6gYORCmekMSYqTkj4tEC9NnItQjGLWJLNCnOgEiRrlKIjk4qsEUiMpmsDLtH0T2FqU
         AvcybWV8ttm1TmF3jZOo2G/9eS/cHn6RRkgV/dcFZb4s23m1CEhm6b/iZmS7q7sh6i2w
         zBOABy0wCZ1GpoLpiCctb9RrPbjfl7+shkcjaDpcY4zN+BCEBCTS5w3HY4s5vxbRMOhV
         kJog==
Subject: [PATCH v4 5/6] defer/rcuintro: Convert snippet to new scheme
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
 <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
 <20191022120533.GE2479@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <67a02888-6011-faef-985f-f2cad86a091c@gmail.com>
Date: Tue, 22 Oct 2019 23:34:48 +0900
MIME-Version: 1.0
In-Reply-To: <20191022120533.GE2479@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6a9e5e96a0dd94b6f20052ab741d2606e79dc80f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 22 Oct 2019 23:23:42 +0900
Subject: [PATCH v4 5/6] defer/rcuintro: Convert snippet to new scheme

This snippet was added using the verbatimbox scheme.
Convert it using VerbatimL.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

> With the exception of defer/rcuintro.tex, which collided with one of
> my cleanups.  I believe that the fix is straightforward, just accounting
> for the line I added, but I figured that I should check.

FWIW, this is the result of my rebase of the patch.

        Thanks, Akira
> 
> 							Thanx, Paul

--
 defer/rcuintro.tex | 58 ++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index ed7ff0b0..dc750326 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -375,50 +375,48 @@ has executed a context switch, which in turn guarantees that
 all pre-existing reader threads have completed.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}[\LstLineNo]
+\begin{linelabel}[ln:defer:Insertion and Deletion With Concurrent Readers]
+\begin{VerbatimL}[commandchars=\\\[\]]
 struct route *gptr;
 
 int access_route(int (*f)(struct route *rp))
 {
-  int ret = -1;
-  struct route *rp;
-
-  rcu_read_lock();
-  rp = rcu_dereference(gptr);
-  if (rp)
-  	ret = f(rp);
-  rcu_read_unlock();
-  return ret;
+	int ret = -1;
+	struct route *rp;
+
+	rcu_read_lock();
+	rp = rcu_dereference(gptr);
+	if (rp)
+		ret = f(rp);
+	rcu_read_unlock();
+	return ret;
 }
 
 struct route *ins_route(struct route *rp)
 {
-  struct route *old_rp;
+	struct route *old_rp;
 
-  spin_lock(&route_lock);
-  old_rp = gptr;
-  rcu_assign_pointer(gptr, rp);
-  spin_unlock(&route_lock);
-  return old_rp;
+	spin_lock(&route_lock);
+	old_rp = gptr;
+	rcu_assign_pointer(gptr, rp);
+	spin_unlock(&route_lock);
+	return old_rp;
 }
 
 int del_route(void)
 {
-  struct route *old_rp;
-
-  spin_lock(&route_lock);
-  old_rp = gptr;
-  RCU_INIT_POINTER(gptr, NULL);
-  spin_unlock(&route_lock);
-  synchronize_rcu();
-  free(old_rp);
-  return !!old_rp;
+	struct route *old_rp;
+
+	spin_lock(&route_lock);
+	old_rp = gptr;
+	RCU_INIT_POINTER(gptr, NULL);
+	spin_unlock(&route_lock);
+	synchronize_rcu();
+	free(old_rp);
+	return !!old_rp;
 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Insertion and Deletion With Concurrent Readers}
 \label{lst:defer:Insertion and Deletion With Concurrent Readers}
 \end{listing}
-- 
2.17.1


