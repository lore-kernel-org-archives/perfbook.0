Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D60224B4C
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkhG8qts"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bbc755167fso985462b6e.0
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704448547; x=1705053347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZ1deVaW3I8RSF4465Kfvm0p0EuQFyu3sgEXp7cplNo=;
        b=fkhG8qtsUQpYT8eSOdPgI1wi7kzLxb86ziZn5Swomk0QU74C5cRU4A/KYQYYpuIntY
         UQBM7Lv3VgY15fm/vND/4kw6yvolXiflAF9Ehq8c791YfLiOtfNlPoFYSvFLZ1qUTFkN
         Zeq45PEEejRkGwYmwzqn6a0Z7sqbtMmSZjJ4kFO1wYHgPPYE7PwUYk621aZq9VqZNQtx
         HH1auLeab4bvL2W5UQcxoFcCO4OkPmOOolrH2ZXj+ukPgeNOc6J3OW7mxrw/M8dk+ECW
         HkKCCPfrQuxruamcVyrj2STbyq9AgPAXRRSZg7js2FmNbBLz8W9W4iYOT6W1lmex/kP+
         cKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448547; x=1705053347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ1deVaW3I8RSF4465Kfvm0p0EuQFyu3sgEXp7cplNo=;
        b=Lch5rTElnPgypiC28Ua7bNR+u1maJUsOrF/Nfgsp2zBo1J9L67gm4vdQLq3qwHuKnG
         pTUV1bEKXWnc29njNqxgkis3+61JPlxsDCzUrre5UpMaXyO6zkQNkyX79Wa0TgSsMTRv
         1pPtpSI7f7j9Ut2UkGQO+0s3RXOU9S2zsHic9Zzs+vvu2lZAPwIrqXmlO2KqV5vETn2b
         3izMpnSYOkotS2UrIqoFbSW2CCbjOCExSN2YNVexVEE16ecmny+Py8VwAem6ezKBcr+W
         XupOKAQ6Ag0RlIaQpV2qZmIy2KqS35VOZ2SZ8AztF1jt2opsIWE5mLnDYXfVYIyRIDv/
         zNKA==
X-Gm-Message-State: AOJu0YyW9DoNN1e4yA6DOn41jRJE+u/kIdDYzJHvbh/Ix1FkD4sLCeyb
	9gV9QClB36KKmAxIFSMicUzc56VFOAc=
X-Google-Smtp-Source: AGHT+IE8hdQRzuLBMak96JT17HtiASCMm3FZH/fBS1vYtwuRnUlON8qYyALpChxBBqEPMxcV8GqBEA==
X-Received: by 2002:a05:6808:1449:b0:3ba:57:1a0b with SMTP id x9-20020a056808144900b003ba00571a0bmr2161509oiv.7.1704448547114;
        Fri, 05 Jan 2024 01:55:47 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b006da24e7c16dsm1029605pfn.186.2024.01.05.01.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:55:46 -0800 (PST)
Message-ID: <3f623b32-edf0-43b8-96ee-ba3bfbe78b84@gmail.com>
Date: Fri, 5 Jan 2024 18:55:46 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 6/8] FAQ-BUILD: List package for rsvg-convert in
 package lists
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Instead of inkscape, name package for rsvg-convert.  Unfortunately,
the package name varies wildly among distros.

Adjust surrounding text accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index e9719a60..e86dffb7 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -40,11 +40,13 @@
 		Alternatively, you can use the container image described
 		in #13 below.  Otherwise, instructions follow.
 
-		On Ubuntu Focal and later, the following list should cover
+		On Ubuntu jammy and later, the following list should cover
 		necessary packages (except for -doc packages):
 			texlive-publishers texlive-pstricks
 			texlive-science texlive-fonts-extra
-			xfig inkscape graphviz
+			xfig librsvg2-bin graphviz
+
+		On Ubuntu focal, install inkscape instead of librsvg2-bin.
 
 		On Fedora, installing the following set of packages
 		suffices:
@@ -53,7 +55,7 @@
 			texlive-collection-latexextra
 			texlive-collection-fontsextra
 			texlive-collection-fontutils
-			transfig graphviz inkscape
+			transfig graphviz librsvg2-tools
 
 		On other Linux distributions such as RHEL/CentOS and
 		Scientific Linux, where support of TeX Live packages
@@ -70,7 +72,20 @@
 
 		Besides TeX Live, you need the following list of
 		packages:
-			fig2dev (or transfig) graphviz inkscape
+			fig2dev (or transfig) graphviz librsvg2-tools
+			(or librsvg2-bin, rsvg-convert, etc.)
+
+	    Note: For building on Git repo prior to January 2024,  you need
+		inkscape as well.
+
+		Preferred SVG --> PDF converter is rsvg-convert >= v2.57.
+		rsvg-convert v2.52 should also suffice.  If there is
+		no inkscape installed, any version of rsvg-convert is
+		used for the conversion, albeit there can be poor looking
+		figures in the end.
+		You can continue building perfbook without rsvg-convert
+		if you have inkscape, that is, as long as command-line
+		mode inkscape works reliably...
 
 6.	I cannot build perfbook, and the perfbook.log file complains
 	about some obscure package being missing.  What do I do?
-- 
2.34.1


