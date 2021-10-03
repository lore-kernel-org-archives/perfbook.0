Return-Path: <SRS0=vqDK=OX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3cxPApyJ/Jn/mWhHuBYtMNP3GOnrlnJxvHKWfDfBDz0=;
        b=m/lnqbbfYiW8reMsKmi4m2VWdnHUm/paftbwWBGyzCbVeBK3vMybb6OzBVP4zZ6DbR
         ZGoszQoX6TR5YqMADZeRd70034s4VZoBKmQwMpbG27TtF03iCVrtt/1hZhwK5iMcmRNw
         Iwy9uI3XAfK/MoFmT6ZVqFfVPNdnIFT1zgfnmuacS0QfD6jfAbmSINwIx04CyjdI6Tdc
         oVXAbZk3FzNXDrPv3M/o4ByjvJpE8zSJUN0Pz6gDGwjm820/EoZMq73OWWSIrF05ylgB
         IbAXE2di3O0C2gGKB9rl3OUA5LEfC3IbEojU+EaZfqJzsBoRWTKxao/UoG2VsujKgjqK
         h8Hg==
Subject: [PATCH -perfbook 1/6] Makefile: Add targets to build/clean figure
 files
References: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2f526624-3202-9ffe-3731-8b3f2c89dc8d@gmail.com>
Date: Sun, 3 Oct 2021 23:40:26 +0900
MIME-Version: 1.0
In-Reply-To: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

For ease of switching rules for "eps --> pdf" conversion, add targets
"cleanfigs", "cleanfigs-eps", "cleanfigs-svg", and "figs".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index eca23aab..e2838779 100644
--- a/Makefile
+++ b/Makefile
@@ -204,6 +204,7 @@ BASE_DEPENDS := perfbook.tex $(foreach v,tcb 1c msns mss mstx msr msn msnt sf nq
 .PHONY: help help-official help-full help-semiofficial help-paper help-draft
 .PHONY: help-experimental help-prefixed
 .PHONY: paper-clean periodcheck punctcheck punctcheck-auto
+.PHONY: cleanfigs cleanfigs-eps cleanfigs-svg figs
 
 all: punctcheck-auto
 
@@ -625,6 +626,17 @@ ls-unused:
 neatfreak: distclean
 	find . -name '*.pdf' | xargs rm -f
 
+cleanfigs-eps:
+	rm -f $(EPSSOURCES_FROM_TEX) $(EPSSOURCES_FROM_DOT) $(EPSSOURCES_FROM_FIG)
+	rm -f $(PDFTARGETS_OF_EPS)
+
+cleanfigs-svg:
+	rm -f $(PDFTARGETS_OF_SVG)
+
+cleanfigs: cleanfigs-eps cleanfigs-svg
+
+figs: $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
+
 punctcheck:
 	utilities/punctcheck.sh
 	utilities/cleverefcheck.sh
-- 
2.17.1


