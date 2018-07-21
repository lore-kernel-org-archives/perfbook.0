Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=4FDvfR6RBxFuLE68iSf29V49bjtvE+K/AOXaFbVJ77I=;
 b=cOoDPmFDt1i/anD/I3n96G+6PxtXJ9EX3jrlNRTv3yMpEY+ewhw6NyEVmJW0Z0aFsf
 hcL2C7ExYkqLXylRFGneNDEz+7M4AodgQdyKrzc4vVnFnhiUmmuTH/hHFzzQAZgLaN6S
 pNRFZUmY/BtByYEjUoc+nfk8JZSEfD0m4nHeCHG2g84Kac4W16Ffts6UGhUhDURJJdmW
 hpIPasBogWbhkiTze0j6DSN+vdlNAiRJvVtzhNDdj5Z+6EWT6jKAbEtBcRApl1yDlgAp
 a48FQyC0E41kvMwU8n1Sscwz5OixEKPW48uVU2MZXHNvD3+4OAGG8b+JsiMqoA9Vumvs
 oOvw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [NOT YET PULL] Trial of labeling lines in code snippets
Message-ID: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
Date: Sat, 21 Jul 2018 09:19:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So, an experimental branch to label particular lines in code
snippets is ready for review.
The branch is based on current master of yours.

I've converted 4 code snippets in Section 4.2. and updated
corresponding code samples (sans forkjoin.c because it is
quite simplified in Listing 4.1).

Does this approach look reasonable to you?

        Thanks, Akira

---
The following changes since commit e3191997557e0d33b862e267fb4d5971e879ca07:

  utilities: Provide scripts instead of broken symlinks (2018-07-18 11:40:57 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook trial-fancyvrb

for you to fetch changes up to 2154a175e469e6238c89d4c494d204a9ddbaa20a:

  [EXP] Update hyphen2endash (2018-07-21 09:17:34 +0900)

----------------------------------------------------------------
Akira Yokosawa (3):
      [EXP] toolsoftrade: Add labels in code samples as comments
      [EXP] toolsoftrade: Reference line in code snippets by label
      [EXP] Update hyphen2endash

 CodeSamples/api-pthreads/api-pthreads.h |  14 +-
 CodeSamples/toolsoftrade/forkjoinvar.c  |  10 +-
 CodeSamples/toolsoftrade/pcreate.c      |   5 +-
 perfbook.tex                            |   6 +
 toolsoftrade/toolsoftrade.tex           | 221 +++++++++++++++++---------------
 utilities/hyphen2endash.sh              |   3 +
 6 files changed, 141 insertions(+), 118 deletions(-)

