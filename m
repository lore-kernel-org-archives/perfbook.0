Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w2KtjdIVurQQveG4YWagKZBRjM5966g8C02Xa5oOgaM=;
 b=euGPSRBbYLhag/YqHYJxP9sfr0V8qWwuxW4W3osFiE4/U3DbHiIK4F1RWPLBJ6qWSB
 9hv51lcsWihpRfOKlo/rPVHm9vvXv+4iwHZiAE+MKu7+YiCGdoiNcfvFiA8AH5cwTZbg
 8ckWIu5S4MXLIoek7jHwcj0tPDITvtxa6K1Tg1VXboZh40em7gK+3LTkyKtD1DcCqsqQ
 toW+Xxg2XYXHlnpWKEUNB7QT4I0CahTWMofj9ty+0Q/nPhHlZu0z2Xwb3MGXeFXUcW9z
 TWLUs8j7pldKqKb7I1T4qr2T+yKllWZ+5Rl3+RvQWEfIu1HFKb1CC5WP/AV+amzAby9d
 3i+A==
Subject: [PATCH v2] CodeSamples/formal/herd: Remove dependency on
 linux-kernel-hardware.cat
References: <f00d9adf-bbcd-79c1-1454-6c217cb9ec1b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <84105abb-b535-d177-efac-f5fe8abcb705@gmail.com>
Date: Wed, 21 Feb 2018 00:29:53 +0900
MIME-Version: 1.0
In-Reply-To: <f00d9adf-bbcd-79c1-1454-6c217cb9ec1b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8ba8747211c2793fae6d280833190bbe74486198 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 20 Feb 2018 00:09:53 +0900
Subject: [PATCH v2] CodeSamples/formal/herd: Remove dependency on linux-kernel-hardware.cat

The target "run-herd7" doesn't depend on linux-kernel-hardware.cat.
So remove it from the dependency list.
This change also makes the target compatible with the provisional
memory-consistency model branch [1] intended to be merged into Linux
mainline.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git lkmm

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Changes in v2:
    Rephrase change log to clarify the intention of the change.
--
 CodeSamples/formal/herd/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 8e0635a..3162659 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -31,7 +31,7 @@

 LKMM_DIR     := memory-model
 LKMM_FILES   := linux-kernel.bell linux-kernel.cat linux-kernel.cfg \
-		linux-kernel.def linux-kernel-hardware.cat lock.cat
+		linux-kernel.def lock.cat
 LKMM_LIST    := $(addprefix $(LKMM_DIR)/,$(LKMM_FILES))
 HERD_DIR     := $(shell pwd)
 HERD7_CMD    := $(shell which herd7)
-- 
2.7.4


