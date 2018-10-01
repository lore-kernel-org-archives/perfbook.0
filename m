Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=m0fYQbxPyERc4rNTFy/we4w4wgXHgJ3fv3dv5K9PACw=;
        b=Q60g6Cct/KS3BcxGCII0FVVUBwHdaAoWnAi0Yyhp+hUv/i2bHA1MSSN8e27xkvyU2k
         9HkBoU6x4UN+Mj/VA7l4bl+8fevVuHYSemZVJkCxQIkKG6NNyQc/Ji0YrPwlMUW2DYP8
         QwwHWoaRADZX3yGZIlA1L8XPB/70tr1U2gqbKRScMIkJP/CU9KTnKfk6PoxjI5qJN1/B
         YM1iwt3shPmw13H6ZbFWkIev9rNHe1bM8yUCJj6fpYlx5079oYX0+SInYOJIS+XsrBq+
         VXmX9D9pz1xVqPlBWgzis0hzoMrWaINhsg/xIKkIKp2FjKoe39Dt2irpr8x6pGsNCNc7
         n7Hg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Misc updates
Message-ID: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
Date: Mon, 1 Oct 2018 22:48:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c545a33aea39aeae40bcff478285f814c32a4456 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 1 Oct 2018 22:05:58 +0900
Subject: [PATCH 0/5] Misc updates

Hi Paul,

This is a miscellaneous collection of updates.

Patch #1 fixes build error you'd encounter when you do "make"
after doing "make" under CodeSamples/ directory.

Patches #2 and #3 fix trivial typos in FAQ-BUILD.txt and
tooldoftrade, respectively.

Patch #4 removes obsolete workaround code in perfbook.tex.

Patch #5 removes rules in Makefile used to support a hi-res
figure in QC section.

Once Patch #5 is applied, you can remove orphaned files listed
below:

    future/Bloch_Sphere.svg
    future/QC-FormConstant.eps
    future/QS1_1.svg
    future/T2h1lc19xmqrdlsor.eps
    future/ibmqx2-labeled.svg

As a matter of fact, I have prepared a patch to remove
them, but it would be too large to submit.

        Thanks, Akira
--
Akira Yokosawa (5):
  CodeSamples: Exclude meta command lines in building api.h
  FAQ-BUILD.txt: Fix typo
  toolsoftrade: Fix typo DEFINE_PER_THREAD() -> DEFINE_PER_CPU()
  Remove workaround for Fedora 23 Tex Live bug
  Makefile: Remove rules for QC section

 .gitignore                    |  1 -
 CodeSamples/Makefile          |  4 +++-
 FAQ-BUILD.txt                 |  2 +-
 Makefile                      | 25 +++++--------------------
 perfbook.tex                  | 14 --------------
 toolsoftrade/toolsoftrade.tex |  2 +-
 utilities/gen_snippet_d.pl    | 16 ++++++++--------
 7 files changed, 18 insertions(+), 46 deletions(-)

-- 
2.7.4

