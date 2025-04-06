Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96AF176ADB
	for <perfbook@vger.kernel.org>; Sun,  6 Apr 2025 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743935465; cv=none; b=l4Ro+Jl823AHgKYXDEwU88+X0zOYEfKHyaMNe6koU0Yh3+BKFFncK1MKMK4fjJo3L80hNW4yMFSb8VQWeksE+hf2MibYnnWgN/edGnSTcjwvj7HJrcj57qA3x1SrijKy5kpTA4ukMFFooSDXHFzG9WJV0wSwCseD4ZFw8xRXn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743935465; c=relaxed/simple;
	bh=k5ps/rRBX682F+zo6uPejZvJeRQz4xs5L36Z1l6zjyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCynaYqK6K0zV+iFx4pgMQFKU1Xr3Gv52rPqJ3kgBTZvDg7lxtzeE1n3nPUKWP1SqA7ck0T3087lg3T8mQz1QhKc6bThd4ibiaJIu+Mct8iV/BTA7e2JzfciZOG4HVZbL75c7Dh8BsaZxk4iAcwyGlK/PdWjjcxZinNYlJNHE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clNCeJoL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clNCeJoL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227b828de00so32466555ad.1
        for <perfbook@vger.kernel.org>; Sun, 06 Apr 2025 03:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743935463; x=1744540263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/5dduKKGQl0J2pHf/zraXYowNSetNnEqafLOECIjhY=;
        b=clNCeJoLth7Vj2RGrnNjxeKPStKA6nSudf3bK93w8a8rZ3eRU4lD1WlC0c/hipqFhV
         V8MEavfCZR2umSmybRvs2289mT0fK/eKSR8vn8FdADIMLFkpvM+U42Hoy2LKIG8rRrFp
         Uy3pozZHyvrFYLdTR7omSvTn9tN26kZyyvhE4miTMHG6Qg6TjDmegAHY4JzVV0L88Aoi
         37c89GNWEz1lJ9PltnOCPQqJzH9MlujXvme1zbgnSDPt5BcA/FFll6f5ELruU/oXFUDy
         6eONKnAzuJ53U+pZlzbtgoNrisgHPRKGEaIj8GbIoDfZ6Dvoqc4hXamb9unL5TPhjQcv
         cXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743935463; x=1744540263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/5dduKKGQl0J2pHf/zraXYowNSetNnEqafLOECIjhY=;
        b=W0zfFyKIczFtv8aWukLHmr8ah0kGLMOrsbqavtgGwElX3oQdkfzpcevlF9iKL8oo0+
         gah3JHKn1BdmBm3L+y3fBm3kc7zLJ9kI/UA4kzKtXcIbD+cbhj5noWLVUN7BaeNSjdV8
         KyOlX+Q63vpp2W88aujwn5O6/TuU8tR1E+doK1OVicb0EirSgRhfPr/exvPQU83STJXl
         UuhxQOJEmF9aOg8IYPfqW4wIOhgXCsljyGSYkOoR2kgfTJ/K7IMHl8iHHc7viOvQFFCA
         WKn4b0p1RFCg+ScBOD30qt/D5mkMsNwXb8tm8gYrIzaz7wnVwwLfbolxmsGvdaMatCQx
         Tlow==
X-Gm-Message-State: AOJu0Yy4oqJf4T1QlFHXLssqcF9dLxMU6h3s543KKWmnRPxUo4veUML+
	rvUvIyu868VMh3+2pXOJw3TalRPQBotSwClrMtuISQHfH3Gi6lvN
X-Gm-Gg: ASbGncutuHowUARDPMwmVCvPbOieRhgEqiLztDmpEO+fZ7gEhgem0UJ3Z4nqnFMaEm6
	BIXX1qaF0aLPUp1+YLrkNOvDjnFl0RcwnSJfk9LkRL9pctSp+liYHBcc5n0oPtQFgU/iDOZJio6
	ovP3vQtyr5sG0ejZK9Wq8Y+t8MmBnl881AI2s1APYkbmiqwB7KGBmSkgF9cVbh3Z6a5+E7ZQH/n
	xjjCqHRa2d21dDHbAyV5qjWNTV/CHYanXEK9Ruw2oWjP3/Huv1TF7NfFhxG4n1UqIQU2KH4x0Rb
	RRSvVDm60VWEfs1QCSF4gJocr5qegkGA3ifPXxd0olk7vd0aWFtEmClxikW23qflH+nYbVqhokJ
	DFjCcoCnh+RA6Ogk=
X-Google-Smtp-Source: AGHT+IGYjis4aI1t1F/LLZ2rySTIagD157PG5Qj32sGXk8T3gdVX2nTx8t0KfI4T9FIMXGB84nbNlw==
X-Received: by 2002:a17:903:1b2c:b0:223:49cb:5eaa with SMTP id d9443c01a7336-22a95589a47mr84480155ad.35.1743935463042;
        Sun, 06 Apr 2025 03:31:03 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e483sm61876435ad.116.2025.04.06.03.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 03:31:02 -0700 (PDT)
Message-ID: <1a55c6a3-6b84-4fb7-a52f-41c51502dba7@gmail.com>
Date: Sun, 6 Apr 2025 19:31:00 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/3] memorder: Add index marker for "LKMM" as
 acronym
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5c50d42d..46261137 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -86,8 +86,8 @@ follows up with more detail on a few representative hardware platforms.
 	 {F. W. Nichol}
 
 This section is for people who would like to avoid learning all the
-details of the Linux-kernel memory model (LKMM), the better to get on with
-their concurrency lives.
+details of the Linux-kernel memory model (\IXacr{lkmm}), the better
+to get on with their concurrency lives.
 The good news is that learning a very small fraction of LKMM can get
 you most of its benefits.
 % @@@ \cref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
-- 
2.34.1


