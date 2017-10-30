Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=F6NFXa8Hn/aVKoLdjX2okfQnTI6z8mWIIM540PNjV3o=;
 b=Va0vWgB11FCEP+A4aDHlf/LgaFtJHfVM6Wu/yVziDufycMlwSk2GlWJQdEzeW2ptGP
 SEKmRG3gAVTI9KOQxdsfQhHqh2+w86Bf5h0NxkwpjD+4vTlc+4HV52rlV6aYv62+kmjM
 QlReYDjeRz1ZVzp1GSf1jN6qNCLTrROyuuOrhN4zmwuTn9P5J2/COM8m6CZMuXdZpjRz
 Dyt22mEVEFMHCZfIn/BkM/bLbLvAuVX3WpKUlXJ2i7nqmmRLPeCYFwDvdnNW98QPMymB
 LzAv/JV+/rcWYeACeqkp4416p8tPGaQHKmOG/lcJh7moJvSCas+J/ijaoPtgIs1DT6ck
 6NFg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] formal/regression: Fix typo
Message-ID: <ea9123a0-7651-72c0-24d5-1b847b6b2efc@gmail.com>
Date: Tue, 31 Oct 2017 00:53:39 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c313894cb1f877b1d8ef5303d59d97b187cf925e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 31 Oct 2017 00:48:11 +0900
Subject: [PATCH] formal/regression: Fix typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Here are fixes of several typos in the new section.
There are chances I'm guessing wrong in some of the hunks, though.

      Thanks, Akira
--
 formal/regression.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/formal/regression.tex b/formal/regression.tex
index 39ca388..09d28e1 100644
--- a/formal/regression.tex
+++ b/formal/regression.tex
@@ -60,7 +60,7 @@ and C++ code, but these tools work only on very small litmus tests,
 which normally means that you must extract the core of your
 mechanism---by hand.
 As with Promela and \co{spin}, both PPCMEM and \co{herd} are
-extremely useful, but they are well-suited for regression suites.
+extremely useful, but they are not well-suited for regression suites.

 In contrast, \co{cbmc} and Nidhugg can input C programs of reasonable
 (though still quite limited) size, and if their capabilities continue
@@ -394,7 +394,7 @@ Worse yet, imagine another software artifact with one bug that fails
 once every day on average and 24 more that fail every million years
 each.
 Suppose that a formal-verification tool located the 24 million-year
-bugs, but failed to fined the one-day bug.
+bugs, but failed to find the one-day bug.
 Fixing the 24 bugs located will take time and effort, likely slightly
 decrease reliability, and do nothing at all about the pressing
 each-day failure that is likely causing much embarrassment and perhaps
@@ -479,7 +479,7 @@ Despite requiring hand translation, Promela handles assertions
 in a natural way, so its fifth cell is green.

 PPCMEM usually requires hand translation due to the small size of litmus
-tests that it support, so its first cell is orange.
+tests that it supports, so its first cell is orange.
 It accurately handles several memory models, so its second cell is green.
 Its overhead is quite high, so its third cell is red.
 It provides a graphical display of relations among operations, which
@@ -493,7 +493,7 @@ so \co{herd}'s first cell is also orange.
 It supports a wide variety of memory models, so its second cell is blue.
 It has reasonable overhead, so its third cell is yellow.
 Its bug-location and assertion capabilities are quite similar to those
-of \co{cbmc}, so \co{herd} gets the same color for the next two cells.
+of PPCMEM, so \co{herd} gets the same color for the next two cells.

 The \co{cbmc} tool inputs C code directly, so its first cell is blue.
 It supports a few memory models, so its second cell is yellow.
@@ -515,7 +515,7 @@ so they are all yellow with question marks.

 Once again, please note that this table rates these tools for use in
 regression testing.
-Just because many of them area poor fit for regression testing does
+Just because many of them are poor fit for regression testing does
 not at all mean that they are useless, in fact,
 many of them have proven their worth many times over.
 Just not for regression testing.
-- 
2.7.4

