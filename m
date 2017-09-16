Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=jSeNEMQwzZOQvFpNN45lqOZQ023XoSLEhpoGXrq/hTQ=;
 b=ovBcFQsYPc6PS7/lnrFbFqCOkJkW+gi5VtRoQglVGH6P4T/4pbv5Ov2t+yxEi4eIyh
 wzY8lsoQepAwO/R7In7lGcngKA1kYujqTFadCoLNIRHErnt8GlKsiPhyXV6qFN7QKiCS
 NxSRbID4vYAI4WxvkyZaoBj2LaXIU3YKku1rREez0W3hC7pzXWGNsvwa+69Q+bkxz4Ix
 SgP2QZZq3bDRj7ywR2KsFNYyKK2t9P+L55kohcdiB6rP4K+oLoRxLv2uo8lvsBQktx4f
 tiqtCj6J4kZo8S3YJpPwjr1SvjZItJQY52F5Vsw0A0bamnAapZknoEQZcteYY3wWvU8H
 9usw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] memorder: Miscellaneous fixes
Message-ID: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
Date: Sat, 16 Sep 2017 23:56:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d4c4e843d7810ad589f256868aafb3cb06147a80 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 16 Sep 2017 23:39:11 +0900
Subject: [PATCH 0/5] memorder: Miscellaneous fixes

Hi Paul,

This patch set consists of small fixes in memorder.

Patches #1, #2, and #3 are trivial fixes.

Patch #4 fixes a recursive reference within the chapter. I chose
Section 14.1, but there might be other choices.

Patch #5 might be a wrong guess on my side. I have not consulted
any document regarding PA-RISC arch or its CPU implementation.
Please apply it if it is the right guess.

       Thanks, Akira
--
Akira Yokosawa (5):
  memorder: Adjust hspace of table 'Summary of Memory Ordering' in 1c
  memorder: Fix usage of \IfInBook macro
  memorder: More reword to 'full-strength non-void RMW'
  memorder: Update reference to memory-barrier primitives
  memorder: Fix table of 'Summary of Memory Ordering'

 appendix/styleguide/styleguide.tex |  2 +-
 memorder/memorder.tex              | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.7.4

