Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=xaexmttdsXKIaOiUGBmLw5OqId3PNS5kZVJGOgzURR4=;
 b=I0WtN+pMfxMivbbB3HyylxCs/fMydWkItiVCGyRsdH64Ozb5990f5HO6PGtNNNXTUI
 fNBn6Ccp5QWYwVG1lr00ShhZSHPN0bugZmyBQ4QKgpWemN6h4YN77ftfmxp0uabqvf7C
 +zQs7H9cO1IuPHULrX0yux9+BdemPJWL+QfhZUTOIJxcW7M9TOU0fthD114ckTDuPjNx
 yca2xgB4lCaOIfeHaSnud3lNrJo5bVCt1+r1OCpXZAvaaJg3A3OJ/DgTa/BC0S4uxbhT
 V8AnW74jkgyH+Ytx9NoR03N7J0B2LZYP8oH0CqjowbpVck+2TrzD6s82DkYJJUQzc0OQ
 8t6w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH 0/3] Trial of replacing hyphens with en-dashes
Message-ID: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
Date: Sat, 13 Aug 2016 12:38:11 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a63dd50b648013af5780341f9c740bf9d9f6b65d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 13 Aug 2016 11:17:19 +0900
Subject: [RFC PATCH 0/3] Trial of replacing hyphens with en-dashes

Hi Paul,

This is an RFC patch series of my attempt to replace hyphens used for
ranges of numbers with en-dashes.
Instead of sending modifications in LaTeX sources as patches, I'm
submitting scripts which do the replacements on the fly.
The "sed" script is fairly stable now, and there is no false positives
AFAIK.
There might still be false negatives I'm not aware of. Any false positive
would be addressed by adding a sed pattern.
As a bonus, the sed pattern also contains fixes of typos such as "line~mm-nn".

To try the replacement, at the top directory of perfbook, invoke the
script by "sh utilities/dohyphen2endash.sh".
You need to be in a clean git repository. This check is to ensure
that you can revert the changes made by the script by "git reset --hard".
So you might want to try this series on a test branch.
Or the check of git status can be overridden by a "-f" or "--force" option.

The modification by the scripts can be reviewed by "git diff" afterwards.

It is up to the editor's choice whether or not to commit the result.

Just adding the scripts to the repository is fine with me.

                                                Thanks, Akira 
------

Akira Yokosawa (3):
  Trial of replacing hyphens with en-dashes for number ranges
  dohyphen2endash.sh: Add check of git status
  dohyphen2endash.sh: Use mktemp to create temp file

 utilities/dohyphen2endash.sh | 74 ++++++++++++++++++++++++++++++++++++++++++++
 utilities/hyphen2endash.sh   | 50 ++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 utilities/dohyphen2endash.sh
 create mode 100644 utilities/hyphen2endash.sh

-- 
1.9.1

