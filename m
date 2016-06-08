Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113; h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding; bh=rbao07h1hI1of35hWnMUYsNz31xRjlUuEk4dN2nfOpo=;
 b=gs3JiRbQCwm1qHV4lbrSLV/hgWkiFN6t5a2U4mEx9OfVytJHEYe68F9t12T987LdiL
 lxM6w/WxFbC/sCCnxkqjHJ6o1mn0Dl9+4YBAtOA5q09XQVaFdLm/v1l7HsH1R2SNGKeO
 wZQx4GhPyGeCnfXMj8TaR/fRKHLLEn96/1CY10Qk0H0VOimN8yJ9JBERJMZ6bju5LIWH
 9XyBZZeCCY8fXip0cHhqsLBc1ExuNKyg87jQEswv2qB+9oCDgrxIJSp4w5nGMCXnqDkx
 xW8tCAtIP7sxjnv6+yuBPE0RguaNLYp0LOYVs885w9mdMC7lDO+wi3ZSGq+43l8JkY6x /Kew==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] Follow-up patches of cleanup-makefile
Message-ID: <e1642a9c-14f1-6cfe-e4f5-7d726226a952@gmail.com>
Date: Wed, 8 Jun 2016 23:36:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

These are follow-up patches of the previous patch series.
They will suppress warning messages and streamline messages displayed
during build.

I hope you like them.

                                                Thanks, Akira
          
--- 
The following changes since commit ca71bc6cf0bf303257b589d7edf251d627e90ce3:

  Fix typo in epigram attribution (2016-06-07 13:30:31 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git cleanup-makefile-v2

for you to fetch changes up to 35e4d20da570eab7e6ca6a59b92ab438d2efd7b2:

  Makefile: Use wildcard for .dot files (2016-06-08 23:05:39 +0900)

----------------------------------------------------------------
Akira Yokosawa (3):
      build scripts: Suppress warning messages
      Hide sources of unused figures
      Makefile: Use wildcard for .dot files

 Makefile                                           |  58 +++---
 SMPdesign/lockdeq.fig                              | 219 ---------------------
 .../MoreThanOneValue-15CPU-noresp.eps              |   0
 .../MoreThanOneValue-15CPU-noresp.fig              |   0
 .../rcuimpl/{ => .unused}/RCUpreemptCounters.fig   |   0
 cartoons/{ => .unused}/patterns.fig                |   0
 cartoons/{ => .unused}/patterns.svg                |   0
 utilities/runfirstlatex.sh                         |   2 +-
 utilities/runlatex.sh                              |  16 +-
 9 files changed, 32 insertions(+), 263 deletions(-)
 delete mode 100644 SMPdesign/lockdeq.fig
 rename advsync/{ => .unused}/MoreThanOneValue-15CPU-noresp.eps (100%)
 rename advsync/{ => .unused}/MoreThanOneValue-15CPU-noresp.fig (100%)
 rename appendix/rcuimpl/{ => .unused}/RCUpreemptCounters.fig (100%)
 rename cartoons/{ => .unused}/patterns.fig (100%)
 rename cartoons/{ => .unused}/patterns.svg (100%)

