Return-Path: <SRS0=XH/m=YE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=J0HOFz+u+QJpJ1tHVTs8OOBnkQo4XP0sP7D2bNDOH7Q=;
        b=gx7fID7yx7x4qkIddlc2Zaf0WVc/HD8qCKAuhWDsMrfPP3qJWYTX9JhhMzkqHUA/Hm
         GUAGZaKMy1dBBlaMqYOA1Sp93VDPIP2tL+6+fGGK4fnHqJQockqD55AcaWeX4+/p8ud9
         mEPwFF1AEFItkhomvlVZDx/Qgnowx5+xbtEMX0CwkU+TCe2JXAVgFRfNBOgCuiQTxoZt
         Hd70RBWrpoUsk6ZivFqAOPKeXod/WJV0f01xRBzq9Bv0GsoOa0TnxfkPuFt96WUWHRME
         +gzOtD5hEOzbVJaDtxuBXwZpkvAtr3U+YxQLOcif4KvrZQf9mBdMYUdq8+SZFNFRvQRP
         dpUQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [perfbook GIT PULL] Update code snippets and cross references
Message-ID: <cb414c7c-1644-2927-1b83-42ed40f359d1@gmail.com>
Date: Fri, 11 Oct 2019 23:43:25 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

As my pending list of patches has become long, and you've start updating
perfbook, I'm submitting the changes as a pull request.

Among the changes, there are a few which affect the contents.
So here is a list of commits you might want a closer look:

    1479c0450d5a ("together/count: Use \dots for ellipses")
        I know you are not a great fan of \dots, but I want them look better.

    1d2970a0287b ("together/refcnt: Clarify corresponding Linux kernel version")
        This section talking about code from old Linux kernel. They are presented
        as examples, so I'm not sure updating the code is whothwhile.

    f707214e9b45 ("Fix cross refernece to paragraph")
        Cross references to this paragraph have never worked. By using the newly
        defined macro \pararef{}, references are made by the title and page number
        of the paragraph.

    0ef7eb13286c ("memorder: Tweak list of sections")
        I'm not sure you like this change, but I don't think its a big deal.

    dfcde1b74ecf ("Warn of buggy 'cleveref' package")
        As long as you stick with Ubuntu Xenial, this change has no effect.
        Ubuntu Bionic's packaging of Tex Live happened at an unfortunate 
        timing just before the release of Tex Live 2018.

Can you pull them as they are, and do additional edit as you like?

        Thanks, Akira
--
The following changes since commit 89dbb755fc1aea3b5bf4c19ecafebdee1fe486cf:

  debugging: Add point about focus on bad things promoting good things (2019-10-09 18:15:48 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul

for you to fetch changes up to dfcde1b74ecf6b366a756c0c4fce3d7ff8132f91:

  Warn of buggy 'cleveref' package (2019-10-11 22:57:17 +0900)

----------------------------------------------------------------
Akira Yokosawa (25):
      count_end_rcu.c: Remove unnecessary READ_ONCE()
      together/count: Use \dots for ellipses
      together: Apply new scheme of code snippets
      together/refcnt: Clarify corresponding Linux kernel version
      together/refcnt: Reflect reordering of chapters
      together/refcnt: Remove out-of-date sentence in QQA 13.2
      advsync: Apply new scheme of code snippets
      Fix cross refernece to paragraph
      memorder: Apply new scheme of code snippets (part 1/3)
      memorder: Apply new scheme of code snippets (part 2/3)
      memorder: Apply new scheme of code snippets (part 3/3)
      memorder: Apply 'cleveref' way of cross reference
      memorder: Tweak list of sections
      Define '\crefthro' for 'Sections~m.n through~m.o'
      future: Apply new scheme of code snippets
      future: Apply 'cleveref' way of cross reference
      appendix/questions/after: Apply new scheme of code snippet
      appendix/questions: Apply 'cleveref' way of cross reference
      appendix/toyrcu: Apply new scheme of code snippets
      appendix/toyrcu: Convert \lnref to \clnref and its variations
      appendix/toyrcu: Apply 'cleveref' way of cross references
      Set 'lmtt' as \ttdefault for listing* environment
      appendix/whymb: Apply new scheme of code snippets
      appendix/whymb: Apply cleveref way of cross reference
      Warn of buggy 'cleveref' package

 CodeSamples/api-pthreads/QAfter/time.c             |   16 +-
 CodeSamples/count/count_end_rcu.c                  |   77 +-
 CodeSamples/defer/rcu_lock_percpu.c                |    6 +-
 CodeSamples/defer/rcu_lock_percpu.h                |    2 +
 CodeSamples/defer/rcu_qs.h                         |    2 +
 CodeSamples/defer/rcu_rcg.c                        |    7 +-
 CodeSamples/defer/rcu_rcg.h                        |    6 +-
 CodeSamples/defer/rcu_rcpg.c                       |   36 +-
 CodeSamples/defer/rcu_rcpg.h                       |   30 +-
 CodeSamples/defer/rcu_rcpl.c                       |   27 +-
 CodeSamples/defer/rcu_rcpl.h                       |    4 +
 CodeSamples/defer/rcu_rcpls.c                      |   33 +-
 CodeSamples/defer/rcu_rcpls.h                      |    6 +-
 CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus    |   10 +-
 .../formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus    |   12 +-
 .../formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus      |   13 +-
 .../litmus/C-LB+a-o+o-data-o+o-data-o.litmus       |   10 +-
 .../formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus      |   10 +-
 .../formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus      |   10 +-
 .../litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus  |   10 +-
 CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus      |   12 +-
 CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus      |   12 +-
 CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus |   17 +-
 CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus |   14 +-
 CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus  |   11 +-
 CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus |   15 +-
 .../formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus     |   24 +-
 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus  |   12 +-
 .../formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus      |   12 +-
 .../formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus   |   25 +-
 .../formal/litmus/C-R+o-wmb-o+o-mb-o.litmus        |   14 +-
 .../formal/litmus/C-S+o-wmb-o+o-addr-o.litmus      |   20 +-
 .../formal/litmus/C-SB+o-mb-o+o-mb-o.litmus        |   22 +-
 CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus      |   19 +-
 .../formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus |   10 +-
 .../formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus    |   26 +-
 .../formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus  |   25 +-
 CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus   |   18 +-
 .../formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus   |   10 +-
 .../formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus     |   10 +-
 .../formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus    |   12 +-
 FAQ-BUILD.txt                                      |   15 +
 advsync/advsync.tex                                |   98 +-
 advsync/rt.tex                                     |  359 ++-
 appendix/questions/after.tex                       |  132 +-
 appendix/questions/time.tex                        |    2 +-
 appendix/toyrcu/toyrcu.tex                         |  727 ++----
 appendix/whymb/whymemorybarriers.tex               |  280 +--
 datastruct/datastruct.tex                          |    4 +-
 future/cpu.tex                                     |   18 +-
 future/formalregress.tex                           |   28 +-
 future/htm.tex                                     |  262 +-
 future/tm.tex                                      |   60 +-
 memorder/memorder.tex                              | 2532 +++++++-------------
 perfbook.tex                                       |   15 +-
 together/applyrcu.tex                              |  374 ++-
 together/count.tex                                 |   21 +-
 together/hash.tex                                  |    6 +-
 together/refcnt.tex                                |  361 +--
 together/together.tex                              |    9 +-
 utilities/runlatex.sh                              |   10 +
 61 files changed, 2385 insertions(+), 3595 deletions(-)
