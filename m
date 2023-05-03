Return-Path: <SRS0=XXQI=AY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683157460; x=1685749460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rctN5YOvJk0tQDB/34BBQ6dnPman0dLfESNZ560Jya4=;
        b=WvVq+GkwFJ8+IYSKkfj8Za9QozRzzVA7Rr1Q7brdw/eWr64/JKy6vxh/D88KNhUZ0D
         W3QrUqQCFpTs2PW5oRFp8yociKN5L7Ue2YSNwmHNpXrtqcgDyrH3cJ6yqOG64Mywf4+X
         V1jnh+Wtz4+w2MC4GpMS96HVsrkPDweth/4AFy/BI7t7M7rGXKqJBMdkIc0w/gyg3/r4
         z86J0J2cwSRkUX29hglWp1yRVvpd7uyyhEzaMiiaDC5sAuGDBZyAq3MQot2n0Yzhlc8v
         CLEdWYvDdX1gdf/O6S6ngx1F8c5N7HCnj31q5vrMtE50TWzv8gAo/Nq+HbP89H+I9gU4
         HRJw==
Message-ID: <055adce3-31a0-2b56-64db-048eb85fed33@gmail.com>
Date: Thu, 4 May 2023 08:44:17 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/4] CodeSamples/formal/data/plot.sh: Tweak plot
 params
Content-Language: en-US
References: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Due to the increased number of bars, color of bars becomes hard to
see.  Unfortunately, gnuplot doesn't provide a means to specify
histogram's border width.

As a compromise, to make border appear relatively thinner, enlarge
plot and font sizes and thicken the ratio plot.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/plot.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CodeSamples/formal/data/plot.sh b/CodeSamples/formal/data/plot.sh
index e91c9126b6bc..30340dbf8e18 100644
--- a/CodeSamples/formal/data/plot.sh
+++ b/CodeSamples/formal/data/plot.sh
@@ -1,8 +1,8 @@
 #!/bin/sh
 
-fontsize=8
-plotsize=0.5
-przsize="nosquare 0.8,0.25"
+fontsize=12
+plotsize=1
+przsize="nosquare 1.2,0.375"
 font=`kpsewhich uhvr8a.pfb`
 
 gnuplot << ---EOF---
@@ -34,7 +34,7 @@ set style line 1 \
 
 # Set linestyle 2
 set style line 2 \
-    linetype 4 lc 'dark-red' linewidth 1 \
+    linetype 4 lc 'dark-red' linewidth 1.5 \
     pointtype 8 pointsize 0.5
 
 #plot 'rcu-test.dat' using 0:xtic(1), for [i=2:3] '' using i linestyle 1
-- 
2.25.1


