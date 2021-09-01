Return-Path: <SRS0=HGIU=NX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=JcFQkrYA4cq0Hq4U0EXwNd885OzQzvyvD72nj0lFITk=;
        b=eoLbL4baXs/EllhZne1ff0zHUrCXw0gz2q8iI4sxINPdCKyJvdalbcGSfCKOg1sz+e
         q3E9VWsLmaIrw/4BKYR2OfdlReEW9dQsdI4jd3Fk8CThy4xg8w+qB0wUL0vzpYOD9dO5
         N/6zvNVXVfj0KyRWcrmpgZQmDiPgZZn957oxvQW7tPZNXbC4X4dBQSksTqZit5mll4ov
         KZlVE4PpW4BM2GgwCxgVP8NoM8AtQixd1LF7QmD3XfgfKGtTC+pchClp2+rRfN3Ug5lw
         oVpU8VcH84cm6ck7Jjd3ju/LQCE+CSqYvv+XleCfnXKVNctX5Y+5wShlNuY0jO1D390C
         VM/A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] together/applyrcu: Shrink Listing 13.10 in
 ebook-size builds
Message-ID: <29232571-1ee0-db14-cde9-f90d8b21b584@gmail.com>
Date: Wed, 1 Sep 2021 22:07:39 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Listing 13.10 added in commit 42d9b5f32956
("together/applyrcu: Add example of retriggering a grace period")
is too tall for ebook-size builds.

As the \ebresizeverb command used to shrink code snippets requires
a verbatim element to be fed via \input{}, move the snippet into
CodeSamples/together/retrigger-gp.c.
The code snippet is now handled by fcvextract.pl.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/together/retrigger-gp.c | 60 ++++++++++++++++++++++++++++
 together/applyrcu.tex               | 61 +----------------------------
 2 files changed, 61 insertions(+), 60 deletions(-)
 create mode 100644 CodeSamples/together/retrigger-gp.c

diff --git a/CodeSamples/together/retrigger-gp.c b/CodeSamples/together/retrigger-gp.c
new file mode 100644
index 00000000..9b315220
--- /dev/null
+++ b/CodeSamples/together/retrigger-gp.c
@@ -0,0 +1,60 @@
+//\begin{snippet}[labelbase=ln:together:retrigger-gp:whole,commandchars=\\\@\$,tabsize=8]
+#define RTRG_CLOSED    0
+#define RTRG_OPEN      1
+#define RTRG_CLOSING   2
+#define RTRG_REOPENING 3
+#define RTRG_RECLOSING 4
+
+int rtrg_status;
+DEFINE_SPINLOCK(rtrg_lock);
+struct rcu_head rtrg_rh;
+
+void close_cb(struct rcu_head *rhp)
+{
+	spin_lock(rtrg_lock);
+	if (rtrg_status = RTRG_CLOSING) {
+		close_cleanup();
+		rtrg_status = RTRG_CLOSED;
+	} else if (rtrg_status == RTRG_REOPENING) {
+		rtrg_status = RTRG_OPEN;
+	} else if (rtrg_status == RTRG_RECLOSING) {
+		rtrg_status = RTRG_CLOSING;
+		call_rcu(&rtrg_rh, close_cb);
+	} else {
+		WARN_ON_ONCE(1);
+	}
+	spin_unlock(rtrg_lock);
+}
+
+int open(void)
+{
+	spin_lock(rtrg_lock);
+	if (rtrg_status == RTRG_CLOSED) {
+		rtrg_status = RTRG_OPEN;
+	} else if (rtrg_status == RTRG_CLOSING ||
+		   rtrg_status == RTRG_RECLOSING) {
+		rtrg_status = RTRG_REOPENING;
+	} else {
+		spin_unlock(rtrg_lock);
+		return -EBUSY;
+	}
+	do_open();
+	spin_unlock(rtrg_lock);
+}
+
+int close(void)
+{
+	spin_lock(rtrg_lock);
+	if (rtrg_status == RTRG_OPEN) {
+		rtrg_status = RTRG_CLOSING;
+		call_rcu(&rtrg_rh, close_cb);
+	} else if (rtrg_status == RTRG_REOPENING) {
+		rtrg_status = RTRG_RECLOSING;
+	} else {
+		spin_unlock(rtrg_lock);
+		return -ENOENT;
+	}
+	do_close();
+	spin_unlock(rtrg_lock);
+}
+//\end{snippet}
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index f9116055..769250ae 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -701,66 +701,7 @@ either of the CLOSING or the OPEN state, depending on which of the
 RECLOSING or REOPENING states the callback was invoked in.
 
 \begin{listing}
-\begin{VerbatimL}[tabsize=8]
-#define RTRG_CLOSED    0
-#define RTRG_OPEN      1
-#define RTRG_CLOSING   2
-#define RTRG_REOPENING 3
-#define RTRG_RECLOSING 4
-
-int rtrg_status;
-DEFINE_SPINLOCK(rtrg_lock);
-struct rcu_head rtrg_rh;
-
-void close_cb(struct rcu_head *rhp)
-{
-	spin_lock(rtrg_lock);
-	if (rtrg_status = RTRG_CLOSING) {
-		close_cleanup();
-		rtrg_status = RTRG_CLOSED;
-	} else if (rtrg_status == RTRG_REOPENING) {
-		rtrg_status = RTRG_OPEN;
-	} else if (rtrg_status == RTRG_RECLOSING) {
-		rtrg_status = RTRG_CLOSING;
-		call_rcu(&rtrg_rh, close_cb);
-	} else {
-		WARN_ON_ONCE(1);
-	}
-	spin_unlock(rtrg_lock);
-}
-
-int open(void)
-{
-	spin_lock(rtrg_lock);
-	if (rtrg_status == RTRG_CLOSED) {
-		rtrg_status = RTRG_OPEN;
-	} else if (rtrg_status == RTRG_CLOSING ||
-		   rtrg_status == RTRG_RECLOSING) {
-		rtrg_status = RTRG_REOPENING;
-	} else {
-		spin_unlock(rtrg_lock);
-		return -EBUSY;
-	}
-	do_open();
-	spin_unlock(rtrg_lock);
-}
-
-int close(void)
-{
-	spin_lock(rtrg_lock);
-	if (rtrg_status == RTRG_OPEN) {
-		rtrg_status = RTRG_CLOSING;
-		call_rcu(&rtrg_rh, close_cb);
-	} else if (rtrg_status == RTRG_REOPENING) {
-		rtrg_status = RTRG_RECLOSING;
-	} else {
-		spin_unlock(rtrg_lock);
-		return -ENOENT;
-	}
-	do_close();
-	spin_unlock(rtrg_lock);
-}
-\end{VerbatimL}
+\ebresizeverb{.88}{\input{CodeSamples/together/retrigger-gp@whole.fcv}}
 \caption{Retriggering a Grace Period (Pseudocode)}
 \label{lst:together:Retriggering a Grace Period}
 \end{listing}
-- 
2.17.1

