Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=1jffiSacozsKRWsqntAJj9H0niEymvfRjpRwiyNkIT8=;
 b=BFcysc77wP1+nqi3xlIr5DgM2pEucElty9bMhm090bCeVlLPxuy96nkPMA5DzkXvZp
 Tt+O1cNOzlSBkZP8PCblqziuJach5Lnt8rqJYh8t/zW//O4pcfvjRbwpFuFMkG1kwjKN
 hmSYyUjcvobALAcZK85z39vOGQ3m/g/UPhE1jBX7FbnfvkzLY/D86GpQIRalsmypDvby
 KB/8HT+wqEfmb8RkeJSXqLW6BWJkrrZGNOCtFXV///RtFLiJdKpJxVHp/iFtuE8JHM/r
 LH7NrRlDXEJW+qFgxy9WHKU5WAYH5XGFNNX0t40tTlTIBNKaTouYn8Bxl8NU9Tt5CUEV
 G4qA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] Misc updates and fixes
Message-ID: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
Date: Tue, 14 Mar 2017 07:43:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 93e02eca9bb8361be47e0936f5d2ca56586bc093 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 14 Mar 2017 07:38:12 +0900
Subject: [PATCH 0/6] Misc updates and fixes

Hi Paul,

This patch set contains misc updates and fixes I noticed
while comparing current perfbook contents and your draft LWN article.

                           Thanks, Akira
--
Akira Yokosawa (6):
  runlatex.sh: Refactor further
  formal/spinhint: Fix typo
  formal/spinhint: Adjust option of enumerate list
  formal/spinhint: Refer explicit Figure labels
  advsync/memorybarriers: Refer explicit Figure label
  advsync/memorybarriers: Distinguish 'CPU family' from 'CPU'

 advsync/memorybarriers.tex | 13 +++++++------
 formal/spinhint.tex        | 16 +++++++++-------
 utilities/runlatex.sh      | 27 +++++++++++++++++----------
 3 files changed, 33 insertions(+), 23 deletions(-)

-- 
2.7.4

