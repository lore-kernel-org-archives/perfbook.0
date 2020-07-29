Return-Path: <SRS0=SbQd=BI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tOAURs1mXB+omVhMDgSsGg/IV9vPKROTM6c4EObrhK8=;
        b=LB9aWZ16UXeqmMYzJlf8QWfGy+qtD4p6QB4QhsLT6A4++ymxbwW64kddxHhfKldA/w
         QIpQQszHiaA0xX6UlSZV9eC9XJhSJXUoGNyOPyhLqmXPsklDmFXNMaCorntgPtn/akaT
         eg1P/kjxI35PV/9UCBapdJqy0aVr/+uoBEQms9hPzXxk2To/YfXhBmMnFZ4l++M+x9eZ
         gj29f75r1lcl0ajIwB0RIIEqEP5QL4POiuFBoXec0Xna/CHj1Z+lc0lRdDbo4b3fhvnr
         89wReZK/lZNyEH9FJoKcKdrjGj8GQayiUgQTw/sd+8ZP42rZGmzyIbygXIi6DKG4NDBZ
         Zuxg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Chapterwise QQZ answers
Message-ID: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
Date: Thu, 30 Jul 2020 00:11:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So, in the mean time, I've attempted chapterwise QQZ answers.
This patch series is the resulting changes.

Patch #1 fixes a typo in Makefile which I noticed during this
development.

Patch #2 is the main change enabling chapterwise QQZ answers
in perfbook-nq.pdf.
This patch becomes a large one, as the addition of argument
to macros in qqz.sty requires tree-wide changes for successful
build.  It also contains minor tweaks in howto.tex.

Patches #3--#5 are minor updates.
Patch #5 results in a table mostly identical to Table E.5.
I don't think these quick quizzes are redundant, though.

The resulting perfbook-nq.pdf looks fairly reasonable to me.
Some of the question parts have room to improve so that
they are less context-dependent.

Let me know what you think.

        Thanks, Akira
--
Akira Yokosawa (5):
  Makefile: Fix typo in CREFPTN
  Enhance qqz scheme for chapterwise QQZ answers
  perfbook-lt.tex: Tell cleveref not to capitalize 'page' in \cpageref{}
  datastruct: Use nbsp in captions (State (a), State (b), etc.)
  formal: Retouch Table E.4

 .gitignore                           |  2 +-
 Makefile                             | 17 ++++++++---
 SMPdesign/SMPdesign.tex              |  4 ++-
 advsync/advsync.tex                  |  4 ++-
 appendix/questions/questions.tex     |  4 ++-
 appendix/toyrcu/toyrcu.tex           |  4 ++-
 appendix/whymb/whymemorybarriers.tex |  4 ++-
 count/count.tex                      |  4 ++-
 cpu/cpu.tex                          |  4 ++-
 datastruct/datastruct.tex            | 12 ++++----
 debugging/debugging.tex              |  4 ++-
 defer/defer.tex                      |  4 ++-
 easy/easy.tex                        |  4 ++-
 formal/axiomatic.tex                 | 26 ++++++++++-------
 formal/formal.tex                    |  4 ++-
 future/future.tex                    |  4 ++-
 howto/howto.tex                      | 27 ++++++++++++++----
 intro/intro.tex                      |  4 ++-
 locking/locking.tex                  |  4 ++-
 memorder/memorder.tex                |  4 ++-
 owned/owned.tex                      |  4 ++-
 perfbook-lt.tex                      |  5 ++++
 qqz.sty                              | 22 +++++++++++++--
 together/together.tex                |  4 ++-
 toolsoftrade/toolsoftrade.tex        |  4 ++-
 utilities/divideqqz.pl               | 42 ++++++++++++++++++++++++++++
 26 files changed, 179 insertions(+), 46 deletions(-)
 create mode 100755 utilities/divideqqz.pl

-- 
2.17.1

