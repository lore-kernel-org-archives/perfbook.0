Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=oyHO0B7OqcBRvqtdf++l1ni/A/0oYPBaWCWJ5Lj+hb0=;
 b=ACyeMQPRqTwef68YE2m23G2hiYtmkcANr0n/i3u2VbnyhOPynFtHxiIFOSmyFBKyyI
 zAKGT4VtwgnQfwPOSB38acCKO5Gh73Aix2BFjDIdrLaRzVeKgrb3hD3gFr19yQ203PiK
 DDkyLqvn2EJOj52e9RKdUuIxX/pRzF3PS0K+fmDvwVB+9liOcD0u7+R0sRnI2As2+oxb
 PnfCzT8sCdz/UNktrMcxQoRL41YIPwz5U+IrIlN9jR0swXrnsYKgN8v71Navv6nsbNCk
 XfLUm5QqWR4oB4KGPUHDZDsmuvrkxL0Rh2nONN+edV+mjKkfk3Thbx1jhk6reyehIoei
 dc8Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Adjust context to herd7 litmus test
Message-ID: <2e39d17d-bb28-db5b-b8e1-f65b8fa1caa4@gmail.com>
Date: Tue, 27 Jun 2017 00:04:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3db6dc5ae7f71c42f91742064ec38db750f3f25d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 26 Jun 2017 22:33:30 +0900
Subject: [PATCH] advsync: Adjust context to herd7 litmus test

Commit 96ab6febd94c ("advsync: Convert memory-misordering table to
herd7 litmus test") needs further adjustment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index e9e9de1..4a2c334 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -50,7 +50,7 @@ code that makes direct use of explicit memory barriers for data structures
 in shared memory.
 For example, the litmus test in
 Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
-appears to guarantee that the assertion never fires.
+appears to guarantee that the \co{exists} clause is never validated.
 After all, if \nbco{0:r2=0},\footnote{
 	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
 	equals zero.
@@ -60,10 +60,10 @@ as shown in the \co{exists} clause, we might hope that Thread~\co{P0()}'s
 load from~\co{x1} must have happened before Thread~\co{P1()}'s store to~\co{x1},
 which might raise
 further hopes that Thread~\co{P1()}'s load from~\co{x0} must happen after
-Thread~\co{P0()}'s store to~\co{x0}, so that \nbco{1:r2=0}, as required by the
-assertion.
+Thread~\co{P0()}'s store to~\co{x0}, so that \nbco{1:r2=2},
+which should negate the \co{exits} clause.
 The example is symmetric, so similar hopeful reasoning might lead
-us to hope that \nbco{1:r2=0} guarantees that \nbco{0:r2=1}.
+us to hope that \nbco{1:r2=0} guarantees that \nbco{0:r2=2}.
 Unfortunately, the lack of memory barriers in
 Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
 dashes these hopes.
-- 
2.7.4

