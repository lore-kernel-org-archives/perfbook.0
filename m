Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A21724B59
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQ+lWo7R"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-595b208a050so623244eaf.0
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704448321; x=1705053121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwD8JGEgH6r7Mc+3ejwnRjGPiF1uSiWCZH3dDRlPqlo=;
        b=hQ+lWo7RSw0Uy4nOfPZiFC+MfI8cOajSW475e9bWvTrfwQZf5mt+dfTuanfIRipb0W
         nQXcbykWBLSjTGtytw5muyXfqJts5xqoQZm5paRoOoeQDZ/PEgEFLxAmkPZnBv8VPVSx
         PJ2vdjjn6rfkkDSIz2Hracng9F4WJIoMbN0bBdnFok5SD19M+tBrUPvjb2bEKhNu4daR
         A4EiZXnOn6vzebjojDqGtHrIzVsOu3uGQUa0o5MFUGtnuu4lgVjjtIwBl8s4QTVeoZk8
         eIX7DtM+DZJrx0+LiXD1pC0X0FWGIjysOeRlppCzcFopfXObwFTrQCdHS5EBSiDMDaEv
         6Jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448321; x=1705053121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwD8JGEgH6r7Mc+3ejwnRjGPiF1uSiWCZH3dDRlPqlo=;
        b=wVCu6I33oWDR0k/+va8x40dM0VaIQT/2KBwChXqijR/RPVcUdz8meXJoBl08km8Z2f
         GXoQcjrKeeUJ5Q98LdeZNU6UoExt7o76A/Yl6kyjUiCvJvHH7vzOD+JrBaURnUQeQHL9
         vquXrZ0vZkcA0IofmLYDHy/AnFpS8IXrr+h4QRnjxrQsBeMnWFeGiZlbtNfaUBd51RDP
         eLOJKKBJmYaZc/puMUXx23qviwjMZejKYFMOAYNwUyA7vJCzr4xtyYLDkh2anLIMZzBj
         OKXiFNHud5ZQ1CEM2kLfT0VNN7mt5wSQSiSzHEsuNXOmfUwn1nR32UqyW3f4DX+vODEu
         AMlA==
X-Gm-Message-State: AOJu0YwDGMmES3jp1i3LcUQ50K5kp7mwJUkqP+9arS3WNuHUY8FqquNx
	LO0tAoyf77snZdTvP7AhZYMs1lwu48k=
X-Google-Smtp-Source: AGHT+IEzpOcTWCOB9ij3k97mefk/WJGTWKNJgGE9OA0XNdaxOLGuvZrOss8Ty+h+CdnO9Ed/bF7T7g==
X-Received: by 2002:a05:6359:5c30:b0:174:c1b6:86d1 with SMTP id pu48-20020a0563595c3000b00174c1b686d1mr1549544rwb.46.1704448321220;
        Fri, 05 Jan 2024 01:52:01 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b006da24e7c16dsm1029605pfn.186.2024.01.05.01.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:52:00 -0800 (PST)
Message-ID: <46bdaf6a-d83b-4466-aa22-259a8edcbbc1@gmail.com>
Date: Fri, 5 Jan 2024 18:52:00 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/8] Makefile: Allow rsvg-convert 2.52
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

rsvg-convert 2.52.5 (on Ubuntu 22.04 LTS) output PDF 1.5 by default
and is good enough for perfbook.
Add rules for using it in SVG --> PDF conversion.

rsvg-convert versions >= 2.54 and < 2.57 default to PDF 1.7 and don't
have option of --format pdf1.5.  Avoid using those interim versions
by default.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9f19ce52..3844c37b 100644
--- a/Makefile
+++ b/Makefile
@@ -119,12 +119,24 @@ ifdef RSVG_CONVERT
   RSVG_CONVERT_VER := $(shell rsvg-convert --version | $(SED) -e 's/rsvg-convert version //')
   RSVG_CONVERT_VER_MINOR := $(shell echo $(RSVG_CONVERT_VER) | $(SED) -E -e 's/^([0-9]+\.[0-9]+).*/\1/')
   RSVG_CONVERT_GOOD_VER ?= 2.57
+  RSVG_CONVERT_PDFFMT_VER := 2.57
+  RSVG_CONVERT_ACCEPTABLE_VER := 2.52
   RSVG_CONVERT_GOOD := $(shell echo $(RSVG_CONVERT_VER_MINOR) $(RSVG_CONVERT_GOOD_VER) | awk '{if ($$1 >= $$2) print 1;}')
+  RSVG_CONVERT_ACCEPTABLE := $(shell echo $(RSVG_CONVERT_VER_MINOR) $(RSVG_CONVERT_ACCEPTABLE_VER) | awk '{if ($$1 == $$2) print 1;}')
+  ifeq ($(RSVG_CONVERT_ACCEPTABLE),1)
+    RSVG_CONVERT_GOOD := 1
+  endif
+  RSVG_CONVERT_PDFFMT := $(shell echo $(RSVG_CONVERT_VER_MINOR) $(RSVG_CONVERT_PDFFMT_VER) | awk '{if ($$1 >= $$2) print 1;}')
   ifeq ($(RSVG_CONVERT_GOOD),1)
     SVG_PDF_CONVERTER = (rsvg-convert v$(RSVG_CONVERT_VER))
   else
     SVG_PDF_CONVERTER = (inkscape)
   endif
+  ifeq ($(RSVG_CONVERT_PDFFMT),1)
+    RSVG_FMT_OPT := --format=pdf1.5
+  else
+    RSVG_FMT_OPT := --format=pdf
+  endif
 else
   SVG_PDF_CONVERTER = (inkscape)
 endif
@@ -503,7 +515,7 @@ ifeq ($(RECOMMEND_LIBERATIONMONO),1)
 endif
 
 ifeq ($(RSVG_CONVERT_GOOD),1)
-	@cat $<i | rsvg-convert --format=pdf1.5 > $@
+	@cat $<i | rsvg-convert $(RSVG_FMT_OPT) > $@
 else
   ifeq ($(INKSCAPE_ONE),0)
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
-- 
2.34.1


