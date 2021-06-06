Return-Path: <SRS0=2uZh=LA=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=za92caITP/GaFH0cWw8jCIyzzOcEXaqgxuDYHxyN14A=;
        b=mcRQ706Jv1k5dYYzlgZMTZhYypDmVbYBbzWSi4u3iUKSN1v7fhC/Yv7tqwyK390FRz
         hzY8eWfX7bMj6CF/7RoU3l44p3vMB23C3LLDE+NRlRh4ADL5Hu8Wb04gV+3SIAg7pLMj
         pXLq4erejP1Owuihy5uI/yMjFPYA8IxOnDj202ESD52RQUv7qQEnIQL2Fhc97f0N2kDR
         Ee9LpWOB0e9sSqlMqMLD6VNI0PvT/sDLOSdJ5piR0bpMEQEPNXauPcKMZN2xZJQ4Oyg9
         obcb2EXKx+JhlQCcfHPPwbZDCuQLKUecDaTM/0hVky0YjSlTtkJifaT7+RCOGe0MeCz9
         xQzw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/2] intro: Fix trivial nits
Date: Sun,  6 Jun 2021 10:17:25 +0200
Message-Id: <20210606081727.2125-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset fixes trivial nits in intro chapter, which I found while
translating it.

SeongJae Park (2):
  intro: Fix a wrong opening quote ('' -> ``)
  intro: Add missed unbreakable spaces

 intro/intro.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1

