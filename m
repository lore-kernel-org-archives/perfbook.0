Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CJIekLSYecEtOvUpj0oalQPs3nHH/4lkClcJRABYHg8=;
        b=nVopKfKi6f6edIBbZqy5cugyAsAMieYqiwNow/VbDkx5sj+JfAZBlKJ4uL5F24ucXm
         j5iPP8vJjOqjSILw0ervmIJR0W/I31yZFVwRv1Fn3E8daMGpzsMb1fbKcrH2OPHDMkKx
         cnWeT1dbyv59JaN6b87nsDxJMnAn9zIo2Sd2taI+Ar7GfcAZ4RnPU4JZrsWdrZ9SBcuB
         35jUs64PYxQekSdhP31V1yWd4xHgUHNdKG6gnHrjVwpF19+39CMPDhBe4iayicH0LBLc
         m2x0YEo3DSw8ICAaDCQr1hdLSsMllR23V5/S5aCR8xOFBmATV+Zoj1qjywbQn9VPFiC2
         nxnQ==
Subject: [PATCH 5/8] CodeSamples/formal: Add
 C-RomanPenyanev-list-rcu-rr.litmus
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <09f6e353-6384-4433-5dc5-334b90484310@gmail.com>
Date: Thu, 1 Nov 2018 00:13:51 +0900
MIME-Version: 1.0
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 37a1a26897a72e8cac8c5c1cc6e0982d76effd52 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 31 Oct 2018 08:34:35 +0900
Subject: [PATCH 5/8] CodeSamples/formal: Add C-RomanPenyanev-list-rcu-rr.litmus

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../formal/herd/C-RomanPenyaev-list-rcu-rr.litmus  | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus

diff --git a/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus b/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
new file mode 100644
index 0000000..bf88ee4
--- /dev/null
+++ b/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
@@ -0,0 +1,47 @@
+C C-RomanPenyaev-list-rcu-rr
+//\begin[snippet][labelbase=ln:formal:C-RomanPenyaev-list-rcu-rr:whole,commandchars=\%\@\$]
+
+{
+	int *z=1;			(* \lnlbl[listtail] *)
+	int *y=z;
+	int *x=y;
+	int *w=x;
+	int *v=w;			(* \lnlbl[listhead] *)
+	int *c=w;			(* \lnlbl[rrcache] *)
+}
+
+P0(int *c, int *v)			//\lnlbl[P0start]
+{
+	rcu_read_lock();		//\lnlbl[rl1]
+	r1 = READ_ONCE(*c);		//\lnlbl[rdcache]
+	if (r1 == 0) {			//\lnlbl[rdckcache]
+		r1 = READ_ONCE(*v);	//\lnlbl[rdinitcache]
+	}
+	r2 = rcu_dereference(*r1);	//\lnlbl[rdnext]
+	smp_store_release(c, r2);	//\lnlbl[rdupdcache]
+	rcu_read_unlock();		//\lnlbl[rul1]
+	rcu_read_lock();		//\lnlbl[rl2]
+	r3 = READ_ONCE(*c);
+	if (r3 == 0) {
+		r3 = READ_ONCE(*v);
+	}
+	r4 = rcu_dereference(*r3);
+	smp_store_release(c, r4);
+	rcu_read_unlock();		//\lnlbl[rul2]
+}					//\lnlbl[P0end]
+
+P1(int *c, int *v, int *w, int *x, int *y)//\lnlbl[P1start]
+{
+	rcu_assign_pointer(*w, y);	//\lnlbl[updremove]
+	synchronize_rcu();		//\lnlbl[updsync1]
+	r1 = READ_ONCE(*c);		//\lnlbl[updrdcache]
+	if (r1 == x) {			//\lnlbl[updckcache]
+		WRITE_ONCE(*c, 0);	//\lnlbl[updinitcache]
+		synchronize_rcu();	//\lnlbl[updsync2]
+	}
+	smp_store_release(x, 0);	//\lnlbl[updfree]
+}					//\lnlbl[P1end]
+
+//\end[snippet][locationslabel=locations_,existslabel=exists_]
+locations [0:r1; 1:r1; 1:r3; c; v; w; x; y]
+exists (0:r1=0 \/ 0:r2=0 \/ 0:r3=0 \/ 0:r4=0)
-- 
2.7.4


