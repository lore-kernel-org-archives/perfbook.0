Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454093B187
	for <perfbook@vger.kernel.org>; Thu, 11 Jan 2024 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lg19+YT4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d40eec5e12so43669895ad.1
        for <perfbook@vger.kernel.org>; Thu, 11 Jan 2024 06:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704981875; x=1705586675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzP+XqZIEu/FCU5HTQRXG79wGVNN7QX/lRoeuEGtzLo=;
        b=lg19+YT4GwAY4KyMD8e1VEOOkLwxtdTy0Ah/2kYyWWRa1wj7t5/Sfxc759mkI31kcz
         4N5gTGLMzTyGswQb85A3ffrO/1ntN3tkiHGfWkE2ecQ3Hy5Fi1p44+fEOICtPpOTJEe6
         n63sC90BA2jcbJkBDIJ411Wg5UY2EGvYYeV5qlQXPjXKfKNMODI+RboJBelJvUssi5Zj
         M+9lT9bmgaNXPPleLlQMQ5ByEHKv+gTrzbbzKnthhgEvz7NEA4PIcIhEfB4p/G0QoZPn
         j6HaIxYzWPvCvsBiykjkvW05+K6D2Bq7BYWPWFd9ZTm/ohUofJkglDZKhnYYWRo3JNIS
         JDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981875; x=1705586675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzP+XqZIEu/FCU5HTQRXG79wGVNN7QX/lRoeuEGtzLo=;
        b=nk1/GD1bDRFrne2d6lWlAcc8KrAlf1daaK/Y1pvFYnuFoo9Zbd0UfDEWA/v4XB7w4l
         0jngf/8dQrkKhd7IObMdtq192mje0ItmuREa8xG0P5y42ZvpqRf0MzLHPpeu26hZhzGg
         79yLtFUXntb5Gi2uPuZNBIcxVSeA6YptMLcfEakR1zNzaB7gkD3VmZYXPBgmHdyef7Zj
         FUgyyG47mqP9mjR+mH9mQbZuU+Qt0J3Spz5ZAwTkCe1qGZwEDu+DjyFbTOmVrLfOqZ1U
         vrkXVY8fjHjPioia5ATMDF2uWY3q443RJmhMsoAEgB8Qtl2F5qXBCYb+9XKMWcyIw8bo
         YXRQ==
X-Gm-Message-State: AOJu0Yy+tRGLJRUs6LfGzGOUAh3W0aKVmysowGqLMzbI7MW8vtkqHzVS
	yWy6Bs1071GatyKqg14ElVs=
X-Google-Smtp-Source: AGHT+IGUg63y5K4edJMmLBorXW6vbMRv05WMwwNcrit5CxgMLk45+R4uY3RY1S09aAKW4xmySVS2PQ==
X-Received: by 2002:a17:903:32c1:b0:1d4:c336:2b10 with SMTP id i1-20020a17090332c100b001d4c3362b10mr1379498plr.0.1704981875508;
        Thu, 11 Jan 2024 06:04:35 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902edc300b001c71ec1866fsm1196870plk.258.2024.01.11.06.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 06:04:35 -0800 (PST)
Message-ID: <cad53010-521c-4064-8169-5e1c37bd549e@gmail.com>
Date: Thu, 11 Jan 2024 23:04:28 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/2] count_lim_atomic.c: Enclose complex loop with
 {}
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Hao Lee <haolee.swjtu@gmail.com>, perfbook@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
 <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
 <20230521075425.GA13425@haolee.io>
 <71ebc20c-7e07-a029-b576-40782bb77a9d@gmail.com>
 <c518cdae-cc7a-4de0-bfb6-6bfe81434534@gmail.com>
 <ad92d88c-b48d-4a51-8640-4ad13e1271b7@paulmck-laptop>
 <554b2470-8d25-4fbd-9863-b3cdbce1e447@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <554b2470-8d25-4fbd-9863-b3cdbce1e447@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject: [PATCH -perfbook 1/2] count_lim_atomic.c: Enclose complex loop with {}

Let's get consistent with coding style of Linux kernel.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim_atomic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/count/count_lim_atomic.c b/CodeSamples/count/count_lim_atomic.c
index 8c4dcc75..27c4b38e 100644
--- a/CodeSamples/count/count_lim_atomic.c
+++ b/CodeSamples/count/count_lim_atomic.c
@@ -84,13 +84,14 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
 	if (globalreserve == 0)				//\lnlbl{flush:checkrsv}
 		return;					//\lnlbl{flush:return:n}
 	zero = merge_counterandmax(0, 0);		//\lnlbl{flush:initzero}
-	for_each_thread(t)				//\lnlbl{flush:loop:b}
+	for_each_thread(t) {				//\lnlbl{flush:loop:b}
 		if (counterp[t] != NULL) {		//\lnlbl{flush:checkp}
 			old = atomic_xchg(counterp[t], zero);//\lnlbl{flush:atmxchg}
 			split_counterandmax_int(old, &c, &cm);//\lnlbl{flush:split}
 			globalcount += c;		//\lnlbl{flush:glbcnt}
 			globalreserve -= cm;		//\lnlbl{flush:glbrsv}
-		}					//\lnlbl{flush:loop:e}
+		}
+	}						//\lnlbl{flush:loop:e}
 }							//\lnlbl{flush:e}
 //\end{snippet}
 
-- 
2.34.1


