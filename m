Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=E6pc9vpRBLALZExNstmkigSSbzMWVZb65PjoQkArYPE=;
 b=kxd4MErcnEldXvx6LvC/Bhy1ZEUcn17EuPB+fbXPYFGCfLJX+QGZWTxudmOSB7WLqd
 t/d/RCJC8YSfpQxi7ZJeeJFL1t4JG/XbJqwH3gy0yQeDFQswMpMsDFip/aL/RbZiiZbe
 qGzmVqK4IN99QEVuGvt73Ixbr60EYO5FbYEetWe9KCZtBxIpK/SyhfL6wR995f0eVwKx
 JTM9THUyQh9dOwWvtPpPoe2QZVflOLexTo2iElCI4jZ+BaZV5caDcMBXbGcj7sooFAxU
 NQTX6f+mGZqZaJabNZyfw48uVw5VZfI/OKcb2wm4ckCRe+kt3KGQR9UZC7ZRyDnJSE50
 TDdg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Fix layout hiccups in answers to quick quizzes
Message-ID: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
Date: Sat, 4 Nov 2017 10:38:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fa20d77f7a35114dd6bf93e362b44235b163f1ad Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 4 Nov 2017 09:01:08 +0900
Subject: [PATCH 0/3] Fix layout hiccups in answers to quick quizzes

Hi Paul,

This patch set picks up some minor tweaks regarding answers to
quick quizzes.

Patch #1 adds a couple of patterns to hyphen2endash.sh
Patch #2 adjusts line-break position after nn-mm so that the pattern
added in Patch #1 can be applied.
Patch #3 fixes some layout hiccups in answers to quick quizzes.

      Thanks, Akira
--
Akira Yokosawa (3):
  hyphen2endash.sh: Add patterns for 'nn-mm days' and 'nn-mm sheets'
  cpu/overheads: Don't break just after nn-mm
  Fix layout hiccups in answers to quick quizzes

 cpu/overheads.tex             | 4 ++--
 defer/rcuapi.tex              | 7 ++++---
 defer/rcufundamental.tex      | 1 +
 memorder/memorder.tex         | 7 ++++---
 toolsoftrade/toolsoftrade.tex | 2 +-
 utilities/hyphen2endash.sh    | 6 ++++++
 6 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.7.4

