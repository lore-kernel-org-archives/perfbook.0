Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uSokpDmLuxhZqxsjv48HppMu/bAp4eoV39EkXaZWmHI=;
 b=YdxMXiiZq04JejAX5/eLKcMagvAyQ0k3I9OPFFosbjjTEwC5q5Lmj3uaQ6izH/PArs
 8KW2Op9RzaYqsH9QIw0PYlG4mxY+b8n0IgWFR9d6REC4XFO+7a+GUQLTy6P85nwf3iAV
 AchCYA3MtDiAdg1FN1wYKSj1r7r2GveOZKxTEp2dtAiVWUN3uTYjeZIvbuybGdEHTly7
 sJSg9tCH3emPSHzCu8T3vyW+Lpss8Zz+Rvg9FQyidWm56nEgy/2Q2Fd3eYiT9gMTARL0
 xgmfsKkRaCRIulmVicA27lEZCGZ6DGe2NenCZ/KYRz/pkbG+12QAn1J/zPc0I9tf+Mir
 gjpA==
Subject: [PATCH 1/6] advsync: Fix typo of litmus name
References: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <23c0aec0-a67f-7055-f1e8-4ea2d84d1ee2@gmail.com>
Date: Thu, 13 Jul 2017 00:08:36 +0900
MIME-Version: 1.0
In-Reply-To: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fa84a8b089a721ea67ba631eb76d6b10e1965541 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Jul 2017 20:09:43 +0900
Subject: [PATCH 1/6] advsync: Fix typo of litmus name

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/advsync/herd/C-MP+o-wmb-o+o-rmb-o.litmus | 2 +-
 advsync/memorybarriers.tex                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/advsync/herd/C-MP+o-wmb-o+o-rmb-o.litmus b/CodeSamples/advsync/herd/C-MP+o-wmb-o+o-rmb-o.litmus
index e604eb5..1e92453 100644
--- a/CodeSamples/advsync/herd/C-MP+o-wmb-o+o-rmb-o.litmus
+++ b/CodeSamples/advsync/herd/C-MP+o-wmb-o+o-rmb-o.litmus
@@ -1,4 +1,4 @@
-C C-MP+o-wmb-o+o-o.litmus
+C C-MP+o-wmb-o+o-rmb-o.litmus

 {
 }
diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index a1c3327..a354a54 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -636,7 +636,7 @@ this~\cite{JadeAlglave2011ppcmem}.
 \begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
- 1 C C-MP+o-wmb-o+o-o.litmus
+ 1 C C-MP+o-wmb-o+o-rmb-o.litmus
  2
  3 {
  4 }
-- 
2.7.4


