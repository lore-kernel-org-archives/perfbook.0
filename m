Return-Path: <SRS0=2h+b=BG=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684324872; x=1686916872;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WP60dCcfsVLnccPKXpnbQe13e5QUXOu8oOdMbLP4z/M=;
        b=P9LAuwRSDT+zE3lkE5419K8QQjuy1CuSSAr11H0l3rjgJmhOHw4V2VvGATdzp5nFkK
         auSzdutEb1OGtNwn69+UUpWk2Y6No0kWPzPPCwKnJLOSwHErOkz0bKAuTzDWZb5Dscgk
         kNmzIckf9oY4quPC8w8Z8WgQnBV3H/5PL9ne5Soz8U7qqhLRaEpJL3EDDmks0wNcYnoG
         2WPLPwzkQpjiZaZoxJSdadFWq4h6sn9LNcJ1Mvfo752SFBt1O0MdGteXuyBAu3NAP2cJ
         7ut9wnPPTIh3BBf1DE6x0dirZZIeBMrASvmDxD5FPWd9wwHy+N/gke5InPx3u28u++TM
         VdCA==
Date: Wed, 17 May 2023 12:01:10 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: A question about QuickQuiz 5.46
Message-ID: <20230517120110.GA23586@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi, Paul

I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
balance_count() and flush_local_count() are both located within the
slowpath and are called sequentially. As a result, it is impossible for
them to compete for the counterandmax thread-local variable. Therefore,
I believe that this quiz may be referring to the global variables
globalcount and globalreserve.

Thanks,
Hao Lee
