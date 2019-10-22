Return-Path: <SRS0=bx9V=YP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u9SnYSHkNwCbIyrHVywHqCBzgh57oGDDj4JcWx7Tkfk=;
        b=SwKBJEJ6ie1h3hry8RPOR6BUG1ZFV7BGlguz4ine/PqsuKl49Wkw8OvFWwMlatUnFK
         9Zi3gI54z+2D68pY4fX1QErZSrrF5KQ9fGFpbn7Elhz+E+j1wSjouCCJbPuEbxqNQrx6
         rVd4SYen4yFAnQM/2kLtsix+qfXwxH+a3TREB6FDxShD84f8iqq8dxO5HNbpc827U/uN
         4Lvz6bLI0CagOI7i0Hqy5axzZIM8Ql2qMZ3A6880UbjmpRWsL26KUd14vHFDVyHCyPqe
         yqNHzHXlduXP7j+HPXEtRUDlV7G1xD3VYQ3bUqE2LZHjrcqxUU+EigmqDbxAf7EuZuqS
         1Hjg==
Subject: [PATCH v3 5/6] defer/rcuintro: Convert snippet to new scheme
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
 <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bf3f3451-fc71-8cc4-d4a4-2551730286f9@gmail.com>
Date: Tue, 22 Oct 2019 20:23:19 +0900
MIME-Version: 1.0
In-Reply-To: <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f4ecbf9683111d67e70fc32bfed737ac556bfaf5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 22 Oct 2019 12:53:00 +0900
Subject: [PATCH v3 5/6] defer/rcuintro: Convert snippet to new scheme

This snippet was added using the verbatimbox scheme.
Convert it using VerbatimL.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 56 ++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index b9b9400e..000c61a7 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -370,49 +370,47 @@ has executed a context switch, which in turn guarantees that
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
+	spin_lock(&route_lock);
+	old_rp = gptr;
+	rcu_assign_pointer(gptr, rp);
+	spin_unlock(&route_lock);
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


