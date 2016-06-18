Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=0YQhY9y0p6ymhRQZRwO58JVVakWNxiHrEIb00oe4crA=;
 b=TYBQ2gqBqjCir8Y0VeYVCDUGO1SE02MIz8Y3MjUWex3PHyMlGTEGfVVTADUtu8Dn92
 c36Genoch/sqe9ZRbTw6zpGrezndL9aKpkvnYHuSmdY5leis9O6E9HrCnTN/BizDzXP2
 RvUKNeo6tpotUW91569+pnTmfBrEO9FfKDkpoARwOwkbF9ZcmH+ztPZxV2+oSCbG9ZSn
 Fnwz8zqjSe5SH3BUE5YzR3nvqZkQP59PP1DMapT+Vq6699FwRQ3+emt451z+zIUEBSG0
 oneR98CFehwMcMAOtJKUueoJgChlm21zsp1pOMTM7u5RZGq9fq6rnPDiGextvGO4NT++
 M/nQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] Cosmetic fixes for chapters 4, 5 and 6
Message-ID: <5d5dfa35-bee5-8370-4bab-9780d7ae0219@gmail.com>
Date: Sat, 18 Jun 2016 17:43:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The following changes since commit 17ba9e5472a7eefa5e7af13f708c1df4f772e11b:

  cpu: Fix numbers in Performance of Mechanisms tables (2016-06-17 20:54:35 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git cosmetic-fixes

for you to fetch changes up to 0c2b722d652c4da3b3ba7c0521e50f0f2df57d59:

  count: Typo fix ("a Intel" -> "an Intel") (2016-06-18 17:20:35 +0900)

----------------------------------------------------------------
Akira Yokosawa (9):
      toolsoftrade: Centering figures of verbatim code examples
      toolsoftrade: Adjust position of Figure 4.5
      toolsoftrade: Use \path command for C source file name
      count: Use \path command for C source file name
      count: Centering figures of verbatim code examples
      count: Tweak position of Figure 5.1
      SMPdesign: Use \path command for path names
      SMPdesign: Centering figures of verbatim code examples
      count: Typo fix ("a Intel" -> "an Intel")

 SMPdesign/SMPdesign.tex       |  70 ++++++-----
 SMPdesign/beyond.tex          |  42 ++++---
 SMPdesign/partexercises.tex   |  32 +++--
 count/count.tex               | 270 ++++++++++++++++++++++++------------------
 perfbook.tex                  |   1 +
 toolsoftrade/toolsoftrade.tex |  98 ++++++++-------
 6 files changed, 302 insertions(+), 211 deletions(-)

