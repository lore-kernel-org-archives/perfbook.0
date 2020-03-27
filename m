Return-Path: <SRS0=2js+=5M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=doGtARE3cL66C6d1uo2K0vNwSe6QZmeArcSd4+2+Lig=;
        b=N2XfFL5ILyf89xbQFkognbuOQDZWy+dlIxdRq8fQrWWuXPoiBlmwkAnoqIjQ8yEwZ7
         zra0LmxyvX4b2VEXTI+Ce/L+7Tz5WWvMeoVOcWs8JUD4Gf2FR8zMeDV87QDUI37quASS
         gZkd4b5flQ3WH2ugBk/Q97kmjNSB7e4+wC9B7aFcW8ilcQgKPfSXRpt/rO/xQgP93kd+
         L15TD1UvECDUz2/uDIV+N8rwL6cd5GmRLId7ZmCK+g7xhYL+5f/JlW6/4XuPTtGetax3
         FnpVB4CPwiSYOQ4aLZ9BBvzdoy5tAlBR5OYzvyC0GYW63ztAJbeEPXP26PDINdIfGF/Q
         TsTg==
Subject: [PATCH 4/4] Makefile: Show only official targets in 'make help'
References: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <74768170-59ac-d2b4-5e54-9a9473a55b93@gmail.com>
Date: Fri, 27 Mar 2020 20:29:58 +0900
MIME-Version: 1.0
In-Reply-To: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a16de4dd9a42483064426c0b964263a552f2475e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Mar 2020 19:29:59 +0900
Subject: [PATCH 4/4] Makefile: Show only official targets in 'make help'

To prevent the most important info from scrolling away,
divide the help text into two parts.

"make help" will show three official targets and a hint for
"make help-full".
"make help-full" will show all the targets and further notes.

Suggested-by:Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt |  3 ++-
 Makefile      | 22 ++++++++++++++--------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 6a1acff1..ffb380f2 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -17,7 +17,8 @@
 	A.	"make hb" will build perfbook-hb.pdf that is useful
 		for making hard-bound printouts.
 		"make 2c" will build perfbook.pdf.
-		"make help" will show you the full list of targets.
+		"make help" will show you the list of official targets.
+		"make help-full" will display all the available targets.
 
 4.	Isn't it possible to build perfbook-1c.pdf by just typing
 	"make"?
diff --git a/Makefile b/Makefile
index c65bd786..b721eeae 100644
--- a/Makefile
+++ b/Makefile
@@ -150,7 +150,7 @@ endif
 
 chkpagegroup = $(PERFBOOK_CHKPAGEGROUP)
 
-.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help
+.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help help-official help-full
 all: $(targ)
 
 ifeq ($(MAKECMDGOALS),clean)
@@ -403,26 +403,32 @@ $(FCVSNIPPETS_LTMS):
 	@echo "$< --> $@"
 	@utilities/reorder_ltms.pl $< > $@
 
-help:
+help-official:
 	@echo "Official targets (Latin Modern Typewriter for monospace font):"
 	@echo "  Full,              Abbr."
 	@echo "  perfbook.pdf,      2c:   (default) 2-column layout"
 	@echo "  perfbook-1c.pdf,   1c:   1-column layout"
 	@echo "  perfbook-hb.pdf,   hb:   For hardcover books (2-column)"
+
+help: help-official
+	@echo
+	@echo "\"make help-full\" will show the list of available targets."
+
+help-full: help-official
 	@echo
 	@echo "Experimental targets:"
 	@echo "  Full,              Abbr."
-	@echo "  perfbook-qq,       qq:   2c with framed Quick Quizzes"
-	@echo "  perfbook-1cqq,     1cqq: 1c with framed Quick Quizzes"
-	@echo "  perfbook-nq,       nq:   2c without inline Quick Quizzes"
-	@echo "  perfbook-1cnq,     1cnq: 1c without inline Quick Quizzes"
-	@echo "  perfbook-tcb,      tcb:  2c with table caption at bottom (prev default)"
+	@echo "  perfbook-qq.pdf,   qq:   2c with framed Quick Quizzez (1cqq for 1c)"
+	@echo "  perfbook-nq.pdf,   nq:   2c without inline Quick Quizzes (1cnq for 1c)"
 	@echo "  perfbook-msnt.pdf, msnt: 2c with newtxtt as monospace (non-slashed 0)"
 	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
 	@echo "  perfbook-msr.pdf,  msr:  2c with regular thickness courier clone"
 	@echo "  perfbook-msn.pdf,  msn:  2c with narrow courier clone"
 
 	@echo "  perfbook-1csf.pdf, 1csf: 1c with sans serif font"
+	@echo
+	@echo "Historical targets:"
+	@echo "  perfbook-tcb.pdf,  tcb:  2c with table caption at bottom (prev default)"
 	@echo "  perfbook-msns.pdf, msns: 2c with non-scaled courier (orig default)"
 	@echo "  perfbook-mss.pdf,  mss:  2c with scaled courier (prev default)"
 	@echo
@@ -432,7 +438,7 @@ help:
 	@echo "  - \"msn\" doesn't cover bold face for monospace."
 	@echo "  - \"1csf\" requires \"newtxsf\"."
 	@echo "  - \"msnt\" and \"1csf\" have framed Quick Quizzes."
-	@echo "  - All targets except for \"msn\" use \"Latin Modern Typewriter\" font"
+	@echo "  - All the targets except for \"msn\" use \"Latin Modern Typewriter\" font"
 	@echo "    for code snippets."
 
 clean:
-- 
2.17.1


