Return-Path: <SRS0=PE5W=SN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=G00CJzBWe/qc/C/4lT0CzLLIA64ccMwtk54vEolrC3I=;
        b=ZUklyMViyay7OOrPRnideXkAFYAtf7l/lHTTU1KN8RukEbEAsISLjq7wzxZoOH24My
         MGAxAqZxLgVreyc0KMh6su+0ZgSh8yTHhJQEcx+ikSblmeUCdlCBmdr5sgwiTYZv5KKH
         rsjI7aqgxbg5sD2PuAGMmxwDwOr5vJA2Xeq8gpZ1ty2jHvOVPg5YKBcBKHTZcjoHPg/H
         0Qjg2nXK7HUK3K1Lsu1Eov2Q1+1ufnP6ysfm2o+sAnii4pfOZCUesA22gnlVNEn5vZ0E
         HcKSROG8c3ZscDbY6BVCji1X1neu7AJkQk37bDEyUTuUnlHnjZhHPLVL9FonENl5oF9O
         GY0A==
Message-ID: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
Date: Sat, 29 Jan 2022 20:19:33 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFT PATCH -perfbook v3 v3 0/4] Enable parallel runs of pdflatex
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I said earlier in v2's thread:

> This patch changes both LaTeX code and Makefile.
> SyncTeX database is affected by LaTeX code change because
> it is a collection of "LaTeX code (file:line:char) <->
> coordinates in PDF".
> So we can't see if changes in Makefile affect PDF or not.
> 
> I'll split this patch into a set of "preparatory LaTeX change"
> and "Makefile update" patches.

I did break up the patch (1/4 and 2/4), but it did not work as I
had expected.
Because of the Git-commit info in the footer area, SyncTeX database
can't be identical when you move to another commit.

So, I restored the Makefile as of 2022.01.25 for reference (3/4)
and added a script to collect and compare SyncTeX databases from
reference, sequential, and parallel runs of pdflatex (4/4).

Please give it a try.

You can override defaults of TARGETS (2c 1c eb) and JOBS (4) by
saying, e.g.:

  TARGETS="2c 1c eb nq 1cnq ebnq" JOBS=8 ./utilities/parallel-latex-regress.sh

It will take quite a while for sequential runs of pdflatex with
the synctex option enabled.  So I'd suggest starting from a short
list.

In my tests so far, no mismatch was detected.

        Thanks, Akira

--
Akira Yokosawa (4):
  Replace \include{} with \input{} for parallel pdflatex runs
  Makefile: Fix issues WRT parallel runs of pdflatex
  Restore Makefile as of 2022.01.25
  Add script for parallel-pdflatex-run regression test

 Makefile                            |  12 +-
 Makefile.2022.01.25                 | 608 ++++++++++++++++++++++++++++
 appendix/appendix.tex               |   8 +-
 perfbook-lt.tex                     |   4 +-
 utilities/parallel-latex-regress.sh |  75 ++++
 5 files changed, 696 insertions(+), 11 deletions(-)
 create mode 100644 Makefile.2022.01.25
 create mode 100755 utilities/parallel-latex-regress.sh


base-commit: f24ccfbd345eab8a70d6c08e71c84f18df46a3a1
-- 
2.17.1

