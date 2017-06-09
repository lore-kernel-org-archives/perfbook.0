Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qHB9MYWcSdG+9MGsKMdE/8kvmCylzifCBFnWMxefkoU=;
 b=pt79bO5Os+rfuIAoCzg2Rh+8Xrz7cwV8TAhZspmI3updcpSKhJs0MmGkjg3sByA/RM
 zR5OdawoyKt1NaAtWPWbYo34eQYmRyuT36S2kmn1Ci4XGNBc/CyzXzNWDTdtnPUOm4Rj
 /nGJBxrkldpEDAbPTr6Psdh1ERcRXIpa7ukRHa9B4ElP+b0+PRPrXbkj0Ja8UFNUX7lE
 8S6vb6pPl3+bP7dvWEAzuGCADTXGBPuil38MXszoNaP0eH1Sq/eqR3S8Wo2eHXOpwK+6
 sfqzLZDkXZ/RqCROxQpKO9h9ItiHHefatbTYeo7nOAEt/7Z3WB8QBDNOTjnVxoJBxAqw
 LHig==
Subject: [PATCH 2/5] CodeSamples: Use $(MAKE) for recursive make
References: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <89d52e83-835a-c5e8-b09e-77183c6e3e57@gmail.com>
Date: Sat, 10 Jun 2017 00:25:43 +0900
MIME-Version: 1.0
In-Reply-To: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e227572a57eaa6c14636c1d197a6d40254bcfa5c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 6 Jun 2017 00:24:15 +0900
Subject: [PATCH 2/5] CodeSamples: Use $(MAKE) for recursive make

For recursive make, "$(MAKE)" is recommended.[1]
By this change, options such as "-j4" can be transferred to builds
under subdirectories.

Also convert the list of recursive "make"s to a "for" loop by
defining a variable "subdirs".

[1] https://www.gnu.org/software/make/manual/html_node/Recursion.html

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/Makefile   | 16 ++++++++--------
 CodeSamples/depends.mk |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index e1593a7..ec9e9a6 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -1,24 +1,24 @@
+subdirs = SMPdesign advsync count defer intro toolsoftrade
+
 .PHONY: all clean pthreads pthreads-x86 pthreads-ppc64 pthreads-arm

 top := .

 all:
-	(cd SMPdesign; make)
-	(cd advsync; make)
-	(cd count; make)
-	(cd defer; make)
-	(cd intro; make)
-	(cd toolsoftrade; make)
+	for d in $(subdirs); \
+	do \
+		$(MAKE) -C $$d; \
+	done

 include depends.mk

 api.h Makefile.arch:
 ifeq ($(strip $(target)),)
-	make pthreads
+	$(MAKE) pthreads
 	$(warning "Could not figure out which target to use (arch:$(arch)).\
 		   Used 'make pthreads' in CodeSamples/Makefile.")
 else
-	make pthreads-$(target)
+	$(MAKE) pthreads-$(target)
 endif

 pthreads:
diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index f3a325d..9d2691b 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -35,10 +35,10 @@ endif

 ifneq ($(top),.)
 $(top)/api.h: $(api_depend) $(api_depend_common)
-	make -C $(top) api.h
+	$(MAKE) -C $(top) api.h

 $(top)/Makefile.arch: $(arch_depend)
-	make -C $(top) Makefile.arch
+	$(MAKE) -C $(top) Makefile.arch
 else
 $(top)/api.h: $(api_depend) $(api_depend_common)
 $(top)/Makefile.arch: $(arch_depend)
-- 
2.7.4


