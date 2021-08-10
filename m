Return-Path: <SRS0=Si6l=NB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZqjbvHTjnDd8h4Rrn3EIFyJlMKt6KpHwdpQwB9JU5Pk=;
        b=uGuiWZg+bVC/LQLygYdBKmv3IMAz584tCeRYBlcS/dA0ZKm3sZpnZJ1HGe7GhokoGp
         f9abtOsKBmQGEHQ6F9ln4sWdbPC1K8lb2goL7vtwbJaIEeKb66JU+cCU/ZA+9UrYq89E
         36lCIdjncCqKqqwyo6cVjC5Nt4sBurxuQZ67CfSXoiEiOHt4K1P5oVSa77RTedJi+b29
         wTouw/KBAZP5PD5SWjud85oP72M8ArR3/6UE1E7eJUkS8Zxe6QJvV+qOf/R/mW1OOsxK
         b2gCpYjWQaQX5H20G/0vA8UmIQ647wOMPGTyVlLBpA5Ia/+8RfUdJW5TLSUrHH2hlg16
         +qyw==
Subject: [PATCH 1/7] debugging: Break and capitalize after colon
References: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ead7b08d-897d-e13c-bba4-28667aef763c@gmail.com>
Date: Tue, 10 Aug 2021 13:36:19 +0900
MIME-Version: 1.0
In-Reply-To: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 92 +++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 41 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 87e21135..10b3f801 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -108,8 +108,9 @@ of meeting.
 Perhaps the set of software assistants are now available on smartphones
 will fare better, but as of 2021 reviews are mixed.
 That said, the developers working on them by all accounts still develop
-the old way: The assistants might well benefit end users, but not so
-much their own developers.
+the old way:
+The assistants might well benefit end users, but not so much their own
+developers.
 
 This human love of fragmentary plans deserves more explanation,
 especially given that it is a classic two-edged sword.
@@ -118,7 +119,8 @@ the person carrying out the plan will have (1)~common sense and (2)~a good
 understanding of the intent and requirements driving the plan.
 This latter assumption is especially likely to hold in the common case
 where the person doing the planning and the person carrying out the plan
-are one and the same:  In this case, the plan will be revised almost
+are one and the same:
+In this case, the plan will be revised almost
 subconsciously as obstacles arise, especially when that person has the
 a good understanding of the problem at hand.
 In fact, the love of fragmentary plans has served human beings well,
@@ -149,8 +151,8 @@ to start a difficult but worthwhile project.\footnote{
 	There are some famous exceptions to this rule of thumb.
 	Some people take on difficult or risky projects in order to at
 	least a temporarily escape from their depression.
-	Others have nothing to lose: the project is literally a matter
-	of life or death.}
+	Others have nothing to lose:
+	The project is literally a matter of life or death.}
 
 \QuickQuiz{
 	When in computing is it necessary to follow a
@@ -308,9 +310,10 @@ validation is just job for you.
 	Of course, one way to economize on destructiveness is to
 	generate the tests with the to-be-tested source code at hand,
 	which is called white-box testing (as opposed to black-box testing).
-	However, this is no panacea: You will find that it is all too
-	easy to find your thinking limited by what the program can handle,
-	thus failing to generate truly destructive inputs.
+	However, this is no panacea:
+	You will find that it is all too easy to find your thinking
+	limited by what the program can handle, thus failing to generate
+	truly destructive inputs.
 }\QuickQuizEnd
 
 But perhaps you are a super-programmer whose code is always perfect
@@ -595,7 +598,8 @@ asking a few questions:
 \item	Exactly when are they going to look?
 \end{enumerate}
 
-I was lucky:  There was someone out there who wanted the functionality
+I was lucky:
+There was someone out there who wanted the functionality
 provided by my patch, who had long experience with distributed filesystems,
 and who looked at my patch almost immediately.
 If no one had looked at my patch, there would have been no review, and
@@ -619,8 +623,9 @@ Still others test maintainer trees, which often have a similar time delay.
 Quite a few people don't test code until it is committed to mainline,
 or the master source tree (Linus's tree in the case of the Linux kernel).
 If your maintainer won't accept your patch until it has been tested,
-this presents you with a deadlock situation: your patch won't be accepted
-until it is tested, but it won't be tested until it is accepted.
+this presents you with a deadlock situation:
+Your patch won't be accepted until it is tested, but it won't be tested
+until it is accepted.
 Nevertheless, people who test mainline code are still relatively
 aggressive, given that many people and organizations do not test code
 until it has been pulled into a Linux distro.
@@ -648,9 +653,9 @@ you already have a good test suite.
 When all else fails, add a \co{printk()}!
 Or a \co{printf()}, if you are working with user-mode C-language applications.
 
-The rationale is simple: If you cannot figure out how execution reached
-a given point in the code, sprinkle print statements earlier in the
-code to work out what happened.
+The rationale is simple:
+If you cannot figure out how execution reached a given point in the code,
+sprinkle print statements earlier in the code to work out what happened.
 You can get a similar effect, and with more convenience and flexibility,
 by using a debugger such as gdb (for user applications) or kgdb
 (for debugging Linux kernels).
@@ -692,9 +697,9 @@ what it knows is almost always way more than your head can hold.
 For this reason, high-quality test suites normally come with sophisticated
 scripts to analyze the voluminous output.
 But beware---scripts will only notice what you tell them to.
-My rcutorture scripts are a case in point: Early versions of those
-scripts were quite satisfied with a test run in which RCU grace periods
-stalled indefinitely.
+My rcutorture scripts are a case in point:
+Early versions of those scripts were quite satisfied with a test run
+in which RCU grace periods stalled indefinitely.
 This of course resulted in the scripts being modified to detect RCU
 grace-period stalls, but this does not change the fact that the scripts
 will only detect problems that I make them detect.
@@ -829,8 +834,8 @@ This section covers inspection, walkthroughs, and self-inspection.
 \label{sec:debugging:Inspection}
 
 Traditionally, formal code inspections take place in face-to-face meetings
-with formally defined roles: moderator, developer, and one or two other
-participants.
+with formally defined roles:
+Moderator, developer, and one or two other participants.
 The developer reads through the code, explaining what it is doing and
 why it works.
 The one or two other participants ask questions and raise issues,
@@ -865,15 +870,18 @@ by the author's invalid assumptions, and who might also test the code.
 	\begin{enumerate}
 	\item	Testing for a non-zero denominator will prevent
 		divide-by-zero errors.
-		(Hint: Suppose that the test uses 64-bit arithmetic
+		(Hint:
+		Suppose that the test uses 64-bit arithmetic
 		but that the division uses 32-bit arithmetic.)
 	\item	Userspace can be trusted to zero out versioned data
 		structures used to communicate with the kernel.
-		(Hint: Sometimes userspace has no idea how large the
+		(Hint:
+		Sometimes userspace has no idea how large the
 		data structure is.)
 	\item	Outdated TCP duplicate selective acknowledgement (D-SACK)
 		packets can be completely ignored.
-		(Hint: These packets might also contain other information.)
+		(Hint:
+		These packets might also contain other information.)
 	\item	All CPUs are little-endian.
 	\item	Once a data structure is no longer needed, all of its
 		memory may be immediately freed.
@@ -1100,9 +1108,9 @@ Here are some time-tested ways of accomplishing this:
 	the problem.
 \item	Make extremely disciplined use of parallel-programming
 	primitives, so that the resulting code is easily seen to be correct.
-	But beware: It is always tempting to break the rules
-	``just a little bit'' to gain better performance or
-	scalability.
+	But beware:
+	It is always tempting to break the rules ``just a little bit''
+	to gain better performance or scalability.
 	Breaking the rules often results in general breakage.
 	That is, unless you carefully do the paperwork described in this
 	section.
@@ -1163,7 +1171,8 @@ Congratulations!!!
 \begin{figure}
 \centering
 \resizebox{3in}{!}{\includegraphics{cartoons/r-2014-Passed-the-stress-test}}
-\caption{Passed on Merits?  Or Dumb Luck?}
+\caption{Passed on Merits?
+			   Or Dumb Luck?}
 \ContributedBy{Figure}{fig:cpu:Passed-the-stress-test}{Melissa Broussard}
 \end{figure}
 
@@ -1213,11 +1222,11 @@ is required to attain absolute certainty.
 	Of course, if your code is small enough, formal validation
 	may be helpful, as discussed in
 	\cref{chp:Formal Verification}.
-	But beware: formal validation of your code will not find
-	errors in your assumptions, misunderstanding of the
-	requirements, misunderstanding of the software or hardware
-	primitives you use, or errors that you did not think to construct
-	a proof for.
+	But beware:
+	Formal validation of your code will not find errors in your
+	assumptions, misunderstanding of the requirements,
+	misunderstanding of the software or hardware primitives you use,
+	or errors that you did not think to construct a proof for.
 }\QuickQuizEnd
 
 But suppose that we are willing to give up absolute certainty in favor
@@ -1646,7 +1655,7 @@ The next section discusses counter-intuitive ways of improving this situation.
 \label{sec:debugging:Hunting Heisenbugs}
 
 This line of thought also helps explain heisenbugs:
-adding tracing and assertions can easily reduce the probability
+Adding tracing and assertions can easily reduce the probability
 of a bug appearing, which
 is why extremely lightweight tracing and assertion mechanism are
 so critically important.
@@ -1768,8 +1777,8 @@ or removal of a given delay.
 	Shame on you!
 	This is but one reason why you are supposed to keep the commits small.
 
-	And that is your answer: Break up the commit into bite-sized
-	pieces and bisect the pieces.
+	And that is your answer:
+	Break up the commit into bite-sized pieces and bisect the pieces.
 	In my experience, the act of breaking up the commit is often
 	sufficient to make the bug painfully obvious.
 }\QuickQuizEnd
@@ -1828,7 +1837,7 @@ If the program is structured such that it is difficult or impossible
 to apply much stress to a subsystem that is under suspicion,
 a useful anti-heisenbug is a stress test that tests that subsystem in
 isolation.
-The Linux kernel's rcutorture module takes exactly this approach with RCU:
+The Linux kernel's rcutorture module takes exactly this approach with RCU\@:
 Applying more stress to RCU than is feasible in a production environment
 increases the probability that RCU bugs will be found during testing
 rather than in production.\footnote{
@@ -2326,8 +2335,8 @@ the POSIX \co{sched_setscheduler()} system call.
 However, note that if you do this, you are implicitly taking on
 responsibility for avoiding infinite loops, because otherwise
 your test can prevent part of the kernel from functioning.
-This is an example of the Spiderman Principle: ``With great
-power comes great responsibility.''
+This is an example of the Spiderman Principle:
+``With great power comes great responsibility.''
 And although the default real-time throttling settings often address
 such problems, they might do so by causing your real-time threads
 to miss their deadlines.
@@ -2485,9 +2494,9 @@ larger measurements suggests that sorting the measurements in increasing
 order is likely to be productive.\footnote{
 	To paraphrase the old saying, ``Sort first and ask questions later.''}
 The fact that the measurement uncertainty is known allows us to accept
-measurements within this uncertainty of each other:  If the effects of
-interference are large compared to this uncertainty, this will ease
-rejection of bad data.
+measurements within this uncertainty of each other:
+If the effects of interference are large compared to this uncertainty,
+this will ease rejection of bad data.
 Finally, the fact that some fraction (for example, one third) can be
 assumed to be good allows us to blindly accept the first portion of the
 sorted list, and this data can then be used to gain an estimate of the
@@ -2591,7 +2600,8 @@ If \clnref{chk_max} determines that the candidate data value would exceed the
 lower bound on the upper bound (\co{maxdelta}) \emph{and}
 that the difference between the candidate data value
 and its predecessor exceeds the trend-break difference (\co{maxdiff}),
-then \clnref{break} exits the loop: We have the full good set of data.
+then \clnref{break} exits the loop:
+We have the full good set of data.
 
 \Clnrefrange{comp_stat:b}{comp_stat:e} then compute and print
 statistics.
-- 
2.17.1


