Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E5luW4/QeSk7Fge3EhJSPGrBosZ2Put3OAMZJ490Wr8=;
 b=QXGxJ/j82+4zj77oWTKs0LrpsnFyBnpMf6se38Z20FRnNvENjf8QE3ir9JTk2PPiR8
 eAZWZ+xEmYCGQC0Lmu7O62dvI2KTN2Z9XzZ+Z+hfiXeFGGZhrxZkAiNSWv9jMKgIWPPk
 mWtjLzOO+YpoCZz41JL121UUJrArwlywj8txm97aEwzvCvLnW026YSCjG7X6qXXyFRCv
 WtoqcoPapY8ZqOczr6eVvBtf25BJhpzbzHeUs1Y1gTSl/eXTh7WSMmMN/gj1DXjJCHQG
 oFAuHzSHG0RXZHOGdHmW3WqBRN2UDScfUDPGW4tFr9ou+yrBMIlMU9kqywJBL+5qzpqE
 gbZg==
Subject: [PATCH v2 3/5] memorder: More reword to 'full-strength non-void RMW'
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
 <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <49e40bbd-622e-9e8d-0849-2224eb12a79a@gmail.com>
Date: Sun, 17 Sep 2017 00:10:12 +0900
MIME-Version: 1.0
In-Reply-To: <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From eaf26d55d0e73058d9574a0966aaeb6292dc8729 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 16 Sep 2017 11:00:34 +0900
Subject: [PATCH v2 3/5] memorder: More reword to 'full-strength non-void RMW'

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


