Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=JhdX/UGAeRkVSfHM0IEZAFB8HkriqVjKoL7ZxFV2LcI=;
        b=dW23kH94orf3YqIpRvdgwP++PSuytfVbJLFlRlZGiweYooQ0/+1+Uk9qsuQ/QmjfHE
         QKR0kDQvq/yOy5WAC0Rws6hc2ibQ8UJBvCBGQ3UdYlf9nP/iA3Z7/jRXJprrkd9xFge8
         HK1g9K2Hja/ae7gton90xcRMh3im4cLi/tfwDHWvOBNhWihSwfXXgw5h5RYovOapdRug
         fc746hrDNwhoXBk31UkR34B9HzVOBmMxjCbPhR6yqtZu4HGA4VRpOr1ZH6IGsPAiPPYi
         T3gsITi028BrT+cEtnmmw52aJuo8Elf4XgZxt40RdkrJTkbTJSo+nf7OvaKkPngAL9gK
         qRSQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/7] count, toolsoftrade: Employ new code-snippet scheme
 (cont.)
Message-ID: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Date: Sat, 27 Oct 2018 00:22:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is a set of simple conversions of code snippets to the new scheme
in count and toolsoftrade.  There is no change in the code under CodeSamples,
but there are a few visual changes in the pdf output which reflect the
actual code samples.

Patch #7 fixes an unintended change in indent width made in the previous
patch set.

        Thanks, Akira
--
Akira Yokosawa (7):
  count: Employ new scheme for inline code snippets
  toolsoftrade: Use 'VerbatimU' for inline snippets
  toolsoftrade: Employ new scheme for snippets of lock.c
  toolsoftrade: Employ new scheme for snippet of rwlockscale.c
  toolsoftrade: Employ new scheme for snippet of compiler barriers
  toolsoftrade: Employ new scheme for snippets of threadcreate.c
  count: Fix indent in count_lim_atomic.c

 CodeSamples/api-pthreads/api-pthreads.h |   7 +-
 CodeSamples/count/count_lim_atomic.c    |   2 +-
 CodeSamples/intro/threadcreate.c        |  20 +-
 CodeSamples/toolsoftrade/lock.c         |  76 +++---
 CodeSamples/toolsoftrade/rwlockscale.c  |  54 ++--
 count/count.tex                         |  89 +++---
 toolsoftrade/toolsoftrade.tex           | 460 ++++++++------------------------
 7 files changed, 253 insertions(+), 455 deletions(-)

-- 
2.7.4

