Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-pl1-f179.google.com ([209.85.214.179]:39251 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfAUPfU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 21 Jan 2019 10:35:20 -0500
Received: by mail-pl1-f179.google.com with SMTP id 101so9990077pld.6
        for <perfbook@vger.kernel.org>; Mon, 21 Jan 2019 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=EBtLyZM68qXrhIJ1fRrdE5xGPMWKkKm8fZkDP/XQ1jA=;
        b=aTU6bhdX3PTrNokrJJK8K79j+1G8RNt4RGFVimjTifzykzXjTmk99tJaW/14FHAMxv
         96Pp7+OoSXes7LNG8QGdLnvp/6eJlYHRJZfWG/Ug54gjICrS5Zk+MMFCKFyaYFVuWgHz
         902fKmOF/J50qJWZL2Il+QhmRY+6vI0txGW2Aj4C9kh8Ia7+NbaFKW70Be3yxfcbFf7p
         ILkCrOGUJoPIabBE7YvdRZXXw3FTqmvl/6rJsG4QBf9pXje8a2/ee2SCOTVMu2VGBPF1
         TWkON+Hx//Oj+SWePTnPnPUorVAbygXeGClhWCe2NqiwnVoB8f0pwsRG6s2LMxOoRo81
         EC9w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Fix conflict of commandchars choice in .litmus
 files
Message-ID: <b9ea7041-ee2f-eae7-5ac3-e60d689e6d25@gmail.com>
Date: Tue, 22 Jan 2019 00:35:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From aa363e5eb43bec50d5126be41314d10343397d9a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 22 Jan 2019 00:15:10 +0900
Subject: [PATCH] memorder: Fix conflict of commandchars choice in .litmus files

As "\" is used in the "exists" clause, commandchars should not
contain it.  "@" should be a safe choice for litmus tests.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This should recover vanished "\" in the exists clauses of the new snippets
of RCU litmus tests.

To add the check of commandchars in fcvexclude.pl is on my to-do list.
Or ideally the choice could be made automatic.

BTW, C-SB+o-rcusync-o+rl-o-rul-o.litmus and C-SB+o-rcusync-o+rl-rul-o.litmus
looks identical, and causes warning of "duplicate targets" from "make".
Can you please look into them?

        Thanks, Akira
--
 CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus               | 2 +-
 CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus               | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus            | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus                     | 2 +-
 .../herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus      | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus             | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus              | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus              | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus   | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus              | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus              | 2 +-
 CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus                | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus b/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
index 68ecdec..f53ffac 100644
--- a/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus
@@ -1,5 +1,5 @@
 C C-LB+o-rl-rul-o+o-rl-rul-o
-//\begin[snippet][labelbase=ln:formal:C-LB+o-rl-rul-o+o-rl-rul-o:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-LB+o-rl-rul-o+o-rl-rul-o:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
index 8c53137..829e82d 100644
--- a/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus
@@ -1,5 +1,5 @@
 C C-LB+rl-o-o-rul+rl-o-o-rul
-//\begin[snippet][labelbase=ln:formal:C-LB+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-LB+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
index 1b3c394..2422abe 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+i-rl-o-o-rul
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+i-rl-o-o-rul:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+i-rl-o-o-rul:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
index 1aef1ee..4c471c4 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+o-o
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-o:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-o:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
index a83d130..78eed5e 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
index cd5a358..e43188b 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+o-rcusync-o
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rcusync-o:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rcusync-o:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
index f6bcc25..a4e3aa9 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+o-rl-o-rul
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rl-o-rul:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rl-o-rul:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
index 70b03ae..7998036 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+o-rl-rul-o
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rl-rul-o:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+o-rl-rul-o:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
index 7d13f3e..4905ea5 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
index a3462f8..4be12dd 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+rl-o-o-rul
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-o-rul:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-o-rul:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
index fa32853..356a61e 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+rl-o-rul-o
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-rul-o:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-rul-o:whole,commandchars=\@\[\]]
 {
 }
 
diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
index fa32853..356a61e 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
@@ -1,5 +1,5 @@
 C C-SB+o-rcusync-o+rl-o-rul-o
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-rul-o:whole,commandchars=\\\[\]]
+//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-rul-o:whole,commandchars=\@\[\]]
 {
 }
 
-- 
2.7.4

