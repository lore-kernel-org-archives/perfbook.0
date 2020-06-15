Return-Path: <SRS0=eYHJ=74=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=s9RkO1f75pBVr398H/ZuBzdbBc3tEGYg8owPg8mvCVE=;
        b=S+RMSjKi1F8221UhGsXhwDuQV5j0qJWdOOyyPLj4sUnvddijO+MLuAdbGvpz/HsAzo
         cV4YDsz6Y8ZX3ymCPNaEA1ML9trwDuxBb2C7+E+j6HAQaHNEJn61MnzbQ3xlCtOo20Lo
         Avcltu8Ah6ggtZJXSATlwUKbQwczxpsmjBmIin1x9WCx2R8FfJC+oyxMM/2epDvelniD
         GJyGtAEAV1i70KD/TNrc1AI083vQF63/zvZRos4pZjihOmICSROAejNUB8bnlK2RMGSZ
         7taNun99vcOdxhVMikVuqut4ATKv0cZAb9AandUpiApSTUcWF26dclMCNJkAZgsctU1J
         Hv7w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] bib/RCU: Use short-cut URL of git.kernel.org/linus/
Message-ID: <277f0200-992e-7ebb-5389-418859f0f90e@gmail.com>
Date: Tue, 16 Jun 2020 00:11:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c03e0aa0d7a8ad1b561f5069bbd963457f9561ea Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Jun 2020 13:29:07 +0900
Subject: [PATCH 1/2] bib/RCU: Use short-cut URL of git.kernel.org/linus/

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index f3474b6e..f3aefda7 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -1280,7 +1280,7 @@ Revised:
  day="17",
  year="2007",
  note="Git commit:
-\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=97b430320ce7}",
+\url{https://git.kernel.org/linus/97b430320ce7}",
  lastchecked="December 17, 2017",
 }
 
@@ -1364,7 +1364,7 @@ lot of {Linux} into your technology!!!",
  day="19",
  year="2008",
  note="Git commit:
-\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ae66be9b71b1}",
+\url{https://git.kernel.org/linus/ae66be9b71b1}",
  lastchecked="April 6, 2019",
 }
 
@@ -1386,7 +1386,7 @@ lot of {Linux} into your technology!!!",
  day="12",
  year="2008",
  note="Git commit:
-\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d7c0651390b6}",
+\url{https://git.kernel.org/linus/d7c0651390b6}",
  lastchecked="April 6, 2019",
 }
 
@@ -1409,7 +1409,7 @@ lot of {Linux} into your technology!!!",
  day="11",
  year="2008",
  note="Git commit:
-\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c3cdc1f83a6}",
+\url{https://git.kernel.org/linus/9c3cdc1f83a6}",
  lastchecked="December 17, 2017",
 }
 
@@ -1496,7 +1496,7 @@ lot of {Linux} into your technology!!!",
  day="18",
  year="2008",
  note="Git commit:
-\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=64db4cfff99c}",
+\url{https://git.kernel.org/linus/64db4cfff99c}",
  lastchecked="April 15, 2019",
 }
 
@@ -3130,7 +3130,7 @@ Andrew Hunter and Geoffrey Romer and Lance Roy",
  day="27",
  year="2017",
  note="Git commit:
-\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b899a850431e}",
+\url{https://git.kernel.org/linus/b899a850431e}",
  lastchecked="December 17, 2017",
 }
 
-- 
2.17.1

