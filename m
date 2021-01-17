Return-Path: <SRS0=Srvm=GU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=UvdTQ15t5U6l4fKNvWDRJxGXugb8NiTDkcBQ1zGc7M0=;
        b=lQQUlr6tEWK0QTp1Qt9JwujTVzRunb76CoRoN8iyojZ/dtKVvpO8MtTy/XNysfYj+W
         mwgZMbThNXXkN6OFn0sgPcXjFISabWl7ksmqK3kditsPvklk0HxcET3TEUOATudVQRWy
         6c8wEEkMooSWkccmhtZXB8tEsOZqdYIMbip1s0VvK9GschqTTjbXmsCYvnjpMGuUAUn4
         E9SzKHWHBVEZ5qfOdhF7V6ijLJGLa7m/dFqw83IO4WPU4Y4DlijntXZRJz6yDIFzF8Dk
         LJWSWtLkEp16IvrAko3sERZ6qpfNPxoNxvFS1e/MyKlT/t9vTZIS02HK48MNjb1VXqH2
         2zdg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3 -perfbook] Makefile fix and RCU test bar chart update
Message-ID: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
Date: Mon, 18 Jan 2021 00:02:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set is last minute updates for the Second Edition.

Patch 1/3 fixes a regression resulting in the "(m)" flag in the
watermark of footnote area.  It can happen only in parallel make
of first build. See the commit log of the root cause of the false
flag.

Patches 2/3 and 3/3 are my attempt to update Figure 12.4 to extend
the bar chart up to Linux v5.10.

I thought all I need to do would be to append data of v5.x releases.
However, when I ran the rcutorture.sh (for the first time), I noticed
the differences in line counts of RCU code of previous releases.

My guess is that when you collected the data, your Linux git
repository had some untracked file(s) which unfortunately matched
the wildcard pattern in the script.

Can you check the data on your own?

Also, the discussion of the evolution of use of validation needs
some expansion to mention the trend of v5.x era.
Especially, v5.0 had a spike in test ratio.
A new trend of RCU code increase can be seen since v5.8.
Can you add some explanation regarding them?

        Thanks, Akira
--
Akira Yokosawa (3):
  Makefile: Fix timing of autodate.tex generation
  rcutorture.sh: Add "rcuscale" to test code
  formal: Extend bar chart in Figure 12.4 up to Linux v5.10

 CodeSamples/formal/rcutorture.sh |    6 +-
 Makefile                         |    6 +-
 formal/RCU-test-ratio.eps        | 2373 ++++++++++++++++--------------
 formal/data/plot.sh              |    4 +-
 formal/data/rcu-test.dat         |  149 +-
 5 files changed, 1344 insertions(+), 1194 deletions(-)

-- 
2.17.1

