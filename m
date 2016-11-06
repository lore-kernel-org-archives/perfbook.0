Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=n7gNuINutVDe25tiumz04xDbO1X0Altpxp3DSznlsG0=;
 b=HBZQJuGOd/dfuPm0q+zzMq66Qd4BnPgjGcPuzcxCkCd8BYeCXPU9EmKlzZ3j8ASGL/
 k6XHFjwSxrG5EHHeDAPGs572jPlPjQhDba5J7TlVkslHC36REr6Y6Dhkg+k5JDsoCjv5
 6wwjaiinLOsygHvUAcrja2EPEuX70nP96HjCAh2dgRTzi0feTSW79EJDAXpUHmMf45hj
 q2kvZiUWqSUDZ2Al8c87ceKKG5yX1rJ41ELbP3WZvaG91V7lq2WdrR/d5rSyg97CodXL
 P3ZftSTZ2Rp9psRRirenaULw2PzrOzWQssvQSKBoPLVP/m2oFly7CsJfdufPr5apZWOr
 k7uw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] rt: Fix a typo: soo -> so
Date: Mon,  7 Nov 2016 02:52:34 +0900
Message-Id: <20161106175234.13878-2-sj38.park@gmail.com>
In-Reply-To: <20161106175234.13878-1-sj38.park@gmail.com>
References: <20161106175234.13878-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 rt/rt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rt/rt.tex b/rt/rt.tex
index 870bc9af6e0b..6fbc8dde0808 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -1849,7 +1849,7 @@ on lines~17-35.
 	the call to \co{malloc()}???
 \QuickQuizAnswer{
 	In early 2016, situations forbidding runtime memory were
-	also not soo excited with multithreaded computing.
+	also not so excited with multithreaded computing.
 	So the runtime memory allocation is not an additional
 	obstacle to safety criticality.
 } \QuickQuizEnd
-- 
2.10.0

