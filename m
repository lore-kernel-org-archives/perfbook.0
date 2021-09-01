Return-Path: <SRS0=HGIU=NX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HAKhrQ+RUP/EZvlHFcXW8Rcl+r3je3RKyh76f3DZ3cY=;
        b=ouf4sHVAUBwzqsp/DobG1hglT37Rxmrl9TTXgdkRpbzjHJXI7zROgpeEmIk8vWX/X6
         F3ifJV+rigew+msSk7qX1FnRdSXaKe9DS3DrybsBYOmiXiaAjKTszByKY4ghyp/bl4Ez
         Riiol5Y/kesPG15T01BB2I0n0mMqnaebX0DVju2ZJeYQ2fZkV1r3E+4q06SeFxwer82Q
         T9XGUwdCJRKZA1m62YkcS9kEonJbwufolA53fUyFhaUz3vwlhlRyDilO/7gx2nqpjJPt
         HNMISsbxemCNlPw2ZXdL0SlRr/WXmoOovJp/6Ubn38GHkaXyChyDvxqU5+TVfvRS9gmf
         pbAA==
Subject: [PATCH -perfbook 2/2] together/applyrcu: Apply \clnref{} scheme to
 Listing 10.13
References: <29232571-1ee0-db14-cde9-f90d8b21b584@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6dd8cea1-94e2-be4b-f95f-b032fde02c19@gmail.com>
Date: Wed, 1 Sep 2021 22:10:10 +0900
MIME-Version: 1.0
In-Reply-To: <29232571-1ee0-db14-cde9-f90d8b21b584@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Embedding line labels in code snippets and referencing them by
\clnref{} and its variants can reduce the risk of line-count mismatch
in the future.

Also fix a typo (RCLOSING -> RECLOSING).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/together/retrigger-gp.c | 30 +++++++++----------
 together/applyrcu.tex               | 45 +++++++++++++++--------------
 2 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/CodeSamples/together/retrigger-gp.c b/CodeSamples/together/retrigger-gp.c
index 9b315220..eade27ec 100644
--- a/CodeSamples/together/retrigger-gp.c
+++ b/CodeSamples/together/retrigger-gp.c
@@ -1,32 +1,32 @@
 //\begin{snippet}[labelbase=ln:together:retrigger-gp:whole,commandchars=\\\@\$,tabsize=8]
-#define RTRG_CLOSED    0
+#define RTRG_CLOSED    0	//\lnlbl{states:b}
 #define RTRG_OPEN      1
 #define RTRG_CLOSING   2
 #define RTRG_REOPENING 3
-#define RTRG_RECLOSING 4
+#define RTRG_RECLOSING 4	//\lnlbl{states:e}
 
-int rtrg_status;
-DEFINE_SPINLOCK(rtrg_lock);
+int rtrg_status;		//\lnlbl{status}
+DEFINE_SPINLOCK(rtrg_lock);	//\lnlbl{lock}
 struct rcu_head rtrg_rh;
 
-void close_cb(struct rcu_head *rhp)
+void close_cb(struct rcu_head *rhp)		//\lnlbl{close_cb:b}
 {
 	spin_lock(rtrg_lock);
 	if (rtrg_status = RTRG_CLOSING) {
-		close_cleanup();
+		close_cleanup();		//\lnlbl{cleanup}
 		rtrg_status = RTRG_CLOSED;
 	} else if (rtrg_status == RTRG_REOPENING) {
 		rtrg_status = RTRG_OPEN;
 	} else if (rtrg_status == RTRG_RECLOSING) {
 		rtrg_status = RTRG_CLOSING;
-		call_rcu(&rtrg_rh, close_cb);
+		call_rcu(&rtrg_rh, close_cb);	//\lnlbl{call_rcu1}
 	} else {
 		WARN_ON_ONCE(1);
 	}
 	spin_unlock(rtrg_lock);
-}
+}						//\lnlbl{close_cb:e}
 
-int open(void)
+int open(void)					//\lnlbl{open:b}
 {
 	spin_lock(rtrg_lock);
 	if (rtrg_status == RTRG_CLOSED) {
@@ -38,23 +38,23 @@ int open(void)
 		spin_unlock(rtrg_lock);
 		return -EBUSY;
 	}
-	do_open();
+	do_open();				//\lnlbl{do_open}
 	spin_unlock(rtrg_lock);
-}
+}						//\lnlbl{open:e}
 
-int close(void)
+int close(void)					//\lnlbl{close:b}
 {
 	spin_lock(rtrg_lock);
 	if (rtrg_status == RTRG_OPEN) {
 		rtrg_status = RTRG_CLOSING;
-		call_rcu(&rtrg_rh, close_cb);
+		call_rcu(&rtrg_rh, close_cb);	//\lnlbl{call_rcu2}
 	} else if (rtrg_status == RTRG_REOPENING) {
 		rtrg_status = RTRG_RECLOSING;
 	} else {
 		spin_unlock(rtrg_lock);
 		return -ENOENT;
 	}
-	do_close();
+	do_close();				//\lnlbl{do_close}
 	spin_unlock(rtrg_lock);
-}
+}						//\lnlbl{close:e}
 //\end{snippet}
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 769250ae..b26c7b6e 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -708,30 +708,33 @@ RECLOSING or REOPENING states the callback was invoked in.
 
 Rough pseudocode of this state machine is shown in
 \cref{lst:together:Retriggering a Grace Period}.
-The five states are shown on lines~1-5, the current state is held in
-\co{rtrg_status} on line~7, which is protected by the lock on line~8.
+\begin{fcvref}[ln:together:retrigger-gp:whole]
+The five states are shown on \clnrefrange{states:b}{states:e},
+the current state is held in \co{rtrg_status} on \clnref{status},
+which is protected by the lock on \clnref{lock}.
 
 The three CB transitions (emanating from states CLOSING, REOPENING,
 and RECLOSING) are implemented by the \co{close_cb()} function shown
-on lines~11-26.
-Line~15 invokes a user-supplied \co{close_cleanup()} to take any final
-cleanup actions such as freeing memory when transitioning to the
-CLOSED state.
-Line~21 contains the \co{call_rcu()} invocation that causes a later
-transition to the CLOSED state.
-
-The \co{open()} function on lines~28-42 implements the transitions
-to the OPEN, CLOSING, and REOPENING states, with line~40 invoking a
-\co{do_open()} function to implement any allocation and initialization
-of any needed data structures.
-
-The \co{close()} function on lines~44-58 implements the transitions
-to the CLOSING and RCLOSING states, with line~56 invoking a
-\co{do_close()} function to take any actions that might be required
-to finalize this transition, for example, causing later read-only
-traversals to return errors.
-Line~49 contains the \co{call_rcu()} invocation that causes a later
-transition to the CLOSED state.
+on \clnrefrange{close_cb:b}{close_cb:e}.
+\Clnref{cleanup} invokes a user-supplied \co{close_cleanup()} to
+take any final cleanup actions such as freeing memory when
+transitioning to the CLOSED state.
+\Clnref{call_rcu1} contains the \co{call_rcu()} invocation that
+causes a later transition to the CLOSED state.
+
+The \co{open()} function on \clnrefrange{open:b}{open:e} implements
+the transitions to the OPEN, CLOSING, and REOPENING states, with
+\clnref{do_open} invoking a \co{do_open()} function to implement
+any allocation and initialization of any needed data structures.
+
+The \co{close()} function on \clnrefrange{close:b}{close:e}
+implements the transitions to the CLOSING and RECLOSING states,
+with \clnref{do_close} invoking a \co{do_close()} function to take
+any actions that might be required to finalize this transition,
+for example, causing later read-only traversals to return errors.
+\Clnref{call_rcu2} contains the \co{call_rcu()} invocation that
+causes a later transition to the CLOSED state.
+\end{fcvref}
 
 This state machine and pseudocode shows how to get the effect of a
 \co{call_rcu_cancel()} in those rare situations needing such semantics.
-- 
2.17.1


