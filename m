Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8660D2230F
	for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098816; cv=none; b=LoDTU5HpYOt75uX6YH7TuGrBB6Q9UxyTFHN3sFMYGhVq88IHyUa+SWoe+ypwnV7C6xTSiyLmZ/9C3QllSCIszyVf1uHNY9NgEYSNRHAztRWCSVdnj50HePlfIeSBOfdEKrUxhx5vKQRIs83v7MCFhFSnlNoMJSTyTmlRLOKIGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098816; c=relaxed/simple;
	bh=eykrhWgJTLmtbbZ27HJ4E20XOxASTRKIropLzyLWgk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2eFBFNnnmRByCJ5zZXhZC2R8JsLcHCqzmGO+dRjrihQPFUKONqApjvVxrJfzUVU0yVAhdXul78kYrErMQOFhVH8UlcDOHsGAGFFJaIs537UIjpl/N93D58HnqOA1EIymGNNixrV3BWcX1A111FORb/pcaziL9lNoDbGqcGXyFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvUb+8R0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvUb+8R0"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70255d5ddc7so784082b3a.3
        for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 02:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718098814; x=1718703614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGQgN8pUd+ci4Zg6XlcL8OkoxIxF7tbZZ6TFPUvxjGA=;
        b=hvUb+8R0EPLKW53qkokz6H+yIQwGKqgZKkuW6bK4bLt1tVkjgIokRR8tZo8pADx25k
         VX+sKN/4Q5IGGS9LtBsiXZxa79pZXqOyMgQlJEITKfBqLbKw1gZb9otWZorzoBajdOwm
         gY27Sd/xHHTfRqBKeN4cwYdNgyKU0EOvxYCjW1C0jKSW/9b7t7WCoCxbeJQ4mfyRqcUV
         Vx2U4W9mohcEC6gRr2ystH3yG3k2dJDkxiUcpa+mFxNt/VLq1NRYCqPOKEKNonWD+gHr
         7UlA9nGD6nA2w4zbqPpGYdlLIvv16cZL3Tnm1iEAQszeHMQtZSO4UzZ+NCq5UIs0BwV2
         6f3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098814; x=1718703614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGQgN8pUd+ci4Zg6XlcL8OkoxIxF7tbZZ6TFPUvxjGA=;
        b=umEXF8dgyp3tHZtV00OE14fPfKa5ePiQSEuXsNdRhVlLyVlvrgQ82tl8hD/r2/dBhA
         MQamp/e/C+jcnqvqCj6D0jP/EiUVc9kyiPl14wUuvsHiUUAzjf3FRh49rv6boO3F19Hx
         YHD/L0tA4QNPld8/8SMg54nKlwldhxOj2mzCSMv3LobY3R7we5NS0uoT8LbUrGn5o4g9
         B+L7+gTtfzCWYGV65+v5A77WFu0BqTB9/YEsnXCGF4QsSYkCvvAjmReyHSoKjiUjKgEA
         NG9L2MYY7OjofmlPjjaXxIzvVzNtYfWy5ovI2Gh+v3Cmtnppo9maoR+ge/7azXgdsKFB
         u70w==
X-Gm-Message-State: AOJu0Yw5KmroQVzZ3b6E9rTz57ZkcmZhJ/NPTEMioBH4ArpD+GPTioUP
	CEYF63Nxpbyd6sbCNu+czW+Og0EYqYVP8ChY1wgUmWoVXNTf7tw2
X-Google-Smtp-Source: AGHT+IHBNhQ5W4H9EjhSVYRvPH9PAZ1bs5HujM+b/Ow9hx+4g2ldpqHPZ8RkL0u8oQHIaaD4y8gpjQ==
X-Received: by 2002:a05:6a00:189b:b0:6f3:ea8a:f974 with SMTP id d2e1a72fcca58-7040c61950amr12059659b3a.1.1718098814493;
        Tue, 11 Jun 2024 02:40:14 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041bb50dd1sm6049439b3a.193.2024.06.11.02.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 02:40:14 -0700 (PDT)
Message-ID: <9fdb80f4-85b6-48ef-81b5-801cbf86d8c6@gmail.com>
Date: Tue, 11 Jun 2024 18:40:12 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook v2 2/3] Silence warning msg from LaTeX while loading
 parnotes package
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

LaTeX2e <2024-06-01> emits warning on loading parnotes.sty saying:

    LaTeX Warning: Command `\theparnotemark' already defined -- not changed on input line 54.

This looks like a harmless warning.
As perfbook's build scripts treat "LaTeX Warning" as build error,
silence it by enabling a filter for this particular message.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Unfortunately, parnotes doesn't have any maintainer assigned and it
is not clear if the issue can be taken care of soon.

---
 perfbook-lt.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index ad4463be..3c6fb9f3 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -79,6 +79,9 @@
 \usepackage[split,makeindex]{splitidx}
 \usepackage[nottoc]{tocbibind}
 \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in]{idxlayout}
+\RequirePackage[save]{silence}
+\WarningFilter[parnotes]{latex}{Command `\theparnotemark' already defined}
+\ActivateWarningFilters[parnotes]
 \usepackage{parnotes} % for footnotes in tabularx
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all,pdfusetitle]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
-- 
2.34.1


