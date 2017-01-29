Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=zJwll7xDyY/PsGlFN8eeWuzmb+qimMIbluJQ1yfg6X0=;
 b=CUuOOGRO3TClsbVv5MJsIN+D+8dlI9LUmg2EoFXVftV+fNzwV/uG3yy3gB76OrRkqz
 RNSN4x06RnxVbCjZnhccue+TNROQ7yKvkEEXTGwpK3AcMLaekHsEtJZ9vjzxYohwERsd
 ZPKIsScUzrXI84r/SPU/gh0AmL1pSENzIrcikMNo6zSuFrUruwZ/+OShsk4tT0MGgzIg
 gvCGmRcex+2k1G+bna+u6XlUzYp9U/zmbWU5KMSyHdzESMCUegi4SLR/jg7v9nXciDIE
 y0h0uFz1fBJkhPIm9mPKRwHUpHZwUIU18rYXuIE0t3cr6JgyvOcxYcruNV953/bC9vvT
 1cYw==
Subject: [PATCH 7/8] bib/hw: Add doi to TrevorMudge2000Power
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8226e725-f978-96a7-251c-9539c30fd07f@gmail.com>
Date: Mon, 30 Jan 2017 00:35:54 +0900
MIME-Version: 1.0
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b0677c29afc3b790b3452e1606107d458c9f2268 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 14 Nov 2016 09:24:46 +0900
Subject: [PATCH 7/8] bib/hw: Add doi to TrevorMudge2000Power

Also fix volume no. and year of publication.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index f996b35..7ed7381 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -674,12 +674,13 @@ Luis Stevens and Anoop Gupta and John Hennessy"
 @article{TrevorMudge2000Power
 ,author="Trevor Mudge"
 ,title="{POWER}: A First-Class Architectural Design Constraint"
-,Year="2000"
+,Year="2001"
 ,journal="IEEE Computer"
-,volume="33"
+,volume="34"
 ,number="4"
 ,month="April"
 ,pages="52-58"
+,doi="10.1109/2.917539"
 }


-- 
2.7.4


