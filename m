Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fZ+jZEiYB4nJTgdAj7l4bKIIVGduDgfXSi6vL7L/siY=;
        b=UbqM9o2Vo9a8AgKHDQk8JeGp8fjwMYl90aHWbmZwIr83U0++4B6yFly11FXzIM6Eud
         Xw7OfHRXNHiavqAi5I1LHYxBAKgkpN1VwOZX3Q/EwWBLIfYnsnrgxcUzXYe0gNAgRZ1A
         uP9lx1c2bsVxPdURypZdQJAKpnhRKNkSkOeSwFzW7zKZm+NcIMvL1et2mJbUuON7JIbn
         DmKiMtzVkOyf9HElZX8B1+uyMbl//k3WlAP5+b70Vy9aeKdahfpbJDh2FttaBuKRYKkP
         HZMOuJKVNsq+BpwOm6V2yHwDCpK1drFeR4SNeLeA/W5dy5D+6G82mNqtB+hnB0yQfsIT
         omrw==
Subject: [PATCH 1/7] count: Employ new scheme for inline code snippets
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <70901d74-61e2-5319-8328-ffab4c869d47@gmail.com>
Date: Sat, 27 Oct 2018 00:24:02 +0900
MIME-Version: 1.0
In-Reply-To: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c8ed9b923cfdc68403998cd154f07f7834ad4edb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Oct 2018 10:50:24 +0900
Subject: [PATCH 1/7] count: Employ new scheme for inline code snippets

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 89 +++++++++++++++++++++++++++++----------------------------
 1 file changed, 46 insertions(+), 43 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 4d13394..0f35042 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2679,30 +2679,33 @@ when updating the counter, and to write-acquire that same reader-writer
 lock when checking the counter.
 Code for doing I/O might be as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
-  1 read_lock(&mylock);
-  2 if (removing) {
-  3   read_unlock(&mylock);
-  4   cancel_io();
-  5 } else {
-  6   add_count(1);
-  7   read_unlock(&mylock);
-  8   do_io();
-  9   sub_count(1);
- 10 }
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
-
-Line~1 read-acquires the lock, and either line~3 or~7 releases it.
-Line~2 checks to see if the device is being removed, and, if so,
-line~3 releases the lock and line~4 cancels the I/O, or takes whatever
+\begin{linelabel}[ln:count:inline:I/O]
+\begin{VerbatimN}[commandchars=\\\[\]]
+read_lock(&mylock);		\lnlbl[acq]
+if (removing) {			\lnlbl[check]
+	read_unlock(&mylock);	\lnlbl[rel1]
+	cancel_io();		\lnlbl[cancel]
+} else {
+	add_count(1);		\lnlbl[inc]
+	read_unlock(&mylock);	\lnlbl[rel2]
+	do_io();		\lnlbl[do]
+	sub_count(1);		\lnlbl[dec]
+}
+\end{VerbatimN}
+\end{linelabel}
+
+\begin{lineref}[ln:count:inline:I/O]
+Line~\lnref{acq} read-acquires the lock, and either
+line~\lnref{rel1} or~\lnref{rel2} releases it.
+Line~\lnref{check} checks to see if the device is being removed, and, if so,
+line~\lnref{rel1} releases the lock and
+line~\lnref{cancel} cancels the I/O, or takes whatever
 action is appropriate given that the device is to be removed.
-Otherwise, line~6 increments the access count, line~7 releases the
-lock, line~8 performs the I/O, and line~9 decrements the access count.
+Otherwise, line~\lnref{inc} increments the access count,
+line~\lnref{rel2} releases the
+lock, line~\lnref{do} performs the I/O, and
+line~\lnref{dec} decrements the access count.
+\end{lineref}
 
 \QuickQuiz{}
 	This is ridiculous!
@@ -2717,27 +2720,27 @@ lock, line~8 performs the I/O, and line~9 decrements the access count.
 
 The code to remove the device might be as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
-  1 write_lock(&mylock);
-  2 removing = 1;
-  3 sub_count(mybias);
-  4 write_unlock(&mylock);
-  5 while (read_count() != 0) {
-  6   poll(NULL, 0, 1);
-  7 }
-  8 remove_device();
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
-
-Line~1 write-acquires the lock and line~4 releases it.
-Line~2 notes that the device is being removed, and the loop spanning
-lines~5-7 wait for any I/O operations to complete.
-Finally, line~8 does any additional processing needed to prepare for
+\begin{linelabel}[ln:count:inline:remove]
+\begin{VerbatimN}[commandchars=\\\[\]]
+write_lock(&mylock);		\lnlbl[acq]
+removing = 1;			\lnlbl[note]
+sub_count(mybias);
+write_unlock(&mylock);		\lnlbl[rel]
+while (read_count() != 0) {	\lnlbl[loop:b]
+	poll(NULL, 0, 1);
+}				\lnlbl[loop:e]
+remove_device();		\lnlbl[remove]
+\end{VerbatimN}
+\end{linelabel}
+
+\begin{lineref}[ln:count:inline:remove]
+Line~\lnref{acq} write-acquires the lock and
+line~\lnref{rel} releases it.
+Line~\lnref{note} notes that the device is being removed, and the loop spanning
+lines~\lnref{loop:b}-\lnref{loop:e} wait for any I/O operations to complete.
+Finally, line~\lnref{remove} does any additional processing needed to prepare for
 device removal.
+\end{lineref}
 
 \QuickQuiz{}
 	What other issues would need to be accounted for in a real system?
-- 
2.7.4


