Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=etyhaVoEpTUmCPqpTS5xoKUbx2V7RxICjlUxs5hnxk4=;
        b=MGFYTvD11MYmuJJSqIkJzz2vsvoWoaEbnR2s5OSnPEcptOSz0kr10w0etHBW6fu+Km
         RtOivPkGQdMqGVgold2jLM/K4kQZ2qgAoP78Q8ZS8hJuj2OyNU67DLVYc5rF9rt+vk5n
         TkQk3PmIZqbbPG9DbxX7A3h2HIGqNGAV9FPdOKGYWxsd29BiYzbXYaS5MJgrh0GcR4Gv
         ARxz6IiVTNmokcUa/fArKjP6l46vaWHx3vsoHD7Get5sCK0EaOw8syymAS//72rwtMm2
         z97FrTugO0EBetnaoaARO/9xukrJWzQsiM/7UpxHlkvCL0WtpgJnbUR4OScNxRhbX+AI
         AJhw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH v3 0/2] Toyrcu: replace plain accesses with READ_ONCE()
Date: Mon, 29 Apr 2019 22:38:42 +0800
Message-Id: <1556548724-17844-1-git-send-email-junchangwang@gmail.com>
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

--
Junchang Wang (2):
  rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
  rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable
    rcu_gp_ctr

 CodeSamples/defer/rcu.c    |  30 ++++---
 CodeSamples/defer/rcu.h    |  21 +++--
 CodeSamples/defer/rcu_qs.c |  29 ++++---
 CodeSamples/defer/rcu_qs.h |  42 ++++-----
 appendix/toyrcu/toyrcu.tex | 207 +++++++++++++++++----------------------------
 5 files changed, 146 insertions(+), 183 deletions(-)

-- 
2.7.4

