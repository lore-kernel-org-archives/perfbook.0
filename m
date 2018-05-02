Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DniDtNb/xDpACBGQcR6Cw5KVT71TsRpYHdxIuTRkLVY=;
 b=SmGgjJ5jeURU3ezvgR5QlPsNbQVHlOUnwyv4XqDYMGPWervBbrEIz3uMZ022jnhg5V
 xMXO8fDLnBaWxv/NHwVX4lPv63uV19T0Ep4dqmbOJqnZYlmgKX9RfxYmvYkkz6+IFWY7
 ri9ML1kPLoM8mXATgiQQ8+4GE8Koj0qKKoM42FdQqxfs+wXM7YqnpFFaIzIka6fdlfUy
 4Ql1E065ToSBc2Jt/JguQH+j775PciXgBslOIlK1eCUtAdgoR24tdsSqHaeMPXlEv/c+
 f0cQMoGL/5pedQQ7QvsC5TEpFmS488ccua7opo/xARvshYKgcoCBMg39yjvaqUzXQUlz
 zJow==
Subject: [PATCH 1/5] Makefile: Update help message
References: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dea96265-f805-edd0-2c38-ace2d4cc0ed8@gmail.com>
Date: Wed, 2 May 2018 13:16:11 +0900
MIME-Version: 1.0
In-Reply-To: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 59863c5f0cbff34e90a1cbbea671f47d70c750a2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Apr 2018 20:07:46 +0900
Subject: [PATCH 1/5] Makefile: Update help message

Fix typo and out-of-date dependency info displayed by "make help".
Also move target "perfbook-tcb" under "Experimental targets:".

Also mention "make help" in FAQ-BUILD.txt.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 1 +
 Makefile      | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index e277d95..8b0e8aa 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -17,6 +17,7 @@
 	A.	"make hb" will build perfbook-hb.pdf that is useful
 		for making hard-bound printouts.
 		"make 2c" will build perfbook.pdf.
+		"make help" will show you the full list of targets.

 4.	Isn't it possible to build perfbook-1c.pdf by just typing
 	"make"?
diff --git a/Makefile b/Makefile
index 4167e20..9ac521c 100644
--- a/Makefile
+++ b/Makefile
@@ -221,12 +221,12 @@ help:
 	@echo "Official targets (Latin Modern Typewriter for monospace font):"
 	@echo "  Full,              Abbr."
 	@echo "  perfbook.pdf,      2c:   (default) 2-column layout"
-	@echo "  perfbook-tcb,      tct:  2-column layout with table caption at bottom"
 	@echo "  perfbook-1c.pdf,   1c:   1-column layout"
 	@echo "  perfbook-hb.pdf,   hb:   For hardcover books (2-column)"
 	@echo
 	@echo "Experimental targets:"
 	@echo "  Full,              Abbr."
+	@echo "  perfbook-tcb,      tcb:  2c with table caption at bottom (prev default)"
 	@echo "  perfbook-msnt.pdf, msnt: 2c with newtxtt as monospace (non-slashed 0)"
 	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
 	@echo "  perfbook-msr.pdf,  msr:  2c with regular thickness courier clone"
@@ -238,9 +238,9 @@ help:
 	@echo "  \"msnt\" requires \"newtxtt\". \"mstx\" is fallback target for older TeX env."
 	@echo "  \"msr\" and \"msn\" require \"nimbus15\"."
 	@echo "  \"msn\" doesn't cover bold face for monospace."
-	@echo "  \"1csf\" requires recent version (>=1.3i) of \"mathastext\"."
+	@echo "  \"1csf\" requires \"newtxsf\"."
 	@echo
-	@echo "All targets except for \"msns\" and \"mss\" use \"Latin Modern Typewriter font"
+	@echo "All targets except for \"msns\" and \"mss\" use \"Latin Modern Typewriter\" font"
 	@echo "for code snippets."

 clean:
-- 
2.7.4


