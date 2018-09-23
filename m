Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=6Y3xuGzsui6kw9RqBquiH9dR+9OXzq1ln+Ir/sr6eqo=;
        b=amH3RyXXgWDBpxBX2Kngwlw6+RkcTFGy/H9TQSjdG0j00ld0or8wngEN2KQrRUFiso
         uexavS5SNfX6cubs/Psv2Rax22UcNXYql6Gi/67JDx68WE6eWNCIbIb2o2IO0QQjeY9o
         xJEszL2tb9RfJQ/GZm9Py4P+/l4F5K4suh2ZrSHAdTHedimmwcTedHTyAx1U28QEPFV/
         OpNBsRAcNTFIPD+XcmgWMUEyjNQ7VvFI94nSwNHPnreL4oXMMWyyXRncRiiZy2VNw7oE
         P+bt6zbxtw+Qr9/22WL8bc5x87RSuqiik6dzUsXm8SBbUBiw+SrCjHNYKcMf3YlsrcRj
         cG9Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/9] Update code snippet extraction scheme
Message-ID: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
Date: Sun, 23 Sep 2018 16:21:05 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From df6459c699d373a247342b3a79d3bf7a239cfbe3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Sep 2018 09:16:20 +0900
Subject: [PATCH 0/9] Update code snippet extraction scheme

Hi Paul,

This patch set updates scripts to extract code snippet from
source files under CodeSamples/.

Patch #1 fixes fcvextract.pl to use "linelabel" environment in
extracted .fcv files.

Patches #2 through #5 add capability to handle code snippets
other than C. Patch #2 is a simple update with a bug fix to
handle source files under deep sub-directories. 

One major obstacle was the restriction of comments in .litmus
files.

    1) We can't add comments at the beginning nor the end of
       a litmus test.
    2) There are a few tokens and characters we can't use in
       comments, i.e. "exists" or "filter" as a token in
       comment is not accepted by herd7, "{" and "}" characters
       sometimes cause error, comments of the form "(*" -- "*)"
       are not allowed in the C-language part of litmus test.

I ended up using comments of the form "//...", which has been
supported by herdtools7.

Patches #3 and #4 work around the restriction.

Patch #5 prevents a side-effect of doing "make" under
CodeSamples/formal/herd, which will convert litmus tests under
CodeSamples/formal/litmus so that they can be fed into herd7,
and cause the converted tests to have redundant
"\begin[snippet]" meta commands.

Patch #6 adds an option "style=" to the meta command
\begin{snippet}, which can be used to specify which of
Verbetim{L/N/U} is to be emitted. It also adds pass-through
handling of other options.

Patch #7 is not an update to the scripts, but a tweak in
appearance of VerbatimN and VerbatimU environments so that
inline snippets will have frames around them. 

Patches #8 and #9 are examples of actually extracting snippets
from .sh and .litmus files.

Effect of patch #7 can be seen in Section 4.1 (below the 1st
paragraph) and in Section 4.2.1 (above Quick Quiz 4.6) after
applying the whole patch set.  If you don't like the change,
feel free to omit #7.

By this update, hopefully, the new scheme should be able to
cover 99 percent of snippets. Although the scripts lack
rigorous checks of unexpected inputs.

        Thanks, Akira

Akira Yokosawa (9):
  fcvextract.pl: Use 'linelabel' env in extracted snippet
  Update build scripts to support code snippets other than 'C'
  Add scripts and recipes to work around restriction of herdtools7
  reorder_ltms.pl: Enable further labeling in litmus test snippet
  Exclude meta command lines in .litmus -> .litmus.herd conversion
  fcvextract.pl: Support 'style=' option and pass through other options
  Enable 'single' frame around inline code snippets
  toolsoftrade: Example of extraction of snippet from parallel.sh
  future/formalregress: Example of extraction of snippet from .litmus
    file

 .gitignore                                         |   1 +
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus      |   2 +
 CodeSamples/formal/herd/litmus2herd.sh             |   4 +-
 CodeSamples/toolsoftrade/parallel.sh               |  20 ++--
 Makefile                                           |  19 +++-
 future/formalregress.tex                           |  40 +------
 perfbook.tex                                       |   7 +-
 toolsoftrade/toolsoftrade.tex                      |  12 +--
 utilities/fcvextract.pl                            |  74 ++++++++++---
 utilities/gen_snippet_d.pl                         |  66 +++++++++++-
 utilities/reorder_ltms.pl                          | 117 +++++++++++++++++++++
 11 files changed, 281 insertions(+), 81 deletions(-)
 create mode 100755 utilities/reorder_ltms.pl

-- 
2.7.4

