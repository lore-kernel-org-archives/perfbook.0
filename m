Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8cePEwB3pK8SRqOll/j8z2rpXZ8z/SXcHGfxM2O7ZZM=;
        b=TdTne5DiJHc7SOHajoTPL+VCWqKdnAA1kkO7yEB5E9eJNErGcv9TO340/isEwbduA3
         wDzIR+lGBeNRHf78ChBdBs/skStOq/cIQN9LViEaDdDQ2wfVaNJcgBaNqn8INduB9PRW
         yW/7DUx9oTyDYbO5qmtv8nbnQA6mg9xBrbH/biG1UtQHNuBCxlf/JGQqNHRGVdF4KHW6
         mo60uCaWj2QctNZwme8r2Qg+Dd+4ZAuCbn/4sr8C90F+V8J0dzwRO1bETxUkVwl0mQgW
         FRPtcHTZzxl8apNUT2rlbEQQON6n0p+CkET9fW09FkM9kSnOU88osl2AfEeeiKR+vi8P
         jvlA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH v4 0/2] Toyrcu: replace racy plain accesses with READ_ONCE()
Date: Wed,  1 May 2019 22:22:23 +0800
Message-Id: <1556720545-15885-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi list,

Variable rcu_gp_ctr is accessed concurrently by the updater and readers,
and hence should be protected by READ_ONCE() and WRITE_ONCE(). This patch
set updates rcu and rcu_qs.

The tex file is updated accordingly. And a new scheme, which is suggested
by Akira and can extract code snippets from the source code, has been
applied.

Please note that rcu_nest also needs to be updated. I will first make sure
that I'm fully understand how it works, and then submit a patch for it.


Junchang Wang (2):
  rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
  rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable
    rcu_gp_ctr

 CodeSamples/defer/rcu.c    |  34 +++++---
 CodeSamples/defer/rcu.h    |  21 +++--
 CodeSamples/defer/rcu_qs.c |  31 ++++---
 CodeSamples/defer/rcu_qs.h |  42 ++++-----
 appendix/toyrcu/toyrcu.tex | 206 +++++++++++++++++----------------------------
 5 files changed, 152 insertions(+), 182 deletions(-)

-- 
2.7.4

