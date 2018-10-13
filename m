Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E78nbwZ3ewfl4Ua8MzTdQZts8YB0cJfWbJH180bxVyI=;
        b=KwjUHEVvSt+z7fnk13MLxtvvP1AEyHTgWMW8kCTTEgATxsH1VHzDdVU/FU5SYl4TW8
         O99lz2lsi4nRXrP8ve0H/i1CcUrne3aMNY+dt4E0JWYM5E6/mpVZt6KkFaCpIJSeBT/G
         08RNGlk6u9FKwt2kwKdBq3Nbb/q9y1pg5BA6wNaelebayd53+E90DSXdlXo6JBSMDyyn
         yaXE9GxN5O7llQ/OYuVH7XCwdPRAeopRujGtcv5wAcmyHJuOCr4D2wHYId8/KD3UCs5y
         t5GwRLPM/znF1HKFFfEDMAsOxoO4GUS7PKsijAXbVPE5HUhy/sxfdd1zpkghg7AEhVfD
         9HVQ==
Subject: [PATCH 7/6] count: Fix typo (missing \lnref)
References: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1df2c84d-4a55-6050-627a-21bc568c5b82@gmail.com>
Date: Sun, 14 Oct 2018 08:15:45 +0900
MIME-Version: 1.0
In-Reply-To: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8cf8ccf218f2a3b3a15911a6a4619c21627dfe37 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Oct 2018 08:09:49 +0900
Subject: [PATCH 7/6] count: Fix typo (missing \lnref)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

This fixes typo in Patch 4/6 ("count: Employ new scheme for snippet of
count_lim_sig").

        Thanks, Akira
--
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index d8d60db..4d13394 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2421,7 +2421,7 @@ if (counting) {
 Lines~\lnref{b}-\lnref{e} shows \co{flush_local_count()}, which is called from the
 slowpath to flush all threads' local counts.
 The loop spanning
-lines~\lnref{loop:b}-{loop:e} advances the \co{theft} state for each
+lines~\lnref{loop:b}-\lnref{loop:e} advances the \co{theft} state for each
 thread that has local count, and also sends that thread a signal.
 Line~\lnref{skip} skips any non-existent threads.
 Otherwise, line~\lnref{checkmax} checks to see if the current thread holds any local
-- 
2.7.4


