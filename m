Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oTqdtSFk0xbXl+uI6bn1YfvgK73wOJeDlPL5x0i69wY=;
        b=OQKa6K17RNs3dg6SS5ZkM3tTwopk5Q7o4BoiZw1KsAXoHWqb02p+PSYVK2gbJGjZYc
         SwcxaszElEAmZgurGcIcBqd7g0KJB3oyOpputyDPdh3kz88XaPiEZ7nAFolRDiMAiwAE
         MWM3CCdSPDExNGwPu6gmRsfIymu7gPbLGFi0rqZa+kfVNH60z/iwbb/Zwtk8k+11CDxb
         TCWm+RNm1v7DRtprvcfc0xZSVSwHGPQvpZDv4ynTLOmXFdhYiXwr8Vt2l7mrbNEEFmpS
         JStsbULO9AbuH3hA45JNyvTYINBn7mK/jnNf8EVzaYJwrZwMUs10JX3ybmc551t7jIwN
         vnVw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 0/3] Patches for Section Deferred Processing
Date: Sat, 24 Nov 2018 17:34:51 +0800
Message-Id: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is the patch sets for Section Deferred Processing. Please take a look.

The first patch fixes a dependency issue in compiling route_hazptr.c.

The second patch fixes a memory leak bug in hazptr.c.

The last one fixes a typo in writing.


Thanks,
--Junchang

Junchang Wang (3):
  route_hazptr: Add dependency to hazptr
  route_hazptr: Fix a memory leak bug
  defer: Fix a typo

 CodeSamples/defer/Makefile | 2 +-
 CodeSamples/defer/hazptr.c | 4 ++++
 defer/hazptr.tex           | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.7.4

