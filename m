Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2LpLSQEw9rorRp1sLKOPZZf9q/GTpz/BvrFOvu2oHIg=;
 b=BVVpM2+hvyOzQ2pudU0d9/FnkzzAZRg/ed6N19yZb2N+g5eCH3iZddzyQ9ZhBW5bDl
 tRLFkdZC7vvGUJjU8YNlIhSqvK6QYb9NKrCqKrTNuj/oE+fQUS0KGl0+iQfwIhlneek7
 GyCpJ0qVXCU4CRQP7IS0GPOcHaAGkLqZZoD5FwZ3XHrvw2gq0ZI3YRNnNpNS5UqY10wf
 aeF1Isd+Ruw1BMWaTyzMwAoye2T3nWdnuYc3VIW2v7HyJpoWaJa3NC4Ge/foNpPEHTIf
 EIpd5bPwqy1NODV7zOxpG4UaStWX5NgGA5LTFscbEkSy/mUxkKVv6esUijNsNjeoS+rS
 5BiQ==
Subject: [PATCH 2/2] CodeSamples: Remove cpu specific flag for ppc64
References: <ad29f159-eb20-4493-d1f7-90bd4b3f17ae@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <72a3c163-cc41-aae5-d139-9b487aa81b70@gmail.com>
Date: Sat, 3 Jun 2017 16:04:13 +0900
MIME-Version: 1.0
In-Reply-To: <ad29f159-eb20-4493-d1f7-90bd4b3f17ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7c151a100ef7d6c30259a966c68c45421edd7707 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 3 Jun 2017 12:42:38 +0900
Subject: [PATCH 2/2] CodeSamples: Remove cpu specific flag for ppc64

Also update links to tuning options for POWER.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/arch-ppc64/Makefile.arch | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/arch-ppc64/Makefile.arch b/CodeSamples/arch-ppc64/Makefile.arch
index 90a8ecf..cae45e3 100644
--- a/CodeSamples/arch-ppc64/Makefile.arch
+++ b/CodeSamples/arch-ppc64/Makefile.arch
@@ -1,2 +1,5 @@
-# http://www.ibm.com/developerworks/wikis/display/hpccentral/Tuning+options+to+consider+with+gcc#Tuningoptionstoconsiderwithgcc-mcpuandmtune
-GCC_ARGS=-g -Wall -O3 -m64 -mcpu=power5 -mtune=power5
+# You might want to add a flag such as -mcpu=power8.
+# See e.g.:
+# https://www.ibm.com/developerworks/community/wikis/form/anonymous/api/wiki/366c0058-50f7-4c6d-9505-9d8af81d40f1/page/56044ce1-e853-47f2-a038-c7c8ea8bef23/media?convertTo=html (power5 & power6 era)
+# https://www.ibm.com/developerworks/community/wikis/home?lang=en#!/wiki/W51a7ffcf4dfd_4b40_9d82_446ebc23c550/page/New%20to%20PowerLinux%20tuning%20and%20optimizations?section=gcc (not so up to date)
+GCC_ARGS=-g -Wall -O3 -m64
-- 
2.7.4


