Return-Path: <SRS0=opCU=SJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=V3j692stVO0X2LX2HS5TYibSvTMqKB8bHpPFfgVR50w=;
        b=Hm6tgI56gwb33S+Xgvpq87KMBqjQdFSUEcxjk/6icSenIJ1YWJvIgE+U0E9ZwqhHLn
         I1mLHRcytHULOLwAq4TUbl63QzVE0jN3VRCCTpme5R5HceQw9qdipJADtoQUY8Rj3Mzr
         /1wqGkwwu0J2c+JkpARSUnii8erY3YCHiLJ5uPoySAdYTHnNaVKg7RoNGuSW690IX8Tx
         HJAnDiAQH3YQMgNjRAF1FdS7ZUhe1/YtYFhV3yTYjXwW6XqgceuwB/cFAy9NTIAlDMCT
         TGKRWvN1hX14eulBsnI7YDgPmg18uPf5+pwQjB4vucq3OvAAbN1oqriEPuGeHwdWc1Pe
         7zpA==
Message-ID: <4f29d7e7-b62d-eddf-87b4-3d54a8cccc6e@gmail.com>
Date: Tue, 25 Jan 2022 19:03:31 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/6] locking: Mark major references to 'livelock',
 'starvation", and 'unfairness'
Content-Language: en-US
References: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Note: \IX{} or \IXB{} markers can't be used in \subsection{}.
low-level macro of \ucindex{} is used instead for "livelock"
and "starvation".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index c223d40c..e8477f6d 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -878,14 +878,14 @@ addressed with other tools.
 Nevertheless, the strategies described in this section have proven
 quite useful in many settings.
 
-\subsection{Livelock and Starvation}
+\subsection{Livelock and Starvation}\ucindex{Livelock|BF}\ucindex{Starvation|BF}
 \label{sec:locking:Livelock and Starvation}
 
 Although conditional locking can be an effective deadlock-avoidance
 mechanism, it can be abused.
 Consider for example the beautifully symmetric example shown in
 \cref{lst:locking:Abusing Conditional Locking}.
-This example's beauty hides an ugly \IX{livelock}.
+This example's beauty hides an ugly livelock.
 To see this, consider the following sequence of events:
 
 \begin{listing}
@@ -967,7 +967,7 @@ retry:					\lnlbl[thr2:retry]
 	assuming that the global lock need not be acquired too often.
 }\QuickQuizEnd
 
-Livelock can be thought of as an extreme form of \IX{starvation} where
+Livelock can be thought of as an extreme form of starvation where
 a group of threads starves, rather than just one of them.\footnote{
 	Try not to get too hung up on the exact definitions of terms
 	like livelock, starvation, and unfairness.
@@ -1060,7 +1060,7 @@ these problems by maintaining low \IX{lock contention}.
 \label{fig:locking:System Architecture and Lock Unfairness}
 \end{figure}
 
-\IX{Unfairness} can be thought of as a less-severe form of starvation,
+\IXB{Unfairness} can be thought of as a less-severe form of starvation,
 where a subset of threads contending for a given lock are granted
 the lion's share of the acquisitions.
 This can happen on machines with shared caches or \IXacr{numa} characteristics,
-- 
2.17.1


