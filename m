Return-Path: <SRS0=Uwbt=SY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Jt1oeHsi6tvr3jjio02sNpGeK3TOrX5tQR/NQeK2Nqk=;
        b=VRgxxjoy8HMbKw7+USGLlyOv3NbKpXVu24fo1h0/03mvc2wCT6APq/f0nbYA84blDL
         7SL8Xj8xpGu0n5WhlfMWconlwjI28Yxia/lTedmiWAZO9MtccDw6UhpZ//FqC2PFryx4
         ydkjqwByGf/3792nLgeyMe0CewXF+24NwjRJ4ND7uaUaaVlPjT/OHq5wyabbbMwOdEOJ
         5wun59s1QIXJSphZQPYEKICjcDBfxPi53txDAdxyQgTV0sYCUcD2UzkrGVon+881Ji1u
         9yK6G2uk4VhKpNXqh5syvAj38Oz+7R/PtWMstFJBmvAMcAv/cRbP+vnJ5b7XhUf5eMCL
         wWUw==
Message-ID: <bae71121-9ade-7836-ef5d-a13608921c76@gmail.com>
Date: Thu, 10 Feb 2022 00:08:30 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/3] defer, together: Group consecutive QQzs
Content-Language: en-US
References: <b9607a1e-7ab2-62fb-578e-d9dec3547905@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b9607a1e-7ab2-62fb-578e-d9dec3547905@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

These consecutive pairs of plain QQzs should be grouped by the
\QuickQuizSeries{ ... } construct.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex   | 14 ++++++++------
 together/seqlock.tex | 14 ++++++++------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 2fb517c2..7a624e4c 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -506,13 +506,14 @@ run concurrently with \co{do_maint()} to complete, and finally
 \clnref{toquick} sets the \co{be_careful} flag back to \co{false}.
 \end{fcvref}
 
-\QuickQuiz{
+\QuickQuizSeries{%
+\QuickQuizB{
 	What is the point of the second call to \co{synchronize_rcu()}
 	in function
 	\co{maint()} in \cref{lst:defer:Phased State Change for Maintenance Operations}?
 	Isn't it OK for any \co{cco()} invocations in the clean-up
 	phase to invoke either \co{cco_carefully()} or \co{cco_quickly()}?
-}\QuickQuizAnswer{
+}\QuickQuizAnswerB{
 	The problem is that there is no ordering between the \co{cco()}
 	function's load from \co{be_careful} and any memory loads
 	executed by the \co{cco_quickly()} function.
@@ -525,13 +526,13 @@ run concurrently with \co{do_maint()} to complete, and finally
 	\co{READ_ONCE()} to \co{smp_load_acquire()} and the
 	\co{WRITE_ONCE()} to \co{smp_store_release()}, thus restoring
 	the needed ordering.
-}\QuickQuizEnd
+}\QuickQuizEndB
 
-\QuickQuiz{
+\QuickQuizE{
 	How can you be sure that the code shown in
 	\co{maint()} in \cref{lst:defer:Phased State Change for Maintenance Operations}
 	really works?\@
-}\QuickQuizAnswer{
+}\QuickQuizAnswerE{
 	By one popular school of thought, you cannot.
 
 	But in this case, those willing to jump ahead to
@@ -543,7 +544,8 @@ run concurrently with \co{do_maint()} to complete, and finally
 	\path{C-RCU-phased-state-change-2.litmus}).
 	These tests could be argued to demonstrate that this code
 	and a variant of it really do work.
-}\QuickQuizEnd
+}\QuickQuizEndE
+}% End of \QuickQuizSeries
 
 Phased state change allows frequent operations to use light-weight
 checks, without the need for expensive lock acquisitions or atomic
diff --git a/together/seqlock.tex b/together/seqlock.tex
index b8acbe3d..42eb8faa 100644
--- a/together/seqlock.tex
+++ b/together/seqlock.tex
@@ -221,11 +221,12 @@ Any reader succeeding in looking up the new name is guaranteed that
 any subsequent lookup of the old name will fail, perhaps after a series
 of retries.
 
-\QuickQuiz{
+\QuickQuizSeries{%
+\QuickQuizB{
 	Is it possible to write-acquire the sequence lock on
 	the new element before it is inserted instead of acquiring
 	that of the old element before it is removed?
-}\QuickQuizAnswer{
+}\QuickQuizAnswerB{
 	Yes, and the details are left as an exercise to the reader.
 
 	The term \emph{tombstone} is sometimes used to refer to the
@@ -233,11 +234,11 @@ of retries.
 	Similarly, the term \emph{birthstone} is sometimes used to refer
 	to the element with the new name while its sequence lock is
 	still held.
-}\QuickQuizEnd
+}\QuickQuizEndB
 
-\QuickQuiz{
+\QuickQuizE{
 	Is it possible to avoid the global lock?
-}\QuickQuizAnswer{
+}\QuickQuizAnswerE{
 	Yes, and one way to do this would be to use per-hash-chain locks.
 	The updater could acquire lock(s) corresponding to both the old
 	and the new element, acquiring them in address order.
@@ -247,7 +248,8 @@ of retries.
 	This complexity can be worthwhile if rename operations are
 	frequent, and of course can allow rename operations to execute
 	concurrently.
-}\QuickQuizEnd
+}\QuickQuizEndE
+}% End of \QuickQuizSeries
 
 It is of course possible to instead implement this procedure somewhat
 more efficiently using simple flags.
-- 
2.17.1


