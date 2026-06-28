Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC124379C4A
	for <perfbook@vger.kernel.org>; Sun, 28 Jun 2026 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641435; cv=none; b=EdEZKxC+64W4Qm6lvEPilydovFw8XJp4aq6tTiYdukCxwjppygZbOqpxMs2zM/aEP5zXCEaWZR8lP8SwQei/7vgVh4B6OeJspXpumF0LjbwarOo6NcWe1sIHxHpSATKKjKHnL69DtHu1Ab9MGsCJlAXTj6AFX/CKNdp9GSo9Ur8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641435; c=relaxed/simple;
	bh=P6f8AvYTzoDCfwpHvqHTtV8Wmo1qOS8EUu7vjRPW1cU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=JphXV8r6E0PNpKBwX9Opmeu6tixt2KaSHzR4RdaZJoTIvO5IWl6cr6TMeWzU8gA9aUun4fLpMd8D4670Hy4Oks/JwT/kqlWg1wdszwfpYW4tlAQeM3kblCzK88ecf6K+CtCbOErcuKIsMr8L7j7SEwPhcUf3WCFU81Vdxw19sD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=parlxbnu; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="parlxbnu"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37d70036426so975183a91.3
        for <perfbook@vger.kernel.org>; Sun, 28 Jun 2026 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782641433; x=1783246233; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lzr/emqsfmZZgJyKEWQVkbrFG8F1TMl+BzAFB5GgDo=;
        b=parlxbnuIR47iFYLTfQixd/nN6eiXvRWcm3oNyYJCH0xBrYjWsyffX8ghhNAJZdkhi
         bKfOGSyEv3LttmLR3blmPrtjQcHadmwPEw1ABQIdcJEWsu8NiLzMR5zFHz12qtK6Wdxh
         NZzk6cCIzFVj64jdIjYu+PSAvQGMVarFPZU/HVCz+EIP9YakoASKdddWy5D+Cgo5BesI
         84rMYXA5f7L5ugIsvkoOOCmcD4oqzKn2YTGfULNecO6tfiZflddXCVGpxQiIoXc1rBFL
         c6y1R7tMX1NLPRM/C0J5yovi4CI2YwfqtUT9OMwjeqeeDf8+SuXXq6yMxSoJi50XN7+l
         BneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782641433; x=1783246233;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lzr/emqsfmZZgJyKEWQVkbrFG8F1TMl+BzAFB5GgDo=;
        b=IiYaFi0MX1loymJMWiH5/q05YKmct66xePJhPiJeyClIHfzP8XepEV3us3dfByl4eX
         Jzhbj4nKtCGBJ3nL9t9yRnoItYm8u50acNLZQKbU+CElOaFuXjl+C0dF88fY0i2G8eHS
         bAX1glRPXCnq6iPxl6RhfpeCUPLZQB7T9UPUrPj1CuyxGPxe4UqrZxk89pOcOan4fH93
         9VlYyFHFVhBGmul8581m2kTB7BBLHf7cv4Uv0qbN1vJ8EHh94qCMhkWlZtTtX7xHiUbr
         i86L5E5gUln9TnboVzauVzoycfpATiWnuG/+uEgved9PXiMT5qQ85C1d1yizGNXBa8gm
         EW+g==
X-Gm-Message-State: AOJu0Ywx/jwv6TGKVCVKUv55d81j+f/I+7T7Wa4zbAZ9MCczW9HumLuJ
	dmQcCTL7GxKJQg20Ph1K1bBymlOWA8BupyVjtqpwi/EytJSQTahll4Dz
X-Gm-Gg: AfdE7cnPguzPRuNx0TfxsOPT0wr0YsngIHd5SONE2i3EHbCJNkX0BkFVqZ1d4qN30cV
	vrkvqkjajZZKu7SmfdgKPKCcGJeBaKyzidf0TRPaFXFBFZcCSXBfKp9zbX57xXjImDfZ/c7Tnja
	k4Cv5A5m8ii7GLdyxMwpuFqU/VcBNcXce8cGDxDhgSMw7aPdRb0GnZKGLtqxWOROPE1fteuVzu1
	bM4NpXwy9PGzMV5CkOmaYD8Ch5+CJ9nz0jCz5oqN5hHEJCwU9+OW9lWAwIiDxBCzSO76XKRSNeK
	BOCLtw+fKZ/HZbwKte97q0WhgXdPsz/PO6GApmiDl8NHvtGqHfpdkf4imnKx4wyCOk6iNDLToZi
	7WanQOUAx9xaSICgGgtnKVXvLdGhbIu3vEXID37BdB7u6YnGrKzeuQv+/Tvi0iMysxmnpjLgKc5
	Er3RRaLeuibAptRbiOlIhZ22+S2qyyO9izN4t8iusPfixBawIFbkyDcQBeqQ==
X-Received: by 2002:a05:6a21:3102:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3bd4ae06973mr14289074637.28.1782641432912;
        Sun, 28 Jun 2026 03:10:32 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c97467552c0sm1026132a12.6.2026.06.28.03.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 03:10:32 -0700 (PDT)
Message-ID: <1c9d883c-fa79-44dd-ac4e-0278af17d0c9@gmail.com>
Date: Sun, 28 Jun 2026 19:10:31 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] toolsoftrade: Fix up conventions around
 VerbatimT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

After the convention introduced in commit b29ee7777f33 ("Redefine
line count format at the beginning of VerbatimT env"), redefine
\myfvline in front of \begin{VerbatimT}.

This restores custom form of line counts in Listing 4.14 such
as "A1", "B2", "C3", etc.

Remove \fvset{} which is now redundant as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index d83e55f2..08efff11 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1487,24 +1487,19 @@ A short answer to this question is ``they lived dangerously''.
 \begin{listing}[tb]
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
-\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xrightmargin=5pt}
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny A\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
 \begin{VerbatimT}
 ptr = global_ptr;
 if (ptr != NULL && ptr < high_address)
 	do_low(ptr);
 \end{VerbatimT}
-}
 Might be transformed to:
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny B\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
 \begin{VerbatimT}
 if (global_ptr != NULL &&
     global_ptr < high_address)
 	do_low(global_ptr);
 \end{VerbatimT}
-}
 The compiler assumes normal variables do not spontaneously change,
 the surrounding code  might use many machine registers, and this
 transformation reduces register pressure.
@@ -1513,14 +1508,12 @@ to \co{NULL} between lines~B1 and~B2 of the transformed code, the
 two comparisons will be against different variables, possibly passing
 \co{do_low} a \co{NULL} pointer.
 Prevent this by using \co{READ_ONCE()} as follows:
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny C\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
 \begin{VerbatimT}
 ptr = READ_ONCE(global_ptr);
 if (ptr != NULL && ptr < high_address)
 	do_low(ptr);
 \end{VerbatimT}
-}
 \end{adjustwidth}
 \caption{Living Dangerously Early 1990s Style}
 \label{lst:toolsoftrade:Living Dangerously Early 1990s Style}

base-commit: f7fdd691fd80b87b08719f1faad5059105712f37
-- 
2.43.0

