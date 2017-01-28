Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=nrQa7QdSJDg0nQe0JHnKPaEGU2luniZZ8NTPbOVZtGk=;
 b=DjCIAYPUhcF9h1wc2jjlpZ+PSZRv0LlwauruLbsSMlevke8RWMVzROuQN+JvzGkyIv
 knqdIkCzpVE6/vB0l/L9G5XqVYXeTwazsjJGtTsmIRgxo6sIQoQKX4cDpa74tXxiLwsf
 e+1XSsCRZ+KZhwhzwMKCETNemXDYn5xwStWbV2kEgQCoYaRmq+w2ezdt+kLH8MezlRME
 85sPFV3Qsl3aAuqRtWq+9Tn0ev+IAQxRuuwN8wabjYFYH1yCFKvAHvKwhIQoPPnT7Vg+
 ByXCyOsjtnHBCL+sUGR8Iuz2GszUSV9hXaU7At3gOUFmKkhkZ1UeJLBMoxsI9aus0pGE
 25JA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] Misc updates and fixes
Message-ID: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
Date: Sat, 28 Jan 2017 20:06:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 11f5734bf4b31fbb51cd6ec603d680a8b3f4f99c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 28 Jan 2017 20:01:42 +0900
Subject: [PATCH 0/4] Misc updates and fixes

Hi Paul,

This is a collection of random updates and fixes.

Patch 4 replaces non-hyphenation dashes with math mode minus signs.
As you know, I dislike such uses of dashes in LaTeX source. ;-)

                                    Thanks, Akira
--
Akira Yokosawa (4):
  Update hyphen-to-endash scripts
  advsync/memorybarriers: Use American spelling (initialize)
  together: Typo fix (a RCU ... -> an RCU ...)
  Use math mode minus signs for dashes in tables

 advsync/memorybarriers.tex           |  2 +-
 appendix/whymb/whymemorybarriers.tex | 20 ++++++++++----------
 together/applyrcu.tex                |  2 +-
 together/refcnt.tex                  |  8 ++++----
 utilities/bibhyphen2endash.sh        | 27 +++++++++++++++++++++++++++
 utilities/dohyphen2endash.sh         | 12 ++++++++++++
 utilities/hyphen2endash.sh           |  4 +++-
 7 files changed, 58 insertions(+), 17 deletions(-)
 create mode 100644 utilities/bibhyphen2endash.sh

-- 
2.7.4

