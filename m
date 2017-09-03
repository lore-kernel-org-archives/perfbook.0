Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=1wjdVTvTFwOMxp3S2+YnTtD2je/HGqCetJscOWEDhJc=;
 b=XXLv7qEDJBaaEMjMsE134XVck9oE3MLLSkl9wotSmpQoY4Ix90aozOJGFanFnJnc2T
 889QbLC6gq3mdw11rIQPbfa1oy8UqAsnJ376ShEp8sg9DTZodpz3DYtJDfHt4VuHrmMb
 8VSS29tP6HkSPMOnWgmTTiNKOjG1HplzuV1zwwBFi5xGXeYOTpisu3zsBeRAlvjO2pmX
 raHhSQ1X6ZbPlJNkqj8C6e70OLewmsGauRKipWjjlOs1vB3LzfftMVul5s327cPl6ocE
 Y2uCz+u5j5ye3TeTxfaNtJxoMdeHzVH3KHB2bhOUlsxSBThr3XDO1O/7uB2JD+9zEWaZ
 c5nQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Style guide updates
Message-ID: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
Date: Sun, 3 Sep 2017 23:54:19 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 91874614a21874550a5d9ffa3d0fba5f6d6416f1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 3 Sep 2017 23:39:54 +0900
Subject: [PATCH 0/2] Style guide updates

Hi Paul,

This patch set adds a section of ellipsis and a couple of experimental
tables corresponding to new tables in memorder.
Booktabs' rules and gaps in mid-rules still works in these tables, I
suppose.

Let me know what you think.

    Thanks, Akira
--
Akira Yokosawa (2):
  styleguide: Add 'Ellipsis' section
  styleguide: Add more experimental tables

 appendix/styleguide/styleguide.tex | 206 ++++++++++++++++++++++++++++++-------
 1 file changed, 169 insertions(+), 37 deletions(-)

-- 
2.7.4

