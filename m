Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360C43D517
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067906; cv=none; b=hoUQernSH3Ft8ig/3sTughvVCdagNypQYEG+A7zAzsWHUfvSrFWABdJiuvSguVXyZC8IovjGb+UtzGq7QA4cAxGENrfJwZC/FJRSIsThrxQfBNj4DvJWDml8JbjjoFX7o+5sKURut7zIE3PfsfFvZo7pqbHanLAEpeAQOTFh26g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067906; c=relaxed/simple;
	bh=uPISJrgcQw7/uhB6FJdlyL/oPHyAe7DFqXdIYHaPLsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqKVgbrzlIFP0jd8xW1MDrARknRmPunnDBXMgff+jw34iVCj9V9ceFqr+6Cn/RZWvxqdgNoAnC288gadRgfjS3wRGq0k/aeL39oBT9+YlR0H5UVpw1EZr6t7ZXywWciixXTg9tbXzp1usPqfbDDsmL0xvBuneQOuo4SavnegRVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qT0g+TIE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qT0g+TIE"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8367df48711so1569910b3a.1
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778067904; x=1778672704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrTI10+MwLUSSTN5f7vDHtcArrIgyttkBGn5j7zPXYY=;
        b=qT0g+TIEny+r6H29jWdIOVjORjlnnmhF4cHd8eSxIebl8Z2faw3YJNaFNUC0PYuMZt
         5NJpJ28y99GpWgu/xpjxUJOaDJpQ87gquZLvnAx/KQcvmvd7HfNBg7tP3NYDz+xtwes7
         16SP7dzFbG6talKctPKvgqtRnPliPFP8eRf2iV6CId2CU+zVuYZumR7CUpunrXceR9aM
         EvqpUk6gpBb4w5xRRO3q2Kc6Ob7iWV5ZzncwnTBWBgtWwnnz0v5WSGV384MLdEAd4MzH
         EuvJn+7SWVMPQhddBET0tpOfLQqtVSNN82C2LztDKZGqchR8Rpi1vlx3tUz7TsAxeC3F
         +8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067904; x=1778672704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrTI10+MwLUSSTN5f7vDHtcArrIgyttkBGn5j7zPXYY=;
        b=pJb/dfraNYCa4DUj0FayW+r33VuxRyWqp78X6i2PtHEEklTeXlMEVzvcREta3woZKR
         2txRoyINgOF4+kg1Hp5BAVLKY4lq0kgRZt2uGFMhwBYzzmjBfpoZOsW21jatP+y7u3ux
         S2qRz/LLS36vG7oE+1W1lX/3gPNcPmWTqdjSWqK3hdZDSSmNWMkizloTfpJAetk9a0IW
         klOPLCwaPAoTLKhUBU9IbetAPqGzBeSRCWxdcleOHfb6PkOQ7F1exlvZ71WsvtdNDiOL
         ynITK/yBGYXPPpbE1AuLOkJZtFlU9Kj4gm3r3XjnfhbCzYwpHB7xjHtCi5m0TScve91i
         sKPw==
X-Gm-Message-State: AOJu0YyJNV5e+usjjO/4ohJqtsjZfkLH1Jqq2kM/ATSk+CBMFKs8i5WV
	8yAglaQ7OsZBL4UTYXehILyKTrBmpdVrdKXKLCT919ect9eYhzLerchS6yqU9w==
X-Gm-Gg: AeBDiesfm6agy+jekLX4YfqzUEhMd60yjOYDTnqekX8LwJctKcR2CmQrdBZx2A7ww51
	lUGFDAxpR1ww00kvv9gJsTuXAD2dynSofS8SPgkxdmXYy9QeLKqXdzdynQixdqV/UeUl1y0BVPg
	d/+lPpRx/bfu8yw+sQP5c2zgEeHItdVDShHV1irjyxMBIOebUI4iSMDSHBHJrL0kmNTvLkVHloF
	bfAuXA5+oPFWDwnlZlTqBaVQFHF6UXTHW3xwXz6rK/PGs+5lCfMtIta2UD+ItrglxHgNfXLHm9A
	qt0l5aI3z8Hok+QrykJ8I0WqFhQFc313QWHO+mBggCs489yYfvGs+UUG6vF1ty6Uqh7mI5B60IZ
	BsPTL/vZ+ipdYPRuG9OnkgWI5m1+ciMhLOvJHi835Rccqfdd5Dw1C1Qm2HfB5Mv/HIyqIXdT29c
	46iB0Aq3iXNKbwF7A4CuARHj6FHK7pLKATSGUi6JeF3xAcNJSNc7azWrUPnzuUYZVQEbt5qhJC/
	y6MekM=
X-Received: by 2002:a05:6a21:338f:b0:395:7fb:9362 with SMTP id adf61e73a8af0-3aa5a90db5cmr3631606637.19.1778067904235;
        Wed, 06 May 2026 04:45:04 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242bb959bsm2091835a12.27.2026.05.06.04.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:45:03 -0700 (PDT)
Message-ID: <2e706ab3-e69b-4148-bf89-fbbcc0f2dfba@gmail.com>
Date: Wed, 6 May 2026 20:45:06 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 6/8] precheck-tentative.sh: Fail early with
 suggestions for Fedora 44
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Here is an example of aborting message you will see under Fedora 44 from
simple "make":

    #### array.sty requires a later release of LaTeX2e.     ####
    #### arary.sty requires LaTeX2e <2026-06-01>,           ####
    #### while your LaTeX2e is <2025-11-01>.                ####
    #### Check your TeX Live installation.  (Known issue under Fedora 44).
    #### 1st option is to downgrade array.sty to v2.6n.
    #### 2nd option is to install texlive-latex-base-dev and
    ####     say 'make LATEX=pdflatex-dev'.
    #### As a last resort, 'make WARNEXIT=0' would ignore such 'LaTeX Warning:'
    ####     messages and complete iteration of latex runs (if you are lucky).
    make: *** [Makefile:300: perfbook.aux] Error 1

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/precheck-tentative.sh | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/utilities/precheck-tentative.sh b/utilities/precheck-tentative.sh
index 8b53e02c..96d2fe2f 100755
--- a/utilities/precheck-tentative.sh
+++ b/utilities/precheck-tentative.sh
@@ -5,6 +5,8 @@
 #
 # Copyright (C) Akira Yokosawa, 2026
 
+: ${WARNEXIT:=1}
+
 KPSEWHICH=`command -v kpsewhich`
 
 if [ "$KPSEWHICH" != "" ] ; then
@@ -63,4 +65,42 @@ if [ "$hyperrefsince" = "$HYPERREF_SINCE" ] ; then  # older
     fi
 fi
 
+#### Tentative check of packaging inconsistency in Fedora 44 #############
+# latex-base vs array (provided in texlive-tools)
+
+latex_release_dev=`kpsewhich latex-dev/base/latexrelease.sty`
+
+if [ "$latex_release_dev" != "" ] ; then
+	latex_dev_ver=`grep -F -A1 -e '\edef\latexreleaseversion' $latex_release_dev | \
+	grep -F '{' | \
+	sed -E -e 's/[ ]+\{([0-9\-]+)\}/<\1>/' -e 's/\//\-/g'`
+fi
+
+array_sty=`kpsewhich array.sty`
+array_req_ver=`grep -F -e '\NeedsTeXFormat{LaTeX2e}' $array_sty | \
+	tail -n 1 | \
+	sed -e 's/\\\\NeedsTeXFormat{LaTeX2e}//' | \
+	sed -E -e 's/\[/</' -e 's/\]/>/' -e 's/\//\-/g'`
+
+if [ "$LATEX" != "pdflatex-dev" ] ; then
+    if [ "$array_req_ver" \> "$latex_ver" -a "$WARNEXIT" = "1" ] ; then
+	echo "#### array.sty requires a later release of LaTeX2e.     ####"
+	echo "#### arary.sty requires LaTeX2e $array_req_ver,           ####"
+	echo "#### while your LaTeX2e is $latex_ver.                ####"
+	echo "#### Check your TeX Live installation.  (Known issue under Fedora 44.)"
+	echo "#### 1st option is to downgrade array.sty to v2.6n."
+	echo "#### 2nd option is to install texlive-latex-base-dev and"
+	echo "####     say 'make LATEX=pdflatex-dev'."
+	echo "#### As a last resort, 'make WARNEXIT=0' would ignore such 'LaTeX Warning:'"
+	echo "####     messages and complete iteration of latex runs (if you are lucky)."
+	exit 1
+    fi
+else
+    if [ "$latex_dev_ver" = "" ] ; then
+	echo "#### LaTeX2e (-dev) is not found!                       ####"
+	echo "#### You need to install texlive-latex-base-dev.        ####"
+	exit 1
+    fi
+fi
+
 fi  #KPSEWHICH
-- 
2.43.0


