Return-Path: <SRS0=NUH/=BR=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685292026; x=1687884026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oNs08xvyrXfVFOCKYAOa6O1RWbIT5vZljUgfWX4BKto=;
        b=czMSEGYd30xLljdtf7L/xASx2UG25v1I9yVvwxdmcvlS21WE2Wz5n6MzuWx1j7kD/6
         BpK1k39/NxQxBBquBb+/4C4FrPEWhCfHKDC6wHJL7IuAGF8LkOA1/N4TytrYAE9qMBxn
         szvnpq19Xbn1gmvih1mbv921GseVOmaecyMLL5N1WGPrgRlkLkB/RSeF/f14kCHtvGgd
         PkvtxEeG6L8+GnYqtGDctVJG5uwWxe+mV0F3z5pVy+Y6SV4/PaH6s+vJ2qtZats30qIo
         lSbpDrjNFjrZMo1gr7Lw7OIeKyZ+OUxNtouZuzP8aTiEj1n208YReAzM/lAarJbBjUEP
         UVdw==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] together: Fix the description of state traversal
Date: Sun, 28 May 2023 16:40:20 +0000
Message-Id: <20230528164020.15935-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There seem to be some issues with the description of state transitions.
This patch fixes that.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 together/applyrcu.tex | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 09a265f7..dee027b9 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -676,11 +676,12 @@ The normal path through this state machine traverses the states CLOSED,
 OPEN, CLOSING (with an invocation of \co{call_rcu()}), and back to CLOSED
 once the callback has been invoked.
 If \co{open()} is invoked before the grace period completes, the
-state machine traverses the cycle OPEN, CLOSING (with an invocation
-of \co{call_rcu()}), and back to CLOSED once the callback has been invoked.
+state machine traverses the cycle OPEN, CLOSING (with
+an invocation of \co{call_rcu()}), REOPENING, and back to OPEN once the
+callback has been invoked.
 If \co{open()} and then \co{close()} are invoked before the grace period
 completes, the state machine traverses the cycle OPEN, CLOSING (with
-an invocation of \co{call_rcu()}), REOPENING, and back to OPEN once the
+an invocation of \co{call_rcu()}), REOPENING, RECLOSING, and back to CLOSING once the
 callback has been invoked.
 
 Given an indefinite alternating sequence of \co{close()} and \co{open()}
-- 
2.34.1

