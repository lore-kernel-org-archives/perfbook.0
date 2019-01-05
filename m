Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S4fdiUubXTLNstMO1M8Kh3XLeqFI+hCAM6Hszm/7l9Y=;
        b=iqbBH/d2rC67W/V1Etwaq3irhGqg24wjau3XRnXqjHUD54bBeA5q6s5wYjJ8zM6e74
         95VfWq7FUjbZqiuUYxc+WnLYg7KKsZC/T18m2hXPNdcGIFrEmYFWcjxnORWgsMzVLyV1
         fVd/Y0Cbs9N1g/XjNJsYFgzdWzn3FO/wotTLc/GhT4tKOksy6mlOu6AV98siYLerggYe
         WuGf1VDlKl/4C+DiNH26z+8YPXNj30TGbYSy0pW9GlF7HjCnF2Pj9DPlql5ifVJwuTgq
         m4aniSn4UBKXv+maEudwg9wiZVMEJOLQbWTJOQvI0Ea61zzpBKn6WY/OiOK0Pocip5u5
         68uw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] debugging: Leave double dashes in description headings
Date: Sun,  6 Jan 2019 04:19:57 +0900
Message-Id: <20190105191957.3050-2-sj38.park@gmail.com>
In-Reply-To: <20190105191957.3050-1-sj38.park@gmail.com>
References: <20190105191957.3050-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A description in debugging chapter is using '\tco' identifier for
command options which start with '--'.  However, '--' inside '\tco'
identifier is converted to a n-dash so that readers could misunderstood.
To avoid such confusion, this commit avoids the conversion via an ugly
walkaround.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 67e575c..5b2ce27 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2287,16 +2287,16 @@ and output consists of one line for each input line, with fields as follows:
 This script takes three optional arguments as follows:
 
 \begin{description}
-\item	[\tco{--divisor}\nf{:}] Number of segments to divide the list into,
-	for example, a divisor of four means that the first quarter
-	of the data elements will be assumed to be good.
+\item	[\tco{-}\tco{-divisor}\nf{:}] Number of segments to divide the list
+	into, for example, a divisor of four means that the first quarter of
+	the data elements will be assumed to be good.
 	This defaults to three.
-\item	[\tco{--relerr}\nf{:}] Relative measurement error.  The script assumes
-	that values that differ by less than this error are for all
+\item	[\tco{-}\tco{-relerr}\nf{:}] Relative measurement error.  The script
+	assumes that values that differ by less than this error are for all
 	intents and purposes equal.
 	This defaults to 0.01, which is equivalent to 1\,\%.
-\item	[\tco{--trendbreak}\nf{:}] Ratio of inter-element spacing constituting
-	a break in the trend of the data.
+\item	[\tco{-}\tco{-trendbreak}\nf{:}] Ratio of inter-element spacing
+	constituting a break in the trend of the data.
 	For example, if the average spacing in the data accepted so far
 	is 1.5, then if the trend-break ratio is 2.0, then if the next
 	data value differs from the last one by more than 3.0, this
-- 
2.10.0

