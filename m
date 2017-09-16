Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oiMM9W6yJOVHX8P4fTp270FdVdv7pr6aRcFaneoa8J0=;
 b=VltncfZkM+Her/B3lY0Fy+/wPBG6mmoZRx0ywe/2+vvtkvDd01q74zusWIOZ7F8e/e
 PR2H3J79mfqKzLiWz2NGRQYBZ5OCPHDZSPO/Z69J7bmw2sJotP/BKfUvgfJg2ZRb0Hxy
 PzIb8n5AYfV9RxamJd2l0XMxMi1+P5ISrniAjkLP3B+KfzwosAUhIo+LBSRWUhRnL0Dt
 cgwMJ4WRoQ7qV9eEfcJsUf4btePEW3TZscY/gOqvBaikE6O4kERVpWucYOpM4lStkRgb
 cCz2bK5lV2kKnB8QDtswWtdnyvua2x01gjDisLc+dYx5t6HRu6JlzoenPsmmAGXxVRk1
 k1RA==
Subject: [PATCH 3/5] memorder: More reword to 'full-strength non-void RMW'
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2ccb2b07-a42b-5c79-f50f-f535692f3b13@gmail.com>
Date: Sat, 16 Sep 2017 23:59:39 +0900
MIME-Version: 1.0
In-Reply-To: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From eaf26d55d0e73058d9574a0966aaeb6292dc8729 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 16 Sep 2017 11:00:34 +0900
Subject: [PATCH 3/5] memorder: More reword to 'full-strength non-void RMW'

Also update table in styleguide.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 2 +-
 memorder/memorder.tex              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 5fd3b4e..072da9e 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1424,7 +1424,7 @@ using booktabs' ruled lines.
 		     &   & Y &   W &      &   & Y &    &  Y &   W &    \\
 	\tco{smp_mb()} & CP &
 		     & Y & Y &   Y &      & Y & Y &  Y &  Y &   Y &    \\
-	Successful Non-Relaxed Non-\tco{void} RMW & CP &
+	Successful full-strength non-\tco{void} RMW & CP &
 		   Y & Y & Y &   Y &    Y & Y & Y &  Y &  Y &   Y &  Y \\
 	\tco{smp_mb__before_atomic()} & CP &
 		     & Y & Y &   Y &      & a & a & a  & a  &   Y &    \\
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 10aa380..a6a33b6 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -522,7 +522,7 @@ The \co{*_acquire} row covers \co{smp_load_acquire()},
 \co{cmpxchg_acquire()}, \co{xchg_acquire()}, and so on;
 the \co{*_release} row covers \co{smp_store_release()},
 \co{cmpxchg_release()}, \co{xchg_release()}, and so on; and
-the ``Successful Non-Relaxed Non-\co{void} RMW'' row covers
+the ``Successful full-strength non-\co{void} RMW'' row covers
 \co{atomic_add_return()}, \co{atomic_add_unless()}, \co{atomic_dec_and_test()},
 \co{cmpxchg()}, \co{xchg()}, and so on.
 The ``Successful'' qualifiers apply to primitives such as
@@ -611,7 +611,7 @@ are at most two threads involved.
 	available on most platforms, with Itanium being the exception
 	that proves the rule.

-	The ``Successful Non-Relaxed Non-\co{void} RMW'' row captures
+	The ``Successful full-strength non-\co{void} RMW'' row captures
 	the fact that on some platforms (such as x86) atomic RMW instructions
 	provide full ordering both before and after.
 	The Linux kernel therefore requires that full-strength non-\co{void}
-- 
2.7.4


