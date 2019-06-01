Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NAAuYrbDeH8EaRaWoNkL5LDOV2dYAysVm8QT9ZhmqrM=;
        b=JEYGTDzxiy1nZRUT272dm9YUyrS9C8p5XWcHcuQJzqq/rTJxlzWTk0YTPH7ti7/nOa
         juU0yXV03HDZ8Io1nNKpj/z5qTuprPvvvHLZ7SK8ILENnnRI7JwCeM0vnI37MoilMjP6
         u5C4JyC8cqcmtDONCo3quywKV+CN7ddek+YQSDCfZR77VtrYEGcAaBVwL3lYyiaUgjKK
         bLI1MHeUkfXnXZV0cfsjtmv6E2md5agzRIy5CbzBmzsOO7WoZg8TNwStYsopqMVZGFKk
         Twrs51+Z5zxKS1biZOT2Jpu0tMlAaoGAS9o9DRQfX8j86X+FR/0nIEv5G0P9PYXtvh8Q
         Vb6w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] together: Fix a wrong number of lines
Date: Sat,  1 Jun 2019 09:54:25 +0900
Message-Id: <20190601005425.22065-2-sj38.park@gmail.com>
In-Reply-To: <20190601005425.22065-1-sj38.park@gmail.com>
References: <20190601005425.22065-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/applyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 9ee770c..d0b1c5d 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -283,7 +283,7 @@ Line~69 can then safely free the old \co{countarray} structure.
 \QuickQuiz{}
 	Wow!
 	Listing~\ref{lst:together:RCU and Per-Thread Statistical Counters}
-	contains 69 lines of code, compared to only 42 in
+	contains 70 lines of code, compared to only 42 in
 	Listing~\ref{lst:count:Per-Thread Statistical Counters}.
 	Is this extra complexity really worth it?
 \QuickQuizAnswer{
-- 
2.10.0

