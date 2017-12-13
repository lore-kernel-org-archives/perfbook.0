Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=Jv0ZWgxJrdCppthIB5LF2fTckfuanni9xmyYeFUzRlE=;
 b=O8Vz/z637Bzlerc4kXKj/zPddCdn0uB2qoomu6smIOavFlqdsQC9uNnthhzlFuW2yC
 bRlZciEDnPdG74B1ZNEB7R95Ewy1hd6epZ5fK4PzBomdb4pZouDJoB5bg3pYEmzgg0+d
 u6PdGYLIIBHf1UKE5eV5e0YzyeFpFURkL1NKol37EcXUFUz23CGQZ5yL7F86x8kFRAjS
 R+NDsz415aa5Eb5HFZ+rfuOMzvahepl0HlzhJBUtkSUGR9dvMApzwG+BZNIRFqHtBTkr
 CoASdERXlmEb4E3uDWlKQFEcpC2fb3j9Vkg/9qiPKvai+GgtLP0KXJApfoEBtLCNnwij
 ndxA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] Fix typo: s/Curiosty Rover/Curiosity Rover/
Date: Wed, 13 Dec 2017 11:16:27 +0900
Message-Id: <20171213021627.25740-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/regression.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/regression.tex b/formal/regression.tex
index 4e06cb7..4e8476d 100644
--- a/formal/regression.tex
+++ b/formal/regression.tex
@@ -584,6 +584,6 @@ Just because many of them are poor fit for regression testing does
 not at all mean that they are useless, in fact,
 many of them have proven their worth many times over.\footnote{
 	For but one example, Promela was used to verify the file system
-	of none other than the Curiosty Rover.
+	of none other than the Curiosity Rover.
 	Was \emph{your} formal verification tool used on a Mars rover?}
 Just not for regression testing.
-- 
2.10.0

