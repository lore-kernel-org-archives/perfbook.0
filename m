Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=DKnpnCI9U1C8hZ6x/lRW9zGjbg1ErlbrBuVPvCSWrSU=;
 b=XJlRUxEYMu4SXEFcmAL2v1IJWJjh4lKqjbWozocFHTtPic7QZTbnuqcIQRtZNEn/Kp
 NQrfXQbae+F9UvYnLEAxKmXv/xyy9UdI2ZT6KCYIRoKuOevwfCbMIZ4lHjnYJJDhXjLg
 BTPowsNsdMcxdwY5nXDMu3771cDF7fowtXEdNHED3e5nIX/i5BvfytTLyFK8T2Sm/d73
 RDrSv6RRziT7BSV4i42r9dRml8MMxwN8WMkTzA00lb9f3JSLH7flO6ldehYN0ZuQ31iv
 SY8fv8cGRAy5GToVi1uk3CeYsYa6StGUwR/KpAKa0HrqCVumY36I+Trk/bVCSeLx8+//
 eteQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] future/QC: Improve table layout
Message-ID: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
Date: Sun, 25 Feb 2018 08:47:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 66f9f9f82d4fef12b6d7e2a399c14fbaa758e3f8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 25 Feb 2018 08:09:50 +0900
Subject: [PATCH 0/5] future/QC: Improve table layout

Hi Paul,

This patch set is a response to your recent updates in QC section.

Patch #1 retouches Table 17.5

Patch #2 removes alternate-row coloring in Table 17.5, which looks
redundant after the retouch.

Patch #3 is for consistency of spacing around unit symbols as is
suggested in Style Guide.

Patches #4 and #5 are a word choice suggestion and a typo fix.

Patch #2 can be skipped if you'd like to keep the background color.

        Thanks, Akira
--
Akira Yokosawa (5):
  future/QC: Improve layout of Table 17.5 by using subfloat
  future/QC: Remove alternate-row coloring in Table 17.5
  future/QC: Add narrow space in front of percent symbol
  future/QC: Disambiguate 'QC power'
  future/QC: Fix typo

 future/QC.tex | 137 +++++++++++++++++++++++++++++++---------------------------
 perfbook.tex  |   1 +
 2 files changed, 75 insertions(+), 63 deletions(-)

-- 
2.7.4

