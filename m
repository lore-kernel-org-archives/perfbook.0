Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=1z1q8oAMYIE1ZpuDOjdTd75s7MYl9CFlsyU8aWpXQ/w=;
 b=sOZxfMxNw4MNxiWa6glZDcllx2Zs7JyAB9Oj4oudzQTT4iYkOhjKygZ+7g4D94Kog7
 KVoP1yCafd1P4dnrnGaWzfUxRxS/HRhzfFUV59v3J20OfeQUG9H2CAUSWoeSsoPfZd3I
 MRuKT+IXko5eiybESwg45U0ZkhAxyQ4GvXg0s/Nwsc2+0hXLa8uurqZFitjTfyzbt3eJ
 K6jZjwmys5OcJWbNHIlGVvZxeLm0aP7jTDGAFqz2F8WRp1bVD3sU6eYkNwGxZFbBsklI
 i+wTKPNzrMO2u8+eos/BZbqSifCvak3DLKrwH2RypNULEWz62RbtKqIbSuHQIwqT2wQh
 pEzQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Misc updates in Makefile and FAQ-BUILD.txt
Message-ID: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
Date: Wed, 2 May 2018 13:14:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9a745e15ae38e8cfc329a365f2ff28112a19a5c3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 2 May 2018 12:31:27 +0900
Subject: [PATCH 0/5] Misc updates in Makefile and FAQ-BUILD.txt

Hi Paul,

This patch set is the result of trying Ubuntu Bionic to build
perfbook.

One major issue is the incompatibility of a2ping 2.77p and
Ghostscript 9.22. You need a2ping 2.83p which is upstream at
https://www.ctan.org/pkg/a2ping.

a2ping is basically a perl script, so you can easily use the latest
one by putting it in your local bin directory.

Other changes in this set are fixes and modifications I made while
testing on Ubuntu Bionic. The updated Makefile is tested on
Ubuntu Trusty, Ubuntu Xenial, Ubuntu Bionic, Fedora 26, and Fedora 27.

Patch #1 updates message of "make help".
Patch #2 adds entry on a2ping compatibility issue in FAQ-BUILD.txt.
Patch #3 adds note on Ubuntu Bionic.
Patch #4 employs "latexpand" of TeX Live instead of "texexpand".
This frees us from dependency on latex2html package.

Patch #5 updates FAQ-BUILD.txt accordingly.

        Thanks, Akira
--
Akira Yokosawa (5):
  Makefile: Update help message
  FAQ-BUILD: Add entry on compatibility of a2ping and Ghostscript
  FAQ-BUILD: Add note on Ubuntu Bionic
  Makefile: Use latexpand instead of texexpand
  FAQ-BUILD: Remove latex2html in package list

 FAQ-BUILD.txt | 27 +++++++++++++++++++++++----
 Makefile      | 12 ++++++------
 2 files changed, 29 insertions(+), 10 deletions(-)

-- 
2.7.4

