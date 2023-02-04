Return-Path: <SRS0=PvuL=6A=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0uZkUj08CbYZVwihMunmakflQkvRUO5WzDD/118iPc=;
        b=oq41Ipe3AvzmaLm0izC5SlYBENTrW1kbB199+7xTrxRpRMCIDyKECyCidu0dDI/1je
         jX+i4ZIU1cD8eLaKBXFn1Ioip9LqKc4Hrl61+Cr8HJ927cDAPd3ilCJFGLD9kBtQUdVb
         9gyVlWzB552RdcePYLAbV9n1YDaMAJQIdpJiVgfDyQeL2uukfbat4wKxYqVuHnr2/BIP
         c2clUW44eQkxTKcqVOfv8We+rNjvSLSSupwo7qINVOwR6ThKoe1f2uaSGS/KeJa5LxYb
         mNyiQicWieb1Mc2bWXPRFtQU4suCeaxrIC1x83pG7lwMSJMdFyXLgXmLZtlasNmaOTef
         UCOg==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v1 1/2] CodeSamples: Add check target to CodeSamples/ and count/ Makefiles
Date: Sat,  4 Feb 2023 00:36:26 -0300
Message-Id: <20230204033627.67980-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Checking happens by running every program compiled from count/ without
arguments and checking if any failed.

In order to do that, introduce a 'check' target in
CodeSamples/count/Makefile.

Also, to allow further CodeSample testing in the future, make a global
'check' target on CodeSamples/Makefile.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 CodeSamples/Makefile       | 3 +++
 CodeSamples/count/Makefile | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index 38143638..2a433a22 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -66,5 +66,8 @@ ifneq ($(strip $(target)),)
 	cat arch-$(target)/Makefile.arch >> Makefile.arch
 endif
 
+check:
+	make -C count/ check
+
 clean:
 	rm -f Makefile.arch api.h
diff --git a/CodeSamples/count/Makefile b/CodeSamples/count/Makefile
index f54edc8c..8d5d4296 100644
--- a/CodeSamples/count/Makefile
+++ b/CodeSamples/count/Makefile
@@ -90,5 +90,8 @@ count_stat_eventual: count_stat_eventual.c ../api.h counttorture.h
 count_tstat: count_tstat.c ../api.h counttorture.h
 	$(CC) $(GCC_ARGS) $(CFLAGS) -o count_tstat count_tstat.c -lpthread
 
+check: $(PROGS)
+	$(foreach prog, $(PROGS), ./$(prog);)
+
 clean:
 	rm -f $(PROGS)
-- 
2.39.1

