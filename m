Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=g0FZOTBStMg9K427z5qSEmm1gXXm7biLL1C9kZttKC4=;
        b=Yvb5KVNQFouPtSvF3dTwO4v14Y1tWlJSTkEfAbo1V+hw63A8t1lCgIexAaezE1NiwU
         DPo06i+4p7p0w7QXXq8YFwiznVlkW6ATXPxsJn/SXjlvtVZ+YHfkZj1cSR6w+qKdEYy2
         v31H/sxa8t5URV5lLyfEmuIwAOsBjoXMK057IZDKeFVOw+aYJw/O19kWTo71WDzfptTr
         jkTG/ark37fX3SDTOZaVYIzdBtDaRvbWwA8U/lGeR7IpUYHBd3ld+N7X0ygsg8cbHt0b
         1xRE5UbWXFDFfcapCDQ/GAViujjsmN2vQCmzCGzDU3X+3+HyiMdUI8qF2y2G46bXUc//
         uh9w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] Misc updates
Message-ID: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
Date: Wed, 5 Dec 2018 00:27:34 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5471262067bf42e8698c80fee3e1d42a8c576d43 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 5 Dec 2018 00:10:12 +0900
Subject: [PATCH 0/4] Misc updates

Hi Paul,

As I reported this September, Figure 5.1 is not complete yet.
As a workaround, patches #1 and #2 restores the old plot of
Nehalem for Figure 5.1.  Once we can obtain complete data,
it should be easy to update again.

Patch #3 is a minor tweak in RCU code snippets to prevent
short code snippets from being page/column broken.

Patch #4 fixes a typo in an epigraph you've added recently.

Hopefully, this would be a final patch set from me for the
upcoming release.

        Thanks, Akira
--
Akira Yokosawa (4):
  CodeSamples/count: Restore atomic125.eps
  count: Restore 'fig:count:Atomic Increment Scalability on Nehalem'
  defer: Prevent page/column break in short inline code snippets
  owned: Fix typo in epigraph

 CodeSamples/count/atomic125.eps      |  856 +++++++------
 CodeSamples/count/atomic125.png      |  Bin 3189 -> 3337 bytes
 CodeSamples/count/atomic_nehalem.eps | 2266 ++++++++++++++++++++++++++++++++++
 count/count.tex                      |   14 +-
 defer/rcufundamental.tex             |   14 +-
 defer/rcuintro.tex                   |    4 +-
 locking/locking.tex                  |    2 +-
 owned/owned.tex                      |    2 +-
 8 files changed, 2770 insertions(+), 388 deletions(-)
 create mode 100644 CodeSamples/count/atomic_nehalem.eps

-- 
2.7.4

