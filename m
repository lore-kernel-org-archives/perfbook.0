Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=imMDSuCQZQUnC2oGCpTSLtLaXDVfI3WKPi2R2Ge0XbU=;
 b=AXF3U+9t9m0SXab22JVFIOlHyyrMP/hCSb4860I0a5bQzVOSCGvmW1BLU1W8PfzLnv
 7EbtaXo1x4oH/3cP8d9RfezPo67RrK4uJzTo8A32ubovOTAcLeWCZp+SS0hsUec4C9Eq
 MKCQoTb37sNbWFR4TxisIrDMSgUjKQ2WcKxfEjPyDr1AfmbTLYc4id9aBWwc9+s83XG8
 07LCV99I/bMUBANZLIdmu6EIR7vChSP825mdEtqS/3Y1OsXw1cfC2kCjn+JZZaNSe/I6
 nsoQ4JNG/LcF4DoLF7uj/DjaNaU64EQ91cJihv04mUgO7i8V9xgyodJQc3XsNr4CgX78
 Uq8g==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] toolsoftrade: fix a typo
Date: Sun, 14 Feb 2016 08:28:36 +0900
Message-Id: <1455406117-6924-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There is a miss of a tilde between line and line number. This change fix
the typo.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index ccbe0ad..8d54d3a 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -207,7 +207,7 @@ Otherwise, this is the parent, which checks for an error return from
 the \co{fork()} primitive on line~4, and prints an error and exits
 on lines~5-7 if so.
 Otherwise, the \co{fork()} has executed successfully, and the parent
-therefore executes line 9 with the variable \co{pid} containing the
+therefore executes line~9 with the variable \co{pid} containing the
 process ID of the child.

 \begin{figure}[tbp]
-- 
1.9.1

