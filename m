Return-Path: <SRS0=wHCD=7N=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I4uEzHtw835Dz4jGo7nq+P24oqPvi3PQfZFOvK29jaM=;
        b=T3fHjQwNr8UhoqznjC9WY7JtUpbdptHjf6QmO/hsQD4wucrq7I3v/kO4r5BMX4vpgu
         aQ6aECL/WY76XfV855Z1wilSEDWu/6y4lHy4jxHzyssYczyPYJhniarYjxm0Vh7LFkOm
         GtkJSZf2/V3k4U3jwHGBBU5a7O+OtvHIiJDlbNY9qwhQHC7FpRUzBhyl3K7aIwag7Gie
         369K0vl9wLWxo2wee0i1Gp5U5zwkiK6lYIcZJUXnFhD9y3pXz82GW1l+SZhfH4UQhKrg
         7wocnNTyKwRK5YNJmfUOP8hd8UlDC+xEjK+MA6JNbJbRLo+r+JtkThoE1lTyGxHjxvKl
         oYvw==
Subject: [PATCH 1/3] defer: Annotate consecutive QQZs as such for 'nq' build
References: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c420be56-61b9-04c4-cae8-3242833da973@gmail.com>
Date: Sun, 31 May 2020 09:32:00 +0900
MIME-Version: 1.0
In-Reply-To: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ff1d191e40f23f5a0200ee3bbabe2073a6c03394 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 31 May 2020 08:12:02 +0900
Subject: [PATCH 1/3] defer: Annotate consecutive QQZs as such for 'nq' build

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index d5329a39..72c1f331 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -241,12 +241,13 @@ reader-writer locking are shown in
 Figure~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking},
 which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
 
-\QuickQuiz{
+\QuickQuizSeries{%
+\QuickQuizB{
 	WTF?
 	How the heck do you expect me to believe that RCU can have less
 	than a 300-picosecond overhead when the clock period at 2.10\,GHz
 	is almost 500\,picoseconds?
-}\QuickQuizAnswer{
+}\QuickQuizAnswerB{
 	First, consider that the inner loop used to
 	take this measurement is as follows:
 
@@ -290,13 +291,13 @@ which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
 
 	It certainly is not just every day that a timing measurement
 	of 267 picoseconds turns out to be an overestimate!
-}\QuickQuizEnd
+}\QuickQuizEndB
 
-\QuickQuiz{
+\QuickQuizM{
 	Didn't an earlier release of this book show RCU read-side
 	overhead way down in the sub-picosecond range?
 	What happened???
-}\QuickQuizAnswer{
+}\QuickQuizAnswerM{
 	Excellent memory!!!
 	The overhead in some early releases was in fact roughly
 	100~femtoseconds.
@@ -328,12 +329,12 @@ which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
 	So which change had the most effect, Linus's commit or the change in
 	the system?
 	This question is left as an exercise to the reader.
-}\QuickQuizEnd
+}\QuickQuizEndM
 
-\QuickQuiz{
+\QuickQuizE{
 	Why is there such large variation for the \co{rcu} trace in
 	Figure~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}?
-}\QuickQuizAnswer{
+}\QuickQuizAnswerE{
 	Keep in mind that this is a log-log plot, so those large-seeming
 	\co{rcu} variances in reality span only a few hundred picoseconds.
 	And that is such a short time that anything could cause it.
@@ -347,7 +348,8 @@ which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
 	Attempting to reduce these variations by running the guest OSes
 	at real-time priority (as suggested by Joel Fernandes) is left
 	as an exercise for the reader.
-}\QuickQuizEnd
+}\QuickQuizEndE
+}                 % End of \QuickQuizSeries
 
 Note that reader-writer locking is more than an order of magnitude slower
 than RCU on a single CPU, and is more than \emph{four} orders of magnitude
-- 
2.17.1


