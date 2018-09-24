Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=V6WYDdcL6maHYixd2+YtvP1V1wr56OsjcFkgL0vj/wM=;
        b=uW7B7kbdSuMRrBINlWcJt373G0zz6uneEQIwmLL1gddhbIrTaip890TOKq+sdAalX9
         iIuHg90gUrngq8e71diIi//uy4ESJMtnclHHdmSX6xrOnOX/3wsGGypjUy6B7zxuDn9R
         LiKFQkwdoAjm/oB3YDijFWXfGL/x27OXaXFBhYlYrZyTGHdn7vpj6tB3QcfsD+YGv7V4
         SXYLc5OiNCTXWe7pYBGD1KJKv9RkYhmq7E3pKynfxKQgYjrqPRjxyWcWDuWJf6AsmS58
         jjk1uNH3CpdzQhwbvbGL2PWxYIYa4rbBBXjNdu3hRVZrFQC2AqjHyxKmVxAQ+e91qmQs
         nFrA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Require updating a2ping to 2.83p on older distos
Message-ID: <aec4b5bb-0095-bfc5-e4b3-2fbd97c5311a@gmail.com>
Date: Mon, 24 Sep 2018 12:02:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f44b769bdf6da275a09ae3abe0decc835ba65875 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 24 Sep 2018 11:26:02 +0900
Subject: [PATCH] Require updating a2ping to 2.83p on older distos

Recent security fixes to Ghostscript [1] on Ubuntu Trusty and
Xenial broke a2ping 2.77p.

This change removes conditional of "Ghostscript 9.22 and later" in
checking a2ping's version, and report error if 2.77p is found.
Also update FAQ-BUILD.txt to provide nicer instructions to update.

[1]: https://usn.ubuntu.com/3768-1/

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 21 ++++++++++++++-------
 Makefile      |  6 ++----
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 9fb3b68..336ab71 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -53,8 +53,9 @@
 			texlive-science texlive-fonts-extra
 			xfig inkscape graphviz fig2ps
 
-		You might need to fetch a version of a2ping which is
-		compatible with Ghostscript 9.22. See #7 below.
+		You need to fetch a version of a2ping which is
+		compatible with updated Ghostscript (not limited to
+		Ubuntu Bionic). See #7 below.
 
 		On Fedora 28 and 27, installing the following set of
 		packages suffices:
@@ -86,14 +87,20 @@
 
 	A.	Please see #5 above.
 
-7.	Building perfbook aborts with error "a2ping version conflict".
+7.	Building perfbook aborts with error "Your need to update a2ping".
 	What can I do?
 
-	A.	Updating a2ping can resolve the build error if you
-		have Ghostscript 9.22 or later.  Compatible a2ping
-		(2.83p) is available at:
+	A.	a2ping 2.77p has become incompatible with up-to-date
+		Ghostscript on most Linux distributions since September
+		2018 due to security fixes backported from Ghostscript
+		9.22 and later. A compatible a2ping (2.83p) is available
+		at:
 			https://www.ctan.org/pkg/a2ping
-		It is included in TeX Live 2018 or later.
+
+		Copy "a2ping.pl" as "a2ping" into a directory which
+		precedes /usr/bin in your PATH setting.
+
+		a2ping 2.83p is included in TeX Live 2018 or later.
 
 8.	When I try to build perfbook, it hangs after printing a line
 	reading "pdflatex 1".  How can I fix this?
diff --git a/Makefile b/Makefile
index 72865d7..4810812 100644
--- a/Makefile
+++ b/Makefile
@@ -75,9 +75,7 @@ STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)
 ifdef A2PING
 A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
 ifeq ($(A2PING_277P),1)
-GS_VER := $(shell gs --version)
-A2PING_GSCNFL := $(shell env printf "%05.2f\n%05.2f\n" $(GS_VER) 9.22 | \
-	sort | head -1 | grep -c "09.22")
+A2PING_GSCNFL := 1
 else
 A2PING_GSCNFL := 0
 endif
@@ -216,7 +214,7 @@ ifndef A2PING
 	$(error $< --> $@: a2ping not found. Please install it)
 endif
 ifeq ($(A2PING_GSCNFL),1)
-	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
+	$(error You need to update a2ping. See #7 in FAQ-BUILD.txt)
 endif
 	@cp $< $<i
 	@sh $(FIXANEPSFONTS) $<i
-- 
2.7.4

