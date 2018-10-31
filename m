Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=QiY3mdd5l9NyT698QXL1oNVxvI8mJoF2wwd488E40NM=;
        b=GSuozvlR6BaRzsk370wKgPM3jLMSkbHWhDFdk9p29q4QOxo24LUEPrxpLC6e2/owq8
         STLlZWfaM4rqS084Xa69ZD4DaU6M3iLkX5cXT6JqcbAlBx5fN0gHMq0fXEXl2+YDu/Iv
         +Swsh9HhKq6eUyBmONkCDtUxncQqLQnpmeykC6MSSqWam9pnbMHp4H+uYaLwnzn6k3v0
         3H77td0BlKNNTXUrg79+UGS02+LfF2PqM9MYgDz6NYjCS8Q4GOMXEGtNKTVo1MxKgKFt
         yU7Ifq3DtHN6K3/7qFWPPlJfnH14KH0LqNWjJjAlla9lcaSkDVa4hNkoXpmCdeVfRfq7
         6bRA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/8] Improve conversion of litmus test snippet
Message-ID: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Date: Thu, 1 Nov 2018 00:08:02 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

In snippets of litmus tests you added recently uses "locations"
directive. It was not covered by reorder_ltms.pl.
This series enhances reorder_ltms.pl to add an option to
the meta command "\end[snippet]".

Now you can put C-RCU-remove.litmus and
C-RomanPenyanev-list-rcu-rr.litmus under CodeSamples/.

Patch #1 is the enhancement of reorder_ltms.pl.
Patch #2 adds C-RCU-remove.litmus in CodeSamples/formal/herd.
Note that I modified the choice of characters given to
the "commandchars=" option to avoid collision with characters
used in snippets.
Patch #3 adds recipe in Makefile to run the added tests by
"make run-herd7".
Patch #4 replaces the inline snippet code with converted one.
Patch #5 adds another RCU litmus test in CodeSamples/formal/herd.
Patch #6 imports snippet converted from above.
Patch #7 converts existing PPC IRIW litmus tests to new scheme
It also reduces the width of the snippets to fit in 2c column
width.
Patch #8 is a trivial typo fix.

I'm afraid commit logs in this series is not descriptive
enough, but hopefully the intention of the changes are evident.

        Thanks, Akira
-- 
Akira Yokosawa (8):
  reorder_ltms.pl: Add 'locationslabel=' option to \end[snippet]
  CodeSamples/formal: Add C-RCU-remove.litmus
  CodeSamples/formal/herd: Add recipe for native .litmus tests
  formal/axiomatic: Import snippet from C-RCU-remove.litmus
  CodeSamples/formal: Add C-RomanPenyanev-list-rcu-rr.litmus
  formal/axiomatic: Import snippet from
    C-RomanPenyanev-list-rcu-rr.litmus
  formal/axiomatic: Convert snippets of IRIW tests to new scheme
  formal/axiomatic: Fill in missing ')'

 CodeSamples/formal/herd/C-RCU-remove.litmus        |  27 +++
 .../formal/herd/C-RomanPenyaev-list-rcu-rr.litmus  |  47 +++++
 CodeSamples/formal/herd/Makefile                   |  21 ++-
 formal/axiomatic.tex                               | 201 +++++++--------------
 utilities/reorder_ltms.pl                          |  15 ++
 5 files changed, 164 insertions(+), 147 deletions(-)
 create mode 100644 CodeSamples/formal/herd/C-RCU-remove.litmus
 create mode 100644 CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus

-- 
2.7.4

