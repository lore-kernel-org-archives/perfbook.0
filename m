Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=0U+3+rtmajyGY5tlGJ8dF2iUy0jdiRl8GMEtY5Bgf6I=;
 b=JOcNwFo9IZJfl44Jka6uS52W87BvZKqGxmLWwivnRQQEhr4eJKAhrnooq69fpPZeuF
 3ILhdJf5pkFPFN5VfZdMcntmD+YbmvV+Pz2dGDssDrOL8/qw2MREuu0knibvUKG30wvc
 dwV/7Rb3VBhmF9Lfwc3abGd/J+ZGGgkGSvZgDGAYYYGf0bygYr56FvunNYlV+kqiLn2+
 YxuZxGJFVA67jVjeu1CL3+OGKevhE3ktvonQNQ0RyOUqpentcFWnDegBfxSIOVmidBR3
 zcvLFSNfihAZ2tMT4gLdp2GTFl08Y+7ju/KTRjYeK15jlTk3v90cjwZKwVNj3HlrqL/T
 LNxg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Update qqzreorder.pl
Message-ID: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
Date: Sun, 19 Nov 2017 00:03:05 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a2d0cd80fb99a15bd5265f12863ac8f0183f9a9b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 18 Nov 2017 23:43:37 +0900
Subject: [PATCH 0/3] Update qqzreorder.pl

Hi Paul,

In commit 90197e37d310 ("Fix layout hiccups in answers to quick
quizzes"), I missed that code snippets at the end of QQAs were
taken care of by qqzreorder.pl. The hiccup I saw in rcuapi.tex
was the regression of conversion of code snippets to "listing"
environment. I should have updated qqzreorder.pl at the time
so that it could take care of "listing"s at the end of QQAs.

Patch #1 updates qqzreorder.pl and tweaks a code snippet in
memorder's QQA, which has such a listing at the end of a QQA.

Patch #2 reverts the unnecessary changes in the above mentioned
commit. It has no effect in the resulting PDF, but the spacial
case handling should be done in a consistent manner.

Patch #3 fixes unrelated trivial typos.

       Thanks, Akira
--
Akira Yokosawa (3):
  Update qqzreorder.pl to take care of listing at the end of QQA
  Partial revert of 'Fix layout hiccups in answers to quick quizzes'
  memorder: Fix trivial typo

 defer/rcuapi.tex        |  7 +++----
 memorder/memorder.tex   |  5 +++--
 utilities/qqzreorder.pl | 24 ++++++++++++------------
 3 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.7.4

