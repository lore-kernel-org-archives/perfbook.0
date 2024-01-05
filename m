Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068A3249F7
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFbFkBQb"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so1038288b6e.2
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704448247; x=1705053047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUZCzol9flORSwk7pW8IYsxcCWVvseN6IpRAQaefw4c=;
        b=EFbFkBQbAL27Lpm0XyC95DdMtjzEGUtBo0E8EQHg181H3ggMmU/Qo0B2+gwQ2RHRBT
         ViJPKjoP3oURoXwD701r+JupfJBhDWtTd1vYMbhx8ctkGXU37nswBKLFuhDT58btfR8s
         AtMy3wPqbl6Z+jdz64oFpBh1Cif/vyuCL6k8ikCNnv4G/II+X4JAuh3r5LFrtMIzqhlM
         /HPKSjYUrOme0dDlu/Wx0KXqarlYPQbAJ8e/0ry0sfZYxsX3lC5zj6e2ZWLFzt7Ygw07
         TSUPn2ZiFQifS73SXpvj8HxpVp4CQstf72QQqenIA/qpFAPTqGXlxKbRpiEMsjXTHPT2
         x3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448247; x=1705053047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUZCzol9flORSwk7pW8IYsxcCWVvseN6IpRAQaefw4c=;
        b=W3L2BJJht2yqRQ8L5ApfuOENsu3oH1HAa6qxqeXoAVGAJwwMfz6drwl7CQiXtRrRdS
         UDC/yWLuR2MV7k8yxoruTJkSzHetLcnHSQ3kEd8j6Xu7+9M3NRpsjm8c0YEwlsYlJlFK
         P8fR9z3dfEVgGV8a0+sgdT87x2JgxgO6B1AXLQNp/7lnX14zI6SgfROu24+/u+zLPf9x
         RZvwG0Ncbof68phIFOpTtlFJaoVkZl5HkgqpstgSFGAhms7OkVlhr0cF55K7v9wiWfgO
         HZ+okjKvZkpH06D8ryLLFhN5IxUWGNziaMgJqore7DlOx1Kz70rMhzTMZGlNYU9sL7JM
         i5Ng==
X-Gm-Message-State: AOJu0YxkfTjEStw6BRgk2bJ3Gl8vFnTALiRGFS0kGL47NzuDoDYEpfQF
	LmQCK7B6HEVkfoyc/w7lo5s=
X-Google-Smtp-Source: AGHT+IFLwpl5E142rlqNMzYxfWTu8jouBVZv1NblGXSg7n1OZXXGijguoxQNu/KiTP7JUcANlY5bjA==
X-Received: by 2002:a05:6808:23c3:b0:3bc:3610:5378 with SMTP id bq3-20020a05680823c300b003bc36105378mr837460oib.105.1704448246959;
        Fri, 05 Jan 2024 01:50:46 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b006da24e7c16dsm1029605pfn.186.2024.01.05.01.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:50:46 -0800 (PST)
Message-ID: <9a613659-9b48-4dc6-8ca6-46765676f7b5@gmail.com>
Date: Fri, 5 Jan 2024 18:50:45 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/8] Makefile: Don't use rsvg-convert < 2.57
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

rsvg-convert versions prior to 2.57 doesn't recognize options for
specifying output PDF version.  Default PDF output version depends
on the version of rsvg-convert.  Version 2.57's default is PDF 1.7.

For the moment, don't use younger versions of rsvg-convert.  Use
inkscape as a fallback.

For rsvg-convert >= 2.57, specify --format=pdf1.5, which matches
inkscape's default behavior.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f869862c..9f19ce52 100644
--- a/Makefile
+++ b/Makefile
@@ -116,7 +116,15 @@ endif
 # rsvg-convert is preferred to inkscape in SVG --> PDF conversion
 RSVG_CONVERT := $(shell $(WHICH) rsvg-convert 2>/dev/null)
 ifdef RSVG_CONVERT
-  SVG_PDF_CONVERTER = (rsvg-convert)
+  RSVG_CONVERT_VER := $(shell rsvg-convert --version | $(SED) -e 's/rsvg-convert version //')
+  RSVG_CONVERT_VER_MINOR := $(shell echo $(RSVG_CONVERT_VER) | $(SED) -E -e 's/^([0-9]+\.[0-9]+).*/\1/')
+  RSVG_CONVERT_GOOD_VER ?= 2.57
+  RSVG_CONVERT_GOOD := $(shell echo $(RSVG_CONVERT_VER_MINOR) $(RSVG_CONVERT_GOOD_VER) | awk '{if ($$1 >= $$2) print 1;}')
+  ifeq ($(RSVG_CONVERT_GOOD),1)
+    SVG_PDF_CONVERTER = (rsvg-convert v$(RSVG_CONVERT_VER))
+  else
+    SVG_PDF_CONVERTER = (inkscape)
+  endif
 else
   SVG_PDF_CONVERTER = (inkscape)
 endif
@@ -468,7 +476,7 @@ $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 ifeq ($(STEELFONT),0)
 	$(error "Steel City Comic" font not found. See #1 in FAQ.txt)
 endif
-ifndef RSVG_CONVERT
+ifneq ($(RSVG_CONVERT_GOOD),1)
   ifndef INKSCAPE
 	$(error $< --> $@ inkscape nor rsvg-convert not found. Please install either one)
   endif
@@ -494,8 +502,8 @@ ifeq ($(RECOMMEND_LIBERATIONMONO),1)
 	$(info Nice-to-have font family 'Liberation Mono' not found. See #9 in FAQ-BUILD.txt)
 endif
 
-ifdef RSVG_CONVERT
-	@cat $<i | rsvg-convert --format=pdf > $@
+ifeq ($(RSVG_CONVERT_GOOD),1)
+	@cat $<i | rsvg-convert --format=pdf1.5 > $@
 else
   ifeq ($(INKSCAPE_ONE),0)
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
-- 
2.34.1



