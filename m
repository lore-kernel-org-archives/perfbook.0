Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=OORnO2l6HoTXgzi1rSuuWd37cuwMVaJRvXuakxuLctI=;
 b=dJaF20ps1bqkxppWy3yCi0XqLOUbromCNYcYlwAjqSzEi9kRMwSq9qlCuJ4bO0Sgx6
 3/16OtS4WNXZwk45Ml+KySy69/zbwYHTY9DdEmuW0HP4n5VwJ5D+6VT9dAayfyP4rU6E
 rSXfLOC9q+KLRct8rlxW3/ewkkoCE2MmliV8Xny3o/sRvdhrE7wKwhYJYOgEtQvjvzFH
 1r2W0qg9AjHUMmvzunMPHBzFoFdk2tSHaeUJpjQXgjl4bMnjvsd8rNGd6Rzh7DmM0pzR
 UTDntA/j8xGWDa5Q9d5u06e1UsNg+PWOB3TSJ1MIFYUzHhn82GQy6TibgOWW+oAxbtCv
 cI0A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Miscellaneous updates
Message-ID: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
Date: Fri, 27 Oct 2017 07:49:47 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 263fa8f220207903d6c41bddb773b113b65dd98f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Oct 2017 07:23:35 +0900
Subject: [PATCH 0/5] Miscellaneous updates

Hi Paul,

This patch set is a collection of small fixes and tweaks.

Patchs #1 -- #4 are trivial fixes
Patch #5 shrinks/enlarges figures which were too large/small.
(I like those penguin cartoons, but ...) ;-)

         Thanks, Akira
--
Akira Yokosawa (5):
  memorder: Fix excessive uses of skips in midrule
  memorder: Parenthesize properly
  defer/rcufundamental: Adjust hspace for 1c layout
  together/applyrcu: Use upright gryph for descriptive suffix
  Tweak figure size

 SMPdesign/SMPdesign.tex     | 14 +++++++-------
 advsync/rt.tex              | 12 ++++++------
 appendix/questions/time.tex |  2 +-
 count/count.tex             |  4 ++--
 defer/rcufundamental.tex    |  4 ++--
 future/QC.tex               |  2 +-
 future/cpu.tex              |  4 ++--
 future/tm.tex               |  4 ++--
 intro/intro.tex             |  2 +-
 memorder/memorder.tex       | 10 +++++-----
 together/applyrcu.tex       |  8 ++++----
 11 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.7.4

