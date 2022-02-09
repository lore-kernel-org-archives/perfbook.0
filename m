Return-Path: <SRS0=Uwbt=SY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=lgULMwvoiXftWJORiignzRgHY+G/1EM+EBqL0Uc4WLg=;
        b=kybfee/8Zq6XPjVTUN+A4Zb3fHgnsW5nPzzpcwIVkTmH5OxPNUHw0KvOa1NIr5PMzw
         6Xt6HVg7kbjqVjx8Ee3sUSI7khJGTgjAiiBf8YLOvNXK+WOkU1IYehvjwvmiwU4po8zF
         wuP+wA7udgk4xlgIFf78v0qEEUNCFMtppH/Fl3/QOn8ZMK2+V/jXtkhZwu1lSb7MrOOT
         H2DrxtM7yZ1ol7FMT9agLnfbA+i1qCpRz548qguMb5RZXTseR7iq4dCTVl/gZA0oDunc
         GzHBeHuicA8v9v55zbNybWFNXCIQkG4Qnkxo5sYdnd+5W2DMD7pOkOO9s0fORrgZn2Sp
         cvNQ==
Message-ID: <b9607a1e-7ab2-62fb-578e-d9dec3547905@gmail.com>
Date: Thu, 10 Feb 2022 00:06:58 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/3] intro, together: Promote section-opening QQzs
 to 'essential'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In "nq" builds, section-opening QQzs can result in headings which
look like "widow" ones accompanied by small boxes of "QQ x.x".

When you start a section by a QQz, it is likely an essential one
and would better be presented even in "nq" builds.

Promote such two QQzs to "essential" ones.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 intro/intro.tex       | 6 +++---
 together/applyrcu.tex | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index 635173e1..e39ea652 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -416,12 +416,12 @@ sequential case when analyzing the performance of parallel algorithms.
 \subsection{Productivity}
 \label{sec:intro:Productivity}
 
-\QuickQuiz{
+\EQuickQuiz{
 	Why all this prattling on about non-technical issues???
 	And not just \emph{any} non-technical issue, but \emph{productivity}
 	of all things?
 	Who cares?
-}\QuickQuizAnswer{
+}\EQuickQuizAnswer{
 	If you are a pure hobbyist, perhaps you don't need to care.
 	But even pure hobbyists will often care about how much they
 	can get done, and how quickly.
@@ -435,7 +435,7 @@ sequential case when analyzing the performance of parallel algorithms.
 
 	Besides, if you \emph{really} didn't care about productivity,
 	you would be doing it by hand rather than using a computer!
-}\QuickQuizEnd
+}\EQuickQuizEnd
 
 \IX{Productivity} has been becoming increasingly important in recent decades.
 To see this, consider that the price of early computers was tens
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index e3a0d2fe..9aef3879 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -196,13 +196,13 @@ references.
 
 \subsubsection{Discussion}
 
-\QuickQuiz{
+\EQuickQuiz{
 	Wow!
 	\Cref{lst:together:RCU and Per-Thread Statistical Counters}
 	contains 70 lines of code, compared to only 42 in
 	\cref{lst:count:Per-Thread Statistical Counters}.
 	Is this extra complexity really worth it?
-}\QuickQuizAnswer{
+}\EQuickQuizAnswer{
 	This of course needs to be decided on a case-by-case basis.
 	If you need an implementation of \co{read_count()} that
 	scales linearly, then the lock-based implementation shown in
@@ -224,7 +224,7 @@ references.
 	with all the scalability and performance benefits of the
 	implementation shown in
 	\cref{lst:together:RCU and Per-Thread Statistical Counters}!
-}\QuickQuizEnd
+}\EQuickQuizEnd
 
 Use of RCU enables exiting threads to wait until other threads are
 guaranteed to be done using the exiting threads' \co{__thread} variables.

base-commit: e4815ca92805056635d98935562ced9e41fd0fb4
-- 
2.17.1

