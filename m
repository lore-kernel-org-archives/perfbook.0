Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=vA4CYOHbWgupdz7TENYtnbjPxS9rMCAS/rsUcFxEkeU=;
 b=V3Sx0DNbdkQQ5VW32L4liu4oSZZow/Wxl+Ut+LYcwAKXzbVSIu75C01CsdKXtkeevE
 uVA/7UQEdpZqLK3SxL3125gfjE/Ye9sm0qX3a30zTVUibNeB1Ir9eO5oj3GJDxM5TKK+
 y6iExz4w4y7vwtAIIES6LzVyjWQZPuK863ArMcfwD7HOH58xv2dj04Tj6PazxeByemte
 iCeWEJKjgfC4reFrVd0yT5tnTlw5/2T2WrG/5BmOK36sWmC1xSQdAvoCAJeHxbElZroe
 nFLTYiLY3hxcdCXz0sgNyV9GOaHdtpnQwcjotG8Adc5OigC8EUt8GgY+yVY1EYzxtvXp
 oftw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] Add target for "Latin Modern Typewriter" font
Message-ID: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
Date: Mon, 13 Mar 2017 00:36:56 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2f6614cdf5e1b0f7da9a5c05833dbc4a251eaa9c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 00:10:31 +0900
Subject: [PATCH 0/4] Add target for "Latin Modern Typewriter" font

So, this is a patch set to add yet another target for alternative monospace font.
While preparing this set, I found a (not serious) bug in runlatex.sh.
In fixing it, I refactored the script so that redundant code can be removed.

Latin Modern Typewriter font is based on "cmtt" (Computer Modern Typewrite) font.
I see that some of your articles cited in Bibliography use it as monospace font,
and they look quite good. cmtt is said to be not suited to Times Roman font
because of its short x-height, but as we are using scaled courier font,
it should not be a big deal.

Please try the target "mslm" and let me know what you think.

                                Thanks, Akira
-- 
Akira Yokosawa (4):
  runlatex.sh: Refactor by defining functions
  runlatex.sh: Fix typo in grep pattern
  runlatex.sh: Add more lines of grep output around warning/error log
  Add target 'mslm' for 'Latin Modern Typewriter' font

 Makefile                   | 11 ++++--
 perfbook.tex               |  3 +-
 utilities/runfirstlatex.sh |  3 +-
 utilities/runlatex.sh      | 87 +++++++++++++++++++++-------------------------
 4 files changed, 52 insertions(+), 52 deletions(-)

-- 
2.7.4

