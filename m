Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=oAF/s8aa8CIJ0Pd7uI6oogEGYWy5yi/BcX5vQjWZvss=;
 b=ZctTIt7HGa8W3c9cBTjIp6AQQcDyR3e9+CWYthOFRjBEQgmcMbmhA4yii5uS2k6rNl
 91g6lMgfxsQAeTms8Sl8A8X0s0TtdNXOVxzimDcojC6jOhMvr3fklgLBYBhIAdo1rxQD
 1fvSw0yLhkAiYmZNE8VRwdnfQe4e/638OI+VEYuMniUqZfnyyqU3MlILrapJn1CL+/zr
 JgI78vU9mG6WbgaOVsFRHOOUmnMOJi8eHB05LcENweEbyBWhKKYdwMY83IAVPD3EO0Jz
 pKudSxg4Kc0hIU636QZpaAPwAISLmN87EVJQpgcyACFgatXxpuDeS+SZjL/KJL2Nsn9z
 cS3A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/7] Bibliography update round 2
Message-ID: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Date: Sun, 22 Jan 2017 23:57:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 01ba68ac394333779c7745f249df5f78a500e091 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Jan 2017 23:31:05 +0900
Subject: [PATCH 0/7] Bibliography update round 2

Hi Paul,

This is the 2nd batch of bibliography update.
This time, I picked up more aggressive fixes which touch somewhere other
than urls in note fields. They may need closer review.
Some of the fixes reflect the context of citations in perfbook, so they
might cause context mismatches in your other publications.
I'm anticipating some feedback from you.

                                               Thanks, Akira

Akira Yokosawa (7):
  bib/hw: Update url note of JohnKnickerbocker2008:3DI
  bib/syncrefs: Update BengHongLim94
  bib/RCU: Salvage url of Spraul01
  bib/syncrefs: Salvage url of AdrianSutton2013LCA:Disruptor
  bib/RCU: Append followup mail's url to LinusTorvalds2001a
  bib/syncrefs: Salvage url of DavidUngar2011unsync
  bib/swtools: Salvage url of RichardBornat2006SheepGoats

 bib/RCU.bib      | 13 +++++++------
 bib/hw.bib       |  6 ++++--
 bib/swtools.bib  | 12 ++++++++----
 bib/syncrefs.bib | 26 +++++++++++++++++++-------
 4 files changed, 38 insertions(+), 19 deletions(-)

-- 
2.7.4

