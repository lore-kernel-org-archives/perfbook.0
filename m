Return-Path: <SRS0=Ej0c=IQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=AX0Pi6xGb+uOgcTnek1CPu+QFpefcXJIrLZXNEGMtqo=;
        b=aIbHSZnpYBnCupeX9yHddQXXvvPPt9JnEDs0eP6Izy1QSJdfcoAkfip2LBI+ySXE+C
         4okCLVmqfN56jGiELtWjzX6IrN9UhhmDZoqQToBO2Gz5f0HFB+vZiOc+Zh7rscMMyJ8H
         C6HJiBugq5VvwDOy7iC68FOyAg9PUIu1d5DEo7VTJAzq0LHZ3llMPR4Ye+Ybjniq00BM
         7J5MqFSRyzOyOucOFkzSi2IUNzi8U7fCaYz4ZylhfD89O9jMx37zWk78BHPlAiC4lIPI
         bPypGvnHpJisX/mMvpW4jx/MzJgMCNMkicL/w4iAN7gvlKEnvAOEuavCiZOXp5catbG6
         1y/g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Minor tweaks for Edition 2, take 3
Message-ID: <1bab2519-02be-a38c-0d20-ac40567c084e@gmail.com>
Date: Thu, 18 Mar 2021 10:57:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So, this contains fairly large diff stats which do not sound like
"minor" due to the annotations of sentence-ending fullstops in
Patch 1/6.

They improve consistency of the whole textbook a little bit.

I know there are arguments of single spacing vs double spacing.
LaTeX does double spacing by default.
If you put \frenchspacing in the preamble, the effect of "\@"
will be voided.

For portability of the LaTeX code base, I think annotations by "\@"
should be maintained as far as possible.

Patch 2/6 does a similar tweak by introducing a new macro "\Node{}".

Patch 3/6 makes some of inline code snippets unbreakable so that
they are not disturbed by float/footnote intrusion.

Patches 4/6--6/6 are typo fixes, but I might be missing something
there, especially in Patch 6/6.

If you don't feel like pulling the whole series, feel free to
pull part of it, or add your fix(es) on top.

        Thanks, Akira

--------
The following changes since commit d25a6ca010cd28e366ef712e3c5449f11ed6f82c:

  locking: Fix typos and grammar (2021-03-16 21:05:01 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.18c

for you to fetch changes up to 194bd0a454fc3ca2e6d50c39c248e35fd24ff61a:

  datastruct: Remove redundant line (2021-03-18 10:01:20 +0900)

----------------------------------------------------------------
Akira Yokosawa (6):
      treewide: Annotate sentence-ending fullstops as such
      advsync: Use macro for 'Node A', 'Node B', etc.
      owned, defer, future: Make short inline snippets unbreakable
      defer: Fix typo
      advsync: Fix typo
      datastruct: Remove redundant line

 SMPdesign/SMPdesign.tex              |  2 +-
 SMPdesign/beyond.tex                 | 10 +++++-----
 advsync/advsync.tex                  | 26 +++++++++++++-------------
 advsync/rcu.tex                      |  4 ++--
 advsync/rt.tex                       | 22 +++++++++++-----------
 appendix/toyrcu/toyrcu.tex           | 12 ++++++------
 appendix/whymb/whymemorybarriers.tex | 14 +++++++-------
 count/count.tex                      | 20 ++++++++++----------
 cpu/hwfreelunch.tex                  |  2 +-
 cpu/overheads.tex                    |  2 +-
 cpu/overview.tex                     |  4 ++--
 cpu/swdesign.tex                     |  2 +-
 datastruct/datastruct.tex            | 21 ++++++++++-----------
 debugging/debugging.tex              |  6 +++---
 defer/rcuapi.tex                     | 20 ++++++++++----------
 defer/rcufundamental.tex             |  8 ++++----
 defer/rcuintro.tex                   |  8 ++++----
 defer/rcurelated.tex                 |  6 +++---
 defer/rcuusage.tex                   | 16 ++++++++--------
 defer/seqlock.tex                    |  2 +-
 defer/whichtochoose.tex              | 12 ++++++------
 formal/axiomatic.tex                 |  4 ++--
 formal/dyntickrcu.tex                | 10 +++++-----
 formal/formal.tex                    |  6 +++---
 formal/spinhint.tex                  |  4 ++--
 future/formalregress.tex             |  4 ++--
 future/fp.tex                        |  2 +-
 future/htm.tex                       | 10 +++++-----
 future/tm.tex                        | 18 +++++++++---------
 glossary.tex                         |  2 +-
 howto/howto.tex                      | 10 +++++-----
 intro/intro.tex                      |  2 +-
 legal.tex                            |  2 +-
 locking/locking.tex                  | 20 ++++++++++----------
 memorder/memorder.tex                | 20 ++++++++++----------
 owned/owned.tex                      |  2 +-
 perfbook-lt.tex                      |  1 +
 together/count.tex                   |  2 +-
 together/refcnt.tex                  |  4 ++--
 toolsoftrade/toolsoftrade.tex        | 14 +++++++-------
 40 files changed, 178 insertions(+), 178 deletions(-)
