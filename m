Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=9TIZaBZNYuDdi3Z/WtI/6f5vG+lgtJ/v734E3HdBSOo=;
 b=QBCYu94AzUL7au0x1senwovKsZjXmnMOXOcOVfjWRlis4zyvJUl5H8HBFnGlNb1s0S
 cPqCx2fJQHoqz/TSi6xsJ1wRc9jQVfhhILd2PhZol1bmszw4bCBbvNo4d8N7aONUPZoz
 RCafhS/f1mi1ADbZ2afAdHWT1ybGDzmwtJBCTbpgoYDMFAMikEVWSU1ty7Am8N+rJ4yp
 7nlA1h3Wyn4hzyg/BRVngLPfHufzI6AWwbwfh4IIA02n0JMKwhzaUrobhl84LEMSSU7b
 Ssw51zRJpImLVHIa7jS9T7/dcZWJXnZektQAu9XtUuiGRvMECNAr8jbb5VyYYKQepqIu
 wIRg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] memorder: Update table layout
Message-ID: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
Date: Mon, 25 Sep 2017 07:00:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From acefbb69d69562438d7a7568f671fc85528d5b5f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 25 Sep 2017 06:38:06 +0900
Subject: [PATCH 0/5] memorder: Update table layout

Hi Paul,

My first thought was to update a few experimental tables to catch up
the changes in memorder.tex.
But these new tables are likely to change further.
So I changed my mind and converted the 5 tables in memorder.tex using
the new scheme of shading alternate rows. 3 of the 5 tables are already
presented in the style guide.
In the memorder chapter, we already converted code snippets to the
"listing" environment. So using the new table layout in this chapter
sounds reasonable to me.

Patch #1 updates already experimented tables and a similar one.
Patch #2 is an attempt to apply new scheme to the remaining table.
Patch #3 is an improvement of the table changed in Patch #2.
Patch #4 removes experimental tables in style guide.
Patch #5 is a separate patch to improve MoreThanOneValue and
MoreThanOneValue-15CPU figures.

I'd like to know if the changes in Patches #2 and #3 work with you.

        Thanks, Akira
--
Akira Yokosawa (5):
  memorder: Convert tables to alternate-row coloring scheme
  memorder: Convert 'Summary of Memory Ordering' table to new scheme
  styleguide: Remove experimental tables updated in memorder chapter
  memorder: Add multi-column headers to 'Summary of Memory Ordering'
    table
  memorder: Reduce color saturation of MoreThanOneValue figure

 appendix/styleguide/styleguide.tex  | 113 +---------------------
 memorder/MoreThanOneValue-15CPU.fig |   2 +
 memorder/MoreThanOneValue.fig       |  26 ++---
 memorder/memorder.tex               | 183 ++++++++++++++++--------------------
 perfbook.tex                        |   1 +
 utilities/MoreThanOneValue-15CPU.c  |   3 +
 6 files changed, 107 insertions(+), 221 deletions(-)

-- 
2.7.4

