Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=9S8/kQUq/e2nzKrDBdPHwx+r/Q58QqMxc1t3OBjequE=;
 b=mGwAWjUFU/+1/TH9gd2xcBjDuXogmz2mfD0cHLIVK5e/ULQiEaBuZN05by5Wgd64fm
 WWB7UtMfYaqz/pNgFmzscnYATjOnixbfdrW+0l46dgvry8cHLekHPW2zGZEmRPOh+xsI
 XepnCLP1OvtNx1Qra4iWMixI0RFzmimc/rTcmvc0qYM8kbEQygKlm2WonmSv+i/oWGpa
 tFgk63lteLcYO+06WN9jtIye3do0HiyH6O3zYyymR1h5X60qKLQsVnkh7H1pR6D4P1sT
 izBw+zbE6cZwn4XPzfVikqbIv4/J7SoU+gWtyuFjQIiny87Ngz5blHW5rNBubpxWdLoR
 zs1g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 00/10] Tweaks to follow guidelines in style guide
Message-ID: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Date: Fri, 6 Oct 2017 00:47:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2890e0069882321553c16aac213d4bb8d0a06fb7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 5 Oct 2017 22:57:46 +0900
Subject: [PATCH 00/10] Tweaks to follow guidelines in style guide

Hi Paul,

This patch set consists of minor tweaks in regard to the suggestions
having been presented in style guide for a while.

Patches #1 -- #5 are trivial changes.

Patch #6 attempts to improve consistency in denoting POWER series CPU
by defining a macro "\Power{}".

Patch #7 substitutes "GCC" for "gcc". There are a few exceptions as
mentioned in commit log.

Patch #8 substitutes "IRQ" for "irq" in the same way. You might like
to skip this one, as I see "irq" more often than "IRQ" in Linux
documentations.

Patch #9 is somewhat invasive. It switches Times font to that of
"newtxtext" and "newtxmath" packages. The reason of the change
is to have access to both upright and slated glyphs of Greek letters.
Recent versions of these font packages give better looking result,
especially in math mode. As noted in the commit log, newtxmath in
TeX Live 2013/Debian has a few issues which have been fixed in later
versions. It also switches font choice for the experimental target "1csf".

Patch #10 updates style guide to reflect the changes made in this
patch set.

        Thanks, Akira
--
Akira Yokosawa (10):
  debugging: Insert narrow space in front of percent symbol
  debugging: Use upright font for Euler's number
  future/QC: Insert narrow space in front of percent symbol
  future/QC: Use non-breakable hyphen for axis names
  treewide: Insert narrow space in front of percent symbol
  treewide: Use \Power{} macro for POWER CPU family
  treewide: Call GNU C compiler as "GCC"
  treewide: Use "IRQ" instead of "irq" used as abbreviation
  future/QC: Use upright glyph for math constant and descriptive suffix
  styleguide: Reflect recent style improvements

 FAQ-BUILD.txt                      |   4 +-
 Makefile                           |   2 +-
 SMPdesign/SMPdesign.tex            |   2 +-
 SMPdesign/beyond.tex               |  14 ++---
 advsync/advsync.tex                |   2 +-
 appendix/styleguide/styleguide.tex |  64 ++++++++---------------
 appendix/toyrcu/toyrcu.tex         |  26 +++++-----
 count/count.tex                    |  28 +++++-----
 cpu/hwfreelunch.tex                |   4 +-
 datastruct/datastruct.tex          |   2 +-
 debugging/debugging.tex            | 104 ++++++++++++++++++-------------------
 defer/rcuapi.tex                   |   6 +--
 defer/rcuusage.tex                 |   4 +-
 formal/dyntickrcu.tex              |  52 +++++++++----------
 formal/formal.tex                  |   2 +-
 formal/spinhint.tex                |   2 +-
 future/QC.tex                      |  92 ++++++++++++++++----------------
 future/htm.tex                     |   2 +-
 future/tm.tex                      |   4 +-
 intro/intro.tex                    |   8 +--
 memorder/memorder.tex              |  32 ++++++------
 perfbook.tex                       |  20 +++++--
 rt/rt.tex                          |  22 ++++----
 toolsoftrade/toolsoftrade.tex      |  24 ++++-----
 24 files changed, 257 insertions(+), 265 deletions(-)

-- 
2.7.4


