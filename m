Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=LgCpDRmE6a5LbsaDBUNPclZ7w4eXpiddGGjaOG/r5G0=;
 b=ijjlsvDiOG6ACb4eLDubVmVRRrU3EAQr2an+i88nRlov1Ksm5FmYkunoCSxnjhQPpz
 GPoUhrWiUtOwECurRVVw0lZ2ADN5M/DMG3piFpdtrkak7ogRO/9F4DMUbHuYq8t5jeBn
 yy1GrOL2qlYLUVjPUVDXU2TXSUG8vzYeAAlftnpgtHOhxtbIhNJsaeKlvgHubGssCUcB
 v3rwWANBIPMU7T4sRwK/8bqUcxXigDF1CV0Tm3pHTf4FtASAa2zB6+pYIGVIfBEkHU26
 rhHd35pZzTaXXK42T0LQAgG5yl4MpVc8D7GZajo+HwTzvE2TWjMyIAqcJ8tmjv6lqL81
 gxTw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] Fix layout hiccup and typo in QQA
Message-ID: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
Date: Sun, 5 Nov 2017 23:47:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7902d9405a7e92aef281297af179c0696bc389b8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 Nov 2017 23:33:03 +0900
Subject: [PATCH 0/4] Fix layout hiccup and typo in QQA

Hi Paul,

There remain several hiccups and typos in Answers to Quick Quizzes.
This patch set fixes them.

Patch #1 is actually a regression fix of my own. When I put
a thin space before the "%", I removed the escape by accident.
Patch #2 improves the layout of one-liner.
Patch #3 fixes remaining hiccups in QQA of whymb.
Patch #4 fixes other trivial typos.

      Thanks, Akira
--
Akira Yokosawa (4):
  formal/regression: Restore escape to '%' symbol
  defer/seqlock: Use minipage and verbatim for one-liner in QQA
  appendix/whymb: Fix layout in answers to quick quizzes
  Fix typos in answers to quick quizzes

 appendix/toyrcu/toyrcu.tex           |  2 +-
 appendix/whymb/whymemorybarriers.tex |  4 ++--
 defer/seqlock.tex                    | 10 ++++++++--
 formal/regression.tex                |  2 +-
 memorder/memorder.tex                |  6 +++---
 toolsoftrade/toolsoftrade.tex        |  2 +-
 6 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.7.4

