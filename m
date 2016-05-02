Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=oWxaGaGW7UJ2tQHofLqQ8E/NInNtv2t/v0IwzVn+VoU=;
 b=XkVf8NfHNxo/aHSpujVKRHNFlE/le7iCirlaKCC98H25QkJN6CH2geCyE44iPscm9c
 rgrHfYzhBVksi1MKgtxBb0QPlvbD2CEEfJxGu2dPcOzxz3qj2GvmGaH1X77x+/BMqOwa
 2M1uphOdUfvJIngxDZ2S3UvWpCmoYk+cvGar7vdoZAVsZFgwAFfBfNpg9LixVMNCcOrG
 64acJ/LuhSLdeG79imgBR4V2aXXmAnJHQ6qxIBAuHMA4pZ4O/KOqT5rh36TvhXTH01Z5
 M6LvnkEOEuPn8oWfneNva8fUFvOSIZ6tBqEcTRO2cGuxdiUo8Iu7KBFGQM4umbTCptOH
 RHew==
Subject: [RFT PATCH 5/5] Make default target of Makefile overridable
References: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8a988b8f-e79d-c69a-c905-293911a208e1@gmail.com>
Date: Tue, 3 May 2016 08:03:11 +0900
MIME-Version: 1.0
In-Reply-To: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4ce174f3c72367fed945fb4448e294d205b8d88a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Tue, 3 May 2016 00:01:16 +0900
Subject: [RFT PATCH 5/5] Make default target of Makefile overridable

This commit adds a conditional assignment in Makefile so that
the default target can be overridden by an environment variable.

If you have the environment vairable "PERFBOOK_DEFAULT" set, its
value will be regarded as the default target. Otherwise,
perfbook.pdf is the default as before.

This commit also updates FAQ.txt to add explanation of the
environment variable.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 FAQ.txt  |  8 ++++++++
 Makefile | 11 ++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/FAQ.txt b/FAQ.txt
index 1a1c589..e1d7dd6 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -26,6 +26,14 @@

 	A.	Actually there is!  Just type "make 1c".

+1.3     Isn't it possible to build perfbook-1c.pdf by just typing
+	"make"?
+
+	A	Yes, it is!  Define an environment variable
+		"PERFBOOK_DEFAULT" in your shell and set its value as
+		"1c".  Then, by just typing "make" will build
+		perfbook-1c.pdf.
+	
 2.	The Makefile cannot find pdflatex.  What is it and where can I
 	find it?

diff --git a/Makefile b/Makefile
index 662e2c2..46ec7b9 100644
--- a/Makefile
+++ b/Makefile
@@ -66,8 +66,17 @@ SVGSOURCES = \
 	datastruct/*.svg \
 	rt/*.svg

+default = $(PERFBOOK_DEFAULT)
+spc =
+
+ifeq ($(default),$(spc))
+	def_tgt = perfbook.pdf
+else
+	def_tgt = $(default)
+endif
+
 .PHONY: all clean distclean touchsvg neatfreak 1c 2c hb
-all: perfbook.pdf
+all: $(def_tgt)

 2c: perfbook.pdf

-- 
1.9.1


