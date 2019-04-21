Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=i8euMYw/OgPIkqTb/fgtrX5Df+di6sNjWMvlpaLPJ8I=;
        b=R3pG2aCeS0SIT5LDcnuCS6wnuVHJpePW1f5zAg03IVxW5Si1YQeHUl3sBUl6rASb1X
         FsWUqysNO09cHw13pGER7TYxubZW5uHau+umDZPoV2/XmpJzly+ZhECR4rlC3nt56Ckc
         XyEvP5yB8WbbEeqEUhAJrzxe10PyHZe2sjj15WuYJsRAWa5SBdyDo1YzyPsIvPU4Z1nR
         ARmX6/mrNbG48qLeCF8NkJ8TtQdnoy4XKu9fX0Ks2geY5S1302SjfUVk8fJZBDToifOr
         XIa55leZJqWxzMLPXbKmJ59Zhtjp3t6MbEyPlbR8OQpkHeawAzISO9OXaopMfumKQ/SR
         DlIQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] Updates and fixes in defer/hazptr and formal/dyntickrcu
Message-ID: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
Date: Sun, 21 Apr 2019 19:03:35 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Your latest commit 50c5b95d30bc ("defer/hazptr: Add discussion of
hazptr_free_later()") embeds a code snippet in .tex which can be
extracted from hazptr.c.  My guess is it was easier for you to do so
rather than to tame fcvextract.pl to do what you wanted.
There is an option "gobbleblank=yes" to suppress blank/empty lines
from appearing in the resulting snippet. I couldn't help doing
it myself.

Patch #1 does the necessary changes in hazptr.c and embedding of
line labels.
Patch #2 is a trivial typo fix I noticed along the way.

If you encounter any conflict, please skip patch #1.

Patches #3 and #4 are the followup changes to formal/dyntickrcu,
including the addition of Linux kernel version info. Please refer to
the change log of patch #4.

        Thanks, Akira
--
Akira Yokosawa (4):
  defer/hazptr: Extract snippet from hazptr.c
  defer/hazptr: Fix trivial typo
  RCU.bib: Add entry of git commit of Tree RCU
  formal/dyntickrcu: Adjust context and fix typo

 CodeSamples/defer/hazptr.c |  77 +++++++++++++------------
 bib/RCU.bib                |  11 ++++
 defer/hazptr.tex           | 113 ++++++++++++-------------------------
 formal/dyntickrcu.tex      |  31 ++++++----
 4 files changed, 108 insertions(+), 124 deletions(-)

-- 
2.17.1

