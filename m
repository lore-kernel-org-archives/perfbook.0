Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=nbgbVklHXl5tNsmONCe3PW21T7bTS2kz3yTgF5MiKZc=;
        b=nvbHKcgtgwga80fia8K5BgpmVhfGvWKXB6mb5zqgagdOi/vhOgmxt6N3x/KXlEWkhz
         tahh1faqoiYeWvOWr4+Yhpp44EqFSMH12PbaJNNH2ZNJw3f9JATy8N9PEor+VHmmCyPK
         b3luwb6DYPmAoHcDmrc6ZPzZqjwkACVVbZ3IZtrgEldh7xvot+S/6jH8euqLCFLPCVth
         ZX5H+nv0PyWOXj8B+7lH8iFpJXOxAvww2SLLBezTjodyi+VCYXReKwt9UDKVcPCBQCLj
         yHNJmclYRaUX+cgOhiwF4yI9mYWM/wtxqWPtNSdDuW3jGFxhKFtIefMFPg22qkC61z6O
         0l7g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] count: Employ new code-snippet scheme (cont.)
Message-ID: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Date: Sat, 13 Oct 2018 23:52:50 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

count_lim_sig.c was a hard one to review for me regarding the usage
of READ_ONCE()/WRITE_ONCE(). Patch #5 is my attempt to add several
of them. There might be other combination of racy accesses.

Patches #1--#4 are trivial ones.

Patch #6 is the result of quick review of your recent addition to
toolsoftrade.  I'm not sure you like the addition of comments
"/* BUGGY!!! */" to Lisitngs which look irrelevant to their
captions.

Patches #5 and #6 are more likely to need your close look.

        Thanks, Akira
--
Akira Yokosawa (6):
  count: Employ new scheme for snippet of count_lim_app
  count: Fix uses of READ/WRITE_ONCE() in count_lim_app
  count: Employ new scheme for snippet of count_lim_atomic
  count: Employ new scheme for snippet of count_lim_sig
  count: READ/WRITE_ONCE() tweaks for count_lim_sig
  toolsoftrade: Proofread newly added sections

 CodeSamples/count/count_lim_app.c    |  17 +-
 CodeSamples/count/count_lim_atomic.c | 209 ++++----
 CodeSamples/count/count_lim_sig.c    | 159 ++++---
 count/count.tex                      | 892 ++++++++++-------------------------
 toolsoftrade/toolsoftrade.tex        |  44 +-
 5 files changed, 494 insertions(+), 827 deletions(-)

-- 
2.7.4

