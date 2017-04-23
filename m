Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JOGMBjMftb6x3/7if0tMsRGziMJmQze08E++gsjxpq8=;
 b=Q8jBEUZPqZ4PSvMSD13NBVEGFPopUBn5dkukdEKTdMNO5sB2l5EE0/c5vZsWxY5uTO
 e1P76sxTO0X2QX8pIBMJWjVcwHi3I3l0WXSVfcaUYI9y8ASEjt7ON/AGRFCwIzz+wOkd
 oYF9qq3ALJwbNKiTqjacEdf55Nig9mWsX+TN12jYNlnuR4VQ3MTqPhbK4YE2KhFmjAL2
 /bevz2fB2wfMoQhVOgl6Vq3zXvA+8fB3sy3yPDdYGhM2/EqUGncVg4Tvv45S/Q8lz2km
 uNJ3v6BlEoyUKxGzmi2B9w8YjB8wagyLS807cEZZ5Hn9bQKNjYRZE1wtR9USNYCIT7/S
 IAjA==
Subject: [PATCH 2/4] whymb: Prevent line breaks between 'membar' and '#Sync',
 etc.
References: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cc02516c-d3e6-0bfc-b52a-f79d535e59d6@gmail.com>
Date: Mon, 24 Apr 2017 08:54:08 +0900
MIME-Version: 1.0
In-Reply-To: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 536d7df2df39c0d43bd9e7367b3e4b33c46238a6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 22 Apr 2017 00:14:40 +0900
Subject: [PATCH 2/4] whymb: Prevent line breaks between 'membar' and '#Sync', etc.

These instruction variants are easier to recognize with quotation
marks. Use \qco{} for them.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 6c6b28a..502e37f 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -2244,28 +2244,28 @@ as in
 \co{membar #LoadLoad | #LoadStore | #StoreStore | #StoreLoad},
 thus fully ordering memory operations.

-So, why is \co{membar #MemIssue} needed?
-Because a \co{membar #StoreLoad} could permit a subsequent
+So, why is \qco{membar #MemIssue} needed?
+Because a \qco{membar #StoreLoad} could permit a subsequent
 load to get its value from a store buffer, which would be
 disastrous if the write was to an MMIO register that induced side effects
 on the value to be read.
-In contrast, \co{membar #MemIssue} would wait until the store buffers
+In contrast, \qco{membar #MemIssue} would wait until the store buffers
 were flushed before permitting the loads to execute,
 thereby ensuring that the load actually gets its value from the MMIO register.
-Drivers could instead use \co{membar #Sync}, but the lighter-weight
-\co{membar #MemIssue} is preferred in cases where the additional function
-of the more-expensive \co{membar #Sync} are not required.
+Drivers could instead use \qco{membar #Sync}, but the lighter-weight
+\qco{membar #MemIssue} is preferred in cases where the additional function
+of the more-expensive \qco{membar #Sync} are not required.

-The \co{membar #Lookaside} is a lighter-weight version of
-\co{membar #MemIssue}, which is useful when writing to a given MMIO register
+The \qco{membar #Lookaside} is a lighter-weight version of
+\qco{membar #MemIssue}, which is useful when writing to a given MMIO register
 affects the value that will next be read from that register.
-However, the heavier-weight \co{membar #MemIssue} must be used when
+However, the heavier-weight \qco{membar #MemIssue} must be used when
 a write to a given MMIO register affects the value that will next be
 read from {\em some other} MMIO register.

 It is not clear why SPARC does not define \co{wmb()} to be
-\co{membar #MemIssue} and \co{smp_wmb()} to be
-\co{membar #StoreStore},
+\qco{membar #MemIssue} and \co{smp_wmb()} to be
+\qco{membar #StoreStore},
 as the current definitions seem vulnerable to bugs in some drivers.
 It is quite possible that all the SPARC CPUs that Linux runs on
 implement a more conservative memory-ordering model than the architecture
-- 
2.7.4


