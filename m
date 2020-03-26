Return-Path: <SRS0=deQ9=5L=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7p6NtGjeEH364VtRsM0k6CqVZZo4uGjZTLkYr5cY0T4=;
        b=b4yKXvsVrTAgaAWu4pdLUgK0/U6FY6KzBKlaMiPe/wvsWx9p8L1gueS6LnLiBG8q0a
         JQiie/3Rp/jeulxyCm77KOVb5bBCsnRkj4B93Lw1L0XMxKs5nIUU63KTuXwpLw6C6Con
         ka+wRvAdOumCsr52hVhHPmYT3IDs0sJT5tLfk1nOnYTeM0dxrP+hRaBNKPzuK7Q7R2gg
         sCQcgHlS5n0fp8oljBSdQKbU/7PEnwttpoSsOr9qUlO4afQgmhm4jUfmv+3AkVjB+LpX
         +0goDAq6T/eOZyv9Jeeb/kLACrO8iWmqu1gslb/SHrmtdKJquTgz0MysaW+5PtqGuTVr
         wv4Q==
Subject: [RFC PULL v2] Add experimental targets 'nq' and '1cnq' (sans inline
 Quick Quizzes)
References: <26b6add2-3819-dffe-38b1-d62a566e9a7b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c74f4988-f95c-759f-5b37-56dc6f92ba07@gmail.com>
Date: Fri, 27 Mar 2020 00:04:52 +0900
MIME-Version: 1.0
In-Reply-To: <26b6add2-3819-dffe-38b1-d62a566e9a7b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is the rebased pull request of "noqq" branch.
The conflict was easy to resolve.
I added several commits since v1 (was [RFC NOT PULL]).

As this branch does not change any behavior of official targets,
I think it is safe for you to pull if you'd like to.

Changes since v1:

    Target name changes and additions:
        - qq:    2c with framed Quick Quizzes (was 2cqq)
        - 1cqq:  1c with framed Quick Quizzes
        - nq:    2c without inline Quick Quizzes (was noqq)
        - 1cnq:  1c without inline Quick Quizzes

            Note: Existing targets for 2c layout do not have
                  "2c" except for the default "2c".

    Accuracy fix of cross links to framed Quick Quizzes

    Treewide annotation of Quick Quizzes for nq build

    Target names updates in synctex-forward.sh

    Minor fixes in Quick Quizzes 5.49 and 5.52

Try "make help" to see which target does what.

Thanks, Akira

PS:

As for -hb build, I've found a clue to use "geometry" package as a
workaround. It looks promising.

Enabling qqzbg at release tags for official targets is next in my
todo list.

--
The following changes since commit dcb1d4e43b2c1edba5a61bd0e63e0804478bf520:

  toolsoftrade: Improve rwlockscale.sh sampling strategy (2020-03-25 07:14:47 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.26a

for you to fetch changes up to 1dd2b89ab3e7bb64a380d7ccef7033757dd442ef:

  Makefile: Add and rename targets for framed and no Quick Quizzes (2020-03-26 23:23:10 +0900)

----------------------------------------------------------------
Akira Yokosawa (10):
      qqz.sty: Add background color to Quiz part of Quick Quizzes
      Add experimental target 'noqq' (sans inline Quick Quizzes)
      Permit consecutive QQs to appear in a framed box
      qqz.sty: Make noqq's Appendix E look same as that of 2cqq's
      qqz.sty: Improve accuracy of cross links
      treewide: Use macros for consecutive quick quizzes
      synctex-forward: Add recently added targets
      qqz.sty: Add comment on how to use new sets of macros
      count: Wordsmith Quick Quizzes 5.49 and 5.52
      Makefile: Add and rename targets for framed and no Quick Quizzes

 Makefile                             |  34 ++++-
 SMPdesign/SMPdesign.tex              |  16 +-
 SMPdesign/partexercises.tex          |  32 ++--
 advsync/rt.tex                       |  16 +-
 appendix/toyrcu/toyrcu.tex           |  88 ++++++-----
 appendix/whymb/whymemorybarriers.tex |  40 ++---
 count/count.tex                      | 277 +++++++++++++++++++----------------
 cpu/overheads.tex                    |  16 +-
 datastruct/datastruct.tex            |  16 +-
 debugging/debugging.tex              |  72 +++++----
 defer/hazptr.tex                     |  16 +-
 defer/rcuapi.tex                     |  32 ++--
 defer/rcuexercises.tex               |  17 ++-
 defer/rcufundamental.tex             |  16 +-
 defer/rcuintro.tex                   |  32 ++--
 defer/rcuusage.tex                   |  32 ++--
 defer/refcnt.tex                     |  16 +-
 defer/seqlock.tex                    |  40 ++---
 formal/axiomatic.tex                 |  16 +-
 formal/dyntickrcu.tex                |  48 +++---
 formal/ppcmem.tex                    |  14 +-
 formal/spinhint.tex                  |  33 +++--
 future/formalregress.tex             |  32 ++--
 future/htm.tex                       |  24 +--
 howto/howto.tex                      |  24 +--
 intro/intro.tex                      |  32 ++--
 locking/locking-existence.tex        |  16 +-
 locking/locking.tex                  |  48 +++---
 memorder/memorder.tex                |  96 ++++++------
 owned/owned.tex                      |  16 +-
 perfbook.tex                         |   7 +
 qqz.sty                              | 133 ++++++++++++++++-
 together/refcnt.tex                  |  24 +--
 toolsoftrade/toolsoftrade.tex        | 104 +++++++------
 utilities/extractqqz.sh              |   8 +-
 utilities/synctex-forward.sh         |   2 +-
 36 files changed, 892 insertions(+), 593 deletions(-)
 
