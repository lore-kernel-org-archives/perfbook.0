Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=1XNTmUv4jIQC93tofmu2s+kZ4SCrQnex/GHlmvGuV5Y=;
 b=CSvpBJo5KrjruLqLQzPFBUQ9s1Ratlz16hBAj8QYhbZsx9/OFIHthRKE9hOflYz21Y
 h3eG3hMfT2XxzRfmMvWHyoBkB94JfWa8zC/L+4BG1Yrj79vYZMBmFG7+lyqb8710qU4S
 dcRj8Xwzmy7Rx1QGutNsX4+FrtWu5fU6jTg722D96HswJCQMmVx7lD+ulcXveFy3ZmnP
 Vbc9tZN0UGKR190cZ9lAGxpKAw3BewTNTF9s5xXaaK5anf/QNRLi05ylmxSw403G+dmq
 uBeiifMfxIAfj70HqWs27LfeaDV1AOoow315QvBMKyKLS4d6hY/V0TbfuGyOA2f4tGDB
 6hug==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 00/17] Fixup `Formal Verification` chapter
Date: Wed, 21 Sep 2016 11:44:31 +0900
Message-Id: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset contains fixups for files under formal/ directory.

SeongJae Park (17):
  formal: Rearrange promela sample code location
  formal/spinhint: Add missing NBSPs
  formal/spinhint: Fix typos
  formal/spinhint: Use \path{} for file name quotation
  formal/spinhint: Use \co{} for variable quotation consistently
  formal/spinhint: Reference figure
  formal/dyntickrcu: Add missing NBSPs
  formal/dyntickrcu: Append `()` to function name quotations
  formal/dyntickrcu: Fix typos
  formal/dyntickrcu: Fix wrong line number quotation
  formal/dyntickrcu: Fix wrong function name quotation
  formal/ppcmem: Fix typo for \co{}
  formal/ppcmem: Use \co{} for instruction quotation
  formal/ppcmem: Use P0 instead of thread 1
  formal/ppcmem: Substitute `paper` with `chapter`
  formal/ppcmem: Polish a sentence by removing unnecessary conjunction
  formal/dyntickrcu: Shorten too long code line length

 CodeSamples/appendix/formal/dyntickRCU-base-s.spin | 196 --------
 .../appendix/formal/dyntickRCU-base-sl-busted.spin | 224 ---------
 .../appendix/formal/dyntickRCU-base-sl.spin        | 220 ---------
 CodeSamples/appendix/formal/dyntickRCU-base.spin   | 164 -------
 .../appendix/formal/dyntickRCU-irq-nmi-ssl.spin    | 506 ---------------------
 .../appendix/formal/dyntickRCU-irq-ssl.spin        | 356 ---------------
 .../appendix/formal/dyntickRCU-irqnn-ssl.spin      | 330 --------------
 CodeSamples/appendix/formal/dyntickRCUtarball.sh   |  18 -
 CodeSamples/appendix/formal/runspin.sh             |  31 --
 .../{analysis => formal}/promela/.gitignore        |   0
 .../promela/atomicincrement.spin                   |   0
 .../formal => formal/promela/dyntick}/.gitignore   |   0
 .../promela/dyntick/dyntickRCU-base-s.spin         |   0
 .../promela/dyntick/dyntickRCU-base-sl-busted.spin |   0
 .../dyntickRCU-base-sl-busted.spin.trail.txt       |   0
 .../promela/dyntick/dyntickRCU-base-sl.spin        |   0
 .../promela/dyntick/dyntickRCU-base.spin           |   0
 .../promela/dyntick/dyntickRCU-irq-nmi-ssl.spin    |   0
 .../promela/dyntick/dyntickRCU-irq-ssl.spin        |   0
 .../promela/dyntick/dyntickRCU-irqnn-ssl.spin      |   0
 .../promela/dyntick/dyntickRCUtarball.sh           |   0
 .../promela/dyntick/runspin.sh                     |   0
 .../{analysis => formal}/promela/increment.spin    |   0
 CodeSamples/{analysis => formal}/promela/lock.h    |   0
 CodeSamples/{analysis => formal}/promela/lock.spin |   0
 CodeSamples/{analysis => formal}/promela/qrcu.spin |   0
 formal/dyntickrcu.tex                              | 162 +++----
 formal/ppcmem.tex                                  |  12 +-
 formal/spinhint.tex                                |  18 +-
 29 files changed, 97 insertions(+), 2140 deletions(-)
 delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-base-s.spin
 delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-base-sl-busted.spin
 delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-base-sl.spin
 delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-base.spin
 delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-irq-nmi-ssl.spin
 delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-irq-ssl.spin
 delete mode 100644 CodeSamples/appendix/formal/dyntickRCU-irqnn-ssl.spin
 delete mode 100644 CodeSamples/appendix/formal/dyntickRCUtarball.sh
 delete mode 100644 CodeSamples/appendix/formal/runspin.sh
 rename CodeSamples/{analysis => formal}/promela/.gitignore (100%)
 rename CodeSamples/{analysis => formal}/promela/atomicincrement.spin (100%)
 rename CodeSamples/{appendix/formal => formal/promela/dyntick}/.gitignore (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-base-s.spin (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-base-sl-busted.spin (100%)
 rename CodeSamples/{appendix/formal => formal/promela/dyntick}/dyntickRCU-base-sl-busted.spin.trail.txt (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-base-sl.spin (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-base.spin (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-irq-nmi-ssl.spin (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-irq-ssl.spin (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCU-irqnn-ssl.spin (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/dyntickRCUtarball.sh (100%)
 rename CodeSamples/{analysis => formal}/promela/dyntick/runspin.sh (100%)
 rename CodeSamples/{analysis => formal}/promela/increment.spin (100%)
 rename CodeSamples/{analysis => formal}/promela/lock.h (100%)
 rename CodeSamples/{analysis => formal}/promela/lock.spin (100%)
 rename CodeSamples/{analysis => formal}/promela/qrcu.spin (100%)

-- 
2.10.0

