Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eQ48ra6E9OjPRLN/oY5YG/l56YffIFywUEUg9vFUCH4=;
        b=N4BySAmoXxttiLiNbrnnQMluTpzpnbdH8ln4bJQjPt/MgUIP5Jvvb+1AzCxtrV9yuu
         XNxXOm7zmX5y3EP7pQQzxaLuywqF2p7eEar9mAdOB7Hxw2RKKIdDgDnLQGRyQIn2w3ev
         b6PWLTcDhTCEyxnG5LPh+yOwyLJR1za1Fn7uWUEeJOUp1Kk5lRbFpQcQGckcD3KRPwMq
         uJljbiPsvUh6/ILwf209vHywxecenrxHngCwM7FKsLoOy+kOkLuz2J7fvPVFfbE1uMdc
         2iklY4gvRiIr7Wr1CO1xDNruZFotb+1mNe8ZyxGbY28DAQQeYBu7leoVqOGqB+ivpJUu
         ycDg==
Subject: [PATCH -perfbook 5/5] Makefile: Add info on ebooksize build in help
 and help-full
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7c31e637-8a04-672d-71e5-3a3009e182f3@gmail.com>
Date: Thu, 25 Mar 2021 20:00:07 +0900
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

"(WIP)" will be removed size adjustments of floats are done.

Also promote paper-size specific targets to "make help".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 415bcef3..16c85edf 100644
--- a/Makefile
+++ b/Makefile
@@ -500,8 +500,15 @@ help: help-official
 	@echo "Set env variable PERFBOOK_PAPER to change paper size:"
 	@echo "   PERFBOOK_PAPER=A4: a4paper"
 	@echo "   PERFBOOK_PAPER=HB: hard cover book"
+	@echo "   PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
 	@echo "   other (default):   letterpaper"
 	@echo
+	@echo "Paper size variations (independent of PERFBOOK_PAPER):"
+	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
+	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
+	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
+	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
+	@echo
 	@echo "\"make help-full\" will show the full list of available targets."
 
 help-full: help-official
@@ -510,6 +517,7 @@ help-full: help-official
 	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
 	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
 	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
+	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
 	@echo
 	@echo "Experimental targets:"
 	@echo "  Full,              Abbr."
@@ -540,8 +548,9 @@ help-full: help-official
 	@echo "  - Set env variable PERFBOOK_PAPER to change paper size:"
 	@echo "      PERFBOOK_PAPER=A4: a4paper"
 	@echo "      PERFBOOK_PAPER=HB: hard cover book"
+	@echo "      PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
 	@echo "      other (default):   letterpaper"
-	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", and \"a4\".)"
+	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", \"a4\", and \"eb\".)"
 
 clean:
 	find . -name '*.aux' -o -name '*.blg' \
-- 
2.17.1


