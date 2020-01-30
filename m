Return-Path: <SRS0=aoJh=3T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=quJ47zwEjWOJtUUl1QmKK6lzTERH0Yw3JHQPOj+2SRU=;
        b=Uwx8Kzo2Qc2lqczEO2H5dkj4gZuMjTJDAu50zPUnqHFpUN2wbJ7jhHyk19PF8PA0am
         7xFGRhl9LxP9QrJDsspk17NsvxQdjFRhP9zmwJzL0hjJMK/SpB6UgZsiAgkSe3h+J6Uh
         7SD0uluvJzAn4fUsMK5yX4P9BeDxVWhwiKP1cmXN5hZBWkW+gowTElnkyvx4OBmYLEg2
         AiGsdfmAWvG11yZ5vHGnNKiO7BvOHbRjXjtFOT28ezbj7tvqSR9WpZB+dDHSp6SSsTrb
         vK3LDl9+KEpquYCyW2wgttBEmUHaCcCXL17FNWsw6qBlTtFHQM+MC5myvFPQsyK0NT/f
         S4CA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] howto: Reduce width of Listings 2.1 and 2.2
Message-ID: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
Date: Fri, 31 Jan 2020 07:27:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dc553b44983b30584d0f1003a729885b8b7290f2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 30 Jan 2020 21:13:04 +0900
Subject: [PATCH 0/6] howto: Reduce width of Listings 2.1 and 2.2

Hi Paul,

This patch set has quite a large diff stats despite the
small changes in the resulting PDF.
What I am trying here is to enable (semi-) automatic line breaks
in code snippets.
The "fvextra" package enhances the capability of fancyvrb.
By specifying "breaklines" and "breakafter" options to the
VerbatimL environment, snippets with a long line can be typeset
as a plain "listing" environment.
I see that Listings 2.1 and 2.2 do not deserve the full width
of the page and tried to apply the fvextra approach.

However, there were unfortunate name collisions of custom
environments.
"fvextra" requires the "lineno" package, where "linelabel"
and "lineref" are used as global variables.

So I need to rename the environments to "fcvlabel" and "fcvref".
Patch 1/6 does those renames, hence the large diff stats.

Patch 2/6 adds checks to detect now erroneous uses of "linelabel"
and "lineref".
Without this change, as they are defined as LaTeX variables by
"lineno", such uses wouldn't be caught by LaTeX as errors, but
would end up in undefined references.
The remaining warnings in the log file would be far from pin-point.

Patch 3/6 actually modifies Listings 2.1 and 2.2. At this point,
the symbol representing carriagereturn in Listing 2.1 doesn't
look good enough to me.
Patch 5/6 takes care of the symbol. It also adds comments to mention
the "-jN" option of "make".

Patch 4/6 updates FAQ-BUILD.txt.

Patch 6/6 is an independent change to loosen the required version
of "epigraph". It turned out that the combination of the up-to-date
"epigraph" and the "nowidow" packages doesn't work properly on
TeX Live 2015/Debian (Ubuntu Xenial). On a more recent TeX Live
installation where the combination works, a suggestion to upgrade
"epigraph" will be output after the build completes.

As this patch set touches Makefile, please test carefully before
pushing out.
Especially, I'd like you to test Patch 2/6 and see if the error
message, displayed when you use "linelabel" or "lineref" in place of
"fcvlabel" or "fcvref", looks OK to you.

        Thanks, Akira
--
Akira Yokosawa (6):
  Rename environments 'linelabel' and 'lineref'
  Makefile: Check 'linelabel' and 'lineref' used as environment
  howto: Reduce width of Listings 2.1 and 2.2
  FAQ-BUILD: Add 'fvextra' to the list of packages in item 10
  howto: Tweak carriagereturn symbol at fvextra's auto line break
  Remove required version of 'epigraph'

 FAQ-BUILD.txt                                |  30 ++-
 Makefile                                     |  47 ++++
 SMPdesign/SMPdesign.tex                      |  12 +-
 SMPdesign/beyond.tex                         |  44 ++--
 SMPdesign/partexercises.tex                  |  32 +--
 advsync/advsync.tex                          |   8 +-
 advsync/rt.tex                               |  40 ++--
 appendix/questions/after.tex                 |   4 +-
 appendix/styleguide/samplecodesnippetfcv.tex |   4 +-
 appendix/styleguide/styleguide.tex           |  52 ++--
 appendix/toyrcu/toyrcu.tex                   | 128 +++++-----
 appendix/whymb/whymemorybarriers.tex         |  16 +-
 count/count.tex                              | 200 ++++++++--------
 datastruct/datastruct.tex                    |  80 +++----
 debugging/debugging.tex                      |  12 +-
 defer/defer.tex                              |  16 +-
 defer/hazptr.tex                             |  20 +-
 defer/rcuapi.tex                             |   8 +-
 defer/rcufundamental.tex                     |   4 +-
 defer/rcuintro.tex                           |   4 +-
 defer/rcuusage.tex                           |  52 ++--
 defer/refcnt.tex                             |  20 +-
 defer/seqlock.tex                            |  40 ++--
 formal/axiomatic.tex                         |  40 ++--
 formal/dyntickrcu.tex                        | 148 ++++++------
 formal/ppcmem.tex                            |  24 +-
 formal/spinhint.tex                          |  44 ++--
 future/formalregress.tex                     |   4 +-
 future/htm.tex                               |  28 +--
 howto/howto.tex                              |  57 ++---
 locking/locking-existence.tex                |  20 +-
 locking/locking.tex                          |  76 +++---
 memorder/memorder.tex                        | 240 +++++++++----------
 owned/owned.tex                              |  12 +-
 perfbook.tex                                 |   9 +-
 together/applyrcu.tex                        |  32 +--
 together/refcnt.tex                          |  32 +--
 toolsoftrade/toolsoftrade.tex                | 184 +++++++-------
 utilities/checkfcv.pl                        |   8 +-
 utilities/fcvextract.pl                      |  10 +-
 40 files changed, 956 insertions(+), 885 deletions(-)

-- 
2.17.1

