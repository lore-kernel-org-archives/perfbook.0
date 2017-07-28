Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=GJn3Xh/9V3PBqe9wqXS3e1GUUD87OswzKnlXkkHNVFE=;
 b=rT+zUErepJKeHvFdlWEbDkGiGJ76sYTZG5OG1i5NRFq9IB0DNSyhUmVngC5qHz56Dd
 mAADZJ7Yv4BG/No6i+50f5OE6ugsZ1y6JDmQGcHKsE/BLSkx8dMRktZ+NmHYK0DIdu/X
 yOQWGm6AarEqXiegBmOPIV93zmKJJzileVmYBdqWoPSKODqd+qPD/gO0By1k/FGOOyD7
 S3RzyYAmophDp+1VVr0RpRpuOVHD7tklEAnFNI0kykdk7zlleRoK3CegD9N+HVSPL9R+
 491SamSmbE9cmeeHrZEt5jgNluFRIx9CExsR2qXjZoM5hrBmxnInSDggrynSt9zvIGdc
 TnYA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 00/10] Add style guide
Message-ID: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
Date: Fri, 28 Jul 2017 18:53:19 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cdfca8b81a7d4ee194272359d1775c0c343e0fbe Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 28 Jul 2017 18:06:01 +0900
Subject: [PATCH 00/10] Add style guide

Hi Paul,

This patch series is my attempt to add a style guide for perfbook
in response to your suggestion.

I added it under appendix/styleguide.

It consists of three parts.

  1) Paul's conventions
  2) NIST style guide
  3) LaTeX conventions

I called several conventions as "LaTeX conventions", but they are not
restricted to LaTeX community.

In 3), I attempted a few experiments with the "floatrow" package.
As it conflicts with two-column layout, I need to localize its .sty
file and apply a workaround.

Experiments I did in 3) includes:

  a) Use "listings" environment for code snippets.
  b) Place captions of Tables and Listings at the top.
  c) Improve table layout.

They would involve quite a lot of modifications if we actually employ
the styles. My intention is to show the direction of possible
contributions. I'm not that sure such changes would be worthwhile, though. 

Also, there should be a lot of room to improve in English composition.
Hopefully, unnatural sentences are at least understandable.

Any feedback is welcome.

Note:
  The version of "verbatimbox" required for this series specified in
  patch #2 is newer than the one provided in TeX Live on Ubuntu 12.04 LTS,
  which reached its regular EOL this April. The one on Ubuntu 14.04 LTS
  should suffice. 

       Thanks, Akira.
--
Akira Yokosawa (10):
  appendix: Add style guide
  Specify required revision of 'verbatimbox'
  Localize floatrow.sty
  Apply workaround to floatrow.sty and rename it floatrowpf.sty
  Define 'listing' environment for style guide
  styleguide: Add listing environment examples
  Disable 'floatrow' layout in manually aligned code snippets
  styleguide: Add example of grouping code snippets
  styleguide: Add example of preferred table layout using 'booktabs'
  styleguide: Tweak layout of 'Limitation' table

 appendix/appendix.tex                     |    1 +
 appendix/styleguide/hello.c               |    9 +
 appendix/styleguide/samplecodesnippet.tex |   19 +
 appendix/styleguide/styleguide.tex        |  841 ++++++++++++++++
 defer/rcuusage.tex                        |    6 +-
 floatrowpf.sty                            | 1480 +++++++++++++++++++++++++++++
 howto/howto.tex                           |    4 +-
 perfbook.tex                              |    6 +-
 8 files changed, 2360 insertions(+), 6 deletions(-)
 create mode 100644 appendix/styleguide/hello.c
 create mode 100644 appendix/styleguide/samplecodesnippet.tex
 create mode 100644 appendix/styleguide/styleguide.tex
 create mode 100644 floatrowpf.sty

-- 
2.7.4

