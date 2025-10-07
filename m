Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823F19755B
	for <perfbook@vger.kernel.org>; Tue,  7 Oct 2025 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759849112; cv=none; b=Te98uAc6fwOWe8Fqq4L181Qr+kl3gPWCikyn9aTOSOST7tc7Ln3uuJ1uP9s/guwLGVGkx1ozP77Py4rMEOvlt6DRgiV5RJ4fuWgTK6vkulkby/Spm5Qs040VpVMlafdWQ8x7MPmMOYHsr9Y035kBgPlUqqtr13uQD/HXYpqjcIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759849112; c=relaxed/simple;
	bh=xRfi6iCz4WZrpTA2PFHQ9bcdXLAINrmB1Jxow7l/OIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+qpgpPbnAmNiB5CsOdCMJ02BKmQMvv63Cvj6pqaSDE0aJXam1mnb7fZvwQD+QQBmIKFs+sRl2Lwa1FntQ2Nr+z62rNCsRK7YiUJ+R1RhPzWwZW8Yh7ozcXOm7x8lMRhB3picNDY60Zpwyc3V1Lwk6glvs63gXa37Yf/xaFx7zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLKc0ZIW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLKc0ZIW"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-781206cce18so5437672b3a.0
        for <perfbook@vger.kernel.org>; Tue, 07 Oct 2025 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759849110; x=1760453910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c67VBikr0PnUaOrkuM9D8XrpD5m9WBuXfiEXZwSQYeg=;
        b=NLKc0ZIW+HObFgkoMKBGN3gzYYGVfUjjfmeqGoYmaWHzKGvjbwyfZi1KZ5yRZndXd3
         +u1heGYDu/w5kmVVzvmQMM2K3rZ76MRxjEx0a63yxdN8IfZwpkgprYbVL7ose7rzR6WV
         wJbILYztTLeVRImjfAIK7LQWRXqqQbd9ROzEWu365tPhDh8PC71venqp9Cf93fUQ8/9O
         WNc11hC7+m+QR9rwg+RVlq2XyaGcnvlLNmCLM8HgWxgbMl9i4eqCM1dWUVuGbnCk+JjN
         rHB97RpaWwqzmiuCR4tqnvQfNA01P35r46vxLryiLbAl+s7CyaozoRUw9rh6M7PArXwe
         RVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759849110; x=1760453910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c67VBikr0PnUaOrkuM9D8XrpD5m9WBuXfiEXZwSQYeg=;
        b=iHF7BPzx4clAYuj+8f6S6fMEET1K8PWhzHUocKZ1FmgLX4lslTSLr5TBuAXU+Hpex5
         fhCXaGK5YiZKePtGR0305wtZVPE5mSM2U0m74snAONtdRNTqV1Q6OW+sQ4jDKROSu3/b
         tQhEBUZ1oova2Q+TyOU5UmIAmMxuqnrSgN1t7LXlkLhISgZRn/Y6ILPujvTw8MC2cWNZ
         wZLxhV26KGh1R9x3VTxSSkRM2UEwi0rLjO4u/BJCAXcff1JjhA3ZhJ3Mo2FD+vXl3qSn
         vDYO5CvQCKJHjl6MYe+q/H8wnHkOw7E2t0pg6hSQMJPOH5Z8LUKA1a9N9ocztxsbRtBH
         /IJg==
X-Gm-Message-State: AOJu0Yy0YJOhSs3VXgqYv+rRwkIr6E3Bm4uCKKcPA3TgxmRXafcwOJxs
	1oxj4m35oqAtHWg2nyRlc8Pir1gZ6Ho9TYqSomJMsKUCqXh5sd+o9r0L
X-Gm-Gg: ASbGncuTNE5/uue/KUaR5wlqbAZjHaEfpnjVkrYj4qHNNqJoDmtMn2sW0fkYDYrEPr6
	JZ5pw6gQJAsbRX5RmDN5Yf1votkkNgTpWiaQ8gV7nuCGNPT6IytTvTHEXZ2litNpketta8qPxEg
	yyyrkSAUE5dOBZZ33zuDs9KjzyMXUiFfrYOPpkuOcwhG1Xj6uq2WzdTwf+dcirIihTdRa4GUi94
	15IA3I6v8QuKATiummX4nBLPfM+6nVXhA1UVeRrLNv0cntOkrL08Fi5MLzLI50ac2aL/H7SRfKX
	TKK3HPbwjZTzVirXPTlyeJ9KlSWVpozHdNsafYaMFDb30Ky6oDwnpsumW88DJ5kX4+f/G0D30C5
	4luMxiS1Ehv29JIa/vEWXDPPt36XerZkTrq4ym7x2QRif3hsbyK2cPz6TByU8ahCGg+AsNDfmgP
	tzERnuR8LElWng5VSj
X-Google-Smtp-Source: AGHT+IGXWE4DIb4H4q0W8qPQR6aOk4kZbMT6mi+PfTBT33E69bGEk2t9KlRjVTw4R4/LMLsc8cQ4BQ==
X-Received: by 2002:a05:6a20:4305:b0:23d:45b2:8e3c with SMTP id adf61e73a8af0-32d96db7e9dmr4906873637.6.1759849109713;
        Tue, 07 Oct 2025 07:58:29 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0209005asm16329021b3a.81.2025.10.07.07.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:58:29 -0700 (PDT)
Message-ID: <f4e32dfd-4fba-47ab-8cf2-7c4d0dd006df@gmail.com>
Date: Tue, 7 Oct 2025 23:58:30 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/5] together/applyrcu: Use nbsp around one-letter
 variables in Section 13.5.10
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 together/applyrcu.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 455bf2a1..6004cb24 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -969,16 +969,16 @@ and transfer control to \clnref{unl:2}, which exits the RCU read-side critical
 section.
 \Clnref{init:a} initializes the element (abstracting away any required allocation),
 \clnref{xchg} atomically exchanges the pointer to this element with the global
-pointer \co{p}, returning the old value in \co{r1}.
+pointer~\co{p}, returning the old value in \co{r1}.
 If \clnref{if:2} determines that \co{r1} was non-\co{NULL}, then \clnref{sync}
 waits for any readers accessing the old element to finish and \clnref{free}
 emulates a \co{kfree()}.
-Either way, \co{r2} is set to the initial value of 1.
+Either way, \co{r2} is set to the initial value of~1.
 \end{fcvref}
 
 \begin{fcvref}[ln:formal:C-double-check-rcu-2:whole]
-\Clnrefrange{P1:b}{P1:e} operate in the same manner, but using element \co{b} instead
-of \co{a}.
+\Clnrefrange{P1:b}{P1:e} operate in the same manner, but using element~\co{b} instead
+of~\co{a}.
 
 \Clnref{loc} displays all variables to ease debugging of the litmus test.
 \Clnref{ex:1} verifies that both processes obtain an initialized value,
-- 
2.43.0


