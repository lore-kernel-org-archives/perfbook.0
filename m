Return-Path: <SRS0=nXUX=YT=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9UZq84WK5kjetN5VW+WUzgaV+E30DUqUx9Sh+mYCRrI=;
        b=aYxD6MZx+L2u6iPlTz+pQYHvHI+tGWzLHz7xOGOycK39CVBeH2uO/N/hloLz/bVi6t
         gXINovWuMBueR4ErH2krOUywnxIyIc5xz7AnfX8nD86JOFUxAGccIKGmlwGzOZ+SLkPP
         6GfYGolkkqFB9HqadVtTOdyuBDsd5LV9WAmR1kjnZNFLCgoHX8yRhB0dQeCYoIsjMQPd
         xdj/Bmxye7FtNyy17kwTVCoQWFURmLdgvOnMhFokVq2CLsHfB0A5KaCZK38mF2H1j/j9
         Rw83Xm2fv8NRD3MuATiAoCqUt32tknVfid/GSC55tt0EED+d+a8wvXTFiPun+cDy6iKt
         WIGw==
Subject: [PATCH 3/3] count: Update CPU type/system
References: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0c4e1d46-ef37-da54-cb4b-8850282567f1@gmail.com>
Date: Sat, 26 Oct 2019 09:22:31 +0900
MIME-Version: 1.0
In-Reply-To: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 79832886d01cd0e9e5d491132528dba83440a548 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 27 Oct 2019 09:03:44 +0900
Subject: [PATCH 3/3] count: Update CPU type/system

We are now talking about results obrained on an x86 system.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index 4b01bc75..6430abd5 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2934,7 +2934,7 @@ courtesy of eventual consistency.
 Table~\ref{tab:count:Limit Counter Performance on x86}
 shows the performance of the parallel limit-counting algorithms.
 Exact enforcement of the limits incurs a substantial performance
-penalty, although on this 4.7\,GHz \Power{6} system that penalty can be reduced
+penalty, although on this x86 system that penalty can be reduced
 by substituting signals for atomic operations.
 All of these implementations suffer from read-side lock contention
 in the face of concurrent readers.
-- 
2.17.1


