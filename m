Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=o85GGbW5k4l+FnRN6SA3k/ucJXAogpKpYeeb3hZG85U=;
 b=Iiu16zGDBU+/0xtrqYFyGiXFV0OLt9PO/FXgigTOb9r3dY1bW5CLqu41hp8k//SdBW
 s5CV+XdhiKr3gpNZ5ExLANUFRAhbk9E2f0ynBRe9ppfpeG31ILWHAhZ2zgCdnyu10RPz
 vsNZ7YXxmcVwjGobbQpjjRkQdPhLpcNXcGaR/Hqztezqx9uA8jybHHgMAS50lwQagebF
 krfbbbpyY252T/94m7M4WAEslQthNZ4JZ4bEnkkOgbkZFjgNiRY39jjR8tkQ1cgKGxj/
 /D3t4shcv2A5YmJzwAboQ+mbHo6Ie/E0/s9ohkFfCCtnqIypMj4YkacRQdZeTZYTJ6CR
 HbNQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] CodeSamples: Fixes for ppc64
Message-ID: <ad29f159-eb20-4493-d1f7-90bd4b3f17ae@gmail.com>
Date: Sat, 3 Jun 2017 16:01:39 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7c151a100ef7d6c30259a966c68c45421edd7707 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 3 Jun 2017 13:32:49 +0900
Subject: [PATCH 0/2] CodeSamples: Fixes for ppc64

Hi Paul,

With the help of you, I now have an access to a ppc64 instance on
OSU Open Source Lab.

I tried to build under CodeSamples/ there.
But I needed to fix dependency rules I updated recently.
Also, script for ppc64 in Makefile failed to copy
api-pthreads/api-gcc.h to api.h.
Patch 1 fixes them.

Patch 2 removes GCC flags specific to POWER5, and update links
to pages with regard to optimization for POWER.

And there are a few things I want to confirm regarding CodeSamples.

(1) Is libucru a must now?

If it is the case, we should remove "else" blocks in Makefile
which copu linux/list.h to api.h.

(2) Is little endian assuemed?

You suggested to choose ppc64le for the instance on OSU Open Source Lab.
Is there any code that doesn't work on big-endian platform?

(3) Can we remove gprof-helper.c?

Although I fixed the entry in .gitignore the other day, gprof-helper.c
lives in the repository from the beginning. Can we get rid of it?

            Thanks, Akira
-- 
Akira Yokosawa (2):
  CodeSamples: Fixes for build on ppc64le
  CodeSamples: Remove cpu specific flag for ppc64

 CodeSamples/Makefile                 | 2 ++
 CodeSamples/arch-ppc64/Makefile.arch | 7 +++++--
 CodeSamples/depends.mk               | 2 ++
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.7.4

