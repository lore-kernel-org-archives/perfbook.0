Return-Path: <SRS0=Dz0b=76=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680890303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGB1JH/2PiBEjcozcDIyM2i7LC3SDflrBbIcOZG4tfQ=;
        b=Wn+B3pL6NkGY/8xOZ46LSkqdIMFM0/O3UCcSxjc/4NOOQ54cffskv4PsOKEnBtiBYc
         IfyExmZDA8MULO2Wq6UKnIM78Bk6Ey3BIbFNDYS06nPU/jrb8t99RGOD3FX5ySVKxuzE
         rle3FthEROCh+dnYveKwVpjFMXyPhZlWpRMXnbTCARxKffgyO9gZHuGwGaTDDGaUPjbK
         owdSbV5F8jMt18zGaZ4+qvNECw/HA0wPdcYB5BF7yI8VArRl2Y9hvpXYi8EPfhU/l1PE
         qJj7Os40/qMf+RtbPQG4M1n4RYzz1TB9YWKXhPokyFizWAI4d0ol5M2gm6fd1gcCYaHY
         UGEw==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
Date: Fri,  7 Apr 2023 13:58:13 -0400
Message-Id: <20230407175813.1334028-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In count_lim_sig.c, there is only one ordering required, that is
writing to counter happens before setting theft to THEFT_READY in
add_count/sub_count's fast path. Therefore, partial memory barrier
will suffice.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_lim_sig.c | 10 +++-------
 count/count.tex                   | 12 ++++++------
 2 files changed, 9 insertions(+), 13 deletions(-)

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
diff --git a/count/count.tex b/count/count.tex
index 8ab67e2e..4c139d63 100644
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
+state to READY, with the release store ensuring any change to counter in
+the fastpath happens before the change of theft to READY\@.
 \end{fcvref}
 
 \begin{listing}
@@ -2595,9 +2594,10 @@ handlers to undertake theft.
 \Clnref{barrier:3} again disables compiler reordering, and then
 \clnref{check:ACK}
 checks to see if the signal handler deferred the \co{theft}
-state-change to READY, and, if so, \clnref{mb} executes a memory
-barrier to ensure that any CPU that sees \clnref{READY} setting state to
-READY also sees the effects of \clnref{add:f}.
+state-change to READY, and, if so, \clnref{READY} changes theft to
+READY with the release store ensuring that
+any CPU that sees the READY state also sees the effects
+of \clnref{add:f}.
 If the fastpath addition at \clnref{add:f} was executed, then
 \clnref{return:fs} returns
 success.
-- 
2.34.1

