Return-Path: <SRS0=Nnbh=J3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ptVb3zb7N3erKKNb5Hj2k23khCZFcZZafginQ6ePrDI=;
        b=ffH/pL8ziLj6u9+snNPHN10i6y9soYr98o3ns6r16eeOFfZyhL3v7UIhoZRJPp6nm/
         QBddYYkagEXtjCwMAZXYv2mGz1dDzhwSQOgg01ojZM1cUXD8qhzCz7TMTQADqda1mmTY
         wsv8qO1M7f/uSa05wv2RfFIXLeYJlBXJvFNgr2T8xp6Sf0fXyszXlJl9ceJ4TZde1Vht
         P+Y655fAj2kNEMzvJnq5G83CXuGA15fSei55BViW2i/EnlBsjeiCwvNndZFWTSUReAD8
         vlwRO+6LvfRII3/nNDjbn+RjAN80O+0lBzXhWmk24rEDo8gd0N5IoouQDlluuBXSEyVn
         B1ew==
Subject: [PATCH -perfbook 1/4] Auto run periodcheck on 'make'
References: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9a179097-335a-c80b-22f0-d9bc664ca07f@gmail.com>
Date: Fri, 30 Apr 2021 13:51:40 +0900
MIME-Version: 1.0
In-Reply-To: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Run periodcheck on "make" and "make all".
It uses an intermediate target, periodcheck-auto, which depends on
$(targ).
The dependency ensures that periodcheck runs after runlatex completes
in parallel build but doesn't run if runlatex fails.

"make periodcheck" keeps its behavior and does not run pdflatex.

While we are here, improve targets "mslm" and "qq" by adding
dependencies to ensure that the message concerning the obsolete
targets not to be missed.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index ea264dc5..dc6b68e0 100644
--- a/Makefile
+++ b/Makefile
@@ -192,9 +192,9 @@ BASE_DEPENDS := perfbook.tex $(foreach v,tcb 1c msns mss mstx msr msn msnt sf nq
 .PHONY: qq perfbook-qq.pdf qqmsg
 .PHONY: help help-official help-full help-semiofficial help-paper help-draft
 .PHONY: help-experimental help-prefixed
-.PHONY: paper-clean periodcheck
+.PHONY: paper-clean periodcheck periodcheck-auto
 
-all: $(targ)
+all: periodcheck-auto
 
 ifeq ($(MAKECMDGOALS),clean)
 else ifeq ($(MAKECMDGOALS),distclean)
@@ -206,16 +206,16 @@ endif
 2c: perfbook.pdf
 
 mslm: perfbook-mslm.pdf
-perfbook-mslm.pdf: perfbook.pdf mslmmsg
+perfbook-mslm.pdf: mslmmsg
 
 qq: perfbook-qq.pdf
-perfbook-qq.pdf: perfbook.pdf qqmsg
+perfbook-qq.pdf: qqmsg
 
-mslmmsg:
+mslmmsg: perfbook.pdf
 	@echo "perfbook-mslm.pdf is promoted to default target,"
 	@echo "built as perfbook.pdf."
 
-qqmsg:
+qqmsg: perfbook.pdf
 	@echo "perfbook-qq.pdf is promoted to default target,"
 	@echo "built as perfbook.pdf."
 
@@ -614,5 +614,8 @@ neatfreak: distclean
 periodcheck:
 	utilities/periodcheck.sh
 
+periodcheck-auto: $(targ)
+	utilities/periodcheck.sh
+
 .SECONDEXPANSION:
 $(ABBREVTARGETS): %: perfbook-$$@.pdf
-- 
2.17.1


