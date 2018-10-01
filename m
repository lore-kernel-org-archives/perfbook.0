Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=udEHRevN/qgxIuOTX3PkudtgmG+NkZd7+rrfM6k22nE=;
        b=aJ6YIgFUtOsmCWQ9JuHk3rAMETs9ZMEflom9WT0ZB0RtIQHdGoQSs45XeeS0mKxTkK
         Uelvd1jH5tMMhfAsZLK/MpaHNvv7n1JJaZCtM1eIJAvAjNvAbAZ0/WL7QxHbgTrQcbI8
         2aX3J91MlGouw7wxRBgTY17tqM1Cmx3Z8mnJ5/D8juUQ5rYro/d8QDJg6xalLKu8F5No
         KltBKCApWLLfR6OBD4lc+CPitGcVHokTbUZdONYL2axXUbFcWOM/C8GZhHivTHlpGYz5
         4i57sVssVG50sjXWnOjWh291rlaxFzOGsfoVoOCZspkIQyPhGIkMq5C/wgoMedNTLK7H
         X+mg==
Subject: [PATCH 3/5] toolsoftrade: Fix typo DEFINE_PER_THREAD() ->
 DEFINE_PER_CPU()
References: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <33ae9587-722e-c9e2-4a68-af58ec7e1e4f@gmail.com>
Date: Mon, 1 Oct 2018 22:53:22 +0900
MIME-Version: 1.0
In-Reply-To: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8dc682c333e435df762d204722b79c439048bfd5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 29 Sep 2018 23:44:07 +0900
Subject: [PATCH 3/5] toolsoftrade: Fix typo DEFINE_PER_THREAD() -> DEFINE_PER_CPU()

The kernel's primitive which provides an initializer should be
DEFINE_PER_CPU().

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index d21bda0..9d80883 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1740,7 +1740,7 @@ init_per_thread(name, v)
 
 The \co{DEFINE_PER_THREAD()} primitive defines a per-thread variable.
 Unfortunately, it is not possible to provide an initializer in the way
-permitted by the Linux kernel's \co{DEFINE_PER_THREAD()} primitive,
+permitted by the Linux kernel's \co{DEFINE_PER_CPU()} primitive,
 but there is an \co{init_per_thread()} primitive that permits easy
 runtime initialization.
 
-- 
2.7.4


