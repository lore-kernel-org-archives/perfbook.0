Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864A18B1A
	for <perfbook@vger.kernel.org>; Thu, 29 Aug 2024 02:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724896863; cv=none; b=c260etglzfU7Cbrh2VA0h4K862fOfZQIOx6J7cpk2HNXRRPNkS+DU72xkwQNG4WJrZ63cUYc+PxSxRGarGOH3pzpuRn5a73gf9SE61lLVkU/gjQ/3oGBRcyw8TdFegbDHK7drYH4+Q4DBF1txH3IB3WQyjINXOsgxKjrjwNuOAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724896863; c=relaxed/simple;
	bh=dRhHeEZwT3wMY9KUSlSfGqzgo4xmoZ0qjeKd8L0UNIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWYducxfz6W/qOZUIX41LmQut0IaxJaiXwqxr4S4fot4ASWL10Xy/gs5lNXxq4bU+QaFltL0XIcf+czgjFwLGXNarhhQPe3UMXx6RqNFkO9PEUC2o8re1oy9fOgbhyXG99hzockzhnMCh2SDrdsY3QG5Arw1f7qrS85PltHvJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEmYoLK+; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEmYoLK+"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e7b121be30so57102a12.1
        for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 19:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724896862; x=1725501662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiYsF26tNZujtBNxkXzKYWTTbsY2VuW70hNnfVQLS9g=;
        b=ZEmYoLK+j9hAHdoGiKqaWPG1Y1YVdibPw7edt+8LaQ9/3Zyx55pThwvpq6M4UPDWUG
         DwSxY+QYziyNvgFwjtmLoQ38K+Gc4fKFTL69OEsdvU+qoGQ7PW4Zv80mKDZb+FfxnU5M
         w5NMzIUNylR/37g3RYhHMx7ZhUwWep6qrdWAhKiB80q7PQReMJCR8naED+RFnsVus5l6
         HvL68BMoqUERdYH1thaJ/9ZkVZS1bZo/mNjQXPuRHI9izPpqMp9nY6iC0cTInIH/41EV
         ktoioRQZGzV4fey52ZwECAY5XfmMaKYvU0Z2VJZDClETPmgrM/FtI5P49Hi1OAkzIXgJ
         MSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724896862; x=1725501662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiYsF26tNZujtBNxkXzKYWTTbsY2VuW70hNnfVQLS9g=;
        b=Pls/CpTJOer0IjMo/Jjv4bIkLvC7PddOa+swg64QkJXUNG9ot/I9Ba2xwXL10Rdpm5
         3zKDlqjbXstVvueJGS/le377so9HET9+2IJOyv2PYq+VI5CczA7ORiY2q1PDJryUutSu
         JvsckRwRbt0CLnuIMFAt1HAsu2DgHsgnEw3OlFXapvKjShfNfKMmcaH2LM3vOMmTcF3r
         GVWUrH85tWIFnvHKdtt/veDqXWRNXhDHnj2eQ6F1DJryrokIgoYlW5JtaKfducJ7ALL4
         y4V0EpXHewiHr6Il3+xvVpeX/d64zqTPzJ0JGROMHzs8/1ninm9WnZeC2925bY1krCRT
         1Uag==
X-Gm-Message-State: AOJu0YzdimJaSKlkCMvIMcvwvLGo/K0Deejybg6jXpsRqemDGn8yvYiu
	TtGxr5i75Xa7CKMnBv8S2WExnuGD2/owVO9d8keRG8fk6y2qAZhe
X-Google-Smtp-Source: AGHT+IGJpz9rYM+r7IXaA35uFAf7MYW19cie99y8Z8w+fSXrSqabeLmsDgOsKWwOo0k3cdGEAhVwJg==
X-Received: by 2002:a17:90a:be12:b0:2c9:635b:7271 with SMTP id 98e67ed59e1d1-2d8561e1f74mr1149224a91.21.1724896861641;
        Wed, 28 Aug 2024 19:01:01 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b13d2e9sm161440a91.24.2024.08.28.19.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 19:01:01 -0700 (PDT)
Message-ID: <f98fbd94-6c39-4c78-9bdd-9b8c8d21cefe@gmail.com>
Date: Thu, 29 Aug 2024 11:00:59 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/5] defer: Cite Valerie's KHB article
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/defer.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/defer/defer.tex b/defer/defer.tex
index 4a86b6cc..eefb1215 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -10,7 +10,8 @@ The strategy of deferring work goes back before the dawn of recorded
 history.
 It has occasionally been derided as procrastination or even as sheer laziness.
 However, in the last few decades workers have recognized this strategy's value
-in simplifying and streamlining parallel algorithms~\cite{Kung80,HMassalinPhD}.
+in simplifying and streamlining parallel algorithms~\cite{Kung80,
+HMassalinPhD,ValerieAurora2008Synthesis}.
 Believe it or not, ``laziness'' in parallel programming often outperforms and
 out-scales industriousness!
 These performance and scalability benefits stem from the fact that
-- 
2.34.1


