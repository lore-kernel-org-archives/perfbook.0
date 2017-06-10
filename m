Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=0ShT6/KBxCOGfhy5QI/1pTs2KE8kDRJm42K+LWsnkps=;
 b=uG0lryPR4S5OF85Eu+lFvhckM74bHU2Q9uSdT/j4K5JLcBZ126tdmDL/P/cN5ImAxj
 9jHVYteNSobH4aauLoq1tRsLZyX6wIutm4mfLRN5f5suHOX8l0yn140Cdv0fI+382Uhe
 ix/DQFt5Yh+Xgv40Q6MlmM64PHF71s39HKGGhA3ZzsZkyvYuHCPD7jf5BSbo251Nr2ZM
 HUbNblIukrBut4tiJLeFGhga2PMPmgPxsRl4Bi9N9R592SMn60Aed1YE8Nwn2O27ktxg
 BG1eTUrlYpSeCiH43XZBfL1FMoFm0HlP3xIxrpA0YQWNmU4xvZ6NGSpXqjE529BBOYch
 NK1A==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 0/4] Update on Chapter Deferred Processing
Date: Sat, 10 Jun 2017 22:28:27 +0800
Message-Id: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I'm reading Chapter Deferred Processing, and following are some patches. Please
take a look.

--Jason

Junchang Wang (4):
  Figure Storage Hazard-Pointer Storage and Erasure: Switch from
    ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
  route_hazptr: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
  route_seqlock: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()

 CodeSamples/defer/route_hazptr.c  | 10 +++++-----
 CodeSamples/defer/route_seqlock.c |  6 +++---
 CodeSamples/defer/seqlock.h       |  4 ++--
 defer/hazptr.tex                  | 16 ++++++++--------
 defer/seqlock.tex                 | 12 ++++++------
 5 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.7.4

