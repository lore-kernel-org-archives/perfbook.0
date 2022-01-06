Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=AEtjzSc/G+HyLIOEq/eTi7pTXhMqUv2iHEzaRl75Alo=;
        b=oD+4zOFNQhp9vnTQmwVPF/YKoWfu+SKZrsAc3IZ57sIOJ6BIIL2vukppzA75K9DZTI
         i2JpB5ubbE/qYKzhEJKSA22RDaOY4Btw55vkca62ob7KbIPD0j1s+NzgJlayb+RL8bRh
         zR3hBtLAG5tRtQ3xs4usiUd9ujN2pVRsSXgK5f0+VNghvr7aSGRY0Nvpkjk7wtQ/mmzK
         tdlQJAzR81GO4n3TtxENm2hi18JwMAqWHAFmbIZFRc90GBz+Tv3HewoxLgsQ//fFeE4y
         fl6rWqZLQZ4c/yVJW4VJcT5ktyxrJa9l5oAS+Td4N2jCq1Mx3dhnIWZTEii+6k1GbPKd
         WEPA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH RESEND -perfbook 00/10] Index and acronym updates
Message-ID: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Date: Thu, 6 Jan 2022 16:29:25 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is another round of *never-ending* indexing updates.

Patches 1/10--3/10 add indexing tags to terms recently added in Glossary.
Patch 4/10 adds API indexing tags in rcuapi.
Patch 5/10 fixes a typo found while working on Patch 4/10.

Patch 6/10 adds indexing tags for userspace-RCU APIs in datastruct.
Those APIs are also used in code snippets of other chapters, but are
seldom mentioned from the text in later chapters/sections.

Patches 7/10 and 8/10 add API indexing tags in count and locking.
Patch 9/10 defines acronym of QSBR and adds tags for QSBR and EBR.

Patch 10/10 defines acronym of RAII and adds its tags.  The "WIP" in
the title indicates changes in the appearance of first-time form from
quoted string to emphasized modifier form.  Please keep it with the change
log amended if the new appearance looks good/acceptable to you.

        Thanks, Akira
--
Akira Yokosawa (10):
  index: Add tags for 'reference count'
  index: Add tags for 'existence guarantee'
  index: Add tags for 'type-safe memory'
  defer/rcuapi: Add index tags for RCU APIs
  defer/rcuapi: Fix typo 'get_nulls_values()'
  datastruct: Add index tags for userspace-RCU APIs
  count: Add index tags to APIs
  locking: Add index tags to APIs
  treewide: Add acronym tags for QSBR and EBR
  WIP locking: Add acronym tag for RAII

 SMPdesign/SMPdesign.tex       |   4 +-
 appendix/toyrcu/toyrcu.tex    |   3 +-
 count/count.tex               |  16 ++---
 datastruct/datastruct.tex     |  14 ++--
 defer/rcuapi.tex              | 120 +++++++++++++++++-----------------
 defer/rcuintro.tex            |   3 +-
 defer/rcurelated.tex          |   4 +-
 defer/rcuusage.tex            |  11 ++--
 defer/refcnt.tex              |   3 +-
 defer/whichtochoose.tex       |   9 ++-
 future/tm.tex                 |   3 +-
 glsdict.tex                   |   2 +
 locking/locking-existence.tex |   2 +-
 locking/locking.tex           |  20 +++---
 memorder/memorder.tex         |   2 +-
 together/applyrcu.tex         |   2 +-
 together/refcnt.tex           |   8 ++-
 toolsoftrade/toolsoftrade.tex |   4 +-
 18 files changed, 118 insertions(+), 112 deletions(-)


base-commit: 3cc2d7eede268930304b35fdce6121e18b2ceef6
-- 
2.17.1

