Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=eFujAOynVrDJK26LjojG9YBidOS8S/B/H9GlhH91zgM=;
 b=CBMD9p58xc/scIZRcG0m8Y1QTZ9vQS+s5dZHXt2SvyrNILMjIZC0NZYigysL4MrjXu
 tQxgILdPIMK5VAyFRVtLInlGObBD+6fB05DZ3DeRvzvoW5I+n7+OYtD6TFf4Liqxzge/
 nDSJ5niulPktS9wSibp80X/dY4NbAZqMMFBdX9O+1UEWjWfbSDBdRy9PV8UgjgralQ+p
 Yj/q9tOdIOuV2DsZ9UpE729l9cn5y+fY3lAvfHPddkcm019V0tVb7g3nTzkGJjYtNE/j
 w6y/pxGR99ozCRE7YXudglCZfdn/GEdTnrlbtagYwmzfwp5FpFe3nXlqzJFf3mkC6i3c
 rQQw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Use \tco{} macro within caption and section header
Message-ID: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
Date: Tue, 7 Mar 2017 23:59:34 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a51c44bef0dbc05bd95391ac3f8f0f2d26becbf5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 7 Mar 2017 23:35:32 +0900
Subject: [PATCH 0/3] Use \tco{} macro within caption and section header

Hi Paul,

This is the 1st patch set I have tested locally for a while.
The objectives of this and the following patch sets are as follows:

  o Use \tco{} macro within caption and section header
  o Use modern packages such as enumitem
  o Convert itemize or enumerate lists to description lists
  o Add another alternative monospace font target

This set corresponds to the 1st one.
Patch 1 is an independent change to manage "microtype".

                                    Thanks, Akira.
--
Akira Yokosawa (3):
  perfbook.tex: Disable 'microtype' for typewriter font
  treewide: Use \tco{} for api name in caption
  treewide: Use \tco{} for api name in subsubsection title

 appendix/whymb/whymemorybarriers.tex |  2 +-
 debugging/debugging.tex              |  2 +-
 future/tm.tex                        |  2 +-
 locking/locking.tex                  |  8 ++++----
 perfbook.tex                         |  4 +---
 together/refcnt.tex                  |  6 +++---
 toolsoftrade/toolsoftrade.tex        | 38 ++++++++++++++++++------------------
 7 files changed, 30 insertions(+), 32 deletions(-)

-- 
2.7.4

