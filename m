Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=x14f8GzD0qZLYmVodWBazeMgRnlGkzb8XsmQQ7U+tf0=;
 b=OEDX9joZL9CQuEAtxYkvFo9m57+5dK01mPq8NwFGyb4QwgXnTDeczEexIwElEJ838n
 5rvW1sC2Iwq+4zQtBXIyj0jbnGfskvBnmnXeSOkScxXgPfctoCxb1TPKZ94TMW5pZsuZ
 hMEn1eCi2aQmszFfEcWWVIDncfz346iZ64u636enGLbUSbAHgbK+LSCnsmnR1FM7hB7X
 sRAls6GMeuFV64OqUdKd8mQxHv9HiASbxBRKzE5AmqCV0FkCTP70UNwPuazZgY+fXo10
 HcnwSJ33GFlUUmC3fUnSOVM6vRXlC/5zAH4vuCN5kct9WA7Ey/fe2ad2xfYkGWLtQK8C
 1OzQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Makefile cleanups
Message-ID: <dee02541-574c-3686-8dc7-5cb02303a408@gmail.com>
Date: Fri, 14 Oct 2016 07:05:35 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3fc3583818c9103ef2d1c01516b362c4b6768604 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 13 Oct 2016 20:51:46 +0900
Subject: [PATCH 0/2] Makefile cleanups

Hi,

Here is a patch set sequel to commit 0e6e192e6ea7 ("Makefile: Use
implicit rules for various layout options").

1st patch shortens some rules by using automatic variables.
2nd one gets rid of apparent dependency rules like "1c: perfbook-1c.pdf"
by using secondary-expansion feature of GNU make.

Now almost all redundant rules have been removed.
There is no change in the behavior of make command.

This set is a by-product of my attempt to try some alternative monospace
fonts to be used among Times Roman text.  To give you an easy way to
compare candidates, I'm preparing patches to add a few make targets, but
not sure where it goes.  This cleanup set seems worthwhile on its own.

                                            Thanks, Akira

Akira Yokosawa (2):
  Makefile: Use more automatic variables
  Makefile: Use seconday expansion

 .gitignore |  7 ++-----
 Makefile   | 28 ++++++++++++++--------------
 2 files changed, 16 insertions(+), 19 deletions(-)

-- 
2.7.4

