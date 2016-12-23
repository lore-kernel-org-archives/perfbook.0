Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=XOqxCZdyuN9UZ1suXpCLGk631NE3ttkQcBAbAZZe/xA=;
 b=lW3Io/bNO+EOYhho74q9KpTuxBciJ8GHgh7P7eRNVdYMERpDsuv9sEXBkORYu5yHhh
 yCFj2+1bOc5q667k0yKXRJZ6ZlwWnSI+GFgFxiTgWBP1vxN88XLSGDXarlgDqfnxRvH4
 WnmJ1QRNVTXS170o1glUu83lrikJnVloJgcOLHBHwBBh81SsMtqIjW/IxiC/Sd4eGLPC
 zEXecT6jwU6Bfqv9/zk5eAr1yBObUVC03JpigMqxzqkRlBX4ySYMkL1mEqZ5Q7k/k7LI
 c5aMkw9dmx/4BV5Bdr6EgnpSB5bd25GC4DsCEEjlBfdwTBbEwYf8HSUGMN3zJYRe5SKJ
 vpyg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Patches for recent updates
Message-ID: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
Date: Fri, 23 Dec 2016 17:07:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cbb7797d6b307850a280248589bc09b8852e8a68 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 23 Dec 2016 16:46:06 +0900
Subject: [PATCH 0/3] Patches for recent updates

Hi Paul,

This short patch set consists of fixes to recent updates in
advsync/memorybarriers.

I'm not sure what is your preference of quotation of short variable
names and keywords. In the 1st patch, I chose the form of ~~\co{a}''.
If you prefer other one, please let me know.

Ya, I know a variety of styles are mixed-used in perfbook,
reflecting various original publications...

But at least within a (sub)section, it would be better to keep
consistency.

                                                Thanks, Akira
-- 
Akira Yokosawa (3):
  advsync/memorybarriers: Use consistent quotation marks
  advsync/memorybarriers: Fix typo (READ_ONCE -> WRITE_ONCE)
  advsync/memorybarriers: Fix trivial typo

 advsync/memorybarriers.tex | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

-- 
2.7.4

