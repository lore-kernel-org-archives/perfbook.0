Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ywDX2OjkmvA7n5SVgEohMpfJcqL2c3BPpq+eBnqZ99M=;
 b=A6dO9JuPaElgYfkt7YBpeqzoheadCiOBVpYRcBDBBSh9p5mcWFKezgP02K5FDDlDYD
 Iy2bQOx1TU/2D15dI8eRe/RPSxAKMGbj7DrU/v/h6s0b2bMBEzvWa6xkKWzsIM/e0pY/
 FD6kOC2zjoWe4ZzJZrLl/DLVSDfVFpCHoR03x7Wd06PL0VPkHE/ri6dW4wI/1Msue17q
 QdRhjcS1zgvTXW3QMIL4+WDL+ywdBNlJ3lV37rSBAzVsb1R9jyYIPkDheSqFO7oD8nMZ
 Qam5ABkqnikQg2mDLAzeSDXGSFjUfCAMQw1JXZQofH9t7tdhRZ2B9hnKigQJXZhda7kC
 3gPA==
Subject: [PATCH 2/4] runlatex.sh: Fix typo in grep pattern
References: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c12c6073-1308-30c7-2fbc-c2cec7c0d350@gmail.com>
Date: Mon, 13 Mar 2017 00:39:26 +0900
MIME-Version: 1.0
In-Reply-To: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2cfb4b536d30ff9a1f4ad1723d6ac6b8b663a12f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 12 Mar 2017 20:27:51 +0900
Subject: [PATCH 2/4] runlatex.sh: Fix typo in grep pattern

There was a typo in grep pattern. This means we were giving up
prematurely while there were still changes in warnings.
We were lucky to have sufficient iterations of pdflatex to reduce
remaining warnings.
This typo did not affect successful builds.

Also fix similar typo in runfirstlatex.sh.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh | 2 +-
 utilities/runlatex.sh      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index 5060725..dc55cb7 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -46,6 +46,6 @@ then
 	echo "----- Fatal latex error, see $basename.log for details. -----"
 	exit 1
 fi
-grep 'Latex Warning:' $basename.log > $basename-warning.log
+grep 'LaTeX Warning:' $basename.log > $basename-warning.log
 touch $basename-first.log
 exit 0
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 0fa6633..da9e82d 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -50,7 +50,7 @@ iterate_latex () {
 	then
 		mv -f $basename-warning.log $basename-warning-prev.log
 	fi
-	grep 'LaTex Warning:' $basename.log > $basename-warning.log
+	grep 'LaTeX Warning:' $basename.log > $basename-warning.log
 	return 0 ;
 }

-- 
2.7.4


