Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=oPNiGebOOx7nXhpOGlzsfuWKNWLDVyTd6d+9TasMtgM=;
 b=n3WlvnwF7KQVsJlJlVT0UoGaWlf99OcR/fAopATirP7GQNvlQnePH6UCvUvr5cVI/g
 TODPdU/NyKtCRPyxiZiQIYIciDrRW4XJXLrh7iaCgEwxFdkKHKfywOSpMUYifhFkjnGg
 cbucCo9ibpS5AqIYEM+osDmR3pxNdMfHia79dQMoh9X1CAGkv4t4kzupaUR2MFoHGf0i
 ggKGznseFr+WsWCw6BnrEaDElVbRKvMEuUdpsIKDwYlXCmBu4XC9FrQn91DIZKDDPZB2
 4Cg8jCfEZCj7M5lDEYElOuC410eDkVFPw0d6BrZLPSV9EOhz4GiQhX3sKBkcD8BBAqIp
 T2tg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/4] Fixup trivial nitpicks under defer/
Date: Fri,  1 Jul 2016 09:43:50 +0900
Message-Id: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset contains fixup of trivial nitpicks that has found during
translation of defer/ directory.

SeongJae Park (4):
  defer: Fix typos
  defer: Insert missing tildes
  defer: Add missing dot
  defer/seqlock: Fix wrong line reference

 defer/defer.tex          |  4 ++--
 defer/rcufundamental.tex |  6 +++---
 defer/seqlock.tex        | 14 +++++++-------
 defer/toyrcu.tex         | 10 +++++-----
 defer/whichtochoose.tex  |  2 +-
 5 files changed, 18 insertions(+), 18 deletions(-)

-- 
1.9.1

