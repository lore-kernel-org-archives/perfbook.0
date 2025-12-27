Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F099F13DDAE
	for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766825336; cv=none; b=cNm1C3NSEjw44yyJX2r6IZ22nGUdFWfAFpVD7h9rKoiRjV3PqL+FEWpJe8nFB1WgAdX0EvTRBbfL5RU/l79lzKVQjAzdgxSMVn9SDrm1tuA/IdfnclC+Kq8e+Zub7O88zMVALihoYNRUiWOKfV2VX7n8R/dusXyeNTQZSlZHws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766825336; c=relaxed/simple;
	bh=g+O0VNa6l/08cZ1VkthxlXaGHnUMhaeudG2XmDyKwU8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZVy8R2ixdAd38omlwSuQzcLyf3j/4ngcKd+FY1z6Rj9bywmUIlb8DtCXLZLhwwQJqli5Fn3Ws8/Tnu7a6kP296sjVJR43jHJUBrthklWfrfx0dLgQWw++BiUDUXadD8ooRXpGdoMuKMwjSSVzFHZbLMTkc2F756mz8vmq888w6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjdFORWh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjdFORWh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso12332176b3a.2
        for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766825334; x=1767430134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1KnMI01aU6NqMSD5OtoGiUQNSnMUEqviTPG9D0XlGx8=;
        b=EjdFORWhHtRgIV6iP31B+VQb7pYoYJXazUKSuSGP+04+ILadXM122K5jN7g2OyJ6YR
         lyhQgzbnS3/ARdd3DDqPcQWVtRpZOVNdwEe/OpLkhgEFVG6fMV6uVAxJhavr1Fzy7hX3
         4+3NRQFGyxz8jWXit7bhadpkiMqzRu8eZnA8U/25kDRAal00yyh6AHSat3v/xL9pG9iX
         GDqWFZkh/NZxPood2I3W3ERAazZ8W08L2POXAZqB2NzAurLxdkqaIMQTNHrS+/Hi4p1M
         Xa5cZ368Elc0AW+0iz5UEEGntZzEQ17wVJePVp9GkW6gKGC6sVsk83p+dVGKlnPxqRkz
         w5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766825334; x=1767430134;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KnMI01aU6NqMSD5OtoGiUQNSnMUEqviTPG9D0XlGx8=;
        b=dswFKinXFW6lDujY+C8snZb38yihcyF8bE2vj9GyK0sAy4S0aDwCzcTUi4V3K4/jX5
         4faVfZefYDHXTum8O7rpSvjE/X9xZohf+0oTYhhdlLUCM95Uj2lTkK5MGRXpUZlG503E
         i3M6iGBibUQKiiHNI1lqEAbQ3FiQ5U6Fx3hFnD2ggI8tcDsYcW4JWL9qzLasgYLczbih
         ElSGpXcbAg0dVgur/PN5XMppjmF7JPrOysvYcFVjlmdghrywNtbVJw0iUjNUmtCrOvCX
         +zQvHpNJeQyqHuzKlCypBVrkAfnQAj26kS+Tqzumw1lKdRemgRGZR37X0za4lbe4SNE1
         USSQ==
X-Gm-Message-State: AOJu0Yw/5xyTNhXOYAMTPL130QxoESN9Y4Ww70GNxTafn+CRzgRI8SgP
	VhKcD91FRHSJ6N70sBzx13tbkss2u86XZV0xKPtVeZFJNs3r0OGMPRgGHLVl5A==
X-Gm-Gg: AY/fxX4f5jHQATJHb3YDjsAkyGDgfBv0gsy0PodN97mKsTzz8Gbx0Hz9xZu6U4LAcIn
	zF2Xb678d6hd7eJ9FfzG3fpI+efBNw5sK41AV5aK4d3CDLYpHsGfk4mly6XuDbFjrYoSO9rRU3Z
	4MoqUY2dWTseDPHTTjQgtXkDYBoGjFfeLRimCDOh3Ik2/qKZmYvKe4TfazqFw888kyzDmzoQFgD
	oqdC11rHXf60o8yZbpuOxfI1z01yQecX/T3EnWuorRkEWSS7G4XxOeusywQqNVcQQKOiFG/kYM0
	6rh95TovZTh6LFoGuNNNkGql+OF0bMoLVLgJPz30UnbSAPPkyG9YNq7BWnU34JsWGtY5lkeHu1c
	PkZtnkIyIvHGJ5ujM7fZUfIfgpS63m91kcaZF9L9nRmkcWJUcUC/C79tEQIW84waknYcsLovbQC
	KeJjpCFJjN6k59cfKS7ZLcDgZrmL7Ps2mmL6s2qVfGOgbCHCxUEh96mn3w
X-Google-Smtp-Source: AGHT+IH1ckgwFjebvHYeaAAFjdeUQfXpFVFVwDURFI3K8e+YyGUlvUWOmai86RAIJJipx4jMeQxQBA==
X-Received: by 2002:a05:6a00:1c95:b0:7ab:653a:ca0e with SMTP id d2e1a72fcca58-7ff64cd728cmr22936708b3a.23.1766825334361;
        Sat, 27 Dec 2025 00:48:54 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88c8f0sm24483037b3a.62.2025.12.27.00.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 00:48:53 -0800 (PST)
Message-ID: <4b2e1ddf-bf9e-4ee2-a305-d64227938632@gmail.com>
Date: Sat, 27 Dec 2025 17:48:52 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 3/5] Makefile: Let ghostscript access under /tmp
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Content-Language: en-US
In-Reply-To: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ubuntu 25.10 has got an AppArmor policy for gs (ghostscript) which
prevents its accesses to files outside of $HOME/:

    [in /etc/apparmoer.d/gs]
    # allow access to files with selected extensions under HOME
    owner file rw @{HOME}/**.@{gs_file_ext},

This change has resulted in build errors under Git repos not under
$HOME/ [1].

As a workaround, tweak recipes involving ghostscript so that their
input/output files are under /tmp, where rw accesses are allowed by
a policy included from abstructions/user-tmp.

Link [1]: https://askubuntu.com/questions/1560219/ghostscript-unable-to-write-to-non-boot-volume-after-update-to-25-10
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile         |  5 ++++-
 a2ping-rule.mk   | 40 +++++++++++++++++++++++++++++++---------
 epstopdf-rule.mk | 48 ++++++++++++++++++++++++++++++++++++------------
 3 files changed, 71 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index 1e63c0b5..a72b4794 100644
--- a/Makefile
+++ b/Makefile
@@ -503,7 +503,10 @@ endif
 
 $(PDFTARGETS_OF_SVG_CROP): %-crop.pdf: %.pdf
 	@echo "Crop $< (pdfcrop)"
-	@pdfcrop $< $@ > /dev/null
+	@TMP=`mktemp -d` && cp $< $$TMP/$(notdir $<) && \
+	    pdfcrop $$TMP/$(notdir $<) $$TMP/$(notdir $@) > /dev/null && \
+	    mv -f $$TMP/$(notdir $@) $@ && \
+	    rm -rf $$TMP/
 
 ifdef RSVG_CONVERT
   FALLBACK_RSVG_CONVERT = || (cat $<i | rsvg-convert $(RSVG_FMT_OPT) > $@ && echo "$< --> $(suffix $@) (fallback rsvg-convert)")
diff --git a/a2ping-rule.mk b/a2ping-rule.mk
index 62de9704..da20488e 100644
--- a/a2ping-rule.mk
+++ b/a2ping-rule.mk
@@ -38,10 +38,14 @@ endif
 ifeq ($(A2PING_GSCNFL),1)
 	$(error You need to update a2ping. See #7 in FAQ-BUILD.txt)
 endif
-	@cp $< $<i
-	@sh $(FIXANEPSFONTS) $<i
-	@a2ping --below --hires --bboxfrom=compute-gs $<i $@ > /dev/null 2>&1
-	@rm -f $<i
+	@TMP=`mktemp -d` && \
+	    TMP1=$$TMP/$(notdir $<i) && \
+	    TMPDST=$$TMP/$(notdir $@) && \
+	    cp $< $$TMP1 && \
+	    sh $(FIXANEPSFONTS) $$TMP1 && \
+	    a2ping --below --hires --bboxfrom=compute-gs $$TMP1 $$TMPDST > /dev/null 2>&1 && \
+	    mv -f $$TMPDST $@ && \
+	    rm -rf $$TMP
 
 $(PDFTARGETS_OF_TEX): %.pdf: %.eps
 	@echo "$< --> $(suffix $@) (by a2ping)"
@@ -52,11 +56,23 @@ ifeq ($(A2PING_GSCNFL),1)
 	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
 endif
 ifeq ($(A2PING_GSCNFL),2)
-	@a2ping --below --gsextra=-dALLOWPSTRANSPARENCY $< $(basename $@)__.pdf > /dev/null 2>&1
-	@pdfcrop --hires $(basename $@)__.pdf $@ > /dev/null
-	@rm -f $(basename $@)__.pdf
+	@TMP=`mktemp -d` && \
+	    TMPSRC=$$TMP/$(notdir $<) && \
+	    TMP1=$$TMP/$(notdir $(basename $@)__.pdf) && \
+	    TMPDST=$$TMP/$(notdir $@) && \
+	    cp $< $$TMPSRC && \
+	    a2ping --below --gsextra=-dALLOWPSTRANSPARENCY $$TMPSRC $$TMP1 > /dev/null 2>&1 && \
+	    pdfcrop --hires $$TMP1 $$TMPDST > /dev/null && \
+	    mv -f $$TMPDST $@ && \
+	    rm -rf $$TMP
 else
-	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
+	@TMP=`mktemp -d` && \
+	    TMPSRC=$$TMP/$(notdir $<) && \
+	    TMPDST=$$TMP/$(notdir $@) && \
+	    cp $< $$TMPSRC && \
+	    a2ping --below --hires --bboxfrom=compute-gs $$TMPSRC $$TMPDST > /dev/null 2>&1 && \
+	    mv -f $$TMPDST $@ && \
+	    rm -rf $$TMP
 endif
 
 $(PDFTARGETS_OF_EPSORIG_NOFIXFONTS) $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
@@ -67,4 +83,10 @@ endif
 ifeq ($(A2PING_GSCNFL),1)
 	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
 endif
-	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
+	@TMP=`mktemp -d` && \
+	    TMPSRC=$$TMP/$(notdir $<) && \
+	    TMPDST=$$TMP/$(notdir $@) && \
+	    cp $< $$TMPSRC && \
+	    a2ping --below --hires --bboxfrom=compute-gs $$TMPSRC $$TMPDST > /dev/null 2>&1 && \
+	    mv -f $$TMPDST $@ && \
+	    rm -rf $$TMP
diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
index ea0ff791..56261259 100644
--- a/epstopdf-rule.mk
+++ b/epstopdf-rule.mk
@@ -14,10 +14,15 @@ $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): %.pdf: %.eps
 ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
 endif
-	@sh $(FIXFONTS) < $< > $(basename $<)__.eps
-	@eps2eps $(basename $<)__.eps $(basename $<)___.eps
-	@epstopdf $(GS_OPT) $(basename $<)___.eps $@
-	@rm -f $(basename $<)__.eps $(basename $<)___.eps
+	@TMP=`mktemp -d` && \
+	    TMP1=$$TMP/$(notdir $(basename $<)__.eps) && \
+	    TMP2=$$TMP/$(notdir $(basename $<)___.eps) && \
+	    TMPDST=$$TMP/$(notdir $@) && \
+	    sh $(FIXFONTS) < $< > $$TMP1 && \
+	    eps2eps $$TMP1 $$TMP2 && \
+	    epstopdf $(GS_OPT) $$TMP2 $$TMPDST && \
+	    mv -f $$TMPDST $@ && \
+	    rm -rf $$TMP
 
 $(PDFTARGETS_OF_TEX): %.pdf: %.eps
 	@echo "$< --> $(suffix $@)"
@@ -25,19 +30,38 @@ ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
 endif
 ifeq ($(GS_953_OR_LATER),1)
-	@eps2eps -dALLOWPSTRANSPARENCY $< $(basename $<)__.eps
-	@epstopdf --gsopt=-dALLOWPSTRANSPARENCY $(GS_OPT) $(basename $<)__.eps $@
+	@TMP=`mktemp -d` && \
+	    TMPSRC=$$TMP/$(notdir $<) && \
+	    TMP1=$$TMP/$(notdir $(basename $<)__.eps) && \
+	    TMPDST=$$TMP/$(notdir $@) && \
+	    cp $< $$TMPSRC && \
+	    eps2eps -dALLOWPSTRANSPARENCY $$TMPSRC $$TMP1 && \
+	    epstopdf --gsopt=-dALLOWPSTRANSPARENCY $(GS_OPT) $$TMP1 $$TMPDST && \
+	    mv -f $$TMPDST $@ && \
+	    rm -rf $$TMP
 else
-	@eps2eps -dNOSAFER $< $(basename $<)__.eps
-	@epstopdf --nosafer $(GS_OPT) $(basename $<)__.eps $@
+	@TMP=`mktemp -d` && \
+	    TMPSRC=$$TMP/$(notdir $<) && \
+	    TMP1=$$TMP/$(notdir $(basename $<)__.eps) && \
+	    TMPDST=$$TMP/$(notdir $@) && \
+	    cp $< $$TMPSRC && \
+	    eps2eps -dNOSAFER $$TMPSRC $$TMP1 && \
+	    epstopdf --nosafer $(GS_OPT) $$TMP1 $$TMPDST && \
+	    mv -f $$TMPDST $@ && \
+	    rm -rf $$TMP
 endif
-	@rm -f $(basename $<)__.eps
 
 $(PDFTARGETS_OF_EPSORIG_NOFIXFONTS) $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
 	@echo "$< --> $(suffix $@)"
 ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
 endif
-	@eps2eps $< $(basename $<)__.eps
-	@epstopdf $(GS_OPT) $(basename $<)__.eps $@
-	@rm -f $(basename $<)__.eps
+	@TMP=`mktemp -d` && \
+	    TMPSRC=$$TMP/$(notdir $<) && \
+	    TMP1=$$TMP/$(notdir $(basename $<)__.eps) && \
+	    TMPDST=$$TMP/$(notdir $@) && \
+	    cp $< $$TMPSRC && \
+	    eps2eps $$TMPSRC $$TMP1 && \
+	    epstopdf $(GS_OPT) $$TMP1 $$TMPDST && \
+	    mv -f $$TMPDST $@ && \
+	    rm -rf $$TMP
-- 
2.43.0


