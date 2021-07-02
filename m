Return-Path: <SRS0=JVx/=L2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gr77930XM85t+NtHbI03bvBexM6HaRSVPbhgZ/QvNAs=;
        b=m7jGzbQIQQLl2hqwBUCK92x2SPJ2J1LJyraywd6RIdSUMlWH7Pv14nKRKUY3toIYb1
         /u8JTebwb9jbEfjikkMSdVSaXzr481ZgrfvLqVB+Lv0Qz0GcrwPzQcZWlv5Nkk+njVcK
         8tS8vHHE/fQoVR8I/+Y1XRwZJzURFN2V4dVIvz+teEBdXpx0wRMQwsZNUENBbpr8Ak5g
         T5Bg3ML3fpw/znKZoikGLGrBKarO/UVwOMQp+cfBXT1EsNwFbUjb3WSFdNtMZcRell5L
         jnkG6Cx4lSts1RWHhWbbTzVTV743JluXrdpVB0DFQisDM8KreKMOiod6Ui5LqjuCcBsZ
         aG+Q==
Subject: [PATCH -perfbook v2] future/htm, summary: Fix typos (missing '\' in
 indexing macros)
References: <3b7aac15-128e-56d4-6662-9fa686f94dd1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cea0f767-c1dd-731c-a2cb-3e28e80a0ad0@gmail.com>
Date: Fri, 2 Jul 2021 20:08:26 +0900
MIME-Version: 1.0
In-Reply-To: <3b7aac15-128e-56d4-6662-9fa686f94dd1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fixes: b97d9921b0fd ("acronym: future/htm: Tag TM, HTM, STM, and RCU via acronym dictionary")
Fixes: de25a117a9c6 ("index: Add index and acronym tags, take one")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi again,

I said:

> I'm thinking of adding some rules in the check script to catch
> this sort of typo.

, and a tentative script caught two other typos.

This v2 patch fixes three typos at once.

Updated check script will be posted later along with other punctuation
convention fixes.

        Thanks, Akira
--
 future/htm.tex | 4 ++--
 summary.tex    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/future/htm.tex b/future/htm.tex
index dc67ba23..7458f436 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -150,7 +150,7 @@ HTM is therefore a very real possibility for large non-partitionable
 data structures, at least assuming relatively small updates.
 
 \QuickQuiz{
-	Why are relatively small updates important to IXacr{htm} performance
+	Why are relatively small updates important to \IXacr{htm} performance
 	and scalability?
 }\QuickQuizAnswer{
 	The larger the updates, the greater the probability of conflict,
@@ -252,7 +252,7 @@ write~\cite{RaviRajwar2012TSX}.
 schemes~\cite{CScottAnanian2006,KevinEMoore2006}
 use DRAM as an extremely large victim cache, but integrating such schemes
 into a production-quality
-IXalt{cache-coherence}{cache coherence} mechanism is still an unsolved
+\IXalt{cache-coherence}{cache coherence} mechanism is still an unsolved
 problem.
 In addition, use of DRAM as a victim cache may have unfortunate
 performance and energy-efficiency consequences, particularly
diff --git a/summary.tex b/summary.tex
index 63187998..2ed43920 100644
--- a/summary.tex
+++ b/summary.tex
@@ -86,7 +86,7 @@ And that goes at least double for concurrent code.
 where combining concurrency mechanisms with each other or with other
 design tricks can greatly ease parallel programmers' lives.
 \Cref{sec:advsync:Advanced Synchronization} looked at advanced
-synchronization methods, including lockless programming, IXacrl{nbs},
+synchronization methods, including lockless programming, \IXacrl{nbs},
 and parallel real-time computing.
 \Cref{chp:Advanced Synchronization: Memory Ordering} dug into the
 critically important topic of memory ordering, presenting techniques
-- 
2.17.1


