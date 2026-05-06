Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478243D50C
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067612; cv=none; b=BHmftBsYItYH2m11ICh2rdyrEbjQ4cykmHv17phh9kk3VshJYLQqoai7REnuqqtHduReMAgyKvEbvoDzZVpfFziHULTKHAocqojTnKyVze+m4WqIafRv+SZv9b9tn+6U8GjWaW9GIWbEVEtMUpAAz3iSBPuSwxAWGaOMlKgSKgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067612; c=relaxed/simple;
	bh=WQR651K/Aj03BsA1wmGAz5/RTwuQIDyNo86ee5igRNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJ7VV67XhOTIkyQGx1aaVhxMZ2+HAEpN7+JCQPRnhsT9MtbnOeNJe8Ja5gyZjXvNSjoynwCaHEHpCoTnQVL9jhKj7EAFAjwhFYNBfn/AWPgEP5OBey6tomtrsOAMwqmD+QI/h7sYqmqIzk/bwXc2d/dvPhJ3OCDvm9IRrDDixKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCSaerMf; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCSaerMf"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so4513064b3a.3
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778067610; x=1778672410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCzk6+h3i7BAZ7kjxxGWzJ4vwDHeayHyHLxkTh9Yqqg=;
        b=MCSaerMfOVymLppPgYdjckkSun9VibEvmx6cgBoMtsHCzyK+gH9+bUoydhQDUcanpL
         bn+zS0af/SQdO1s7E4PswyuhFenV25apaPF87ZivBHSjhpUqTvxwW2kQUE4NSpkiL03b
         urIh5Ksy99TwMDiH5B66FTKrFnvI8VZBjnUZAe0rtCdi4/ws2oLZc/LD2hkAA7vaDeQU
         vhj7T1ICXeERDjnJmGWVbQ1N8AdiuE+I24Omiy198m1bvP1Amg8ngjMFnfg7OKGdGW6D
         +qG2IHUoU6Or8mKbJ/rTKejkGuXCOpwYdMPw6Bq0SGQptyPwf5x5hwraDpSTn1aTyGa4
         XM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067610; x=1778672410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCzk6+h3i7BAZ7kjxxGWzJ4vwDHeayHyHLxkTh9Yqqg=;
        b=m8WuAdTgdFjank3FQ4CNjlFGJuGUQ0HVr+bdkRDNGW3cawIg7IQA28IS8JzNutGaP1
         9+fK0+ks+mfULAMmDmP/W/5OEyF7Pu+Js6+sSXutX2k3l1jCT+xla6rQC+QHqhe+XWlA
         yivgXiHK623w2st7K3m1Sm5L8Yu29hbHvG2+5Li6Ln+2KjqyeXlayUg2ctJVyV14ooS3
         UMuH+PlSegN2baQMoBx0JrjXrtllG5S5toybENrUrDTqOO91YxoDgGRL0SECXcZzbxOR
         1xIQpnoLND5CFyiS7wmxDkpT84m2ADjFT3yigZMDd+F+Z2Bqi8jGl1xCVWheUQVRJ/ZY
         OVLA==
X-Gm-Message-State: AOJu0Yw+odogJqPJsSjsNf5sYAiwC101GzNmXAlVORFJLFYJ1J5LMgEJ
	bFfPBhsdAWCINoC7CYFR0Yx69gQKTT/UMYQzqYrqoGlN7kAr+pb/JL6j
X-Gm-Gg: AeBDietfDvU6oqV8Ctk+KH4nQO0pyM+7iS6df31hnUItGAoSyrNxSSalpybFtp59nsh
	c6NGgV+/RxyvwdkHxEf74351FX78dYkql5sbATtZcNlx8XhDhtsB5V6YUJ0ai/rgJjU2XS6uKgv
	r1OffUFs7d5JfaRzrkXiBa2tWQBahN6bllB7ydgfrya7DC3prqpS3nLrZDBzmv2Q0eTwjpdYfvv
	bmYXO3F0LCcTNe+qIj8Su2k7ZXUGPJ29QsgPR3HRoPZVp9m/QqOqEiEUGpt0PBwPWxQohpP9HbE
	1dWpRetuWYbuS5oETrZ9XPAoCOY6llTaJyw9Rcpo5nFE+7LD/7E5X/Whc6c6BcR8gyg0ZXOPY8Z
	/APSyiukuABx754i349LMn10pkxhbkYlSsrRlyn7OWIgMGlJoKPVHdXS7SqYXaqymHt/+YZOzMn
	IbRbml1Z26evv07nqcYfUg1hYwn7D/C+eBbrNWVDbP8R3e05gR4mkBWCZd5TF0PnV1XayJLq5BN
	4N0l6g=
X-Received: by 2002:a05:6a00:2386:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83a5e347c04mr3186770b3a.33.1778067610261;
        Wed, 06 May 2026 04:40:10 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f381sm6727527b3a.6.2026.05.06.04.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:40:09 -0700 (PDT)
Message-ID: <d39b0401-0c40-4a77-a4c4-1d0ff4bceff7@gmail.com>
Date: Wed, 6 May 2026 20:40:12 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/8] Apply hotfix for cleveref against recent
 LaTeX2e
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It turned out that cleveref has been suffering from (yet another)
compatibility issue against LaTeX2e since <2024-11-01> release.

As can be seen in the closing paragraph of Section 1.1 in CI-built
PDFs at:

     https://gitlab.com/linux-kernel/perfbook/-/artifacts

, chapters in Appendix are printed as "Section C" and "Section E",
rather than "Appendix C" and "Appendix E".

Apply a hotfix based on a suggestion from Ulrike Fischer [1].

Link: https://github.com/latex3/latex2e/issues/2049#issuecomment-4302720865 [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 fixcleveref.ltx | 12 ++++++++++++
 perfbook-lt.tex |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 fixcleveref.ltx

diff --git a/fixcleveref.ltx b/fixcleveref.ltx
new file mode 100644
index 00000000..76a2b591
--- /dev/null
+++ b/fixcleveref.ltx
@@ -0,0 +1,12 @@
+\makeatletter%
+ \providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}%
+\makeatother
+\IfFormatAtLeastTF{2024-11-01}{%
+  \AddToHook{cmd/appendix/before}{%
+    \crefalias{chapter}{appendix}%
+    \crefalias{section}{appendix}%
+    \crefalias{subsection}{appendix}%
+    \crefalias{subsubsection}{appendix}%
+    \crefalias{subsubsubsection}{appendix}%
+  }%
+}{}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 5509d455..4eec9b67 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -594,6 +594,8 @@
   \input{fixfvextra.ltx}
 }{}
 
+\input{fixcleveref.ltx}
+
 \begin{document}
 
 %%HTMLSKIP
-- 
2.43.0


