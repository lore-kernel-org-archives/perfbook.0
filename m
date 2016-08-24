Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=OgrMKqEnYRmgVSX6+B8WLCufKVohyT3ghMucQQIswn4=;
 b=omg3h8I6BFZfdJpX6YB55DWCozZkjBFGZkFq3uQNzx4ROM/hC8zrQHWVQqSygNFo11
 qkUPtlTwh3b+i4OzSGczv0kWju1mOmRfXnHwIaWyNrW1KmuCc7cpb55NyY37JUafwc4k
 sSDOJb/at8o3ckeg6MCBUn01hvxXRxOnXcpOBV1Z0mUP9X3M3CUEE5R97vbDMA9RjVp7
 LjwNFlEdSsFjoSZTtKz2p0E8XmuTe300LxPxcTTVAwEZUBKy2FGbTVBhZReUYaQiwILq
 c+mKFCOKn3MYQNb4/bZtUzgKxAi7hogzF28PtIYbwlQFuMqH+TydHPoI4Fc/cQWGIbrO
 chYA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Typo fixes
Message-ID: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
Date: Wed, 24 Aug 2016 23:07:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 98c6fbbe2a7b04bc1ad11d70d96995425d8635de Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 24 Aug 2016 20:43:42 +0900
Subject: [PATCH 0/3] Typo fixes

Hi,

This series consists of typo fixes.

1st patch is the result of a variant of hypen2endash.sh script.
No, this patch does not convert hyphens to endashes, but
replaces spaces in "lines nn-mm" and "Lines nn-mm" with tildes.
It also corrects typos such as "line^nn-mm" to "lines~nn-mm".
Modified sed script can be found in the commit message.

2nd patch adjusts plurality of verbs in appendix/rcuimpl/rcutreewt.tex
after the 1st patch. This file is not referenced any more, so this fix
may be unnecessary.

3rd patch fixes typos I noticed while reviewing Chapter 7.

                                                  Thanks, Akira

Akira Yokosawa (3):
  treewide: Use nbsp after 'Lines' and 'lines'
  appendix/rcuimpl: Adjust plurality of verb
  locking: Typo fixes

 appendix/questions/after.tex         |  4 +--
 appendix/rcuimpl/rcutreewt.tex       |  8 +++---
 appendix/rcuimpl/srcu.tex            |  2 +-
 appendix/whymb/whymemorybarriers.tex |  2 +-
 datastruct/datastruct.tex            |  2 +-
 formal/dyntickrcu.tex                |  2 +-
 formal/spinhint.tex                  | 56 ++++++++++++++++++------------------
 locking/locking.tex                  |  8 +++---
 toolsoftrade/toolsoftrade.tex        |  2 +-
 9 files changed, 43 insertions(+), 43 deletions(-)

-- 
1.9.1

