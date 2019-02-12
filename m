Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ZOuI3A5hpbuacIA99sPyInnLuJAvr8T8N6ZV2WFojAk=;
        b=i/XdwztwiAKpGljGGacNrE2CIUgVpiOxMld9Ym12uvsw3m3LOYoVS1SxOMTG1oU1Zv
         hVS76ZAgNPI73bt1POM0qY5pn8PUXXeBPjAx11wDViNT5Z1vMaZEzh+twNoT4aMTmMvu
         WICCTbKvHiM2t8MEkIQh7Rmf9M2/amGBCefJJB1zh5d01YJb1zbUWR8tJaoEXNePmJJQ
         hCCDAXRBB7hXu6oTxbHCwVRC9E7SxRil0yq7WGhwHhS9OClpBtO2nEOau/fiVI8CBSfI
         NDFmHm7aMXYPGvIwjt90YA66fCGswBRBrYLsv9apdL4SjUnSw70KolZ/EQtI4jTpo0N7
         Tbtw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] formal/spinhint: Clarify hashtable sizes used in tables
Message-ID: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
Date: Wed, 13 Feb 2019 00:31:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

In your wordsmithing, there was confusion of hashtable sizes used in
Tables 12.2 and 12.3. Patch #1 attempts to clarify the point. It also
adds a footnote and fixes a few trivial typos.

Patch #2 is a minor tweak to use "lmtt" font for code snippets
imported by \VerbatimInput{} command. This fixes font of Listing 12.3
for experimental targets such as "msnt" and "1csf".

Patch #3 fixes font choice of snippets in experimental targets "msns"
(original monospace font of "courier") and "mss" (previous monospace
font choice of "scaled courier"), which have kept using those fonts for code
snippets. As is mentioned in the change log, there are a lot of overfills
in code snippets. On the other hand, the font used in the target "msn"
(monospace narrow) is narrower than the "lmtt" font and it should be OK
to use it in code snippets.

Patch #4 resolves the warning from "make" due to a stray litmus test
"C-SB+o-rcusync-o+rl-rul-o.litmus". My guess is that this file was
unintentionally sneaked into the repository in commit 4a6337b85633
("memorder: Cover litmus tests for accesses outside of RCU readers").
But you may have an idea what the test of that name should look like.
If this is the case, please update the test instead of applying this
patch.

        Thanks, Akira
--
Akira Yokosawa (4):
  formal/spinhint: Clarify hashtable sizes used in Tables 12.2 and 12.3
  Set default fontfamily for snippets of 'fancyvrb'
  Change monospace font of snippets for targets 'mss', 'msns', and 'msn'
  memorder: Remove 'snippet' meta command in stray litmus test

 CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus |  2 --
 Makefile                                                 | 11 +++++------
 formal/spinhint.tex                                      | 14 ++++++++------
 perfbook.tex                                             |  5 +----
 4 files changed, 14 insertions(+), 18 deletions(-)

-- 
2.7.4

