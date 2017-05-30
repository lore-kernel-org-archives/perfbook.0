Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1BOVLt12ZpAlbkTUJ9Xupy5SIBcsEQWa5LIhg0uIwBQ=;
 b=hhYGph7fvgST8wjhIHo/Ltcn1BqtYiPFegwTG0J7weQeG7zx1plpEoLlKE/Iihwtgo
 lwuR7mUEKwwJTbbb4j1cdq8577WnsVOvV0xAqoP3ZSlw0PYD4oyqPHBOIHjjutBDFNwL
 IMIOlzFmH/cIWyj3hSxl8Wo4JDmK6GVYan1GKV21avc4IYR3MivNrLRf1wON9tYUc7Fg
 Pz5xJTi3Q/hp+rBekJJB6Vdra9Xbm2rkBAHqZEsPAI1GleboT03dzrWPEfS0/VuAR1Z9
 sh6ECRFasVrDpImK3a9ebbEtavZ55RjcqjjzUlA7ETFR9z8vl7ltsNUyFiUM1iVyQVJf
 2gBA==
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
Message-ID: <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
Date: Tue, 30 May 2017 21:05:15 +0900
MIME-Version: 1.0
In-Reply-To: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 489b5e3bdeba2f9b733dbe3d85390368dd159174 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 30 May 2017 20:44:52 +0900
Subject: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes

Hi Paul,

This is the respin of the latter two patches of v1. I'm keeping RFC
because of some questions.

"long" -> "intptr_t" changes in Patch 1 have no effect on a platform
where "long" and "intptr_t" have the same width, but I think they
are good in portability POV.

WRITE_ONCE() in Patch 2 is placed under the assignment to the array
because I could not translate post increment in any other way.
Does the WRITE_ONCE() ensure the outer "while" capture the value?

              Thanks, Akira
-- 
Akira Yokosawa (2):
  CodeSamples: Use 'intptr_t' to be compatible with 'void *'
  CodeSamples/defer: Add compiler barriers in gettimestampmp.c

 CodeSamples/SMPdesign/matmul.c     | 4 ++--
 CodeSamples/SMPdesign/smpalloc.c   | 4 ++--
 CodeSamples/defer/gettimestampmp.c | 7 ++++---
 CodeSamples/intro/threadcreate.c   | 4 ++--
 4 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.7.4


