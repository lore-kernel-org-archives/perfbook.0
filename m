Return-Path: <SRS0=tmJ5=JC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qzP/dJgh1gFIi5TMOujyEdyKM5RydC1ruCOo5rzgbfQ=;
        b=ILZVByp8YBsEWmGuCdluTlcED6XwmEHIxHkWBDlPVmk2UoTewrhqSkfuSAQyC2b9OT
         mfgOxN2/PiDe0USriH1m7cdl/qPGkrlslBXGBDpv3E/5/MF1fv+cUlFW9L69JrjpIGg4
         fxUatnlrJQT2GHyMVhaIrUHtxq9dYLXKriHJYn/6BxuIA+MQyHUK7LxW39wcm2c2aQ9M
         YUh7IShJpJ9jD0nD3Uhcl/HSOLXjETXqraqUrpU+SxtP/ELbAvBbTEdkjc4ZaBSoo7yd
         9pkCc6PDlNwy4vMEGKmcvf5criXCsvjWMs/78CwiIsbuV54kOvua1QBogygqc3ej5rnE
         S7dg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Index and acronym tagging scheme
Message-ID: <9b9b9f15-9ede-eaf3-d213-0cb48642abff@gmail.com>
Date: Mon, 5 Apr 2021 12:38:55 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, SeongJae Park <sj38.park@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi all,

So I changed my mind and have managed to support normal and modifier
uses of acronym tags.

This topic branch is much smaller than that of the RFC.

Commit 85e93cd23b38 ("index, acronym: Add acronym list and two-level
indexing") contains almost all of the changes to support the new
scheme.

Commits b97d9921b0fd ("acronym: future/htm: Tag TM, HTM, STM, and RCU
via acronym dictionary") and 6a8e58549dc1 ("acronym: Tag 'CAS' and its
long/full form") are PoC of the new scheme.

As is explained in the change log of commit 85e93cd23b38, acronyms who
have modifier forms are registered by the \newabbreviation macro in
glsdict.tex.
Note that the key for the modifier from has a ":m" appended to the one
for the normal form, e.g., "cas:m".
Accessing modifier form can be done by macros \acrm{} and its friends.
They accept the same key as \acr{} and its variants.

One thing changed from RFC is that by default, all the acronyms defined
in glsdict.tex have their "first use" flags unset.
This is to prevent unexpected expansion where you expect short form
to be presented.
Where you want a first form, you need to use \acrfst{} or \acrmfst{}
explicitly.

Another thing I changed is the frequency of tagging by \acr{}, \IX{}
and their variants.
Tagging everywhere indexed acronyms/terms appear would make the LaTeX
sources hard to read.

Indexing is meant to help help people find where a specific term
is discussed. Tagging everywhere won't help much in this respect,
and it might increase noise.

So the above mentioned commits have tags only sparingly.

We can add relevant tags later if there a page where a term/acronym
is the main point in the discussion.

Commits 69a36b97e28e ("Makefile: (help text only) Refactor build
targets"), 283bf48cfa39 ("Makefile: Update rules to reflect help
text"), 7537b1f4a710 ("FAQ-BUILD: Drop Ubuntu Xenial from build
environment"), and 8a8dcbd601e8 ("FAQ-BUILD: Ubuntu Bionic needs
up-to-date glossaries-extra") are the same as in the RFC.

Commit 16f6aae9fbff ("Glossary: Add an entry for "Plain Access"")
is a rebased Paul's change I have carried in my topic branch.

I think this minimal branch is ready to be merged.
If you have any problem, please let me know.

Once it gets merged, I will continue tagging other terms/acronyms
in the sparing manner one by one.

        Thanks, Akira

-------------------------
The following changes since commit 9facbec307ee98cfc3e6e3224772595fbda575f6:

  treewide: Mark non-end-of-sentence full-stop of 'vs.' as such (2021-04-04 16:33:12 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-index-2021.04.05a

for you to fetch changes up to 16f6aae9fbffce68ab0776648ebf9ac0d8efe764:

  Glossary: Add an entry for "Plain Access" (2021-04-05 10:29:05 +0900)

----------------------------------------------------------------
Akira Yokosawa (8):
      index, acronym: Add acronym list and two-level indexing
      acronym: future/htm: Tag TM, HTM, STM, and RCU via acronym dictionary
      index: Use \IXr{} and friends for tagging 'Moore's Law'
      acronym: Tag 'CAS' and its long/full form
      Makefile: (help text only) Refactor build targets
      Makefile: Update rules to reflect help text
      FAQ-BUILD: Drop Ubuntu Xenial from build environment
      FAQ-BUILD: Ubuntu Bionic needs up-to-date glossaries-extra

Paul E. McKenney (1):
      Glossary: Add an entry for "Plain Access"

 .gitignore                         |   8 ++
 FAQ-BUILD.txt                      |  51 +++-----
 Makefile                           | 132 ++++++++++++--------
 SMPdesign/SMPdesign.tex            |   2 +-
 cpu/hwfreelunch.tex                |   4 +-
 cpu/overheads.tex                  |   6 +-
 cpu/overview.tex                   |   4 +-
 cpu/swdesign.tex                   |   2 +-
 formal/ppcmem.tex                  |   2 +-
 future/cpu.tex                     |  10 +-
 future/htm.tex                     |  18 +--
 glossary.tex                       | 170 ++++++++++++-------------
 glsdict.tex                        | 245 +++++++++++++++++++++++++++++++++++++
 indexsee.tex                       |  15 +++
 intro/intro.tex                    |   6 +-
 perfbook-lt.tex                    |  64 ++++++++--
 together/refcnt.tex                |   6 +-
 toolsoftrade/toolsoftrade.tex      |  10 +-
 utilities/install_latex_package.sh |   4 +-
 utilities/runlatex.sh              |   1 +
 20 files changed, 545 insertions(+), 215 deletions(-)
 create mode 100644 glsdict.tex
 create mode 100644 indexsee.tex
