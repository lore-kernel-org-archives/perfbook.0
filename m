Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=WEJK++BoFDxEH6YAGUu0p0SfJxBRVzFn4biAZxXIowo=;
 b=GpDcvcJlgRgy2PjvgLhDG8SUjafTC+2saGjzfOPcbRYDdpQf8u7k2saAPsOhiHO9pI
 EnHmU9Nh1K7DkuczltiZniXxT2+Rr2oauEyjy2jL7/dyEr8yceuMdjacY42FlhFtKHYz
 /uQ4PhUwBzFw13BOR8SnzBZLnlbW8SX2eqhMW/bAa1Xe8eBh9eHOZV1Ad+boYXdi8BqN
 CZeknayC/vcaAGotVnQ74RAwcdl7PxmNihy3P97BDP25ooZn4WZejxl+hvse4l0ndRkc
 OQZ8/lRY2jP1k8X9rKS0Y5/y5BGa2m6u/YQOS0x7dlAvGnVWyOiNYjaw3g+OIB8YXIxn
 VihA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] treewide: Enclose 'verbbox' within 'figure'
Message-ID: <00a15c91-6d25-4136-e72e-6c00ff0ed57e@gmail.com>
Date: Wed, 14 Sep 2016 00:21:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The following changes since commit 13fd84a696ca3951b5a2c2d15b524cf898c9400e:

  Add scripts to check 'verbbox' env usage (2016-09-13 07:05:06 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git enclose-verbbox-in-figure-v2

for you to fetch changes up to a9fe7df2efbc785602351e8fd9f26b0a683f6b9f:

  treewide: Enclose 'verbbox' within 'figure' (2016-09-14 00:02:53 +0900)

----------------------------------------------------------------
Akira Yokosawa (1):
      treewide: Enclose 'verbbox' within 'figure'

 SMPdesign/SMPdesign.tex              | 16 ++++++-------
 SMPdesign/beyond.tex                 |  8 +++----
 SMPdesign/partexercises.tex          |  6 ++---
 advsync/advsync.tex                  |  2 +-
 advsync/memorybarriers.tex           |  4 ++--
 appendix/primitives/primitives.tex   | 10 ++++----
 appendix/questions/after.tex         |  4 ++--
 appendix/whymb/whymemorybarriers.tex |  4 ++--
 count/count.tex                      | 44 ++++++++++++++++++------------------
 datastruct/datastruct.tex            | 28 +++++++++++------------
 debugging/debugging.tex              |  4 ++--
 defer/defer.tex                      |  2 +-
 defer/hazptr.tex                     |  6 ++---
 defer/rcuapi.tex                     |  4 ++--
 defer/rcufundamental.tex             | 10 ++++----
 defer/rcuusage.tex                   | 16 ++++++-------
 defer/refcnt.tex                     |  4 ++--
 defer/seqlock.tex                    | 10 ++++----
 formal/axiomatic.tex                 |  4 ++--
 formal/dyntickrcu.tex                | 16 ++++++-------
 formal/ppcmem.tex                    |  8 +++----
 formal/spinhint.tex                  | 30 ++++++++++++------------
 future/htm.tex                       |  2 +-
 locking/locking-existence.tex        |  4 ++--
 locking/locking.tex                  | 16 ++++++-------
 rt/rt.tex                            |  8 +++----
 together/applyrcu.tex                | 12 +++++-----
 together/refcnt.tex                  |  8 +++----
 toolsoftrade/toolsoftrade.tex        | 16 ++++++-------
 29 files changed, 153 insertions(+), 153 deletions(-)

