Return-Path: <SRS0=ySBD=ZQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=gm4ttlPlvhkEZ7aUd8nB5NZDdpwMSbqnqFD81HfKwl8=;
        b=BrZCJBcLZUBV+Focc+xuGWJ7AwKBKu0klFdg5j4IobQctc08Z+r96CD59vaH6oUQEy
         wYaELEpwnc4RmmdFjcRkKpBdey/6+zPB271+ochfHS8h6gzEHSTh2/rtuIXx/IgvWMy4
         IAqUiqtItoDht3SJIeLYnk6goYViPGBI0nh4AUYHmDCistq6d4XpBWa0Yeu6Pk4kn9s2
         uetvax97AYzUnZb4v9p+OcYn58JNF558aSGDis1AFktwHn6woZZTwK9STgJ6flaETr+/
         AEdmS6riC8dB10ejMMGzGGeJim4H+2vh8uhJNv2+4Xu2a5Rp0NSOigi/Vtei9lBTj26i
         4bog==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [perfbook GIT PULL] Use \clnrefragne to reference range of lines
Message-ID: <9e1089f7-0b30-bd84-3ef3-5fc454a923bf@gmail.com>
Date: Sun, 24 Nov 2019 16:21:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This pull request consists of changes to use \clnrefrange to reference
range of lines in snippets. The motivation is to use endashes (--)
consistently (as much as possible) for ranges of numbers throughout perfbook.

NOTE: What character to use in \crefrange and \clnrefrange is specified
      in perfbook.tex using a couple of macro definitions.
      E.g.: "\newcommand{\crefrangeconjunction}{--}" and
      "\newcommand{\clnrefrange}[2]{lines~\lnref{#1}--\lnref{#2}}"

The final (15th) commit uses \crefrange for ranges of figure numbers.

After these changes, there remain only a couple of tens of dashes (-)
which represent ranges of numbers in the LaTeX sources of perfbook.

Other possible changes to use \cref{} and its variants do not affect
the resulting PDF in most cases. Such changes are error prone as are evident
in fixes by commits 7b327fa2fe97 ("miscellaneous: Fix numerous typos") and
a35705b57c70 ("advsync/rt: Fix usage of \clnref{}"). 
So they are not included in this request. Such changes can wait until
there is some other change nearby.

        Thanks, Akira
--
The following changes since commit cfc525d6386e17dbe7ec6e5e658678139e60ee2b:

  Typo fixes: "and and" and light-weight->lightweight (2019-11-23 11:23:01 -0800)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2019.11.24b

for you to fetch changes up to 38eec3194c9aac87a63568ef42f1e626408bb5dd:

  Use \crefrange{}{} for range of figures (2019-11-24 13:44:41 +0900)

----------------------------------------------------------------
Akira Yokosawa (15):
      toolsoftrade: Use \clnrefrange{}{} for range of lines in snippets
      toolsoftrade: Add cross reference to lines in snippets
      count: Use \clnrefrange{}{} for range of lines in snippets
      SMPdesign: Use \clnrefrange{}{} for ranges of lines in snippets
      SMPdesign: Add cross references to lines in snippets
      locking: Use \clnrefrange{}{} to reference range of lines in snippets
      defer: Use \clnrefrange{}{} to refernece range of lines in snippets
      defer/rcufundamental: Add cross refernece to line in snippet
      datastruct: Use \clnrefrange{}{} to refernece range of lines in snippets
      debugging: Use \clnrefrange{}{} to refernece range of lines in snippets
      formal: Use \clnrefrange{}{} to refernece range of lines in snippets
      together: Fix singular/plural verb form
      advsync/rt: Fix usage of \clnref{}
      Add cross references to lines in snippets of count_lim and count_stat_eventual
      Use \crefrange{}{} for range of figures

 CodeSamples/count/count_stat_eventual.c |   4 +-
 CodeSamples/toolsoftrade/rwlockscale.c  |   2 +-
 SMPdesign/SMPdesign.tex                 |  10 +--
 SMPdesign/beyond.tex                    |  27 ++++---
 SMPdesign/partexercises.tex             |  18 ++---
 advsync/rt.tex                          |   4 +-
 count/count.tex                         | 135 ++++++++++++++++----------------
 datastruct/datastruct.tex               |  67 ++++++++--------
 debugging/debugging.tex                 |  14 ++--
 defer/defer.tex                         |   8 +-
 defer/hazptr.tex                        |  18 ++---
 defer/rcufundamental.tex                |  11 ++-
 defer/rcuintro.tex                      |   2 +-
 defer/rcuusage.tex                      |   8 +-
 defer/refcnt.tex                        |   8 +-
 defer/seqlock.tex                       |  12 +--
 formal/axiomatic.tex                    |  20 ++---
 formal/dyntickrcu.tex                   |   2 +-
 formal/spinhint.tex                     |  60 +++++++-------
 locking/locking-existence.tex           |   2 +-
 locking/locking.tex                     |  16 ++--
 owned/owned.tex                         |  16 ++--
 together/applyrcu.tex                   |   2 +-
 toolsoftrade/toolsoftrade.tex           |  66 +++++++++-------
 24 files changed, 279 insertions(+), 253 deletions(-)
