Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=E8xOHWdxt8tl74DwxMvwACNVfPP+0+cxTEHpsor9MSk=;
        b=khPbO0xGq+ZbpSo4+wH84qb/n13tsYet8/X947gHipRRqvpgd2493WeaCw41cxYnof
         fmAFUUgQXCXcMBMTYvyikQM6n/eE08KsMQERdQvSNEfm8FvOoUCUtVlse9zCpmuGHl34
         r3L5dZEnBdeBVCGCzi76FlAqDuIj/43mjLLS42bcjBTs5hdyAlpHK72+bHXFay4R+WuF
         n8pzTJcCgij80tLmGUHdtVxEnqUnfvPQDtfnC2slHligamacHs/t0PCSKlK/13ClZCsh
         TEsz+N6MgYQ29o8jhCNJdfLR2Y4poiqa9TN6WWOF1Edk3zolxOO4rf+IcWsxqII3eURT
         dI1g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] formal/spinhint: Update code snippet
Message-ID: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
Date: Sun, 3 Feb 2019 00:05:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here is another round of code snippet update, with modernization
of outputs of Spin and tables of state search results.

Patch #1 updates fcvextract.pl so that .spin files are handled
as the same as C source files.

Patch #2 applies the new scheme to code snippets. It also contains
minor changes for better typesetting.

Patch #3 replaces captures of Spin outputs with those obtained
from Spin version 6.4.8. This commit adds outputs as .lst files
under CodeSamples/formal/promela/. They are added to the dependency
in the top level Makefile.

Patch #4 updates tables of Spin result.  For qrcu.spin, I used
the compiler flag -DCOLLAPSE to complete the state search for
updaters=3 readers=2 on a machine with 16GB memory. As far as
I understand correctly, this compiler flag does not affect the
completeness of state search. So I added some explanation in the text
to mention the flag and the argument -mN of ./pan to increase the
limit of search depth.

Patch #5 tweaks footnote on a cell in a table.

Patch #6 is a nitpick patch to consistently use \co{}.

I'm wondering if Patch #4 is OK from your perspective.
Any feedback is welcome!

        Thanks, Akira
--
Akira Yokosawa (6):
  fcvextract.pl: Treat '.spin' files as C sources
  formal/spinhint: Employ new scheme for code snippet
  formal/spinhint: Update output lists of spin
  formal/spinhint: Update tables of memory usage of Spin
  formal/spinhint: Put footnote on header in table
  formal/spinhint: Use \co{...} rather than {\tt ...}

 CodeSamples/formal/promela/atomicincrement.spin    |   2 +
 .../formal/promela/atomicincrement.spin.lst        |  28 +
 CodeSamples/formal/promela/increment.spin          |  46 +-
 CodeSamples/formal/promela/increment.spin.lst      |  28 +
 .../formal/promela/increment.spin.trail.lst        |  42 +
 CodeSamples/formal/promela/lock.h                  |  16 +-
 CodeSamples/formal/promela/lock.spin               |  46 +-
 CodeSamples/formal/promela/lock.spin.lst           |  29 +
 CodeSamples/formal/promela/qrcu.spin               |  95 ++-
 Makefile                                           |   4 +-
 formal/spinhint.tex                                | 874 ++++++---------------
 perfbook.tex                                       |   1 +
 utilities/fcvextract.pl                            |   8 +-
 13 files changed, 502 insertions(+), 717 deletions(-)
 create mode 100644 CodeSamples/formal/promela/atomicincrement.spin.lst
 create mode 100644 CodeSamples/formal/promela/increment.spin.lst
 create mode 100644 CodeSamples/formal/promela/increment.spin.trail.lst
 create mode 100644 CodeSamples/formal/promela/lock.spin.lst

-- 
2.7.4

