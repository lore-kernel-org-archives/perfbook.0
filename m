Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wIQ5kgsChgm7YR966Sp/3ild0WPHHm1QoJHYLU/pLjY=;
        b=YoZTmTaM9tGlmw0GiYTjzgvnsj1FtonF7vmQXXNaxCDYXGX13p1Il4gS1yLV47z9oy
         0MewvJmD85q9fqfXGWhBO3tHKD9jrx9uVnZ60EQdq/zzHLM5p1FQ5Y+ZcZFJlIQVnxqv
         z227WATx22q/sh9izoYgicKoyA/rVwBc9JoommwXqXE9aOEmsgASDQPUjgWYnd55KDU/
         IxXbcog7LEtGst/oDm+T3NWiWArx6YDUSiXcL7/aCsQ02pkxQyEm6sM6MrXF4Brp4NoA
         151BwNtiuGEPDWGTpvEoJ8dKUymeMooRmFyk/41RxDdb+zaucIC2SRV2y7MJsyc/8v2E
         mNmQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 0/4] toyrcu: replace ACCESS_ONCE() and fix typos
Date: Tue, 23 Apr 2019 21:57:01 +0800
Message-Id: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul and list,

I'm reading Chapter Toy RCU, and the following are some corrections.
Most of them focus on replacing ACCESS_ONCE() with READ_ONCE()
and WRITE_ONCE(). Please let me know if they look OK.

Thanks,
--Junchang

--
Junchang Wang (4):
  Replace the plain accesses and the use of ACCESS_ONCE() with
    READ_ONCE()/WRITE_ONCE().
  ACCESS_ONCE() with READ_ONCE()/WRITE_ONCE()
  Replace the plain accesses and the use of ACCESS_ONCE() with
    READ_ONCE()/WRITE_ONCE().
  toyrcu: fix typo.

 CodeSamples/defer/rcu.c      |  5 +++--
 CodeSamples/defer/rcu.h      |  5 +++--
 CodeSamples/defer/rcu_nest.c |  5 +++--
 CodeSamples/defer/rcu_nest.h |  8 +-------
 CodeSamples/defer/rcu_qs.c   |  5 +++--
 CodeSamples/defer/rcu_qs.h   |  4 ++--
 appendix/toyrcu/toyrcu.tex   | 28 ++++++++++++++--------------
 7 files changed, 29 insertions(+), 31 deletions(-)

-- 
2.7.4

