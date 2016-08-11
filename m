Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=seY5svw9i+3x6SVDEeQfoNkNJnvbGV2sJ0pXpWSsL4o=;
 b=a5eS0HHUQcZADUsoX3vkz8rDnpxjqNKj6wp9gIcJcAPTHTdR5aVraT8wlQBT62ZoQZ
 951iASrtGeb126dWjEu7oMAJcuxhbI1HhZF/nwQ6ntkCOWY4l+cG7nbd2u1166FeNJ2D
 w6MBLDGvZOOB9a0YgkDMu3i9l29GIcZoRHWXxvWjBmse8Izdde19ri+xHTa09VJA5djn
 XpTAr4D60pBtkQUV4K+HvJ5zbx9KO5JKQ8hmj4obDm4d9n/kVLlclQ42MhPAnBqDiyL7
 Cjq32M1/unSEkjToCVu35fPJ80dDcilzms+3oH18HOYS9oRtLCUsqAcbjckvD5oe0hK4
 C2MQ==
Subject: Re: [RFT GIT PULL] Makefile: Add ".fig -> .eps" rule
References: <2d788653-610c-bc99-0d70-f86b96056c7e@gmail.com>
 <20160811175403.GB3482@linux.vnet.ibm.com>
 <89115e47-37d6-b563-435e-6dbecf078963@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <43f918de-2031-296c-6365-bfd2865a5d1a@gmail.com>
Date: Fri, 12 Aug 2016 08:24:41 +0900
MIME-Version: 1.0
In-Reply-To: <89115e47-37d6-b563-435e-6dbecf078963@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6cfc7b3b1642c5b80badd9efeb582d24e9a9293c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 12 Aug 2016 08:01:01 +0900
Subject: [PATCH] Makefile: Enable fig2eps --keep option for debugging

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d50420d..be5c50a 100644
--- a/Makefile
+++ b/Makefile
@@ -112,7 +112,7 @@ $(EPSSOURCES_FROM_DOT): %.eps: %.dot

 $(EPSSOURCES_FROM_FIG): %.eps: %.fig
 	@echo "$< --> $@"
-	@fig2eps --nogv $< > /dev/null 2>&1
+	@fig2eps --nogv --keep $<
 	@sh utilities/fixanepsfonts.sh $@

 $(PDFTARGETS_OF_EPS): %.pdf: %.eps
-- 
1.9.1


