Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525512E173E
	for <perfbook@vger.kernel.org>; Tue,  7 Oct 2025 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848754; cv=none; b=GHHoE23Rtay+u5Yfr8u6Hune6huffdwsodpCXku4dKCdGVPNjO36KpzK2RQ3PJfWlLAobAPWftvfgEl4WqZkASxzXIn5+DPC6cEa6IQlXX2SOImMADOiKpCSe2PodIYpXwZdCmlh120HgV9dRhp1JyfsETumzyiGEOQ0XQ6qVJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848754; c=relaxed/simple;
	bh=ikQDNDwfC5+FOWd9iGcjgtfLAeN+OU0BSIS0cbm03dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqCKoAO6tyANjZMf3eeD2UQh3JrOCnBkhMljLCuccfN7a1RUNjK+vk6voHcjzGVMVGhweJ4gQZuC/D7a5wuHTr12DqRZ63MxbBVz5zUfh9axFGRR2YTm1HdAbMrRfObbKKKalJFnkhWfgeYoNjzSiIVuO8P6DJTc0wkPgHSeglU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX5bCmon; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX5bCmon"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7800ff158d5so5384878b3a.1
        for <perfbook@vger.kernel.org>; Tue, 07 Oct 2025 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848753; x=1760453553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9av3L4u7p8ftSBn6Iisc92bfODLkHh7RX8kARsiagE0=;
        b=EX5bCmonES4JFM335NRXLirZDZPn7pxRjFptiX0leDVS8tFNeG2qk3mWySrqQwALyZ
         G98bdISjhhHGHSjl8bGqGDYlpbnWJYs+Ov+JUp5SR5irY/HfxDYxV72pd6Of4wJMdml0
         vTH2WLz/fMjbm1fFivELp9LvUZOiYPwzlCt29P/5rW9hpD+F10VLkhY7N6bk9KbpSYyD
         U9VQjUYkGDagGowgVN5GxSu2GeIH5We5FT2EyOCBIPFerH0Y2EswDOrQZYrbBE/85rpV
         A+vWTO4YNAlTGuuKvcPiexVR/FgWc0vooIG0zDk4qUhsDx8Dvro0e7dP2QDb5y7RH0Rk
         MljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848753; x=1760453553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9av3L4u7p8ftSBn6Iisc92bfODLkHh7RX8kARsiagE0=;
        b=LmlcnBIcmJP95cTUUFia6p9VR3mu8mDJpW17eXDxIuzfqEl2bpyoj635pzxMpiRqul
         UUdlbA2Rc0iuGGtZXiad1B7ex0QFKrino7X9qE3XCUG/yI/RR1kFchyzUEZc61OKz3I3
         MI9w6dCs5wOPFfob05FkGbjDagIgaGo4kgtrJstsNPIcVrDcYWLXU0wqYxXiHtMT6miH
         9luw/jQ2qSKuGF3zEOOvdZsKEFOOXskbiC10jYItlcCPIQvI/ff77ZRbb0hqEtUU+PbM
         OoEkRW14wSBZLqwJoFPvxPdurgs8m0UV+TdFwM/91qLpDgG6unrursAU+dKFKwgnhBvN
         tmeg==
X-Gm-Message-State: AOJu0YzC2c91DWfyF1J13WS+XhX+1TiYxBeqQRzU8wMDJIvgKHe1Z7QY
	p9Cn/Cf/LFNIC+ArGYBizsVUgyXfkYoTELuHArwqRdhX2Y+HBVKYZ5rqe3rrrA==
X-Gm-Gg: ASbGnct1xjG4ovZRubDHUt7KcAGSHtVOsZcPCSBNkFo4/0uCmAHucIgRF8wvgQApNLC
	EXcR5b1Eq3/HNZaPDXf2CPQIkO6EDyIUFbBdkp5mdufKgBzffszRizEFKuLrSYvQiRCind3JiyH
	Y7XpovwL/Oym+xUlqiIPLs28p4SYNAWJoc92ZdFMfuFRPXvbkrzNJH0BVt0diHTeE8gRpPhjIo2
	JoOSkGZ/u0jVMNx0IcZt4u0WvRX4jzZs2NX4NdOBGKRpmAdVuxfjAdRTl8tlz/PmNCa9edGsil0
	zSfl348Fz/09eE5m5oP7xQ4jet76yzvDeGM9icpRgDdkMoT9HdndDvR6OBO0mSr2Avlyh337hYY
	MR2P28thV09ak29l12hCAuIOcni6yhndMQ2Hp2troGqrT36fLemC/BfUln01ALZE5ALycAhozas
	J3s1DetLBidAcz8uKc
X-Google-Smtp-Source: AGHT+IESBQMUGz34bAz92PMJzU01sp+RgaeoOUq9Gbe9R+sv3JKUrGu55rlIu12yckxaZ09UhCKJeA==
X-Received: by 2002:a05:6a20:1611:b0:2c9:1323:f800 with SMTP id adf61e73a8af0-32b61dee09bmr16527521637.9.1759848752442;
        Tue, 07 Oct 2025 07:52:32 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053584sm15903747b3a.50.2025.10.07.07.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:52:32 -0700 (PDT)
Message-ID: <c4b330c5-6dcf-4203-9ede-2f2984735586@gmail.com>
Date: Tue, 7 Oct 2025 23:52:33 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/5] together/applyrcu: Use nbsp around one-letter
 variables in Section 13.5.9
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
 together/applyrcu.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 48eaa685..ff462a3b 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -900,8 +900,8 @@ this code emulates freeing by storing the value zero.
 	In this textbook example, no.
 
 	\begin{fcvref}[ln:formal:C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul:whole]
-	This is because \clnref{init:p} initialized pointer \co{p} to point to
-	variable \co{a}, so that this pointer will never be \co{NULL}.
+	This is because \clnref{init:p} initialized pointer~\co{p} to point to
+	variable~\co{a}, so that this pointer will never be \co{NULL}.
 	However, this is a very good question to ask because in most
 	production-quality code, a \co{NULL} check would indeed be
 	necessary.
@@ -922,7 +922,7 @@ Running this example
 through \co{herd}
 (see \cref{sec:formal:Axiomatic Approaches})
 verifies that this algorithm avoid use-after-free errors (\clnref{ex:1}) and that it
-emulates freeing of all but one of the objects \co{a}, \co{b}, and \co{c}
+emulates freeing of all but one of the objects~\co{a}, \co{b}, and~\co{c}
 (\clnref{ex:2}), thus also avoiding memory leaks.
 \end{fcvref}
 
-- 
2.43.0


