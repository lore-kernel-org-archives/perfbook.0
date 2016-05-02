Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=oAiE1dDDTR0eueNNYLOwhLoYL5VkLEK4mdvUWxI5nk8=;
 b=DRIiW0OrZCoQ6ZYQ/8krxzwvR9Fu0YXz0G7VshTVAqCVyVw1+SaXFdsUQcBzjzYvyu
 Q5ua0mz5eUprArSwbC6ANNs72dPAKVUIM1r7WlkouCfwO6+/Jx/NLXMu0ZCvlurbGBbc
 NO+TuVjyvvWvqzNur+6E+G57OTEbMYs2zLdnH/jJ4J05l+dAlO157iZjVfLC3WDYKaIQ
 216BdPZhrlT5DdrNqnREkHwHtsKH9tSDMahX6bn8kxR8T1GNqkj53ypuV2uhk5cYi33s
 86hYDt3IfzQqvt52Q5YjUDHVap+FA2E65+exq6vplfYeMfrv0rLsDflxVg65KaRtwTsV
 WM3g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFT PATCH 0/5] Another round of build script tweaks
Message-ID: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
Date: Tue, 3 May 2016 07:47:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4ce174f3c72367fed945fb4448e294d205b8d88a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Tue, 3 May 2016 00:18:53 +0900
Subject: [RFT PATCH 0/5]  Another round of build script tweaks

This series restructures build scripts rather radically. 
My initial feeling was that [5/5] would be the most controversial,
and placed at the end of the series.
But in hindsight, [1/5] seems to be the most controversial one.

Anyway, I'd like people to try them and give feedback.

In commit 4038e781ed56 ("Improve behavior of build scripts"),
I caused some regressions.  They were fixed soon after,
but I think changes in build scripts need to be heavily tested
before being pulled in.

Any feedback is welcome. Thanks.

Akira Yokosawa (5):
  Further improvement of build scripts
  Add font installation check
  Add short name targets in Makefile
  Add explanation of short name target in FAQ.txt
  Make default target of Makefile overridable

 .gitignore            |   10 +-
 FAQ.txt               |   23 +
 Makefile              |  322 +--
 contrib.tex           |   60 -
 count/sig-theft.dot   |   19 +-
 count/sig-theft.eps   |  457 ---
 origpub.tex           |    8 -
 qqz.tex               | 7707 -------------------------------------------------
 utilities/eps2pdf.sh  |   12 +
 utilities/runlatex.sh |    9 +
 10 files changed, 181 insertions(+), 8446 deletions(-)
 delete mode 100644 contrib.tex
 delete mode 100644 count/sig-theft.eps
 delete mode 100644 origpub.tex
 delete mode 100644 qqz.tex

-- 
1.9.1

