Return-Path: <SRS0=vqDK=OX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RaYj3BtAIudYjRHnXH8BIO0JtmTGt+a4qzhT/rCkQoM=;
        b=jUxy0MS52jPPWP1ofBfdoYdjtY9Yz8a8mK5/xXdaWkYxHTNq5ZGF5pffpcw6GADzpj
         gCbh/wvnsioc8cTmQdObjX6iT5fW3l47yFs0saywlgiO1c2bEUbX2p87Z3YmtEopcPoJ
         1RocJwU7XrHfXZc2bDipUXhpCJBQ32AD4nN3j89dwmSzxNYHrlEG13m4DxKkULySRsK/
         a8wQdBcfwd0YyORWs/38UMPIpf6uES/kGdZMQf7qW6gtoU77bmQp3rMY5u0KYgg4Qsl9
         nm4EZ2rn+QjoYeD4xVjyvBIFic9qHLYhPOXpr9gJNJrnjz3IXgMG6iFbODVHjR5N3FJX
         XNMg==
Subject: [PATCH -perfbook 4/6] epstopdf-rule.mk: Reduce converted pdf size
References: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <14faed3b-0dd5-c9d6-f52b-eaf6d56617c2@gmail.com>
Date: Sun, 3 Oct 2021 23:55:53 +0900
MIME-Version: 1.0
In-Reply-To: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

By adding "-dPDFSETTINGS=/ebook" in options passed to gs from
epstopdf, pdf size of scanned images can be reduced.
The image quality should be acceptable for perfbook.

Now the size of perfbook.pdf becomes around 500KB smaller than the
one built with a2ping.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 epstopdf-rule.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
index 51425972..83d335f0 100644
--- a/epstopdf-rule.mk
+++ b/epstopdf-rule.mk
@@ -6,6 +6,7 @@
 
 EPSTOPDF := $(shell which epstopdf 2>/dev/null)
 GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
+GS_OPT=--gsopt=-dPDFSETTINGS=/ebook
 
 $(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
 	@echo "$< --> $@"
@@ -15,7 +16,7 @@ endif
 	@cp $< $(basename $<)__.eps
 	@sh $(FIXANEPSFONTS) $(basename $<)__.eps
 	@eps2eps $(basename $<)__.eps $(basename $<)___.eps
-	@epstopdf $(basename $<)___.eps $@
+	@epstopdf $(GS_OPT) $(basename $<)___.eps $@
 	@rm -f $(basename $<)__.eps $(basename $<)___.eps
 
 $(PDFTARGETS_OF_TEX): %.pdf: %.eps
@@ -25,10 +26,10 @@ ifndef EPSTOPDF
 endif
 ifeq ($(GS_953_OR_LATER),1)
 	@eps2eps -dALLOWPSTRANSPARENCY $< $(basename $<)__.eps
-	@epstopdf --gsopt=-dALLOWPSTRANSPARENCY $(basename $<)__.eps $@
+	@epstopdf --gsopt=-dALLOWPSTRANSPARENCY $(GS_OPT) $(basename $<)__.eps $@
 else
 	@eps2eps $< $(basename $<)__.eps
-	@epstopdf --nosafer $(basename $<)__.eps $@
+	@epstopdf --nosafer $(GS_OPT) $(basename $<)__.eps $@
 endif
 	@rm -f $(basename $<)__.eps
 
@@ -38,5 +39,5 @@ ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
 endif
 	@eps2eps $< $(basename $<)__.eps
-	@epstopdf $(basename $<)__.eps $@
+	@epstopdf $(GS_OPT) $(basename $<)__.eps $@
 	@rm -f $(basename $<)__.eps
-- 
2.17.1


