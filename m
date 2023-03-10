Return-Path: <SRS0=Yx13=7C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678457223;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnI41Mv8h9GqUDGkXzVKY8P01nuM7G+25RICsmyztnQ=;
        b=GeEjDrktKT+p1ywDmcfwVJJoa0iLJdfzliReoKk/HB0iWSpAdPUo87oss+nTl0dEd8
         FdnUfNPA9C4NhX0mka+fExA9fu6ZMkuUy7WkLJwCUwMfws7Di/zQ90Ym/qzGgyRwD5+z
         eYi8fYFnUQwsI1YTA+hEcKi86xGoJ4feGuxnVXtmQMZhPB9OrrxUtM3JNwDHY+1WmrVh
         7Dlkix00lbg5PZdOKxduDr4q+CyizSG+d//A/o+ZPeyqU2AZI6aRryaB+D+l3n9eSjVG
         nnCxcbg8I1G2WaezRIxKCk81p0ZxhUyulmlBgHlfK39NO04vFsZiJNP3UNJUos71R8RI
         DuQQ==
Message-ID: <21e1a397-c9aa-2100-527c-e29191a918c2@gmail.com>
Date: Fri, 10 Mar 2023 23:06:56 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Improve portability of build scripts
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

As I mentioned a month ago or so, I've been working on improving
portability of building perfbook.

By portability, I did actual tests mostly under FreeBSD and light weight
alpine container images, not under macOS.
So I don't know if this enables native build for macOS, but here we are.

I don't expect any regression for existing build environments.
(Famous last words!)

        Thanks, Akira
--

The following changes since commit 7876fdfc56dd679b41f68ca5507f1637de35bbb6:

  defer/rcu: Include Butler Lampson RCU assessment (2023-02-28 13:30:47 -0800)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-portable-build

for you to fetch changes up to f7592d2c93182397b032413d68fa139baae262fa:

  FAQ-BUILD.txt: Remove /bin/bash from list of requirements (2023-03-10 20:15:12 +0900)

----------------------------------------------------------------
Improve portability of build scripts

Makefile and build scripts have assumed utility commands found
on GNU/Linux systems.
Past attempts to build perfbook under non-GNU/Linux hosts such as
macOS and FreeBSD failed due to differences in directory-tree
conventions and lack of command features specific to GNU variants.

Here is a list of non-portable conventions and features assumed
in the past:

    - /usr/bin/perl in shebang
    - date: syntax of options for format conversion
    - sed: -e in front of regex can be omitted
    - sed: "{" in to-be-replaced regex where repeat count is not
      expected is interpreted as literal "{"
    - sed: multi-line edit
    - grep: -z option

* Changes made for better portability:

    - #!/usr/bin/perl -> #!/usr/bin/env perl
    - sed: always use -e in front of regex
    - sed: escape literal "{" in to-be-replaced regexs

* Still need capable implementation of commands:

    - date: format conversion
	(needed in autodate.sh)
	either GNU or BSD flavor works, busybox date can't do such conversion
    - sed: multi-line edit
	(needed in extractqqz.sh)
	    - FreeBSD's native sed lacks this feature
    - grep: -z option
	(for checking \cref{}{} which should be \crefrange{}{})
	    - busybox grep on alpine lacks this config
	This check is moved from Makefile to cleverefcheck.sh and
	skipped if an incapable grep is detected.

  Necessary features of date and sed are now checked in the very beginning
  of make runs. Manually running "make precheck" can give a verbose
  result of the check.

  For those who have a full featured command in a different name,
  make/environment variables SED, DATE, or GREP can be used to specify
  an alternative name or full path.

* Package/command removed from requirements:

    - fig2ps
    - which
    - bash

** fig2ps

  On most Linux and other UNIX-like distros, fig2ps is not provided as
  a distro package.

  fig2ps would be needed if LaTeX special strings (such as math expressions)
  were used in FIG files. But it is not the case. Instead, fig2dev is
  good enough for .fig --> .eps conversions.

  fig2dev should be available for most distros as a package named
  "fig2dev" or "transfig".

** which

  It has become usual to be greeted with the

     "which: command not found"

  message on minimal installation of Linux distros, for example,
  RHEL/CentOS/Fedora and Arch.
  Instead, "command -v" is the portable way for testing command
  existence since POSIX 2008/2013.

** /bin/bash

  It turns out that existing build scripts work with variety of /bin/sh
  choices including dash, bash, zsh, and even busybox sh.
  The setting of "SHELL = /bin/bash" in Makefile is now dropped.

Tested under FreeBSD 13.1 and alpine.

----------------------------------------------------------------
Akira Yokosawa (15):
      Use /usr/bin/env in shebang of perl scripts
      extractqqz.sh: Allow alternative command name for 'sed'
      Makefile: Use multiple '-e' flags for non-GNU sed compatibility
      autodate.sh: Add code for BSD-flavor date command
      autodate.sh: Allow alternative command name for 'date'
      Makefile: Use portable egrep pattern (enclose '{' in '[]')
      Makefile: Move CREFPAIR check into cleverefcheck.sh
      FAQ-BUILD.txt: Add Q&A on building under non-GNU/Linux systems
      Use fig2dev as fallback to fig2eps
      Add precheck.sh
      FAQ-BUILD: Mention precheck
      Stop using 'which' command in bulid scripts
      FAQ-BUILD.txt: Remove fig2ps from necessary packages
      Makefile: Remove 'SHELL = /bin/bash'
      FAQ-BUILD.txt: Remove /bin/bash from list of requirements

 FAQ-BUILD.txt              | 53 +++++++++++++++++++++++--
 Makefile                   | 54 ++++++++++++-------------
 a2ping-rule.mk             |  2 +-
 epstopdf-rule.mk           |  2 +-
 utilities/autodate.sh      | 24 +++++++++---
 utilities/checkfcv.pl      |  2 +-
 utilities/cleverefcheck.pl |  2 +-
 utilities/cleverefcheck.sh | 23 +++++++++++
 utilities/divideqqz.pl     |  2 +-
 utilities/extpagegroup.pl  |  2 +-
 utilities/extractqqz.sh    | 17 ++++----
 utilities/fcvextract.pl    |  2 +-
 utilities/gen_snippet_d.pl |  2 +-
 utilities/mpostcheck.sh    |  4 +-
 utilities/precheck.sh      | 98 ++++++++++++++++++++++++++++++++++++++++++++++
 utilities/qqzreorder.pl    |  2 +-
 utilities/reorder_ltms.pl  |  2 +-
 utilities/verbboxcheck.pl  |  2 +-
 18 files changed, 238 insertions(+), 57 deletions(-)
 create mode 100755 utilities/precheck.sh
