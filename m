Return-Path: <SRS0=XIzw=CZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688731393; x=1691323393;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSLARqlTzvJptlBr2OvAeFYv6pyxmbtXHbJe1jH1HzM=;
        b=i3HGu8IC+dMlaj4xVK4NIIi5u+b04QY53ldbwIfJ7jYGivYvneG9IiI0YJSMdCQv+F
         wKtlX9jWMM1byWjf/m8AAgTgC/eMbrXrmnkXio1sDNhOvG+nfG5M3yRsTwqNJVwbb/NC
         l7im6b1KFRIILgF13ROtWFcC+pUNUlWIwL1AKowvYURKTV4fF3upL3k8vv473um9SOIf
         lrEBCumLROq5sbtHb4gTLEIJ46qbYf0Ip2HIKKIbrvLlhZSB6qIRCm3eT7yxW5PuYwBT
         Q0UOqbmW7mxw9s9Xn5hvRtJBNPt+W6P+d7+4Rua3aLHa/U40oVBTupHQa6MmAQWO37UT
         GXlw==
Message-ID: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
Date: Fri, 7 Jul 2023 21:03:09 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/7] Update preamble and build scripts
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set has two goals.

1. Get rid of warnings in .log files as much as possible.

2. Improve messages printed when fatal/major errors/warnings are
   found in .log files.

Patches 1/7 -- 4/7 take care of warning messages by updating commands/
options in the preamble.

Patch 1/7 removes twocolumn option from \documentclass{} which became
redundant when the geometry package was employed for page layout
settings, especially since commit dad8d409e0b1 ("Delegate geometry
settings to 'geometry' package"). To keep the sloppy behavior for
2c layout, an explicit \sloppy is added. On the other hand, 1c layouts
permit occasional horizontal overfulls now.

Patch 2/7 suppresses a warning on title page in ebook-size builds.

Patch 3/7 improves the definition of \ebresizeverb, which is used
for resizing tall code snippets for ebook-size builds.  In commit
63c1b9f80996 ("perfbook-lt: Add macros to shrink floats for ebook"),
I used varwidth inside lrbox. It turns out that varwidth causes
a lot of "Failed to reprocess entire contents on input line xxx."
warnings. Using plain minipage there is the right thing to do.

Patch 4/7 takes care of font warnings with regard to a missing font
shape in sf (sans-serif) builds.  For sans-serif font family, using
italic shape as a fallback to slanted shape is reasonable. To suppress
those warnings, use a package named "silence" and register that
particular message pattern to be filtered out.

Patch 5/7 improves build scripts. When there is a missing package,
current runfirstlatex.sh fails to print the name of missing package.
This is due to the fatal error condition is tested before those for
emitting pin-point logs.

Reorder the tests so that the fatal condition is tested as late as
possible.

Patch 6/7 is an obvious typo fix.

Patch 7/7 reflects the recent change of TeX Live requirement.

        Thanks, Akira
--
Akira Yokosawa (7):
  Get rid of 'twocolumn' option in \documentclass
  Prevent warning of duplicate page identifier in Ebook-size builds
  Use minipage environment in \ebresizeverb
  Silence font warning in sf (sans serif) builds
  run{first}latex.sh: Reorder checks of fatal error/warning messages
  runlatex.sh: Fix typo (exerpt -> excerpt)
  runlatex.sh: Amend message on out-of-date cleveref

 .gitignore                 |  1 +
 Makefile                   |  1 +
 perfbook-lt.tex            | 26 ++++++++++++++++----------
 utilities/runfirstlatex.sh | 34 +++++++++++++++++++++-------------
 utilities/runlatex.sh      | 28 +++++++++++-----------------
 5 files changed, 50 insertions(+), 40 deletions(-)


base-commit: f78aed35958ba9e0e90df68574be2c7cc40c1396
-- 
2.25.1

