Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=rlpezfZUBP00FZ6I610oxfyTbmfiIfNlDe+/SU3s+2s=;
 b=vKxuU+66iOdOE5hBHbJFwn2naOe+Y2/bFfypu3oFcOgh7yQSvF0ZZOyedmaaFeQN0B
 sTQU/3K3pO19AOvcqqAe5gvYFXaoEHMcpJn9PPRgQcowL65OPNTRdn0iS6fL737UQL1p
 ryuCKcsyd05ET6+fyIxCK98sMi/gUI2RoZBQLOYkiC93YIP2njQqq439xZHu/kWNgy5j
 nudi490zvZsmL/vysbqxnGhuq4DQ7aTvvK5XJ/YOuELIozdYKfcux/Y/wSf3PIcE+GTH
 +jALlM+1Agppe4wMEUrV2ZaqvrAFN0No0ZBRPgsZjZL1hTEeDMl63KXWk8DwSq8A5v+9
 ZKEA==
Subject: [PATCH 1/2] Makefile: Fix .bbl dependency
References: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <799db01c-64d2-ee1f-83a4-aa24c88dc857@gmail.com>
Date: Wed, 28 Dec 2016 00:27:59 +0900
MIME-Version: 1.0
In-Reply-To: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 842d6a4951c24e01a905c28babe9b127e197ae19 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 28 Dec 2016 00:00:44 +0900
Subject: [PATCH 1/2] Makefile: Fix .bbl dependency

BiBTeX didn't run properly after update of alphapf.bst.
$(BIBSOURCES) should have been in the dependency of ".bbl".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index f0944f0..f446a66 100644
--- a/Makefile
+++ b/Makefile
@@ -68,10 +68,10 @@ all: $(targ)
 $(PDFTARGETS): %.pdf: %.tex %.bbl
 	sh utilities/runlatex.sh $(basename $@)

-$(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux
+$(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
 	bibtex $(basename $@)

-$(PDFTARGETS:.pdf=.aux): $(LATEXSOURCES) $(LATEXGENERATED) $(BIBSOURCES)
+$(PDFTARGETS:.pdf=.aux): $(LATEXSOURCES) $(LATEXGENERATED)
 	sh utilities/runfirstlatex.sh $(basename $@)

 perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
-- 
2.7.4


