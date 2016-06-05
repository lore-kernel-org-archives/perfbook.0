Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=o4jgxL7CU2WbUbxyjTLN3gAl03Rlxg6QexJdttvYUNQ=;
 b=L8BNrD4//RrYwr7Y1e++ZF34VaBtL6RBUks6nG8YIRdN7cX74GidxyOfqlNEXcP6ms
 /MBIypwiC/T5oDcsTFrLdDFZUv20mW7VODCh6QIrlhvVW05NDLtltya+UZUUEneTAjfa
 LNoeTsRppGyqmMNSg2erUAA4Y3iGfIOw1v4fuC7y0KmY7toK0//aEaQVcBJQYBwbd2nf
 lH118fecVAJrI+EkZriQPCD/fggEwwjRnjkjMFhPmoBxmi05DkvcKTGcTLGGnppWHpSA
 SyfqTNtgwxbWNfqv3uXvHZCk3FnURS+NRA0zrh0aswzGYdvXX2OjcoS32JlpXpA6M5Np
 +AZQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH 0/3] Another round of cleanup and improvement of build
 scripts
Message-ID: <be0f87e8-a39f-6c82-1946-46bacfcd6f66@gmail.com>
Date: Sun, 5 Jun 2016 23:52:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d6c5dc0374c6e558d0acc003273b42537e50297f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 Jun 2016 23:34:26 +0900
Subject: [RFC PATCH 0/3] Another round of cleanup and improvement of build scripts

Hi, 

This series enables parallel build of '.pdf' figures in the first build
or a build after removing them by 'make distclean' or 'make neatfreak'.

It is by no means complete, but it works just fine for the evaluation
purposes. Any feedback is welcome. Further improvements and cosmetic
changes are in my to-do list.
                                                     Thanks, Akira

The series can also be pulled as follows:

---- 
The following changes since commit e719d43325af354d6f0a8a8c8d914b82430a9ff4:

  Add TEST_HASH symbol to allow tests to be excluded (2016-05-30 09:50:52 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git cleanup-makefile

for you to fetch changes up to d6c5dc0374c6e558d0acc003273b42537e50297f:

  Makefile: Promote eps2pdf.sh to implicit rules (2016-06-05 23:17:49 +0900)
----

Akira Yokosawa (3):
  Remove .eps files whose sources are .dot
  FAQ-BUILD.txt: Add graphviz package as required
  Makefile: Promote eps2pdf.sh to implicit rules

 FAQ-BUILD.txt           |   4 +-
 Makefile                |  62 ++---
 advsync/.gitignore      |   1 +
 advsync/store15tred.eps | 653 ------------------------------------------------
 count/.gitignore        |   1 +
 count/sig-theft.eps     | 435 --------------------------------
 6 files changed, 30 insertions(+), 1126 deletions(-)
 create mode 100644 advsync/.gitignore
 delete mode 100644 advsync/store15tred.eps
 create mode 100644 count/.gitignore
 delete mode 100644 count/sig-theft.eps

-- 
1.9.1

