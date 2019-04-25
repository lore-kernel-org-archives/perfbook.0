Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LbyIMx5f7j5SArzdLmk21Wc1DKbnh5CwSKRgQ87XxCw=;
        b=Yzbt86808e+kauqpYF+EFpIXdspQ2O9HJBSSEZPbFE8gjT0BuafLfJGSAybmoiKe70
         Ze1W2/y8Vlllc4D9p1HkMO1p5cXGWQUvR3PrzNtYRdvD/UDkzf3Rpa4a/GPTdjef3e4F
         v1Coy/xd9NJW5TdfyBpSJat/0opFutKoR+so5Hbi9af00o5zc69wTdAZ2sQ1BYm2oHIh
         CSDbwhvPrsun4cEDFDtmYN6ZRuXCq4kEEfpMeUm6wzZc0GhdSgTXb5vLf2JdjSzhdTfk
         il6SdJ2MRaY9Qpp4xMRS6ACtElrZgt7YyEkW3pA06ws1WcNxKJ1FXSF59pSG7/VpqxRx
         Xb5A==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH v2 0/3] Toyrcu: replace plain accesses with READ_ONCE() and
Date: Thu, 25 Apr 2019 16:29:51 +0800
Message-Id: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul and Akira,

This patch set replaces plain accesses and ACCESS_ONCE() with READ_ONCE()
and WRITE_ONCE() in Toy RCU examples. I will send another patch updating
tex file accordingly on top of this patch set.

--
Junchang Wang (3):
  rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
  rcu_nest: Use READ_ONCE() and WRITE_ONCE() for shared variable
    rcu_gp_ctr
  rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable
    rcu_gp_ctr

 CodeSamples/defer/rcu.c      | 2 +-
 CodeSamples/defer/rcu.h      | 4 ++--
 CodeSamples/defer/rcu_nest.c | 2 +-
 CodeSamples/defer/rcu_nest.h | 2 +-
 CodeSamples/defer/rcu_qs.c   | 2 +-
 CodeSamples/defer/rcu_qs.h   | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.7.4

