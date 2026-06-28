Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3436837D126
	for <perfbook@vger.kernel.org>; Sun, 28 Jun 2026 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641510; cv=none; b=rQQr7ZoBW2wknH+XRm5+lK60CplCWXjPJRcpe2zdwDRdZVaNtHsgKydObFDXbl0SqIfQflG2lYNIJKEWQjePiVoewD3lMz9SGbu2mTy0qeq5loeYkgfiATrPfzKwnlYNEOHbHXWut2EvCTVb7cw4arxROXeNDWNv5HMlWjQYGm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641510; c=relaxed/simple;
	bh=V6FMuPDulj71gxhP/pU1My7JSqqNc+8XYISb6rIGKcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnzW1MYM+jPGv50JpmQfHYltZoWD2CH2HxjnXb5p3YbfUZTmocDxnd8d2bp2vAaS+ifMPz+a1Sxyj+j25gBs8oA460pTwhd8E/iL/03scgAfCPp8vu8jvst7KqRRc4EbK8FWCzfQ4uhvBw6Yxt5DWVa9cGP+ODiZKmhx2nC7j+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEpvE/9m; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEpvE/9m"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c8007ce809so11879725ad.0
        for <perfbook@vger.kernel.org>; Sun, 28 Jun 2026 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782641507; x=1783246307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/ZBJr7pi+v+JxjflBvdTH23jWBs/EO865kZZctSlk0=;
        b=PEpvE/9mUPvIydxOou8INFiYDIxsQ4qVBEPqwrNPALvpHlAglQKb6tfSaU8k2XyMKZ
         AHgcG6zwZ7I6kOvjgf6OGiW8WLrd/Nqiai0nj6C+Otr3Ossq6SIXL9Zkn3qldBhI4CWU
         9QUNPE0XiCtkxOqUVk9jCi12CsSWHPWFM3JiA4QJtLXzV38Amf2vHF0WIVP2Bt8dknEv
         B+l5g5gG3+G3okTNeS5u+HOTcxCoAcZvDKN4yfYK1rUF7qDEh5KZYQ6Yh2VZPYD2guIb
         vDmFCJ7AtzLRzDzGMekbpIxA2dScv4J2oeebfhqWXVH6FEPSk/LXbBd85TW7IK1oK3uX
         YrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782641507; x=1783246307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/ZBJr7pi+v+JxjflBvdTH23jWBs/EO865kZZctSlk0=;
        b=plwRh8whXR2WnluGKeElJ2LxN1RBJmtiVY/eqZCFlBS3JnY+GMNoiWtNaKcav2Sykk
         2U/QaUEuqxHRLI1YEURw2nLbQFhAqNMZyMzI8XoQ/48jz5Nt7xj9tXWpR5vlaQN7SHm7
         lYDOkdSVDiCpnEZk9U2Fkgw7sS29+nbrtDPGSdEpmRD3VnWKJa909O6J48UL7/d0RtEY
         P/A+CdH4qzSKXCci2ItH1MwU8TEi8EzRs1nC/6HptEhrXzzXUUGnhfypToS8KLwdMqRy
         I3KRTZIw3JN/S/8pPavPgOmz0EOKZ7IpW0aq+aEMRGgtxiNW/4jvT5SgnNaWRpYIUcOn
         p4sw==
X-Gm-Message-State: AOJu0YzEvgnyKQwvZJ5gwJgy29HIVn2AmF5o8qJLmUmJDH3hERB17BKC
	HT3rx+M173+mOgNvzEtZpxnJARXaYeThfdJQAp9zLNmGGSgbERVv/uoV14txvg==
X-Gm-Gg: AfdE7ckjN68r3kswmJ/boZyoCd/nIv5qCRJZfLjAG4G7RBBRNNSUvLdJGTF3dWKcuKL
	yMvGFYFBZWS1UDD1eQdRmPkgD3M5XFCy1aqS5qdkEBCb0VRa9+qfddX7cmn+7cLNce1vxQfVVHf
	R+9bzFi+X2S1C9EDvFovS50M/VM2PCbrtQ47QgWyXdmN31cOf9+DJeln9pHOCfWfMq34zjKz0Zw
	UfxZ98ECVsJ9CXF+3joF/DL/KvDiYQZVVnoiY0ysU+RZCsuu2lTC8JcdIuADtGjCYDuX5DF09sG
	yxwlifYyUFna4QEM60kRmI7WQLu3GgJYdUn52gn9fAc0ImGVZLxnGuazEiPP6juJMvX4nic9jsd
	hOPDIMgo8nLGm2Rru+Vd73CEWH68MD6Vt4rBhcG/NRdih/wUoI76BVwoWl9vOMiNb1dFgzyKBs+
	h2dKZiEo3IOqT2nKXOOItT7eyGbrKK6Jnd5EqyVudz/boIEwqzktiwKNNbig==
X-Received: by 2002:a17:903:2cb:b0:2c9:9e6c:7c08 with SMTP id d9443c01a7336-2c99e6c7c90mr46158455ad.21.1782641507412;
        Sun, 28 Jun 2026 03:11:47 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9992a586csm31889335ad.21.2026.06.28.03.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 03:11:47 -0700 (PDT)
Message-ID: <db176804-0f0d-478c-aa5a-ca523b594c85@gmail.com>
Date: Sun, 28 Jun 2026 19:11:46 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] toolsoftrade: Fix off-by-one error WRT Listing
 4.14's line count
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <1c9d883c-fa79-44dd-ac4e-0278af17d0c9@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1c9d883c-fa79-44dd-ac4e-0278af17d0c9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There is no such line "B4" there.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 08efff11..9b3f2e4e 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1527,7 +1527,7 @@ relatively small memories of that era.
 Nevertheless, problems did arise, as shown in lines~A1--A3 of
 \cref{lst:toolsoftrade:Living Dangerously Early 1990s Style},
 which the compiler is within its rights to transform into
-lines~B1--B4.
+lines~B1--B3.
 As you can see, the temporary on line~A1 has been optimized away, so
 that \co{global_ptr} will be loaded up to three times.
 This can be prevented using \co{READ_ONCE()} as shown on line~C1,
-- 
2.43.0


