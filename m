Return-Path: <SRS0=7RMV=FG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695391010; x=1695995810; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vv15hy1dNP748SsH/y9VOd4i9B6VPtPwPQayRLME//w=;
        b=Ci/bH+L09ISR9+7iYNkS898GkL11o262dfo3An8RvES0BoyiOk8q4XTEsfHFfGab9L
         TW/uXlL8O1dGrX7F4BZUHpRvah1NoCKVc4/huy/752JOwdeIxgHgrnIwmo5Jh4DlrDyY
         B1cbjPKR98muu9lRCnEJaUTcOBnl59EI4A6Xauamg5Ew7z1poBJXx+gQeoTChBgFHKCW
         isIjrYVj/ewf0L6Bl983sRaBf3JnIIa1qdNqcO/u8pEUINsN3Pd24+lGDKHpkTXK8ifC
         zsABDmjetIN3Sg9yKRe3A9l4aa6WCXGhXcMxVyki/xxu6ClfbQVGICaQQ2oZGBYvc9pv
         RfrA==
Message-ID: <2798495a-22f9-470b-b347-ca253cbd673d@gmail.com>
Date: Fri, 22 Sep 2023 22:56:46 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/4] memorder: Add index marker for
 smp_read_barrier_depends() as classic API
Content-Language: en-US
References: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 9af41194f1de..3d2881df6b35 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -5293,7 +5293,7 @@ influence on concurrency APIs, including within the Linux kernel.
 The need for core Linux-kernel code to accommodate Alpha ended
 with version v4.15 of the Linux kernel, and all traces of this
 accommodation were removed in v5.9 with the removal of the
-\co{smp_read_barrier_depends()} and \co{read_barrier_depends()} APIs.
+\apikh{smp_read_barrier_depends()} and \co{read_barrier_depends()} APIs.
 This section is nevertheless retained in the Third Edition
 because here in early 2023 there are still a few Linux kernel hackers
 still working on pre-v4.15 versions of the Linux kernel.
-- 
2.25.1


