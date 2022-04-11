Return-Path: <SRS0=g3Xn=UV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=qdv6mYKz+7PYCkxp5iTM13w/PoPg1FRmp2oNCfEV7YI=;
        b=NVoxFLr9ctbE/JNfaHuD4tf4o0bqs7lT5i0XSHFh1u6lPuhRTttSHqORbUvP3A3cvg
         pQfIRnUFueRIwlvyTsK1/okjZr85hWJBdXI2DP9GJDIEKLoeRqhX1TUp5Om7EmtkEkjd
         sgff7uliK46iL9m8IlWZmu/SLlzdjg7A9Ak+ge+fZAqjKHARJfJRzUpchhDtSrhtI9iO
         eK7nntG5wXqXUR2zG/t0maH6a7Q/4p7GjZXirGqk4GIDCQ0JFkReiMkNKbkQZo0kvaY7
         TX6SVymg/DDus+VNDRd9wpnxz4KjMuMSiOKgymoDhFivThfcYTJje2nX39JuVUzU2mVF
         7xgg==
Message-ID: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
Date: Mon, 11 Apr 2022 16:49:01 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/7] Build script updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here is a set of updates to build scripts.

Patch 1/7 is to avoid possible build errors when previous build
is interrupted in the middle of converting figures with some
intermediate temporary eps and/or pdf file(s) left. 

Example of such an error (long message not folded):

CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall.eps --> .pdf
make: *** No rule to make target 'CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall__.eps', needed by 'CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall__.pdf'.  Stop.

After this type of an error (or errors after a parallel build),
one needs to run "make clean" (or "make neatfreak"), and run
"make" again.

By adding commands in Makefile to ignore file names of "*__.eps",
this mode of error can be avoided.

The added pattern in .gitignore resolves false "Untracked files"
from "git status".

Patch 2/7 fixes redundant use of filter-out function in Makefile.

Patch 3/7 updates help texts regarding EBook-size builds in
Makefile.  They don't need (WIP) anymore.

Patch 4/7 is to allow use of LaTeX commands other than "pdflatex".
In vanilla TeX Live, there is an alternative command of
"pdflatex-dev", which is used to test development-phase
latex implementation.  With this change, I am allowed to test
it by saying "make LATEX=pdflatex-dev".

Patch 5/7 is to catch typo in the LATEX variable.

Patch 6/7 catches an error exit of LATEX command and print log
messages to the terminal.

Patch 7/7 is a cosmetic tweak improving the later stages of
progress reports from parallel builds.

        Thanks, Akira
--
Akira Yokosawa (7):
  Makefile: Ignore temporary .eps files
  Makefile: Remove redundant nest of filter-out function
  Makefile: Let ebook-size builds graduate from 'WIP'
  run{first}latex.sh: Use variable for 'pdflatex' command
  Makefile: Test $(LATEX) before invoking runfirstlatex.sh
  run(first)latex.sh: Catch error exit of LATEX
  runlatex.sh: Align status report messages

 .gitignore                            |   1 +
 Makefile                              |  27 ++++-
 Makefile.2022.01.25                   |   4 +-
 utilities/runfirstlatex.2022.01.25.sh |  98 +++++++++++++++
 utilities/runfirstlatex.sh            |  16 ++-
 utilities/runlatex.2022.01.25.sh      | 164 ++++++++++++++++++++++++++
 utilities/runlatex.sh                 |  23 ++--
 7 files changed, 314 insertions(+), 19 deletions(-)
 create mode 100644 utilities/runfirstlatex.2022.01.25.sh
 create mode 100644 utilities/runlatex.2022.01.25.sh


base-commit: 87d3513257e793b90f53ebd4b138ab2371aaf25c
-- 
2.25.1

