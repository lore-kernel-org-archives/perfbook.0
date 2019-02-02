Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6i7kbbXvXLqu2i0cOsl1T9L0x3Zgz/kEezo3Csw/LbY=;
        b=aMF4UiQNhT7crj8Tb3Gbb3KE0tQff84GL5OciECFwwCiDwYAKVSJfDaQf2g+TvP6UH
         Y+jr8RVghqNKQN7XwQ95XIWNFQErtI2n8D6tleiHXVCvr2VXvCPbesEV1V8jskovnv8n
         BkXfi28fNBzNSOfjvIMQMD8sJ1k9rM/J29HOn9+r0WZtaHpnc1MNzcgrD4diq2eszNiU
         7p3I0nA/TgIGn2rvYTGQCRAEFDmR9DYmtk+i0z3krKHh736/LVeUaKc3+zSGdMeX2WOf
         LkTBJIK4iemo+dc2GW702mekbFTt7zxuEtSJUubwE7zpzfKXqpUXXICbG9ulWSQPDEth
         fQMQ==
Subject: [PATCH 3/6] formal/spinhint: Update output lists of spin
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e990ac3c-c51f-c777-9c84-91617b66835f@gmail.com>
Date: Sun, 3 Feb 2019 00:11:21 +0900
MIME-Version: 1.0
In-Reply-To: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 986b559571721ae7c57a8d05c7b2da5b03c1ce21 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 31 Jan 2019 00:11:11 +0900
Subject: [PATCH 3/6] formal/spinhint: Update output lists of spin

Update the captures of output of Spin with those of Spin Version
6.4.8. *.spin.lst and *.spin.trail.lst files are placed under
CodeSamples/formal/promela/.
.spin.lst files are manually folded for 2c layout.

Also add dependency to those .lst files in the top-level Makefile.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../formal/promela/atomicincrement.spin.lst        |  28 +++++
 CodeSamples/formal/promela/increment.spin.lst      |  28 +++++
 .../formal/promela/increment.spin.trail.lst        |  42 +++++++
 CodeSamples/formal/promela/lock.spin.lst           |  29 +++++
 Makefile                                           |   4 +-
 formal/spinhint.tex                                | 127 ++-------------------
 6 files changed, 140 insertions(+), 118 deletions(-)
 create mode 100644 CodeSamples/formal/promela/atomicincrement.spin.lst
 create mode 100644 CodeSamples/formal/promela/increment.spin.lst
 create mode 100644 CodeSamples/formal/promela/increment.spin.trail.lst
 create mode 100644 CodeSamples/formal/promela/lock.spin.lst

diff --git a/CodeSamples/formal/promela/atomicincrement.spin.lst b/CodeSamples/formal/promela/atomicincrement.spin.lst
new file mode 100644
index 0000000..ab9150b
--- /dev/null
+++ b/CodeSamples/formal/promela/atomicincrement.spin.lst
@@ -0,0 +1,28 @@
+(Spin Version 6.4.8 -- 2 March 2018)
+        + Partial Order Reduction
+
+Full statespace search for:
+        never claim             - (none specified)
+        assertion violations    +
+        cycle checks            - (disabled by -DSAFETY)
+        invalid end states      +
+
+State-vector 48 byte, depth reached 22, errors: 0
+       52 states, stored
+       21 states, matched
+       73 transitions (= stored+matched)
+       68 atomic steps
+hash conflicts:         0 (resolved)
+
+Stats on memory usage (in Megabytes):
+    0.004       equivalent memory usage for states
+                (stored*(State-vector + overhead))
+    0.290       actual memory usage for states
+  128.000       memory used for hash table (-w24)
+    0.534       memory used for DFS stack (-m10000)
+  128.730       total actual memory usage
+
+unreached in proctype incrementer
+        (0 of 5 states)
+unreached in init
+        (0 of 24 states)
diff --git a/CodeSamples/formal/promela/increment.spin.lst b/CodeSamples/formal/promela/increment.spin.lst
new file mode 100644
index 0000000..2cab90f
--- /dev/null
+++ b/CodeSamples/formal/promela/increment.spin.lst
@@ -0,0 +1,28 @@
+pan:1: assertion violated
+        ((sum<2)||(counter==2)) (at depth 22)
+pan: wrote increment.spin.trail
+
+(Spin Version 6.4.8 -- 2 March 2018)
+Warning: Search not completed
+        + Partial Order Reduction
+
+Full statespace search for:
+        never claim             - (none specified)
+        assertion violations    +
+        cycle checks            - (disabled by -DSAFETY)
+        invalid end states      +
+
+State-vector 48 byte, depth reached 24, errors: 1
+       45 states, stored
+       13 states, matched
+       58 transitions (= stored+matched)
+       53 atomic steps
+hash conflicts:         0 (resolved)
+
+Stats on memory usage (in Megabytes):
+    0.003       equivalent memory usage for states
+                (stored*(State-vector + overhead))
+    0.290       actual memory usage for states
+  128.000       memory used for hash table (-w24)
+    0.534       memory used for DFS stack (-m10000)
+  128.730       total actual memory usage
diff --git a/CodeSamples/formal/promela/increment.spin.trail.lst b/CodeSamples/formal/promela/increment.spin.trail.lst
new file mode 100644
index 0000000..2416930
--- /dev/null
+++ b/CodeSamples/formal/promela/increment.spin.trail.lst
@@ -0,0 +1,42 @@
+using statement merging
+  1:    proc  0 (:init::1) increment.spin:21 (state 1)  [i = 0]
+  2:    proc  0 (:init::1) increment.spin:23 (state 2)  [((i<2))]
+  2:    proc  0 (:init::1) increment.spin:24 (state 3)  [progress[i] = 0]
+Starting incrementer with pid 1
+  3:    proc  0 (:init::1) increment.spin:25 (state 4)  [(run incrementer(i))]
+  4:    proc  0 (:init::1) increment.spin:26 (state 5)  [i = (i+1)]
+  5:    proc  0 (:init::1) increment.spin:23 (state 2)  [((i<2))]
+  5:    proc  0 (:init::1) increment.spin:24 (state 3)  [progress[i] = 0]
+Starting incrementer with pid 2
+  6:    proc  0 (:init::1) increment.spin:25 (state 4)  [(run incrementer(i))]
+  7:    proc  0 (:init::1) increment.spin:26 (state 5)  [i = (i+1)]
+  8:    proc  0 (:init::1) increment.spin:27 (state 6)  [((i>=2))]
+  9:    proc  0 (:init::1) increment.spin:22 (state 10) [break]
+ 10:    proc  2 (incrementer:1) increment.spin:11 (state 1)     [temp = counter]
+ 11:    proc  1 (incrementer:1) increment.spin:11 (state 1)     [temp = counter]
+ 12:    proc  2 (incrementer:1) increment.spin:12 (state 2)     [counter = (temp+1)]
+ 13:    proc  2 (incrementer:1) increment.spin:13 (state 3)     [progress[me] = 1]
+ 14: proc 2 terminates
+ 15:    proc  1 (incrementer:1) increment.spin:12 (state 2)     [counter = (temp+1)]
+ 16:    proc  1 (incrementer:1) increment.spin:13 (state 3)     [progress[me] = 1]
+ 17: proc 1 terminates
+ 18:    proc  0 (:init::1) increment.spin:31 (state 12) [i = 0]
+ 18:    proc  0 (:init::1) increment.spin:32 (state 13) [sum = 0]
+ 19:    proc  0 (:init::1) increment.spin:34 (state 14) [((i<2))]
+ 19:    proc  0 (:init::1) increment.spin:35 (state 15) [sum = (sum+progress[i])]
+ 19:    proc  0 (:init::1) increment.spin:36 (state 16) [i = (i+1)]
+ 20:    proc  0 (:init::1) increment.spin:34 (state 14) [((i<2))]
+ 20:    proc  0 (:init::1) increment.spin:35 (state 15) [sum = (sum+progress[i])]
+ 20:    proc  0 (:init::1) increment.spin:36 (state 16) [i = (i+1)]
+ 21:    proc  0 (:init::1) increment.spin:37 (state 17) [((i>=2))]
+ 22:    proc  0 (:init::1) increment.spin:33 (state 21) [break]
+spin: increment.spin:39, Error: assertion violated
+spin: text of failed assertion: assert(((sum<2)||(counter==2)))
+ 23:    proc  0 (:init::1) increment.spin:39 (state 22) [assert(((sum<2)||(counter==2)))]
+spin: trail ends after 23 steps
+#processes: 1
+                counter = 1
+                progress[0] = 1
+                progress[1] = 1
+ 23:    proc  0 (:init::1) increment.spin:41 (state 24) <valid end state>
+3 processes created
diff --git a/CodeSamples/formal/promela/lock.spin.lst b/CodeSamples/formal/promela/lock.spin.lst
new file mode 100644
index 0000000..c9e9efd
--- /dev/null
+++ b/CodeSamples/formal/promela/lock.spin.lst
@@ -0,0 +1,29 @@
+(Spin Version 6.4.8 -- 2 March 2018)
+        + Partial Order Reduction
+
+Full statespace search for:
+        never claim             - (none specified)
+        assertion violations    +
+        cycle checks            - (disabled by -DSAFETY)
+        invalid end states      +
+
+State-vector 52 byte, depth reached 360, errors: 0
+      576 states, stored
+      929 states, matched
+     1505 transitions (= stored+matched)
+      368 atomic steps
+hash conflicts:         0 (resolved)
+
+Stats on memory usage (in Megabytes):
+    0.044       equivalent memory usage for states
+                (stored*(State-vector + overhead))
+    0.288       actual memory usage for states
+  128.000       memory used for hash table (-w24)
+    0.534       memory used for DFS stack (-m10000)
+  128.730       total actual memory usage
+
+unreached in proctype locker
+        lock.spin:19, state 20, "-end-"
+        (1 of 20 states)
+unreached in init
+        (0 of 22 states)
diff --git a/Makefile b/Makefile
index 2ed7500..c15678b 100644
--- a/Makefile
+++ b/Makefile
@@ -11,6 +11,8 @@ LATEXSOURCES = \
 	*/*.tex \
 	*/*/*.tex
 
+LST_SOURCES := $(wildcard CodeSamples/formal/promela/*.lst)
+
 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
 
 ABBREVTARGETS := tcb 1c hb msns mss mstx msr msn msnt 1csf
@@ -123,7 +125,7 @@ $(PDFTARGETS): %.pdf: %.tex %.bbl
 $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 	bibtex $(basename $@)
 
-$(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES)
+$(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES) $(LST_SOURCES)
 	sh utilities/runfirstlatex.sh $(basename $@)
 
 autodate.tex: perfbook.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) utilities/fcvextract.pl
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 5ba9f04..4332f3e 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -130,32 +130,12 @@ cc -DSAFETY -o pan pan.c    # Compile the model
 ./pan                       # Run the model
 \end{VerbatimU}
 
-\begin{listing*}[tbp]
-\begin{VerbatimL}[numbers=none]
-pan: assertion violated ((sum<2)||(counter==2)) (at depth 20)
-pan: wrote increment.spin.trail
-(Spin Version 4.2.5 -- 2 April 2005)
-Warning: Search not completed
-        + Partial Order Reduction
-
-Full statespace search for:
-        never claim             - (none specified)
-        assertion violations    +
-        cycle checks            - (disabled by -DSAFETY)
-        invalid end states      +
-
-State-vector 40 byte, depth reached 22, errors: 1
-      45 states, stored
-      13 states, matched
-      58 transitions (= stored+matched)
-      51 atomic steps
-hash conflicts: 0 (resolved)
-
-2.622  memory usage (Mbyte)
-\end{VerbatimL}
+\begin{listing}[tbp]
+\VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/increment.spin.lst}
+\vspace*{-9pt}
 \caption{Non-Atomic Increment spin Output}
 \label{lst:analysis:Non-Atomic Increment spin Output}
-\end{listing*}
+\end{listing}
 
 This will produce output as shown in
 Listing~\ref{lst:analysis:Non-Atomic Increment spin Output}.
@@ -177,50 +157,8 @@ spin -t -p increment.spin
 \end{VerbatimU}
 
 \begin{listing*}[htbp]
-\begin{VerbatimL}[numbers=none]
-Starting :init: with pid 0
- 1: proc 0 (:init:) line 20 "increment.spin" (state 1) [i = 0]
- 2: proc 0 (:init:) line 22 "increment.spin" (state 2) [((i<2))]
- 2: proc 0 (:init:) line 23 "increment.spin" (state 3) [progress[i] = 0]
-Starting incrementer with pid 1
- 3: proc 0 (:init:) line 24 "increment.spin" (state 4) [(run incrementer(i))]
- 3: proc 0 (:init:) line 25 "increment.spin" (state 5) [i = (i+1)]
- 4: proc 0 (:init:) line 22 "increment.spin" (state 2) [((i<2))]
- 4: proc 0 (:init:) line 23 "increment.spin" (state 3) [progress[i] = 0]
-Starting incrementer with pid 2
- 5: proc 0 (:init:) line 24 "increment.spin" (state 4) [(run incrementer(i))]
- 5: proc 0 (:init:) line 25 "increment.spin" (state 5) [i = (i+1)]
- 6: proc 0 (:init:) line 26 "increment.spin" (state 6) [((i>=2))]
- 7: proc 0 (:init:) line 21 "increment.spin" (state 10) [break]
- 8: proc 2 (incrementer) line 10 "increment.spin" (state 1) [temp = counter]
- 9: proc 1 (incrementer) line 10 "increment.spin" (state 1) [temp = counter]
-10: proc 2 (incrementer) line 11 "increment.spin" (state 2) [counter = (temp+1)]
-11: proc 2 (incrementer) line 12 "increment.spin" (state 3) [progress[me] = 1]
-12: proc 2 terminates
-13: proc 1 (incrementer) line 11 "increment.spin" (state 2) [counter = (temp+1)]
-14: proc 1 (incrementer) line 12 "increment.spin" (state 3) [progress[me] = 1]
-15: proc 1 terminates
-16: proc 0 (:init:) line 30 "increment.spin" (state 12)	[i = 0]
-16: proc 0 (:init:) line 31 "increment.spin" (state 13)	[sum = 0]
-17: proc 0 (:init:) line 33 "increment.spin" (state 14)	[((i<2))]
-17: proc 0 (:init:) line 34 "increment.spin" (state 15)	[sum = (sum+progress[i])]
-17: proc 0 (:init:) line 35 "increment.spin" (state 16)	[i = (i+1)]
-18: proc 0 (:init:) line 33 "increment.spin" (state 14)	[((i<2))]
-18: proc 0 (:init:) line 34 "increment.spin" (state 15)	[sum = (sum+progress[i])]
-18: proc 0 (:init:) line 35 "increment.spin" (state 16)	[i = (i+1)]
-19: proc 0 (:init:) line 36 "increment.spin" (state 17)	[((i>=2))]
-20: proc 0 (:init:) line 32 "increment.spin" (state 21)	[break]
-spin: line  38 "increment.spin", Error: assertion violated
-spin: text of failed assertion: assert(((sum<2)||(counter==2)))
- 21:	proc  0 (:init:) line  38 "increment.spin" (state 22)	[assert(((sum<2)||(counter==2)))]
-spin: trail ends after 21 steps
-#processes: 1
-                counter = 1
-                progress[0] = 1
-                progress[1] = 1
-21: proc 0 (:init:) line 40 "increment.spin" (state 24) <valid end state>
-3 processes created
-\end{VerbatimL}
+\VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/increment.spin.trail.lst}
+\vspace*{-9pt}
 \caption{Non-Atomic Increment Error Trail}
 \label{lst:analysis:Non-Atomic Increment Error Trail}
 \end{listing*}
@@ -242,30 +180,8 @@ The assertion then triggered, after which the global state is displayed.
 \end{listing}
 
 \begin{listing}[htbp]
-\begin{VerbatimL}[numbers=none]
-(Spin Version 4.2.5 -- 2 April 2005)
-        + Partial Order Reduction
-
-Full statespace search for:
-        never claim             - (none specified)
-        assertion violations    +
-        cycle checks            - (disabled by -DSAFETY)
-        invalid end states      +
-
-State-vector 40 byte, depth reached 20, errors: 0
-      52 states, stored
-      21 states, matched
-      73 transitions (= stored+matched)
-      66 atomic steps
-hash conflicts: 0 (resolved)
-
-2.622   memory usage (Mbyte)
-
-unreached in proctype incrementer
-        (0 of 5 states)
-unreached in proctype :init:
-        (0 of 24 states)
-\end{VerbatimL}
+\VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/atomicincrement.spin.lst}
+\vspace*{-9pt}
 \caption{Atomic Increment spin Output}
 \label{lst:analysis:Atomic Increment spin Output}
 \end{listing}
@@ -616,31 +532,8 @@ cc -DSAFETY -o pan pan.c
 \end{VerbatimU}
 
 \begin{listing}[htbp]
-\begin{VerbatimL}[numbers=none]
-(Spin Version 4.2.5 -- 2 April 2005)
-        + Partial Order Reduction
-
-Full statespace search for:
-        never claim             - (none specified)
-        assertion violations    +
-        cycle checks            - (disabled by -DSAFETY)
-        invalid end states      +
-
-State-vector 40 byte, depth reached 357, errors: 0
-     564 states, stored
-     929 states, matched
-    1493 transitions (= stored+matched)
-     368 atomic steps
-hash conflicts: 0 (resolved)
-
-2.622   memory usage (Mbyte)
-
-unreached in proctype locker
-        line 18, state 20, "-end-"
-        (1 of 20 states)
-unreached in proctype :init:
-        (0 of 22 states)
-\end{VerbatimL}
+\VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/lock.spin.lst}
+\vspace*{-9pt}
 \caption{Output for Spinlock Test}
 \label{lst:analysis:Output for Spinlock Test}
 \end{listing}
-- 
2.7.4


