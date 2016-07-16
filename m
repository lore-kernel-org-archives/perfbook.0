Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=bPchfhUeuQoM7kwksImEN55FXPZw6rS6cf/rveExekY=;
 b=DXFQVpqU/qjQ6uT27JsnGqIu1lUzVfCTnBRjQswJUL/07ZWZzDx7qwrQSvpcAGuhLf
 pFRxoJky1s7bp0S2KEKm6BcCpBVzkWfhHzGHKaMsldAjRDliaDV2NRDFMoQuhDbEt45Y
 MiXMJsHdcQNFh3cFDo7XsANJ4UsV1G6/2NAN0Lsq+wLbY7BpUWs+P0snpWRV5XTqjmBI
 9sT7Yyt9LGM0IQzxGG81DzA+Sw7OvTIUXEIn2S63w8g08mowGKiRSFOb0zpVdVm1P0iY
 5sR6Qr9Et/rahUMm/Fa+suYVzCVOlxzBcO1MQDGMBMQVNHxH3gB5Up3tFwss3Bxiklxk
 gU4g==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/4] Fixup trivial nitpicks under defer/
Date: Sat, 16 Jul 2016 16:58:46 +0900
Message-Id: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset fixes trivial nitpicks under defer/ that found during translation
of upstream change since July, 2016.

SeongJae Park (4):
  defer/refcnt: Add missing dot
  defer: Fix typos
  defer/whichtochoose: Trim a sentence
  defer/seqlock: Fix wrong code line reference

 defer/rcuusage.tex      | 2 +-
 defer/refcnt.tex        | 2 +-
 defer/seqlock.tex       | 4 ++--
 defer/whichtochoose.tex | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.1

