Return-Path: <SRS0=3esZ=IR=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=jy8PjE9oCJ8Yr9+ZQDX4LY/i1LOjfKbypS1XScjhbn4=;
        b=muVP7lsgoDVgrmemYapY2M4uQhRK2WUbj43OFJVixCb6FdwicDSfEFrxhwjsRBxK6z
         jeJcz/Zu5SLzO/XSDcpOxeSboefIUNgp+GK4SaJpW3WowjJC4yLCVudDwYQND/cHtUg/
         mjWih6eAzQH6l7hfJaCaeEZyNiiifMPgagnnp6rNmzNgrkYUkEO1e8R7XKVZbui7F6vI
         WrH8Jge5rfOlCyrggKH4Uc9b1kAPc67WcSxCFbHkQqi3bXbVNDPNk5yv2cwNG9StqqGA
         BQ1zAGil6QZOohHRQ4+/8U50p1o59Vw63W9maYvCLaMm6rHcbMh3/MhaJwm/aPdS4bXz
         DoIg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Minor fixes and update for Edition 2, take 5
Message-ID: <6e94b800-3cc0-3837-6fc7-4d330dad45d2@gmail.com>
Date: Sat, 20 Mar 2021 00:01:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Today's pull request consists of minor typo fixes and an update only.

However, I'm not sure if Patches 6/7 and 7/7 are really the right fixes
or not.
So please have a closer look at them.

        Thanks, Akira

(Please find a PS. part at the bottom.)

---------------
The following changes since commit 82599ee517da15ce3957bc94b82f8702a2357d14:

  memorder: Fix typos and grammar, take two (2021-03-18 17:29:17 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.19a

for you to fetch changes up to 0b1692098fb87a4c1d5f2fec9c078ee4462aac85:

  advsync: Use Oxford comma (2021-03-19 22:19:10 +0900)

----------------------------------------------------------------
Akira Yokosawa (7):
      memorder: Fix staccato of 'another'
      count: Fix typo
      count: Move ',' to proper position
      toolsoftrade: Fix typo
      toolstotrade: Use path of atomic_t.txt under Linux-kernel source tree
      advsync: Fix typo
      advsync: Use Oxford comma

 advsync/advsync.tex           | 4 ++--
 count/count.tex               | 6 +++---
 memorder/memorder.tex         | 2 +-
 toolsoftrade/toolsoftrade.tex | 8 +++++---
 4 files changed, 11 insertions(+), 9 deletions(-)

---------------------
PS.

Looking at the Glossaries, I thought entries of "Concurrent"
and "Parallel" were missing.

And you use these words almost interchangeably.

(In-)distinction of them is the topic of Appendix A.2.

So maybe it might help readers to put a footnote near the first use
of "parallel" telling that in this book, parallel and concurrent are
used as synonyms, and cite Appendix A.2.

To make this point even clearer, adding entries like

  Concurrent: In this book, synonym of parallel.

  Parallel: In this book, synonym of concurrent.

in the Glossaries might help readers.

Thoughts?
