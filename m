Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ysSWt2VHy9u53WyTFgf7+WaS2wHTCfMkLw9ixrwJXM8=;
        b=Wet1ly/ZXqtdTxvfczAECPL7V8uOPIhOj/leJpcagRXyFEJEIS16tYsoxPfDNKbIWe
         Aq4ESZiSlgydBH6l3vSb2dJi8PlfsrhgvkGyOgh4jelDGYfoaaagkWm3F31HxYXjPeSm
         giKIrIu+aJVKqSxyVxOwYrQCKiu7o5eXRx4/oaQ27DtaIvNUai9dwQuhor5SaI0T2oOJ
         1eGysDqL66vPi4UBj1GsqXlkcB/k8D48QJkvpj4A/b7LWdyuhSDdOkCuOr7AhRKTa3cy
         BkaNNQ+pi9SbIKAlFETNZbvqp0tx2iBv8yZlyLq1tRxs7mQcUGOlRpVHFjJyAJC4LA8l
         ZvpA==
Subject: [PATCH -perfbook 11/11] Makefile: Rename periodcheck --> punctcheck
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f35e8408-c679-5c62-62db-d620c914be30@gmail.com>
Date: Tue, 17 Aug 2021 19:40:43 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Now that periodcheck checks punctuation marks not limited to periods,
rename it and use the name "punctcheck".

Note: "make periodcheck" is now an alias of "make punctcheck".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                                    | 14 ++++++++------
 utilities/{periodcheck.pl => punctcheck.pl} |  0
 utilities/{periodcheck.sh => punctcheck.sh} |  2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)
 rename utilities/{periodcheck.pl => punctcheck.pl} (100%)
 rename utilities/{periodcheck.sh => punctcheck.sh} (92%)

diff --git a/Makefile b/Makefile
index 3e604c53..3df1810e 100644
--- a/Makefile
+++ b/Makefile
@@ -191,9 +191,9 @@ BASE_DEPENDS := perfbook.tex $(foreach v,tcb 1c msns mss mstx msr msn msnt sf nq
 .PHONY: qq perfbook-qq.pdf qqmsg
 .PHONY: help help-official help-full help-semiofficial help-paper help-draft
 .PHONY: help-experimental help-prefixed
-.PHONY: paper-clean periodcheck periodcheck-auto
+.PHONY: paper-clean periodcheck punctcheck punctcheck-auto
 
-all: periodcheck-auto
+all: punctcheck-auto
 
 ifeq ($(MAKECMDGOALS),clean)
 else ifeq ($(MAKECMDGOALS),distclean)
@@ -610,13 +610,15 @@ ls-unused:
 neatfreak: distclean
 	find . -name '*.pdf' | xargs rm -f
 
-periodcheck:
-	utilities/periodcheck.sh
+punctcheck:
+	utilities/punctcheck.sh
 	utilities/cleverefcheck.sh
 
-periodcheck-auto: $(targ)
-	utilities/periodcheck.sh
+punctcheck-auto: $(targ)
+	utilities/punctcheck.sh
 	utilities/cleverefcheck.sh
 
+periodcheck: punctcheck
+
 .SECONDEXPANSION:
 $(ABBREVTARGETS): %: perfbook-$$@.pdf
diff --git a/utilities/periodcheck.pl b/utilities/punctcheck.pl
similarity index 100%
rename from utilities/periodcheck.pl
rename to utilities/punctcheck.pl
diff --git a/utilities/periodcheck.sh b/utilities/punctcheck.sh
similarity index 92%
rename from utilities/periodcheck.sh
rename to utilities/punctcheck.sh
index 4fff091b..d0ade754 100755
--- a/utilities/periodcheck.sh
+++ b/utilities/punctcheck.sh
@@ -20,5 +20,5 @@ done
 
 for g in $tex_sources
 do
-	utilities/periodcheck.pl $g
+	utilities/punctcheck.pl $g
 done
-- 
2.17.1


