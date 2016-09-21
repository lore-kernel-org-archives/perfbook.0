Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zwXh4BuGWAEucguXZXOCgAzxYjrwB2K/tAzN+GfIX1s=;
 b=KNqtdozObQoviNqF/qUOMVQyYxfceFoLZNvNTdnEa3HgJzyNh5zP4bDm7CIE1mKlpJ
 kUqpv6JfnJKwIkj41nZzmzVdw26GwVev0r/znnl6bnmXwBxXEoONPxUuCQT5uQFZpxKo
 WYJWZvrQwM5acljNgTMqeZeP6eXlsJtQxe5GBbVyjp5mmaMja5QFh93vp3OaFAzZobwH
 RV1S6g1Nre3Q4IPu8d+WTpoJFkhB3SPGrefInDp04XFpSJrW/ACju0Kz4tmEfso1JtPD
 p3n8ZVjabkSb36Dvd+ExQfY+0e2S2dpURmY/tdDkGt3QhlqV98+6DvVF1rIiBba1EmLK
 Z+Sg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 16/17] formal/ppcmem: Polish a sentence by removing
 unnecessary conjunction
Date: Wed, 21 Sep 2016 11:44:47 +0900
Message-Id: <20160921024448.24744-17-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 743a891..7dc9675 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -233,7 +233,7 @@ The next section describes how to run this litmus test.
 \subsection{Running a Litmus Test}
 \label{sec:formal:Running a Litmus Test}

-Although litmus tests may be run interactively via
+Litmus tests may be run interactively via
 \url{http://www.cl.cam.ac.uk/~pes20/ppcmem/}, which can help build an
 understanding of the memory model.
 However, this approach requires that the user manually carry out the
-- 
2.10.0

