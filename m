Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35211 "EHLO
 mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S933457AbbHLHzd (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 12
 Aug 2015 03:55:33 -0400
Received: by wicne3 with SMTP id ne3so89531596wic.0 for
 <perfbook@vger.kernel.org>; Wed, 12 Aug 2015 00:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=36qsm+Oaxo/BpezSBet0iDyuDZZkiCV5i7M3/Wb5HlM=;
 b=oklNcy7uECF66UzvF7FVCt3pkH32U6uAByyCeac0HyKfLvgJHfV3vaNc5j0J4M/mli
 eDPo0ni7Mh+bRJmZOU2UMKC7ROE/drswPr8M8U4H9mhFXx5K+G77IaPWK5M+QwTpIn7D
 BYzLnszhMOUz2sQKk7CS9zunOrLa+iu64YMmGsPdsdQRwaroUeUhMdH5ziiZd14r8KOQ
 fQvnepzB//wfKihIV4G7GRrKaiOflJs6o8dRXRWghaFWY2h2L8eDqnboCruEcvSIQAGs
 VxtlPerfq3R9JVdI/o8rFP1Dg2WQ4HY41e1x5+9JD8r67J1N+u1+C88YHhiWNI9C7ThR
 TnOQ==
From: Dominik Dingel <dominik.dingel@gmail.com>
Subject: [PATCH 0/2] CodeSample: rwdeq
Date: Wed, 12 Aug 2015 09:55:22 +0200
Message-Id: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Dominik Dingel <dingel@linux.vnet.ibm.com>

From: Dominik Dingel <dingel@linux.vnet.ibm.com>

Hi all,

here is a somehow naive implementation of a reader/writer lock based approch
for the parallel deq problem.

The next step would be to use it as an introduction example in the text, as due
its way of implementation (taking always a read lock, working always with an
atomic counter) it is a less efficient way of doing things, compared with the
tandem approch. Then the benefits of partitioning might be even more obvious.

Thanks
	Dominik

Dominik Dingel (2):
  CodeSamples: Fix compiler warnings
  CodeSamples: add read/write solution to the deq example

 CodeSamples/SMPdesign/Makefile       |   5 +-
 CodeSamples/SMPdesign/deqtorture.h   |   2 +-
 CodeSamples/SMPdesign/lockrwdeq.c    | 154 +++++++++++++++++++++++++++++++++++
 CodeSamples/SMPdesign/locktdeq.c     |   4 -
 CodeSamples/SMPdesign/matmul.c       |   3 +-
 CodeSamples/SMPdesign/matmul_block.c |   3 +-
 CodeSamples/SMPdesign/smpalloc.c     |   1 -
 7 files changed, 163 insertions(+), 9 deletions(-)
 create mode 100644 CodeSamples/SMPdesign/lockrwdeq.c

-- 
1.9.1

