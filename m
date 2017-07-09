Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WQfZv5U6DGScF3pzTBHky8eJSsvQ7ySiiGPVKl92im0=;
 b=siUDga8zMc0F3KDRekSqd5fTKJ6JZ63XC6bcBBokCsryGoOsBFHTwQQm2SghssKMBw
 1Ug29mNsSUpm2g6sLciLNm4vzSNkeNp5uWOTJa1T80JjiMYbumvWJ1RwhjM4X0lV2kA8
 kxHMN5qv5F3YQVWmcqJMEG4LgFsNd4w/q+4ZTqB2OY3qCOH6HgpjqHKhGxTyODm8YW9w
 d6KfAbxLyZRAlU68ldZWY5tJ7u8K3tMt+mWQAJuMDBUrkbqGB7+opVvkky+ICHrOd8bj
 lAvf6L8z4J7Zj2R7lPgG/IbTZMe+zD+iZjMEwTmGikrcrtkMy5D7pkSjwljayLLaZ/7h
 kOzg==
Subject: [PATCH 2/2] advsync: Add cross compilation targets
References: <0f7d5b71-c960-6462-fc45-a83f757d88ee@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <17a22b40-b401-2c91-f513-b0e15247cace@gmail.com>
Date: Sun, 9 Jul 2017 10:41:28 +0900
MIME-Version: 1.0
In-Reply-To: <0f7d5b71-c960-6462-fc45-a83f757d88ee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 955eefe8ad5a64fddd2e33b343ac3a1e171dd089 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Jul 2017 09:00:36 +0900
Subject: [PATCH 2/2] advsync: Add cross compilation targets

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/advsync/herd/.gitignore |  5 +++++
 CodeSamples/advsync/herd/Makefile   | 22 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/advsync/herd/.gitignore b/CodeSamples/advsync/herd/.gitignore
index f47cb20..a01a568 100644
--- a/CodeSamples/advsync/herd/.gitignore
+++ b/CodeSamples/advsync/herd/.gitignore
@@ -1 +1,6 @@
 *.out
+/@all
+/X86
+/PPC
+/ARM
+*.tar
diff --git a/CodeSamples/advsync/herd/Makefile b/CodeSamples/advsync/herd/Makefile
index 7959063..056f5f9 100644
--- a/CodeSamples/advsync/herd/Makefile
+++ b/CodeSamples/advsync/herd/Makefile
@@ -2,13 +2,33 @@ LITMUS := $(wildcard *.litmus)
 LITMUS_OUT = $(addsuffix .out,$(LITMUS))
 CCOPTS = -fomit-frame-pointer -O2
 CCOPTS += -I$(shell pwd)
+CUSTOM_HEADER := $(wildcard *.h)

-.PHONY: all clean
+.PHONY: all clean cross-x86 cross-ppc cross-arm cross

 all: $(LITMUS_OUT)

 %.litmus.out: %.litmus
 	litmus7 -r 1000 -carch X86 -ccopts "$(CCOPTS)" $< > $@ 2>&1

+cross-x86: TARGET = X86
+cross-x86: cross
+
+cross-ppc: TARGET = PPC
+cross-ppc: cross
+
+cross-arm: TARGET = ARM
+cross-arm: cross
+
+cross:
+	echo > @all
+	for l in $(LITMUS); do \
+	    echo $$l >> @all; \
+	done
+	mkdir -p $(TARGET)
+	litmus7 -r 1000 -carch $(TARGET) -o $(TARGET) @all
+	cp $(CUSTOM_HEADER) $(TARGET)
+
 clean:
 	rm -f *.out
+	rm -f @all
-- 
2.7.4


