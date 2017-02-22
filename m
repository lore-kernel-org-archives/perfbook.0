Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=BM9z3QlhgiHuVDLdsftj3s8noSbee7HMXP2JmVDCD4U=;
 b=m6vHKFhclriprtEpbNonvXG1WhW6JK05ek+enyQit9dRxXMCfoVoiY5mJTGUI4+QUn
 0qq4tqfpYoYwV39qB37FC0wBc7MCYyVCsOqtx/DfOs4Zz4rTfS92pHHxRxqWCO+c7X+F
 O5rGy9MbmPA7i7Tcs8Hu5ay+kleH0BBc1asybBxyeGUJxXnVMpB/ctoj+NUDc5hJtW1i
 vSZuIv+eOfB7rZAlHSVON/hl0+xM97Q81K6K7xqGOltuIIQt+1iIHugalQD+lisLmx1m
 awp3JBN8tTa47dAkcjYqw3s73Xkxcb0Tm+wX61M+MGGq8ajvBqmVf5qdIlIr4HdOxdrW
 sYvA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Bibliography updates (misc fixes)
Message-ID: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
Date: Wed, 22 Feb 2017 23:27:00 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cd89aaf41ef91a1f7210243b883e8ef111ae08ef Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 22 Feb 2017 23:16:27 +0900
Subject: [PATCH 0/3] Bibliography updates (misc fixes)

Hi Paul,

This is the final round of bibliography updates I have prepared.
I will submit patches to append location fields when I notice.

                                Thanks, Akira
--
Akira Yokosawa (3):
  bib/WFS.bib: Update info in Valois95a
  bib/TM: Append location to Volos2008TRANSACT
  bib/syncrefs: Fix booktitle and append location

 bib/TM.bib       | 1 +
 bib/WFS.bib      | 8 ++++++--
 bib/syncrefs.bib | 8 +++++---
 3 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.7.4

