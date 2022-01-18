Return-Path: <SRS0=7ZAc=SC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=W6VGkswfjwxs8S8CPk+zXGtApE/d3WMYU2zxk2YugtM=;
        b=mHjOrC+psIuuOdoVydNmo96+btxmjVmD9h6oHdRSZNFwad8FA2+l5lXQZ8SYfcB2iL
         8BTiGJ4HyptvMpkxAy9lmyAlcztATyEMOJCCebkrCvRJy8Q95F0E+n9LJFxWLqk4GC9N
         quimgS14fSOOZreh0Wnj3YPRy4r0F+yieEAfltWFARMAU4l0t80Me5547AC4S6rnVqu0
         lyfOj9L2hCxWMHrUtPIXlF2Owxb08po3hpikmhr7J5LO8XdJgjmllybJd8LDTNwQzxWQ
         kMIRhQRc1he+szipHIpZBJZlTRx5ZOiEKK4F+OeXVkl+/z2Bd7kIxL1+cMoh2Cz8HJvS
         WlaQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/6] index: Support emphasized page numbers
Message-ID: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
Date: Tue, 18 Jan 2022 19:51:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So this patch set is an update of the WIP series you looked at the
other day.

Changes since WIP (other than change logs):

  1/6, 5/6: Preserve adjusted .idx files as $basename-adjust.idx.
      Add adjustment samples in header of adjustindexformat.pl.
  6/6: Concise prenote of general index.

        Thanks, Akira
--
Akira Yokosawa (6):
  index: Initial page number format support
  locking, defer: POC of bold face page number in index
  defer: POC of hierarchical index with modifier part's case preserved
  index: Add prenotes of legends
  index, glossary: Underline page numbers in Glossary
  index: Retouch prenotes

 defer/rcu.tex                  |   2 +-
 defer/rcufundamental.tex       |   2 +-
 defer/rcuintro.tex             |   2 +-
 glossary.tex                   | 176 ++++++++++++++++-----------------
 glsdict.tex                    |  10 +-
 locking/locking.tex            |   4 +-
 perfbook-lt.tex                |  67 ++++++++++++-
 utilities/adjustindexformat.pl |  42 ++++++++
 utilities/runlatex.sh          |   2 +
 9 files changed, 211 insertions(+), 96 deletions(-)
 create mode 100755 utilities/adjustindexformat.pl


base-commit: bf4794df366d2cf87c2e9cf177f5169081138a23
-- 
2.17.1


