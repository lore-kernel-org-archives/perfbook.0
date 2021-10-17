Return-Path: <SRS0=LG5i=PF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=17SgFL7ZFYPdsGrPnuRn15aLVyxPMrQFLk1Ir+xsXdw=;
        b=Ul85Pd6pIZfLu3zdCNOxGFJqGqna2ZtPMUhtwXLtYnRSC2lvoNewpSgsZsU7iL100C
         yk6NtFHxXdzbMTLut9guKSdPo+uBlGPbmc1rfD0plaN+2p2uHCbvI0+Fxo8riYJP99Sx
         /xiOgBMuWI8O4p4MXPu3jYhM8FDffq6L8NSwxJdfGubmmIwF9Oi5mZk2NRVHDnPUeuPm
         RrZJMsp2lPmZQNe6FmAWt+FWngiFXd32wgb2K4IivXFhEtcX9qH2SRQbeO0hh54Yfk2m
         nisGINqykDQPne15u9w2xf/SnoYiY0tbY/YuVfekZdPel2Z9umS3t2E9Od7mX0Zc8T3O
         NofQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/3] Updates of docker/ and Makefile
Message-ID: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
Date: Sun, 17 Oct 2021 17:13:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set consists of updates under docker/ and Makefile.

Patch 1/3 updates Dockerfiles under docker/.
It adds a couple of font packages in Dockerfile.fedora and
adds "gnuplot" and "time" commands in all three Dockerfiles.

Patch 2/3 shortens progress reports from "make".

    Old example: intro/PPGrelation.svg --> intro/PPGrelation.pdf
    New example: intro/PPGrelation.svg --> .pdf

Patch 3/3 switches the default "esp --> pdf" rules to those in
epstopdf-rule.mk.

To see the effect of patches 2/3 and 3/3, a "make neatfreak"
before "make" or "make -jN" is needed.

        Thanks, Akira
--
Akira Yokosawa (3):
  docker: Add some fonts and commands
  Makefile: Shorten progress report (dir/filename.src --> .dst)
  Makefile: Promote epstopdf-rule.mk as the default

 Makefile                 | 16 ++++++++--------
 a2ping-rule.mk           |  6 +++---
 docker/Dockerfile        |  8 +++++---
 docker/Dockerfile.bionic |  8 +++++---
 docker/Dockerfile.fedora | 11 ++++++++---
 epstopdf-rule.mk         |  6 +++---
 6 files changed, 32 insertions(+), 23 deletions(-)


base-commit: d28c5aa8c1dad57c76554743cc4e59a18d367303
-- 
2.17.1

