Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=Cxgk5vgQ6ns63bcMJd5Cl5gg140ZkQMpGRD6HXbV6P0=;
 b=Vh631GDauI2eNTrvUM1UlTqEaoprfJcnIMZ68ep7D2ic3sKfak8j51TmD59DlBSEMk
 WRNGMMt/vM0gjm0/rMSdN7YCa0M95bR44fvg6TuUInukNmwzljqZPLqBomxlsP6tAloi
 8rj0LpyvmO8w0VTIZ4hzeSoefW1dk+JIi7mOm8nDWqAR7mfXOMdL8fZpR4lGGDmKar9p
 PQyQHKbf7nswENkJDMW8D50DyZfK4sbQd7ODvCVd0kGckiKIa4/3JYlDJHYjkbx7SoyF
 ay3YbFgRQ6Xffe5s/EvupLtixxcCmmQrlCMcIpAZuWvhDrGkSBimOI6dvlmzyFpJkK2j
 0Huw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 0/5] Updating Section Deferred Processing
Date: Wed, 14 Jun 2017 23:44:59 +0800
Message-Id: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Most of the following patches switch from ACCESS_ONCE to READ_ONCE/WRITE_ONCE in
Section Deferred Processing. Please take a look.


Thanks,
--Jason

Junchang Wang (5):
  hazptr: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
  route_rcu: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
  route_rcu: Remove redundant assignment statement to rep->re_freed
  seqlocktorture: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
  rcu_rcpls: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()

 CodeSamples/defer/hazptr.h         |  8 ++++----
 CodeSamples/defer/hazptrtorture.h  |  6 +++---
 CodeSamples/defer/rcu_rcpls.c      |  6 +++---
 CodeSamples/defer/rcu_rcpls.h      |  2 +-
 CodeSamples/defer/rcutorture.h     |  2 +-
 CodeSamples/defer/route_rcu.c      |  5 ++---
 CodeSamples/defer/seqlocktorture.c |  8 ++++----
 appendix/toyrcu/toyrcu.tex         | 14 +++++++-------
 defer/rcuusage.tex                 |  4 ++--
 9 files changed, 27 insertions(+), 28 deletions(-)

-- 
2.7.4

