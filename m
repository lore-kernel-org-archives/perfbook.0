Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Z++03VYM5Ea/D0oIKa1oRF1aTr9SNH+/BMzCEqz6brQ=;
 b=HvogGTBNMAiDPSVWsWBfxQgqDB8KzkwwPrpoW01MaUbMb/3CXT61p6T2uO5+zV59Tt
 MFij+0RNyehSfrlslPcpG+YvSSi0YXerP64FRx4r+ajvkFTsqLF875dFgKxLfasu+b0u
 qOyk7vPo0xtSqe8WWTeK2mns9CUyDC5l09kp15n3sIqy8N+jHx1b6EU5yTZUququjYyB
 7oSI/1+8oXRZT/MvZCkvXgOJMiWgOsobfL4Rohv4ZJHlH50aOYBJJDtYlsmJgxmlFoj3
 2id44ZDLlgoFtCYMG+2r8Vag+a4zKBfc0UkBSBkmn+BOchyj2JOoUvdzwKdIAIVNF/kI
 miTw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] toyrcu: Misc. fixes
Message-ID: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
Date: Tue, 20 Jun 2017 23:26:30 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2d0d9c606bf94a9c993f84fb8b5087de6c00b212 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 20 Jun 2017 23:17:56 +0900
Subject: [PATCH 0/3] toyrcu: Misc. fixes

Hi Paul,

While I was preparing patches related to unit symbol usage, I noticed
a few issues in toyrcu section.

Patch 1 is trivial.
Patch 2 seems also trivial, as long as my understanding is correct.
Patch 3 is a follow-up patch to the previous patch set.

                  Thanks, Akira
-- 
Akira Yokosawa (3):
  toyrcu: Adjust reference to prerequisite chapters
  toyrcu: Trivial typo fixes (rcu_idx -> rcu_refcnt)
  future/QC: Another math mode fix

 appendix/toyrcu/toyrcu.tex | 17 ++++++++---------
 future/QC.tex              |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.7.4


