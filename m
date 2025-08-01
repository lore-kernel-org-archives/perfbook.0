Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2350C153598
	for <perfbook@vger.kernel.org>; Fri,  1 Aug 2025 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754048093; cv=none; b=AJkYDKkoK/bR4YHA5pWdyA5mmYm2iEga1IDsOVoZMdUqYfPMRyRm1cK7GIrXLp4JvBiCropaSmlcrVHQW3cFzP/0rVZ9S7RgzO3y1OPZRpTKdzBu5PoYZjoL/FVaAGbhcUwj5Onh85lwBP7zuyt9uDXnLfFaTdU0Z8lha1Aqysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754048093; c=relaxed/simple;
	bh=t+8FEXEOPgQ+8oYp7b0MzfEtwwe8n3HwqeEwb58xxx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFJev7WGYcMDhZmuhySIx/5g3ny/4p3f9FENI8fqZRN6FUMnZXQPj2hxU4pUC3UL9R0138h4NFIqS8fnlGG9SWTBLo2mTZ94Rr2rp1mlOSmUOZKXZQWvwM3dND7W1zlGpaV4Jj+ZS+EugFPUhQ5JpTcEBcb6L+r1ocrw4u1SrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtWq80p1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtWq80p1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bd202ef81so1885293b3a.3
        for <perfbook@vger.kernel.org>; Fri, 01 Aug 2025 04:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754048091; x=1754652891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IwGpm3vD2fSQP957D/pHVEPaOYYRdVYAgNbPPb/2u0=;
        b=MtWq80p1UAkFgd/cdZxlB97K31HztQ1YmO60Pt/ZasBWzMbZAnAQelN/uMbZc9YIET
         kYt1sO8SKOx8uMJ0onWLSvL6Phdr29vZZtOQr5uFlPhIUTOEH2OxdWvS0I7MaZCeRnW6
         D4FejCq2HIwKUg3VTR48uiiInC+mrObRW1tJq/wpuIun7e/Lot18/xi4tKstIcfnL4et
         FwRhr2DaUcCpNaUFkP0bY8soByfyQLrIeIkp9tAf3Ltw/va3SWTx9WOkxfzZwQWigp1z
         pGaaWPB6IxfckC7FZETCtrB8xiiCLdU7VV9nbg0JIQOQFHkOtpOhy/0xOgbr8Hfd/emf
         p2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754048091; x=1754652891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IwGpm3vD2fSQP957D/pHVEPaOYYRdVYAgNbPPb/2u0=;
        b=mZ9unPDzwjX7Az8V3wKCJ5BagJTI3MThaODA9Iqi83QrOb4xFWadqM19VrYJt5YWMG
         jjIKdJBh+L/E5n7MPPumIZZ1c5/aBuRPFPNmsu+h9d8NRTgjqOTsEwWF0lVbLfI9NSl9
         FZ/N7eCsnoC9CQrC+ue2/5ZByAMsCKiopUuLH+iZbcFMnSCZJ6yBotqWjDMUstv4cZpT
         vw+cbwEGjFz96bMqCo8QTp9Ci6kluSzURiT8A/Oe7AE7G/xWrPInDDTy+BObwwIeUv9o
         vI1wgpvwTwlqfjamJom45vSxLlARbskMz9pPlmVPtB7Ej/IKNuVM9YcDzmtcEpTqMkNw
         +93A==
X-Gm-Message-State: AOJu0Yx+q9cFnEKLO6P+/M0uFcZRHZQVt+kOzOJW+F+LCozE57AZCF8B
	/r0gTQsj6u7F1r7+JEGTeFHdTc8HYbQzNcfVNJlLKEdUXZP5Oc5GOMJB
X-Gm-Gg: ASbGncsOlaom8hSGjoc6FSuErjpkY/t+rSM1c1JRfvKDm9LkjAmOmnFkkVZ+GSUMS2S
	G3lcUqKmzdP/GA6YHDw4YyvokNcYir8/H5Cp8EiwyWbhYMLCSVYwwFZv8YKhVX7jFeoGxcn+zuy
	jXfuH/Ya94qjpyrMM88lidrtIuPRl4g4lROnnCKBUJbHBcwDCxZR/oPJE1Ajg95ZJ3Axrlw533T
	AolWLI5n9z3nxC0RITAZGqzDrpxDyG2NrLhISW7MLRVNq3IlonS47SEGPrTHqUSj3Jqw6G2ur6V
	S5mGAJlxi2kIDq2sem/0KdkL3puueKQomVF0uGIH6HOsMHrCm4wp7BlOntEig7rZcdTJwDeT66k
	ifegrh5+U7yGZSmBb/FAOTEcxEimvm0gPcfCFI2JydfY70sEHVcWxf5NdkjYCUtNCbG/J2LShIi
	/G26Y=
X-Google-Smtp-Source: AGHT+IHqgnwFuUvBdzJngBC4t01o6SJt34A+KqdzZhsPbS8LYEXVsgWXDlqqmpUnH55C84JMadeTTw==
X-Received: by 2002:a05:6a00:984:b0:76b:d96d:a9c9 with SMTP id d2e1a72fcca58-76bd96dace9mr5470354b3a.6.1754048091416;
        Fri, 01 Aug 2025 04:34:51 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccd45dffsm3950977b3a.0.2025.08.01.04.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 04:34:51 -0700 (PDT)
Message-ID: <ef37e063-f6b1-4979-ae13-4e2a7eb9b6ed@gmail.com>
Date: Fri, 1 Aug 2025 20:34:48 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] Apply "pdfcrop" to
 CodeSamples/formal/data/RCU-test-ratio.pdf
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <29fc47c4-7ad5-4ac8-98e8-0e6cd76988f2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <29fc47c4-7ad5-4ac8-98e8-0e6cd76988f2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

RCU-test-ratio.pdf has fairly wide side margins and Figure 12.4 does
not fully utilize available page width.
Crop the plot and include the resulting RCU-test-ratio-crop.pdf so
that it can enjoy wider width.

At the moment, it is the only plot generated on-the-fly, but the
same scheme can be applied in the future to similar plots.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile          | 14 ++++++++++----
 formal/formal.tex |  4 ++--
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 337f34aa..29d7c99f 100644
--- a/Makefile
+++ b/Makefile
@@ -58,6 +58,7 @@ SVG_GENERATED := CodeSamples/formal/data/RCU-test-ratio.svg
 SVGSOURCES := $(filter-out $(SVG_EMERGENCY) $(SVG_GENERATED),$(SVGSOURCES_ALL)) $(SVG_GENERATED)
 FAKE_EPS_FROM_SVG := $(SVGSOURCES:%.svg=%.eps)
 PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)
+PDFTARGETS_OF_SVG_CROP := CodeSamples/formal/data/RCU-test-ratio-crop.pdf
 
 OBSOLETE_FILES = extraction $(FAKE_EPS_FROM_SVG) CodeSamples/snippets.mk
 
@@ -298,8 +299,9 @@ endif
 	LATEX=$(LATEX) sh utilities/runfirstlatex.sh $(basename $@)
 
 autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(LST_SOURCES) \
-    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
-     $(GITREFSTAGS) utilities/autodate.sh
+    $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(PDFTARGETS_OF_SVG_CROP) \
+    $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
+    $(GITREFSTAGS) utilities/autodate.sh
 	sh utilities/autodate.sh
 
 perfbook_flat.tex: autodate.tex
@@ -498,6 +500,10 @@ endif
 	    sh plot.sh && \
 	    cd ../../..
 
+$(PDFTARGETS_OF_SVG_CROP): %-crop.pdf: %.pdf
+	@echo "Crop $< (pdfcrop)"
+	@pdfcrop $< $@ > /dev/null
+
 ifdef RSVG_CONVERT
   FALLBACK_RSVG_CONVERT = || (cat $<i | rsvg-convert $(RSVG_FMT_OPT) > $@ && echo "$< --> $(suffix $@) (fallback rsvg-convert)")
 endif
@@ -682,11 +688,11 @@ cleanfigs-eps:
 	rm -f $(PDFTARGETS_OF_EPS)
 
 cleanfigs-svg:
-	rm -f $(PDFTARGETS_OF_SVG) $(SVG_EMERGENCY) $(SVG_GENERATED)
+	rm -f $(PDFTARGETS_OF_SVG) $(SVG_EMERGENCY) $(SVG_GENERATED) $(PDFTARGETS_OF_SVG_CROP)
 
 cleanfigs: cleanfigs-eps cleanfigs-svg
 
-figs: $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
+figs: $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(PDFTARGETS_OF_SVG_CROP)
 
 punctcheck:
 	utilities/punctcheck.sh
diff --git a/formal/formal.tex b/formal/formal.tex
index 9a3b20dc..c54e1505 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -318,9 +318,9 @@ can help reduce the cost of finding and fixing any bugs located.
 \begin{figure}
 \centering
 \IfEbookSize{
-\resizebox{\onecolumntextwidth}{!}{\includegraphics{CodeSamples/formal/data/RCU-test-ratio.pdf}}
+\resizebox{\onecolumntextwidth}{!}{\includegraphics{CodeSamples/formal/data/RCU-test-ratio-crop.pdf}}
 }{
-\resizebox{4.5in}{!}{\includegraphics{CodeSamples/formal/data/RCU-test-ratio.pdf}}
+\resizebox{4.5in}{!}{\includegraphics{CodeSamples/formal/data/RCU-test-ratio-crop.pdf}}
 }
 \caption{Linux-Kernel RCU Test Code}
 \label{fig:formal:Linux-Kernel RCU Test Code}
-- 
2.43.0


