Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=24mTsOtaGhMYVVRkN+1bhKDotM1+StFri4h5mAtbj30=;
 b=dW4v46bYedtlz9IJmQtteb2j8FMMJBACh13bBD+Dqw58kXlA6Ic4n0EVm84SinY0+M
 2zJPfXoZj85TV2QDW3Wn0QMQS65HCDWGVBTbwI1jFj8wWKQzBMpu9HUE6VM2YYn/84Lw
 5FVKPco/A/2fFGY6fm+UtgCWRVIZ/p9CA2h9lqhQMeLyqXi6w3hgGxDJTIVFsZZ2m0uy
 gOALxqKtHiuvWm10/2z4YLv5MjCEYYf2mhmgelayguMPtqdbczUGQvp1OLWdy+HB9Ydd
 xnFfqjuW+bGGJUQ5CC8Z+z4fwlGIJZbv2+jVX5vpOBspmR0a39TNvVkQAUD6fWFAa9Cd
 WvYw==
Subject: [PATCH 1/5] treewide: Add narrow spaces before SI unit symbols
References: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9bcc2080-be6a-7e60-121e-59b8d7286b5d@gmail.com>
Date: Sun, 25 Jun 2017 09:02:47 +0900
MIME-Version: 1.0
In-Reply-To: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 16e6eb35f4f9a4b04fc252c4b805c7d892d917b4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Jun 2017 19:33:31 +0900
Subject: [PATCH 1/5] treewide: Add narrow spaces before SI unit symbols

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex      |  2 +-
 SMPdesign/beyond.tex         |  4 ++--
 advsync/memorybarriers.tex   | 14 +++++++-------
 appendix/questions/after.tex |  2 +-
 appendix/toyrcu/toyrcu.tex   |  2 +-
 count/count.tex              |  2 +-
 cpu/hwfreelunch.tex          |  4 ++--
 cpu/overheads.tex            |  8 ++++----
 cpu/swdesign.tex             |  2 +-
 datastruct/datastruct.tex    |  2 +-
 debugging/debugging.tex      |  2 +-
 defer/rcuusage.tex           |  4 ++--
 defer/refcnt.tex             |  2 +-
 glossary.tex                 |  2 +-
 intro/intro.tex              |  4 ++--
 rt/rt.tex                    |  4 ++--
 16 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index aa40139..842341f 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1158,7 +1158,7 @@ Rough performance results\footnote{
 	match more careful evaluations of similar algorithms.}
 are shown in
 Figure~\ref{fig:SMPdesign:Allocator Cache Performance},
-running on a dual-core Intel x86 running at 1GHz (4300 bogomips per CPU)
+running on a dual-core Intel x86 running at 1\,GHz (4300 bogomips per CPU)
 with at most six blocks allowed in each CPU's cache.
 In this micro-benchmark,
 each thread repeatedly allocates a group of blocks and then frees all
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index ee1a27d..7ba351e 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -196,7 +196,7 @@ attempts to record cells in the \co{->visited[]} array.

 This approach does provide significant speedups on a dual-CPU
 Lenovo\textsuperscript\texttrademark W500
-running at 2.53GHz, as shown in
+running at 2.53\,GHz, as shown in
 Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ and PWQ},
 which shows the cumulative distribution functions (CDFs) for the solution
 times of the two algorithms, based on the solution of 500 different square
@@ -576,7 +576,7 @@ This disappointing performance compared to results in
 Figure~\ref{fig:SMPdesign:Varying Maze Size vs. COPART}
 is due to the less-tightly integrated hardware available in the
 larger and older Xeon\textsuperscript\textregistered
-system running at 2.66GHz.
+system running at 2.66\,GHz.

 \subsection{Future Directions and Conclusions}
 \label{sec:SMPdesign:Future Directions and Conclusions}
diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 5e39ec5..e9e9de1 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -226,7 +226,7 @@ This line of reasoning, intuitively obvious though it may be, is completely
 and utterly incorrect.
 Please note that this is \emph{not} a theoretical assertion:
 actually running this code on real-world weakly-ordered hardware
-(a 1.5GHz 16-CPU POWER 5 system) resulted in the assertion firing
+(a 1.5\,GHz 16-CPU POWER 5 system) resulted in the assertion firing
 16~times out of 10~million runs.
 Clearly, anyone who produces code with explicit memory barriers
 should do some extreme testing---although a proof of correctness might
@@ -333,10 +333,10 @@ if the shared variable had changed before entry into the loop.
 This allows us to plot each CPU's view of the value of \co{state.variable}
 over a 532-nanosecond time period, as shown in
 Figure~\ref{fig:advsync:A Variable With Multiple Simultaneous Values}.
-This data was collected in 2006 on 1.5GHz POWER5 system with 8 cores,
+This data was collected in 2006 on 1.5\,GHz POWER5 system with 8 cores,
 each containing a pair of hardware threads.
 CPUs~1, 2, 3, and~4 recorded the values, while CPU~0 controlled the test.
-The timebase counter period was about 5.32ns, sufficiently fine-grained
+The timebase counter period was about 5.32\,ns, sufficiently fine-grained
 to allow observations of intermediate cache states.

 \begin{figure}[htb]
@@ -349,13 +349,13 @@ to allow observations of intermediate cache states.
 Each horizontal bar represents the observations of a given CPU over time,
 with the black regions to the left indicating the time before the
 corresponding CPU's first measurement.
-During the first 5ns, only CPU~3 has an opinion about the value of the
+During the first 5\,ns, only CPU~3 has an opinion about the value of the
 variable.
-During the next 10ns, CPUs~2 and~3 disagree on the value of the variable,
+During the next 10\,ns, CPUs~2 and~3 disagree on the value of the variable,
 but thereafter agree that the value is~``2'', which is in fact
 the final agreed-upon value.
-However, CPU~1 believes that the value is~``1'' for almost 300ns, and
-CPU~4 believes that the value is~``4'' for almost 500ns.
+However, CPU~1 believes that the value is~``1'' for almost 300\,ns, and
+CPU~4 believes that the value is~``4'' for almost 500\,ns.

 \QuickQuiz{}
 	How could CPUs possibly have different views of the
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index e648667..9944bcf 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -127,7 +127,7 @@ e.g., where time has appeared to go backwards.
 One might intuitively expect that the difference between the producer
 and consumer timestamps would be quite small, as it should not take
 much time for the producer to record the timestamps or the values.
-An excerpt of some sample output on a dual-core 1GHz x86 is shown in
+An excerpt of some sample output on a dual-core 1\,GHz x86 is shown in
 Table~\ref{tab:app:questions:After Program Sample Output}.
 Here, the ``seq'' column is the number of times through the loop,
 the ``time'' column is the time of the anomaly in seconds, the ``delta''
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 3f19662..db45fad 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1871,7 +1871,7 @@ a 64-CPU system.

 \QuickQuiz{}
 	To be sure, the clock frequencies of Power
-	systems in 2008 were quite high, but even a 5GHz clock
+	systems in 2008 were quite high, but even a 5\,GHz clock
 	frequency is insufficient to allow
 	loops to be executed in 50~picoseconds!
 	What is going on here?
diff --git a/count/count.tex b/count/count.tex
index 1b5b030..f1645ee 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -3417,7 +3417,7 @@ courtesy of eventual consistency.
 Figure~\ref{tab:count:Limit Counter Performance on Power-6}
 shows the performance of the parallel limit-counting algorithms.
 Exact enforcement of the limits incurs a substantial performance
-penalty, although on this 4.7GHz Power-6 system that penalty can be reduced
+penalty, although on this 4.7\,GHz Power-6 system that penalty can be reduced
 by substituting signals for atomic operations.
 All of these implementations suffer from read-side lock contention
 in the face of concurrent readers.
diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
index 3ad4b5f..b449ba2 100644
--- a/cpu/hwfreelunch.tex
+++ b/cpu/hwfreelunch.tex
@@ -22,8 +22,8 @@ As noted in
 Figure~\ref{fig:cpu:System Hardware Architecture} on
 page~\pageref{fig:cpu:System Hardware Architecture},
 light can travel only about an 8-centimeters round trip
-in a vacuum during the duration of a 1.8 GHz clock period.
-This distance drops to about 3 centimeters for a 5 GHz clock.
+in a vacuum during the duration of a 1.8\,GHz clock period.
+This distance drops to about 3~centimeters for a 5\,GHz clock.
 Both of these distances are relatively small compared to the size
 of a modern computer system.

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 5af4fdf..16b2b30 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -149,14 +149,14 @@ optimization.
 						& 325,000,000\textcolor{white}{.0} \\
 								\\
 \end{tabular}
-\caption{Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
+\caption{Performance of Synchronization Mechanisms on 4-CPU 1.8\,GHz AMD Opteron 844 System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
 \end{table}

 The overheads of some common operations important to parallel programs are
 displayed in
 Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}.
-This system's clock period rounds to 0.6ns.
+This system's clock period rounds to 0.6\,ns.
 Although it is not unusual for modern microprocessors to be able to
 retire multiple instructions per clock period, the operations's costs are
 nevertheless normalized to a clock period in the third column, labeled
@@ -246,7 +246,7 @@ global agreement.
 	Global Comms		& 195,000,000\textcolor{white}{.0}
 						& 542,000,000\textcolor{white}{.0} \\
 \end{tabular}
-\caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
+\caption{Performance of Synchronization Mechanisms on 16-CPU 2.8\,GHz Intel X5550 (Nehalem) System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
 \end{table}

@@ -254,7 +254,7 @@ global agreement.
 	miniaturization, which in turn limits frequency.
 	And even this sidesteps the power-consumption issue that
 	is currently holding production frequencies to well below
-	10 GHz.
+	10\,GHz.

 	Nevertheless, some progress is being made, as may be seen
 	by comparing
diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
index 05de1f0..0b8a3a2 100644
--- a/cpu/swdesign.tex
+++ b/cpu/swdesign.tex
@@ -14,7 +14,7 @@ These CAS operations will typically involve a cache miss, that is, assuming
 that the threads are communicating primarily with each other rather than
 with themselves.
 Suppose further that the unit of work corresponding to each CAS communication
-operation takes 300ns, which is sufficient time to compute several
+operation takes 300\,ns, which is sufficient time to compute several
 floating-point transcendental functions.
 Then about half of the execution time will be consumed by the CAS
 communication operations!
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 96ebd4c..fad7668 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -393,7 +393,7 @@ The \co{hashtab_free()} function on lines~20-23 is straightforward.
 \label{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo}
 \end{figure}

-The performance results for an eight-CPU 2GHz
+The performance results for an eight-CPU 2\,GHz
 Intel\textsuperscript\textregistered
 Xeon\textsuperscript\textregistered
 system using a bucket-locked hash table with 1024 buckets are shown in
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index c41057f..0199720 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -529,7 +529,7 @@ of failure.

 These brute-force testing tools are all valuable, especially now
 that typical systems have more than 64K of memory and CPUs running
-faster than 4MHz.
+faster than 4\,MHz.
 Much has been
 written about these tools, so this chapter will add little more.

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 9a90a14..af4faff 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -271,7 +271,7 @@ Figure~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}.
 \QuickQuiz{}
 	WTF?
 	How the heck do you expect me to believe that RCU has a
-	100-femtosecond overhead when the clock period at 3GHz is more than
+	100-femtosecond overhead when the clock period at 3\,GHz is more than
 	300 \emph{picoseconds}?
 \QuickQuizAnswer{
 	First, consider that the inner loop used to
@@ -767,7 +767,7 @@ Section~\ref{sec:together:Refurbish Reference Counting}.
 But why bother?
 Again, part of the answer is performance, as shown in
 Figure~\ref{fig:defer:Performance of RCU vs. Reference Counting},
-again showing data taken on a 16-CPU 3GHz Intel x86 system.
+again showing data taken on a 16-CPU 3\,GHz Intel x86 system.

 \QuickQuiz{}
 	Why the dip in refcnt overhead near 6 CPUs?
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index c231961..942f529 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -201,7 +201,7 @@ the reference count is zero.
 Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by Reference Counting}
 shows the performance and scalability of reference counting on a
 read-only workload with a ten-element list running on a
-single-socket four-core hyperthreaded 2.5GHz x86 system.
+single-socket four-core hyperthreaded 2.5\,GHz x86 system.
 The ``ideal'' trace was generated by running the sequential code shown in
 Figure~\ref{fig:defer:Sequential Pre-BSD Routing Table},
 which works only because this is a read-only workload.
diff --git a/glossary.tex b/glossary.tex
index 8fdd9af..9635ffa 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -391,7 +391,7 @@
 	For example, if the conditions were exactly right,
 	the Intel Pentium Pro CPU from the mid-1990s could
 	execute two (and sometimes three) instructions per clock cycle.
-	Thus, a 200MHz Pentium Pro CPU could ``retire'', or complete the
+	Thus, a 200\,MHz Pentium Pro CPU could ``retire'', or complete the
 	execution of, up to 400 million instructions per second.
 \item[Teachable:]
 	A topic, concept, method, or mechanism that the teacher understands
diff --git a/intro/intro.tex b/intro/intro.tex
index 0b8659e..bf512f6 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -421,8 +421,8 @@ One such machine was the CSIRAC, the oldest still-intact stored-program
 computer, which was put into operation in
 1949~\cite{CSIRACMuseumVictoria,CSIRACUniversityMelbourne}.
 Because this machine was built before the transistor era, it was constructed
-of 2,000 vacuum tubes, ran with a clock frequency of 1kHz,
-consumed 30kW of power, and weighed more than three metric tons.
+of 2,000 vacuum tubes, ran with a clock frequency of 1\,kHz,
+consumed 30\,kW of power, and weighed more than three metric tons.
 Given that this machine had but 768 words of RAM, it is safe to say that
 it did not suffer from the productivity issues that often plague
 today's large-scale software projects.
diff --git a/rt/rt.tex b/rt/rt.tex
index 00ced4c..2f5d4fe 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -899,14 +899,14 @@ levels.
 \begin{figure}[tb]
 \centering
 \resizebox{3.0in}{!}{\includegraphics{cartoons/1kHz}}
-\caption{Timer Wheel at 1kHz}
+\caption{Timer Wheel at 1\,kHz}
 \ContributedBy{Figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
 \end{figure}

 \begin{figure}[tb]
 \centering
 \resizebox{3.0in}{!}{\includegraphics{cartoons/100kHz}}
-\caption{Timer Wheel at 100kHz}
+\caption{Timer Wheel at 100\,kHz}
 \ContributedBy{Figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
 \end{figure}

-- 
2.7.4


