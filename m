Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=/3aSSHbQLs+3SSClk3GxJUtCdP7lUX+gzDY2wRSA/gM=;
        b=SXNXQrfrxV8smfU66zRIL2uyjxfUTskqX0G7s2S94YajuHGsp1Ap5H/fk2r96LTmm/
         yNjwEGpoab4wxKbqx71Vm/0TKXDz+QmvAdDit4DoNjgg3CEkFfiLvDIGN+wWUVGzZ+0s
         O0orhUQPkfsmbq1s19ggwOX0ZhSZo3fm9o+6n7AVdnklxuLHC0rQZhAVv7mV0EUkNyDq
         2apyuvfG3DKkrmQmDhG3r776BuCttaZfbD1H3CPOgGkgX/L+DcxMT6iFxvdPhJN5JtDr
         8GQFtb58h5XFKZnCmAvhw078TJgUtdkuNdhT/cydW7B2vhBD5j2h49Xvvx9pAVB+OBWg
         utcQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] Update snippets of litmus tests
Message-ID: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
Date: Fri, 30 Nov 2018 07:10:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f07d05ca837a57e07f7a87bcbac2bf034905adab Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 30 Nov 2018 06:55:25 +0900
Subject: [PATCH 0/4] Update snippets of litmus tests

Hi Paul,

RCU litmus tests recently added in "formal" did not compile
by klitmus7. Patch #1 is my attempt to manage them klitmus7
ready.

Patch #2 add recipe for klitmus7-ready tests. Such tests need
to be manually added in a list.

In preparing Patch #3, I looked up your "litmus" repository
and found that comments on "exists" clause are actually allowed
in the form of "(* ... *)".  Patch #3 updates labels embedded
in litmus tests. Patch #4 updates styleguide accordingly.

        Thanks, Akira
--
Akira Yokosawa (4):
  formal: Make RCU litmus tests klitmus7 ready
  CodeSamples/formal/herd: Add recipe for klitmus7-ready tests
  Use '(* ... *)' style comments in epilogue of litmus tests
  styleguide: Loosen restriction on comment in litmus test

 CodeSamples/formal/herd/C-RCU-remove.litmus        | 18 +++++---
 .../formal/herd/C-RomanPenyaev-list-rcu-rr.litmus  | 28 ++++++++----
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus      |  4 +-
 CodeSamples/formal/herd/Makefile                   |  6 ++-
 appendix/styleguide/styleguide.tex                 | 25 ++++-------
 utilities/reorder_ltms.pl                          | 50 ++++++----------------
 6 files changed, 57 insertions(+), 74 deletions(-)

-- 
2.7.4

