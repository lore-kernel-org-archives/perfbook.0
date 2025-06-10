Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747521CC71
	for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552113; cv=none; b=mDB14OxTelndX0gAYOSIFb669u+vYs+nlUm12C8mGQsJI3x14NrVNbdAJs1gxTLHg6LAvLAjyYb/imR/j6NzbfoVX3K/3QcyL31z4VH8ngX30g8DIhxOJKSGbXOfAFGkQYwcdWbxMFsBkraHTuqm50Hg8MFMV64IzHBHxrFNfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552113; c=relaxed/simple;
	bh=+Zvo7XdrsYglsZ3qYGeaBQz0qAT/jlPTvgoYoZ+fEII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRMAZkPYWNV+LW4g1gTU+aT2FIWQfGWAjuxsxxyOTLgPpvaWgH0D6KuCZwnsgvQTeJP44BIXp4zEE31x6PKdUEsOvpQcmyOXvZaNUKyikGHQkRMIHcsu/XIF/Ae41zhr5J1/jMquq3hG+C2b8v/ohcZl41Zw0HLrMlEHJ9tQmH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c94PXkJG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c94PXkJG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23636167b30so7731955ad.1
        for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 03:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552111; x=1750156911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJ08vOfwDnOgiVJamMI5/lIu8Rtd7qtqHhk5HYj/OmQ=;
        b=c94PXkJGM86ZJd8HRGpTFgUq7f7lC82uxEvJpnBYZzrnj2cRJz58smKj64fi2i/dNy
         y1CxQEM2N53N1ssy+UatmdpL4f5KxaQwvfERyXKvwLwatBQOYuSva6wu8cVoybkV/dci
         dSV7OI8nm6L+IFLjBW6dgndWh+t1N2hXKXaaBycbLXBFuk3LrV20UPsBXPB1/Nxe/h55
         Q39I17jLn3tzfCBG1dEEb1+JOtKgeP25gQtaWXsNtSzsJ1qwdVI9t0zeWWYdMKWMgB3P
         CqEfCgkTRaCwq/h+ypFc4E06g6LqGbsRAMwv8+MGZIEDnHkUA2KDexOjt65b12LBR8Ge
         wgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552111; x=1750156911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJ08vOfwDnOgiVJamMI5/lIu8Rtd7qtqHhk5HYj/OmQ=;
        b=Pasg4c8W9qrkvsBxvNpEqRv9lVSSiqoBR1ycfzRFLyJBnvrkTcS8sOHnKF3hP3tixy
         h8jtooa3by+iFhcdQcsdTCMjRW2T55pNznHoJDlsp1BpdYernbrMEkYvHC/jbuf2qzWI
         mk4Gkb8ZNzP/NpzFaS1E9r0fLdWXEwRcpYHpiHDkcPT0UG+M/+1tNjsLvnUV/BtLcElT
         vfGvSQ4fCKdRxyB1rcpR3f5PB/BSdfmRiY6Ti5e+QEWzidOyN5xXAeJJ9AtS7uPyvL/8
         w+dhQEI/l/Wl+rCoxcIQCO5HlpFTtst30gqUXszByCMe8FrCEsdcLJZpettWFgbNKnym
         cdGw==
X-Gm-Message-State: AOJu0Ywr+OfCupGaB94OA6GGF66mprLbSmKlhYMLd8Jw1o2UYg3GglSy
	ZFwatvPD9QPvtftdg61C+3ZmUwF4IQqcE9cKyHNiFTVdzIioa9WJl0gmDxofEw==
X-Gm-Gg: ASbGncu5NrxP1Nwl63Ut/76kjjcpR3tnXchb5gW97HWissx/xL5h1DLyosOFpZI5zAm
	jytdEXNhEK0Oj21nNkNOS8Jp0jiOkU8lD5JjkWHzl4+BphkkXBifw8LXJTiPv2I5cnBnxVSVf/I
	9OO7Dp1BDs52zGfF1BF0A+ZUx8gIK3fCF+dRu7N91AGPhheR+I6teHttfijF8sVLthXY9/tmR7w
	nhJbxN9hz1Pa0X7btj7xm6G2B0VPqXAE+88NFn9m6gKrbnHYmTNiZE5ViEGTiRSbyBj0xR+V6jf
	VSkcKFoekRPkMGnjrWGE6XfTw1rK0382Dvdsv8KJqbxXUd4uX0tkPWH9CSXjIUMi+b+8Ikwl8Pq
	9a7e8W2qk5lqTvWWNXjc7byGiCoaoPpAPAbpdJlbJkR0=
X-Google-Smtp-Source: AGHT+IE21ZvC6O2CuqJE399Vcv4Hi8PcJ0JA4Q7qm/gHAuFCJJ9guwSFaYjn4gDTvCvFvrJuQ4QQUw==
X-Received: by 2002:a17:902:f551:b0:234:ed31:fc9b with SMTP id d9443c01a7336-23601d82d4bmr247108135ad.36.1749552110959;
        Tue, 10 Jun 2025 03:41:50 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603514acdsm68544635ad.254.2025.06.10.03.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:41:50 -0700 (PDT)
Message-ID: <077e0a2a-c1d4-495c-a50b-ff566fb123de@gmail.com>
Date: Tue, 10 Jun 2025 19:41:49 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/5] Makefile: Fall back to rsvg-convert if inkscape
 crashes
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Under Ubuntu 20.04, whose inkscape is version 0.92.5, conversion of
cpu/SimpleWrite.svg --> .pdf fails with a crashing message from inkscape,
"Error 134".

Ubuntu 20.04's rsvg-convert accepts the SVG and generates a good-looking
PDF from it.

Although using such an old rsvg-convert might end up in a poor looking
PDF, it is much better than ending up in a fatal build error.
Add fallback commands to run rsvg-convert in case of such crashes.

Add the same fallback to modern version of inkscape.  This can mitigate
potential instability of inkscape run as a CLI tool, similar to the one
commit f307e19f2be0 ("Prevent inkscape from interacting with desktop
manager") had worked around.

Rather than cluttering the recipe with additional ifdef's, define a
macro SVG_TO_PDF_COMMAND beforehand and use it in the recipe.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
I have no idea what's wrong in SimpleWrite.svg against the old inkscape
at the moment.

---
 Makefile | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 762df051..337f34aa 100644
--- a/Makefile
+++ b/Makefile
@@ -498,6 +498,19 @@ endif
 	    sh plot.sh && \
 	    cd ../../..
 
+ifdef RSVG_CONVERT
+  FALLBACK_RSVG_CONVERT = || (cat $<i | rsvg-convert $(RSVG_FMT_OPT) > $@ && echo "$< --> $(suffix $@) (fallback rsvg-convert)")
+endif
+ifeq ($(RSVG_CONVERT_GOOD),1)
+  SVG_TO_PDF_COMMAND = cat $<i | rsvg-convert $(RSVG_FMT_OPT) > $@
+else
+  ifeq ($(INKSCAPE_ONE),0)
+    SVG_TO_PDF_COMMAND = inkscape --export-pdf=$@ $<i > /dev/null 2>&1 $(FALLBACK_RSVG_CONVERT)
+  else
+    SVG_TO_PDF_COMMAND = $(ISOLATE_INKSCAPE) inkscape -o $@ $<i > /dev/null 2>&1 $(FALLBACK_RSVG_CONVERT)
+  endif
+endif
+
 $(PDFTARGETS_OF_SVG): $(FIXSVGFONTS)
 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 	@echo "$< --> $(suffix $@) $(SVG_PDF_CONVERTER)"
@@ -529,16 +542,7 @@ endif
 ifeq ($(RECOMMEND_LIBERATIONMONO),1)
 	$(info Nice-to-have font family 'Liberation Mono' not found. See #9 in FAQ-BUILD.txt)
 endif
-
-ifeq ($(RSVG_CONVERT_GOOD),1)
-	@cat $<i | rsvg-convert $(RSVG_FMT_OPT) > $@
-else
-  ifeq ($(INKSCAPE_ONE),0)
-	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
-  else
-	@$(ISOLATE_INKSCAPE) inkscape -o $@ $<i > /dev/null 2>&1
-  endif
-endif
+	@$(SVG_TO_PDF_COMMAND)
 	@rm -f $<i
 ifeq ($(chkpagegroup),on)
 ifndef QPDF
-- 
2.43.0


