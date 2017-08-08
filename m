Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=7uPa2b26FzVDPtZEk5+YsCEfPtauAMsUIgDPYQaSTDo=;
 b=qnAFior68ds48aJj3SwkS2VQWAYZCXwjmiSGbqsc+yjHnokpJFDqhP/Wx5KaDz877+
 IbaUanf5Ywy9qyNJJLSFn6ngs9G6yEdLEQAhkoaZOWEGrK+y3SK/bQI8VEJPfhRIRtej
 VbMNSp3jxSrEc9UEJAumNN6Mn0M4pVUnbd1CO9sX2pFKCmiY5s+Ip6Oly0jz/XebowVo
 I5U76p+1zwkMyzI8pQwAp338qN3Qsg6Yub+vNM+bwRhXxAaBjkmsT0AJy78hnMpmzBfQ
 Xr6C4XGSZFqopQi07TmLLTYeCCkVEALrhVQJc/q0kWNfcuqZDy2ivyWxvBKsFd17esWs
 iMdA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] Convert code snippets to "listing" environment
Message-ID: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
Date: Wed, 9 Aug 2017 07:04:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3a2394edf4c62cd0a051cf251d36702c6baa2c1a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 9 Aug 2017 06:42:58 +0900
Subject: [PATCH 0/6] Convert code snippets to "listing" environment

Hi Paul,

So, this is another attempt to give code snippets their own environment.
This time around, I used "float" and "subfig" packages.

The "ruled" style of "float" package (an example is presented in style
guide) looks a bit different from that of "floatrow", but it should be OK.

Patch #4 gives examples of grouping floating objects.
Grouping "ruled" style objects requires "subfig" package.

Patch #5 changes the label font in captions to bold face. It looks
consistent with the looks of the "ruled" style.

Patch #6 does the conversion in the "memory barriers" section.
The "ruled" style is not applied there yet. I'll submit a patch
to change the default style if you think the look is OK.

            Thanks, Akira
--
Akira Yokosawa (6):
  Define 'listing' environment for style guide
  styleguide: Add listing environment examples
  Use 'subfig' package instead of 'subfigure'
  styleguide: Add examples of grouping floating objects
  Specify 'labelfont=bf' option in captionsetup
  advsync: Convert code snippets and litmus tests to 'listing'

 advsync/memorybarriers.tex         | 120 ++++++++++++------------
 appendix/styleguide/styleguide.tex | 184 +++++++++++++++++++++++++++++++++++--
 perfbook.tex                       |   8 +-
 3 files changed, 245 insertions(+), 67 deletions(-)

-- 
2.7.4

