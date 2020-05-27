Return-Path: <SRS0=FOv9=7J=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=KDVP8cWETf9iigmAf2T/Q5F07fuqnrMmgZzbkVluRQU=;
        b=NMcavJc6bQ0hOPmdifhvAyubLOBJZRpbTC7ymR2ANU0l1HAYYhT0VqMFscQglXmAXy
         XfKXtFgVj3HZsuRTVXoerKeH3cBVycqddUNNGHR7vOZZf3XFbpujOf/465EryLRKWDZv
         xSeAvlCYeK8NU408Gu691QkUeQ2S8HRR8C+sPPWx/C4ToraEkqt4jkbW9PFBRFtDT5UU
         XC7/ukRgL5+oqBUOqL+Vbi0Lc3DiMuCaVXvwZ5BkDz5oXpdEP5VJgMQrhQ9H7e9Ae4eF
         P6TfiX7jJM0qpbGZMFQPAMmYzluEb1Csovqd0nIjknjql/wVXtnZIZDNCGbkX2oJHzFX
         xy3A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] CodeSamples/formal: Fix typo in absperf litmus test names
Message-ID: <7dea1e63-95bf-8d5b-dca2-47e741a5ed48@gmail.com>
Date: Thu, 28 May 2020 07:40:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6eda855e9baeb335b5ab4e36c4b0a072a706ee3b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 28 May 2020 07:21:50 +0900
Subject: [PATCH 1/2] CodeSamples/formal: Fix typo in absperf litmus test names

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus  | 2 +-
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
index b4bbbf98..19b70691 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus
@@ -1,4 +1,4 @@
-C C-SB+l-o-o-u+l-o-o-u-+l-o-o-u-C
+C C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C
 
 {
 }
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
index 9382480b..c22f6a45 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus
@@ -1,4 +1,4 @@
-C C-SB+l-o-o-u+l-o-o-u-+l-o-o-u-CE
+C C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE
 
 {
 }
-- 
2.17.1

