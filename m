Return-Path: <SRS0=dwV0=3F=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=1Zmhqml8r4m57+nXGScx/daPX4xQ73JZn4m9R1j2VHw=;
        b=DwVNFqtyEhtYTmjIhxyxp2ixSW2bT9Z2hdtVTVI55YshdkrU6UZLJHltvUwjfO74oW
         VMS4D6zJETqfLZZyUkFf48oFEVTNRWpAwhFCUs9tZQPd5xjIzSiE0qa4nLP0PLLj2ADI
         by7n8WJozP0M/63Ia899gfNuIlTWlMCun7x4zSZBBlobXuTBR/gHm6b3Ss9VZeUa+te1
         2xYIfOeXoK3+qHgbbgIILWIFDdAxLAkL1Gz4xdk7FaIAvR+9EvbVvXc8+40Kc/k8HBd4
         9XuDxnnBb44xFLDuS56neo793Qvm9AD+iFgoXOQCEvwqdgvQZLGpJsrSN6DbYHefSrqj
         4bqQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Fix for Fedora31
Message-ID: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
Date: Fri, 17 Jan 2020 06:54:19 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I recently noticed that on Fedora 31, there are a few .svg figures
which don't look they should do.
It turned out that Fedora 31 upgraded pango to 1.44, which doesn't
support type1 fonts. StandardSymbolsPS.t1 we used as an alternative
font for Symbol on Fedora no longer works.

Patch 1/3 updates fixsvgfonts-urwps.sh to use "MdSymbol" font
instead, with the existence check of the font added in Makefile.
It also removes a couple of unnecessary rules around symbol fonts
in fixfonts.sh and its derivatives.
By this change, numbers in Figures 14.5, 14.7, and 14.9 become
sans-serif on Ubuntu, which look more consistent.

Patches 2/3 and 3/3 are independent "fixes" of possible typos.
I'm not sure they are the right fixes, though.
They are more like reminders to show you where I couldn't figure
the grammatical structure.

        Thanks, Akira
--
Akira Yokosawa (3):
  utilities/fixsvgfonts-urwps.sh: Use symbol font available on F31
  howto: Fix typo
  intro: Fix typo

 FAQ-BUILD.txt                  |  3 ++-
 Makefile                       | 11 ++++++++++-
 howto/howto.tex                |  2 +-
 intro/intro.tex                |  2 +-
 utilities/fixfonts-urwps.sh    |  5 +----
 utilities/fixfonts.sh          |  4 +---
 utilities/fixsvgfonts-urwps.sh |  8 +++-----
 utilities/fixsvgfonts.sh       |  4 +---
 8 files changed, 20 insertions(+), 19 deletions(-)

-- 
2.17.1

