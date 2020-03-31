Return-Path: <SRS0=YlGk=5Q=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=fsWVtOPV7OkQHftYK+MKzM+Ywj1IM1VzTiru5zKY3zo=;
        b=XBzJ+bmqIW829WBI1mKANv2C0dw0GDwtZSRWsC/mvTaVGyghAhmAYJbuCSm9qaxkoU
         N13ijs0XdqCBKzRq0ne5G2vFcQzIW9eKzRu0A8HlmI4l9sEKK2+G3sjIw5n6kMG4vXKP
         2GLJ/hunQmeT9Pf8/PUzPQPo37kQUkjTrlMk/daA4gxxrSdrxdWZp930caGZwu1WZdGw
         Im0XP1HHuKyQUxgtssrTDDY40yGIO6zHjKkFkmptWOjR8J5uxllzksTLa9jYit0A33Br
         kHWTfHyeF8tESA0P5sT1CCgmtnEtytZB7X70mi2gF87yDtMdek7cXcgEL4clFQBxO9JX
         ilsg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC GIT PULL] Make choices of paper size and layout orthogonal
Message-ID: <cdb5e66d-c733-e6e0-72be-b6f5196fc3f1@gmail.com>
Date: Tue, 31 Mar 2020 23:56:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The following changes since commit 32aff715700d62502624d4dc6468b9fa354c791b:

  SMPdesign: Drag matmul.{c,sh} kicking and screaming into shape (2020-03-29 11:24:02 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.31a

for you to fetch changes up to 39cb8ba9cf5629f93d1fdbf5dd8204cc6f9f077b:

  Let paper size be orthogonal to 1c/2c layout variations (2020-03-31 19:14:40 +0900)

----------------------------------------------------------------
Hi Paul,

This pull request consists of the following.

Commits 1/10 and 2/10 adds target for a4paper via an environment variable
PERFBOOK_PAPER.
Commit 3/10 does similar tweaks for hard-cover-book paper size.

Commits 4/10 -- 6/10 are minor typo fixes. Narrow spaces in front of
percent symbols are for consistency with the Style Guide.

Commit 7/10 is the change on my todo list to enable framed Quick Quiz
on release tags.

Commit 8/10 is an improvement of dependency to tag addition/removal.

Commit 9/10 is an improvement of the torelease script. The added arguments
can be used to specify a secondary git repository for testing/contingency.

Commit 10/10 is what I came up with the organization of make target
variations.
My idea here is to make it possible for us to choose any combination of
choices of paper size and layout options.

By this change, when you set PERFBOOK_PAPER=A4, a "make" or "make 2c" will
generate perfbook.pdf of a4paper, a "make 1c" will generate perfbook-1c.pdf
of the same paper size, and so on. Default paper size is US letterpaper.
so as long as you are concerned, "make" and "make 1c" won't change their
behavior.

For hard cover books, setting PERFBOOK_PAPER=HB and doing a "make" will
generate perfbook.pdf of the custom paper size for "hb".

You can still build perfbook-lt.pdf, perfbook-hb.pdf, or perfbook-a4.pdf
regardless of the setting of PERFBOOK_PAPER.

Note that the rename of perfbook.tex to perfbook-lt.tex, which is tracked
in the git repository.

"make help" will show only the "2c" and "1c" builds with a note on the
variable PERFBOOK_PAPER.

Doesn't this approach sound reasonable to you? 

Any feedback is more than welcome!

        Thanks, Akira
--
Akira Yokosawa (10):
      Add target for A4 paper
      Makefile: Add PERFBOOK_PAPER=A4 support
      Makefile: Add PERFBOOK_PAPER=HB support
      Makefile: Fix typo in recipe of msnt
      SMPdesign: Fix trivial typo
      Put narrow space in front of percent symbol
      Enable framed Quick Quizzes on release tags
      Makefile: Let autodate.tex depend on tag status
      utilities/torelease: Make sure new tag is pushed
      Let paper size be orthogonal to 1c/2c layout variations

 .gitignore                      |   2 +
 Makefile                        | 110 ++++++++++++++++++++++++++++------------
 SMPdesign/SMPdesign.tex         |   2 +-
 debugging/debugging.tex         |  16 +++---
 perfbook.tex => perfbook-lt.tex |  96 +++++++++++++++++++++--------------
 toolsoftrade/toolsoftrade.tex   |   2 +-
 utilities/autodate.sh           |   7 ++-
 utilities/torelease.sh          |  20 ++++++--
 8 files changed, 171 insertions(+), 84 deletions(-)
 rename perfbook.tex => perfbook-lt.tex (94%)
