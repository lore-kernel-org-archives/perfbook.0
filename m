Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=E1vA8vNYznxpSpP9HH9ehu8r22FFcB/PHvz0E07Ps30=;
 b=0jFhykwlOPUOIiFb4sIY0PSWp58ZKk+F3dIxgqhUMCN9uMWj5resQOUCvXwHaTcuOI
 8wZVLHqE9ei8ICa6Jm0Apx6/3oNXuLu0/WwuufJh0otW4OjRKiwWuc5FB7u5zsLstrYL
 /+VXAoCkyzyPJrxmKh6T7xfS+cbdVBcmin8+SufaHQxI0KTPov+uSecusK9+oYI0RKPG
 ug0koFRrez6ahWCbW/Lr+kttOvGuj/qHD1xbQrzZ4e/Un/n9LiaEiGMk9ZU4QzjibA3c
 5jo7J8Te3SlppP0oYUbiDbNoI4kUNw1w+SlZRWb3idWeqjgAlAqPpX+j1JUBxqVMrlk9
 dFbg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] qqz and runlatex improvements
Message-ID: <5718E390.1090309@gmail.com>
Date: Thu, 21 Apr 2016 23:28:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From a5cb77713f4720592f75db71394fcad784ca480e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Thu, 21 Apr 2016 23:02:59 +0900
Subject: [PATCH 0/2] qqz and runlatex improvements

Hi,

There have been two issues that bother me a little since I began to
build perfbook.pdf myself.
One is the cross-link references of quick quizzes that land on random
nearby places in the PDF.
The other is the premature termination of make with warning messages
displayed.
I think I have managed to fix both issues.

However, .sty file modification may introduce regressions and
should be fully tested before being pushed out. Can anybody on the
list test it and give feedback?

Thanks.

Akira Yokosawa (2):
  qqz: Improve accuracy of cross-links
  runlatex.sh: Fix while loop condition

 qqz.sty               | 14 ++++++++------
 utilities/runlatex.sh |  4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
1.9.1

