Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=bwToo9wrAvWg04Ux35TECaC6MCpgiYiqZuWfD/iejQw=;
        b=II3EKme9B7OrkxpBP1SmTs07ZdHRjOg3tQjDiZ4k8ZVZSMrt4kJ0m1gEBKDsdmE8u+
         LgAh9eNCF5BkRizA50Hzh3756xNt2jSuB9KQ6bdDerObo+Ivd5sjPeGO47liFyhgptkN
         eFSgDJi+gecZ6xTfBDpIrpHgCLfvbNJBn22MoixNRRJf0IUHlrApfM62vFFRNx5/5Kqq
         rNvdK3vI1+paaOMSjvz+KtBjk6RAlhr1B5kKKJNg6PRgvG6AUl+d+K+aUvKvp/Lor9m3
         tsAZDMYYPygOxJBhGhQK1oU6JsOrypkSUgiW4pN8IMXzlQQXevFMG9XjGp8y+ht04FJK
         AetA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] count: Employ new code-snippet scheme (cont.)
Message-ID: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
Date: Mon, 8 Oct 2018 10:40:51 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is the continuation of changes to snippets in the "count"
chapter.

To help your review of the changes regarding READ_ONCE()/WRITE_ONCE(),
I split the patches to the ones just applying the scheme and
the ones modifying READ_ONCE()/WRITE_ONCE().

Note on patch #3: It fixes the segfault observed in count_tstat.
However, I'm not sure if you want to take it or not. The fail can
be thought of as a Quick Quiz within the Answer to the Quick Quiz.
So keeping it as is would also be reasonable.

        Thanks, Akira
--
Akira Yokosawa (5):
  count: Employ new scheme for snippet of count_end and count_tstat
  count: Fix uses of READ/WRITE_ONCE()s in count_end and count_tstat
  count: Tweak counttorture.h to avoid segfault
  count: Employ new scheme for snippet of count_lim
  count: Fix uses of READ/WRITE_ONCE() in count_lim

 CodeSamples/count/count_end.c    |  53 ++---
 CodeSamples/count/count_lim.c    | 147 +++++++------
 CodeSamples/count/count_tstat.c  |  27 +--
 CodeSamples/count/counttorture.h |  21 +-
 count/count.tex                  | 437 +++++++++++++--------------------------
 5 files changed, 287 insertions(+), 398 deletions(-)

-- 
2.7.4

