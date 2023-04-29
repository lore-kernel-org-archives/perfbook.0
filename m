Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682809642; x=1685401642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFucU/9B0qE55+Fp675hDJ99OerenKig+joEb+LG4g8=;
        b=EPyUtCBN9aBAWpxM4BtUg4xM2B/a1/eSMtNI4nBS6faFoW+RyOkoeMgBPOpNQ5Vd5H
         qYN+DfgvmGnSUUlnIwALnI5vQ5SlrZv51AuJNknJQz06+0zaF++9A9NFZU2gRp9F9Khh
         yO/8S65Oy5gDyeNBKrb/taA+pnrwmh2sHmCgWw/OP7ytBARLJwIqjeQuF5Wzr6D8cyQ4
         KNpAWh1KfMsMWTpEK2ixt9f4tvdlCFCAqTjDCIc3i9dmd1eiyqZNzqSLqkgcIoWpbEYL
         veWOAwRZOIWRFVWf0QmgKS5+tQf/EYy+P/1m/E/gudF0SnkIXHFH/uz7lvEJAWpAUwFS
         2m5w==
Message-ID: <46c02030-ceca-2547-7b68-1e8642ae18fa@gmail.com>
Date: Sun, 30 Apr 2023 08:07:18 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/7] formal/ppcmem: Use \qco{} as intended
Content-Language: en-US
References: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit f87fadc4c8ea ("formal/ppcmem: Use \qco{} instead of ``\co{}''")
did not use \qco{} in one of the hunks.

Use \qco{} as intended.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 10526bca88ae..9d7704fa43d0 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -99,7 +99,7 @@ exists						@lnlbl[assert:b]
 
 \begin{fcvref}[ln:formal:PPCMEM Litmus Test]
 In the example, \clnref{type} identifies the type of system (\qco{ARM} or
-\co{PPC}) and contains the title for the model.
+\qco{PPC}) and contains the title for the model.
 \Clnref{altname} provides a place for an
 alternative name for the test, which you will usually want to leave
 blank as shown in the above example.
-- 
2.25.1


