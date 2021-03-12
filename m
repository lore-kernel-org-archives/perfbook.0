Return-Path: <SRS0=E7ue=IK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=8cTX43obQoG0j3rsje6iEEKs1OvlxpUIMkjxIiy5UjM=;
        b=NZQ12umweTMDVyElP4idBQgKiey/2+9n85OY1wunU7nN9pT/mfNJVd/F1qijb4FrIi
         QXa4mnvq5hNZKkYpd5kwLQMfQ+GTGNTcsBfjYevykfX90zfdS8ymJNLcHbWhciFiBT9t
         Q2dQrtCyWblEr/WcWAC9IpHi2KhNPVhn15RPEbrUh3xB4UgkrQXNIT9zhd43H3RIya7d
         bd4vrcYkc5Xj5Q9A9fXveS2QpflPcO/XSQ2fOVRx0WINkrUA14Taf3F+WwgVg+6hoO15
         tzozZAtm2ZxXAs1KOZP2x2lzal0r7YyPYQgwt9faOiIsOXoyoD8htsLtx6hFtEo8ixob
         K5vQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] summary: Misc. fixes/tweaks
Message-ID: <3433dd91-c602-528f-7297-ed04609df447@gmail.com>
Date: Sat, 13 Mar 2021 00:44:58 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

o Consistently use past tense in the recap of chapters.
o Use 'nbsp' to avoid line break after "I" in 2c builds.
o Fix staccato of "next next".
o In 1c builds, use float option of "H" to avoid a final page
with a lonely cartoon of frightened Tux.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 summary.tex | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/summary.tex b/summary.tex
index 16320e34..8ca5a635 100644
--- a/summary.tex
+++ b/summary.tex
@@ -9,7 +9,7 @@
 	  {\emph{Konrad Adenauer}}
 
 You have arrived at the end of this book, well done!
-I hope that your journey was a pleasant but challenging and worthwhile
+I~hope that your journey was a pleasant but challenging and worthwhile
 one.
 
 For your editor and contributors, this is the end of the journey to the
@@ -81,13 +81,13 @@ Whichever side of the formal-verification/\-testing divide you might
 be on, if code has not been thoroughly validated, it does not work.
 And that goes at least double for concurrent code.
 
-\Cref{chp:Putting It All Together} presents a number of situations
+\Cref{chp:Putting It All Together} presented a number of situations
 where combining concurrency mechanisms with each other or with other
 design tricks can greatly ease parallel programmers' lives.
-\Cref{sec:advsync:Advanced Synchronization} looks at advanced
+\Cref{sec:advsync:Advanced Synchronization} looked at advanced
 synchronization methods, including lockless programming, non-blocking
 synchronization, and parallel real-time computing.
-\Cref{chp:Advanced Synchronization: Memory Ordering} digs into the
+\Cref{chp:Advanced Synchronization: Memory Ordering} dug into the
 critically important topic of memory ordering, presenting techniques
 and tools to help you not only solve memory-ordering problems, but
 also to avoid them completely.
@@ -146,7 +146,7 @@ parallel-programming experts.
 Paul began his question by noting that in the 15~years from 1991 to 2006,
 the price of a parallel system had dropped from that of a house to that
 of a mid-range bicycle, and it was clear that there was much more room
-for additional dramatic price decreases over the next next 15~years
+for additional dramatic price decreases over the next 15~years
 extending to the year 2021.
 He also noted that decreasing price should result in greater familiarity
 and faster progress in solving parallel-programming problems.
@@ -210,12 +210,21 @@ if in fact he ever knew it.
 
 This book is nevertheless for that man.
 
-\begin{figure}[tb]
+\IfTwoColumn{
+\begin{figure}
 \centering
 \resizebox{3in}{!}{\includegraphics{cartoons/UseTheRightToolsBubble}}
 \caption{The Most Important Lesson}
 \ContributedBy{Figure}{fig:summary:The Most Important Lesson}{Melissa Broussard}
 \end{figure}
+}{
+\begin{figure}[H]
+\centering
+\resizebox{3in}{!}{\includegraphics{cartoons/UseTheRightToolsBubble}}
+\caption{The Most Important Lesson}
+\ContributedBy{Figure}{fig:summary:The Most Important Lesson}{Melissa Broussard}
+\end{figure}
+}
 
 And this book is also for everyone else who would like to add low-level
 concurrency to their skillset.
-- 
2.17.1

