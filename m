Return-Path: <SRS0=naJo=73=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680626880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vwEVa++Je0A4E/E31iiULCn+SUbTEqukY1md5C5b3w=;
        b=M5lJlOixM1qHlEsGfrRhM7SOZVhtzzLPn8dUrP7qomWZCVRfHBsk5AIIi/78CmmYeR
         LwIKIRj7M7xpvjAKT8A8QGCNcyzExdpZktJM7Bzi4jL3ZiXwfqEYlB5Vnt3ui5Qtw6bU
         vEEvPQEJHg9chQNbDE2iJXeqMHxPaImPQiod52V2xcDX5ghaiGY0SVUn4vBjXx+kztM/
         J0wrEP1s5k52QVmQtTbkeRgNtg3hy9mwjujuPwXEae6kQUqslaALlkElFKHuDctoAH2y
         zPe0lW/0yHXJUh+Xqcc6c9xeDP/BLCA7TqsqmfExaGns6cCos/s4BGDJZ8Pl4icLnyVy
         8pWw==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH v2] CodeSamples/count: change full memory barrier to partial one
Date: Tue,  4 Apr 2023 12:47:53 -0400
Message-Id: <20230404164753.1317498-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The original memory barriers in count_stat_eventual.c ensure
writing to global_count happens before writing to stopflag and
reading from stopflag happens before later reading from global_count.

Thus, smp_load_acquire and smp_store_release will suffice.

In count_lim_sig.c, there is only one ordering required, that is
writing to counter happens before setting theft to THEFT_READY in
add_count/sub_count's fast path. Therefore, partial memory barrier
will suffice.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_lim_sig.c       | 10 +++-------
 CodeSamples/count/count_stat_eventual.c |  6 ++----
 count/count.tex                         |  9 ++++-----
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index 59da8077..c2f61197 100644
--- a/CodeSamples/count/count_lim_sig.c
+++ b/CodeSamples/count/count_lim_sig.c
@@ -56,12 +56,10 @@ static void flush_local_count_sig(int unused)	//\lnlbl{flush_sig:b}
 {
 	if (READ_ONCE(theft) != THEFT_REQ)	//\lnlbl{flush_sig:check:REQ}
 		return;				//\lnlbl{flush_sig:return:n}
-	smp_mb();				//\lnlbl{flush_sig:mb:1}
 	WRITE_ONCE(theft, THEFT_ACK);		//\lnlbl{flush_sig:set:ACK}
 	if (!counting) {			//\lnlbl{flush_sig:check:fast}
-		WRITE_ONCE(theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
+		smp_store_release(&theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
 	}
-	smp_mb();
 }						//\lnlbl{flush_sig:e}
 
 static void flush_local_count(void)			//\lnlbl{flush:b}
@@ -125,8 +123,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
 	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
 	barrier();					//\lnlbl{barrier:3}
 	if (READ_ONCE(theft) == THEFT_ACK) {		//\lnlbl{check:ACK}
-		smp_mb();				//\lnlbl{mb}
-		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
+		smp_store_release(&theft, THEFT_READY);		//\lnlbl{READY}
 	}
 	if (fastpath)
 		return 1;				//\lnlbl{return:fs}
@@ -164,8 +161,7 @@ int sub_count(unsigned long delta)
 	WRITE_ONCE(counting, 0);
 	barrier();
 	if (READ_ONCE(theft) == THEFT_ACK) {
-		smp_mb();
-		WRITE_ONCE(theft, THEFT_READY);
+		smp_store_release(&theft, THEFT_READY);
 	}
 	if (fastpath)
 		return 1;
diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 967644de..7157ee0e 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -51,8 +51,7 @@ void *eventual(void *arg)				//\lnlbl{eventual:b}
 		WRITE_ONCE(global_count, sum);
 		poll(NULL, 0, 1);
 		if (READ_ONCE(stopflag)) {
-			smp_mb();
-			WRITE_ONCE(stopflag, stopflag + 1);
+			smp_store_release(&stopflag, stopflag + 1);
 		}
 	}
 	return NULL;
@@ -73,9 +72,8 @@ void count_init(void)					//\lnlbl{init:b}
 void count_cleanup(void)				//\lnlbl{cleanup:b}
 {
 	WRITE_ONCE(stopflag, 1);
-	while (READ_ONCE(stopflag) < 3)
+	while (smp_load_acquire(&stopflag) < 3)
 		poll(NULL, 0, 1);
-	smp_mb();
 }							//\lnlbl{cleanup:e}
 //\end{snippet}
 
diff --git a/count/count.tex b/count/count.tex
index 80ada104..899ea7e9 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2425,12 +2425,11 @@ handler used in the theft process.
 \Clnref{check:REQ,return:n} check to see if
 the \co{theft} state is REQ, and, if not
 returns without change.
-\Clnref{mb:1} executes a \IX{memory barrier} to ensure that the sampling
-of the theft variable happens before any change to that variable.
 \Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
 \clnref{check:fast} sees that
 this thread's fastpaths are not running, \clnref{set:READY} sets the \co{theft}
-state to READY\@.
+state to READY, the release store here is to ensure that the change to counter
+in fast path happens before changing the theft varibale to READY\@.
 \end{fcvref}
 
 \begin{listing}
@@ -2595,8 +2594,8 @@ handlers to undertake theft.
 \Clnref{barrier:3} again disables compiler reordering, and then
 \clnref{check:ACK}
 checks to see if the signal handler deferred the \co{theft}
-state-change to READY, and, if so, \clnref{mb} executes a memory
-barrier to ensure that any CPU that sees \clnref{READY} setting state to
+state-change to READY, and, if so, the release store at \clnref{READY}
+is to ensure that any CPU that sees \clnref{READY} setting state to
 READY also sees the effects of \clnref{add:f}.
 If the fastpath addition at \clnref{add:f} was executed, then
 \clnref{return:fs} returns
-- 
2.34.1

