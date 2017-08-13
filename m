Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=yN8Qau6wQwnWBCOVEKKNIf5DzuBp8qNYG+yzKK056bI=;
 b=V60gdIhx3NU+UCDsDpJtqIQLwcIe9VWxFKwYQ1ByjHoDKQL1nvU2yYI3U2U3YJSQgy
 Sw//j6avg4IcVv7oOTsj98xdRs5X94EEy+NRxhS7tI0NrSXG+NWvRjq2EM7MtwNgEPdW
 aMZj8EoFvGQbB4XOKZ+YwV70DcPyCIOmo0y+XLocauysSxQXxYKvNU48tqA2l5xiuAtl
 KR9u5P5gj9plREgPI+N52Zg+UFySzYnxmkvkAeZ0cZOUApbEHRYTJSGihmeoQsVTIRpZ
 J3uE4xnqXfefPNwyHWv47U0GPj4oaM/WnR6kRnT3DJ/9/qenlw085Ut5T2JDGPJBm8ta
 eiXQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Style guide updates
Message-ID: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
Date: Sun, 13 Aug 2017 12:27:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 24d4de52c8186c1ec1787e76d13e22646d804a53 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Aug 2017 11:00:48 +0900
Subject: [PATCH 0/5] Style guide updates

Hi Paul,

The style guide needs some updates regarding recent changes in
litmus tests in memory barriers section. (Patch #3)
Also I recovered the tweaks in table layout. I added another
option to color rows alternately. (Patch #1 and #2)
Patch #4 is my attempt to convince you that using commas for
digit grouping should be regarded as harmful in global POV.
My suggestion is to use \num{} commands in LaTeX source and
let a reader to pick a style of his/her choice.

\num{} command can slow down pdflatex processing somewhat,
but should be acceptable on modern platforms.

Thoughts?

        Thanks, Akira
--
Akira Yokosawa (5):
  styleguide: Add examples of alternative table layout
  styleguide: Tweak layout of 'Limitation' table
  styleguide: Update LaTeX source of code snippet
  styleguide: Add example of options to \num{} command
  styleguide: Emphasize source part of epigraph

 appendix/styleguide/samplecodesnippet.tex    |  19 --
 appendix/styleguide/samplecodesnippetfig.tex |  19 ++
 appendix/styleguide/samplecodesnippetlst.tex |  19 ++
 appendix/styleguide/styleguide.tex           | 375 ++++++++++++++++++---------
 perfbook.tex                                 |   5 +-
 5 files changed, 301 insertions(+), 136 deletions(-)
 delete mode 100644 appendix/styleguide/samplecodesnippet.tex
 create mode 100644 appendix/styleguide/samplecodesnippetfig.tex
 create mode 100644 appendix/styleguide/samplecodesnippetlst.tex

-- 
2.7.4

