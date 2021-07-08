Return-Path: <SRS0=5QGv=MA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n68VQEZvPq6/mjLokVhDm36xj4E11an44Rf598Cd65M=;
        b=NyKwiiyCuYvuWV/KiAajyUYCfSN66fia6qmkl2FwjLjCAdFfMDmxV2hGbT82n1lLv/
         zbi1iSHSTxXPEp2AbglCZracxfwnDu5pA3fo1zH1xAjoiH1ZV2EcvvEUGIb5xYgUu8AU
         jK+BHi9eDO+TwDIm2AfjAKALRDZrPpIpT+1Bsd3Ho4vipOtazAuaKq9PraWw74T2P3Ph
         ojUBmNTGUTNlUv/lW2U6Bd0lJAGHTfLKyZrvYqAobWPEz2GWjYZt1X/+ELeV3LTMrhYf
         GdimCYGclroB+98EBatf7S5/8u7NEyG4Uoi3sDJW4SHZMkSTw/Q8edMspSv/ZeF9ipjC
         wT7w==
Subject: [PATCH -perfbook 6/6] defer: Remove Oxford comma in two-item list
References: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <667f8125-f869-48c5-57d2-7567efa00ccd@gmail.com>
Date: Thu, 8 Jul 2021 19:46:06 +0900
MIME-Version: 1.0
In-Reply-To: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 0e5ad511..b08a31d7 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -1057,7 +1057,7 @@ a GC in that the \emph{timing} of collection is automatically
 determined, but that RCU differs from a GC in that:
 \begin{enumerate*}[(1)]
 \item The programmer must manually indicate when a given data
-structure is eligible to be collected, and
+structure is eligible to be collected and
 \item The programmer must manually mark the RCU read-side critical
 sections where references might be held.
 \end{enumerate*}
-- 
2.17.1


