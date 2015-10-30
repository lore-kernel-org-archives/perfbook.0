Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=KzU5tNbML0gRX1RjCPB5xNoiFR9+E8HNq4vrSXRBjRY=;
 b=rCdNK6FIxksLE+Fo3Btw1cWCIPZ3i8P8bvLG9PD8cPreV53rFEljGtmmWWp1RRDLhY
 ylJGkoTc3DkXpAmKxJ0SYaOeFL0WJaC3K5rRAxJK7CQn1iFjtPnrT4bhaUddOoqcFo7O
 IKA0q7Yb+o+nNz9Ycq9kEJDHi9NBMY6uBc2iPhPtYW3ptZaZmLz74Vb3EqPUMfmxwk0C
 tTFxc82ATkpzBhinJHn6f91K2+BO/CwmVq2yJDA3hZE4K2xyLr3GdAa8FA3N4xqH56L0
 C6MTbyHI9Iop082wwTKO4SCSxQObKjzOJofhd6UdtBzQfK5dHksJeHvqkAhq4Sm5a3j9
 rloA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] remove wraiths of 2up from FAQ and .gitignore
Date: Fri, 30 Oct 2015 18:37:16 +0900
Message-Id: <1446197836-25128-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Output have unified to perfbook.pdf from the commit
0835aa627d2accb1f39c5584ddb693cf31c57db2 (Remove 2up from Makefile).
However, the wraiths of 2up still exist. This commit removes them from
FAQ and gitignore.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 .gitignore | 1 -
 FAQ.txt    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index 7c9c46f..5df1646 100644
--- a/.gitignore
+++ b/.gitignore
@@ -34,7 +34,6 @@ RCS
 /Pieces
 /.Detritus
 /perfbook.ps
-/perfbook-2up.ps
 perfbook_html/

 !/todo.txt
diff --git a/FAQ.txt b/FAQ.txt
index 631e18c..a698d3d 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -1,7 +1,7 @@
 1.	OK, I have downloaded this stuff.  What do I do now?

 	A.	Type "make" from the top-level directory.  If all goes
-		well, this will produce a file named "perfbook-2up.pdf",
+		well, this will produce a file named "perfbook.pdf",
 		which prints two virtual pages per physical page.

 2.	The Makefile cannot find pdflatex.  What is it and where can I
-- 
1.9.1

