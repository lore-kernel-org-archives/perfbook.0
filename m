Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=uoW9MZ6Qngm35XhBFRfmIV9wdZfQZibrKfPjK7V63Hs=;
 b=CdiWbEpiTJv2ZtqioZlkRfad+1BTkSIkcoFxdVECC3zoRSqIXd1R3hS8V0V7CDJDca
 THNKwFVz2n7rvjKv5MetOYEfVSmjxwPyXp1X955mdPmd2pocxkerUsqTMz7qNO9tMAuG
 EvI56uLIEWE5VATrgaqvtkqN3XRHfv0Ein0qgXZO6wGhtCWE5DllB+HdLXhBZSnOh29V
 8kbQk2NILT8/saCMa2bheYNaIreqovkWhbc+unN7Y/45KsFrYV1chfLEt3BMkMZ2M/8p
 6cs3OlZXrOPhQWFUQTnRVlAYQS+Z3TKI5zmTQoTPSgYPlw5OHw2rawTsd+yKnSsLvb6I
 f1dg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Fix 'Non-Other-Multicopy Atomic?' row in summary
 table
Message-ID: <dc43b2af-dc79-c0f0-6946-03a700a794a8@gmail.com>
Date: Fri, 6 Oct 2017 23:44:11 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a28209de2cced673aa9a924cf7d038571886b6fd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 6 Oct 2017 23:29:24 +0900
Subject: [PATCH] memorder: Fix 'Non-Other-Multicopy Atomic?' row in summary table

In commit c99a5407b2a6 ("memorder: Transpose table 'Summary of Memory
Ordering'"), (PA-RISC), SPARC TSO, and x86 were marked "Y" in
the "Non-Other-Multicopy Atomic?" row.
The corresponding cells before the transposition had been blank.

Remove those bogus "Y"s.

Fixes: c99a5407b2a6
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index ba54fee..eb498fb 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3744,7 +3744,7 @@ dependencies.
 		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
 \cellcolor{white}
 	& Non-Other-Multicopy Atomic?
-		 & Y   & ~   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
+		 & Y   & ~   & Y   & Y     & Y  & ~     & ~   & Y & ~   & ~ & ~ \\
 	& Non-Cache Coherent?
 		 & ~   & ~   & ~   & Y     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
 	\cmidrule(r){1-2} \cmidrule{3-13}
-- 
2.7.4

