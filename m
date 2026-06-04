Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5940534FF74
	for <perfbook@vger.kernel.org>; Thu,  4 Jun 2026 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568152; cv=none; b=PyytBs7mlazHlalxFpYMdxLuHhANUWAIUT9wIkhWmvdtQj67mBoxwI3+rYFRrYtYvzVhUUSrd8HeBR/jOzqoCbMQ0ETRG4bfMPdQ43VNqd5vg1YlLp+WDsMl34twNoDxcuXv+6sQ68+4jz0mFSwCUV6MEaY5y4NMxuCzJpVbEhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568152; c=relaxed/simple;
	bh=wEB86gEbwHFeIAb7QurW+yKHjp+Dkww2GMx9tb77PQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F2erNcexcdoJg4SZIbAJ/allRMrH1m+C/V98eCjfdbfsVHz5wE3SDkp7Q1IF2A4owx9cLsWkUwTiKcOcMSPW/JxetgsnUp2bFW6od2eizjLpmQmyzbsIbR20xRHJljopav+dCKHMl0y0x0CnSwreHIf6CrUBsys85DzOZxTwTV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjsL1TQ8; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjsL1TQ8"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c85c9e8b7e4so210273a12.1
        for <perfbook@vger.kernel.org>; Thu, 04 Jun 2026 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780568151; x=1781172951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hzBZk1YGq77lCuLz1IX2iDC4xg/5YxuqgchQ6JsfESg=;
        b=hjsL1TQ8KhD18D+zwrIzROMAjSi2HoEZDf+Qa5+OrNWcGo/07TEZzcPUul0Z6Y/o3/
         S4qDrwMGu1pRLytWFvjx0DxGXPjLJ3JZED1BEPl3vjKDcXkFcXmZ7vV3U6B/cMF1RJO+
         jrNCzuo6R/ITp4g1nFk4TsZ4SaHvLEG3mEGmJxRStKcPhCJ9vni18okIGnVDX/s0BoGP
         2uwL2Qid2TPF9sSz4s+9CVPngqOuOnYeLQ1pvMrfp+eiNlNkkyn0YOjVNybiLuZLNJOO
         Z+R8Z1FE/S2N3EhjMiW5xQRwCkMdB9QFTW4QFfIRMDfpbTjKlX3cK8GMQiBZjpfnqTMx
         EvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568151; x=1781172951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzBZk1YGq77lCuLz1IX2iDC4xg/5YxuqgchQ6JsfESg=;
        b=MHwLymO2fZhMWDPpblVOUsbq85ZhkF7sInDlQFFbxdkgg1ewfJV+seF3AjxK4vY9dB
         m3lnXCLFDa2R/Zzyw1GHNigXB3FNnVIiDZmNvM5BHGGIK3U8OJAVAlEJ/jenQS5TCvZF
         SyqOSshriXnbOYGfTEojueVrmSc+jp81W9BZCje1Wz7waG/PQTt94htInWpK64rx3y50
         B9usba3K+h38nZ42/LjldamSPRkPU/79/mP2+kErbulw+ew5KoYjG6ky2mUxz2vtdmK+
         wUB8bCi95k5PPfuHDRZ5urSjaE5iUYr0l/R6vOo6dSGeM5pzVjuoxDgDM4V411v4GldJ
         n1hg==
X-Gm-Message-State: AOJu0Yw/dz8vPOADOSddFahuSq+sV4Wlv4cACk4S3PGMT60xKk3dLeLS
	R51i0ds/xFDrIdeGasHqi7c1tdB5tSyKWnYvfoE8+txjPlhf8KflECvB
X-Gm-Gg: Acq92OF4r13iq6S+IBfmHT/mQVkN0o+r5CgnuriTIHZyxr9sohOFVyfBUZcCT70J4bR
	xKd3JLsf5wWl0Cr0kXWMfc+US9nNwaTZi82QHOtf41fMzqoD/pX7vJfkNpjRrfmE5jDxVd41sq9
	rnCthhopCZDmlvRC29Pz3F7RnLTVz2vUz8oKdb8qoPQFUo4FYxReGnUubv3SKEYJD+y6ixB/7Tv
	mHLc+AuPJVGGrV7+W2SK0zXCi0Hdwv201Nt+QR9un2VQdPw31l2mP5af0SPIaB6yiynu7zSNZ/X
	rYjjEzZsTcnSgWmubIZ7DDzLBVCsQQTmFLPoY2xekTjNiTgIfyaRsW9I4Pmaefftp8HLJcHqhyz
	x6nDxiFwmSNo6VqlpU4Ij3CFp47iwaj3yNbznRqNXvxkI+4+d4qAYPo7iKg9NnhWCXRyn4+qyo9
	D9BqxELttHAKTL/T+84TO68iSEkPs0zGr+5deQuXVTn0bwx5I2fCtIIirwcbSFVyKENs74Hsk4y
	bd146Q=
X-Received: by 2002:a05:6a00:1ca2:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-84284f378c2mr6817870b3a.32.1780568150598;
        Thu, 04 Jun 2026 03:15:50 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282494285sm5341255b3a.25.2026.06.04.03.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:15:50 -0700 (PDT)
Message-ID: <bb76e64e-03d8-4eca-8833-d8fa86bfbe9b@gmail.com>
Date: Thu, 4 Jun 2026 19:15:49 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/6] precheck-tentative.sh: Allow "v4.4a" style
 revision of lineno.sty
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Early pre-releases of lineno.sty used "v4.33b" and v4.4b", and
hotfix releases used "v4.4a", "v4.31a", and so on.

Cope with such form of revisions.

"sort -V" has no idea of exact ordering of those minor releases,
but it should be good enough for testing ">= v5.7".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Fixes: c9ef5ee4f94a ("precheck-tentative.sh: Detect premature versions of "lineno" and "microtype"")
---
 utilities/precheck-tentative.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/precheck-tentative.sh b/utilities/precheck-tentative.sh
index 1e106877..9c35c0aa 100755
--- a/utilities/precheck-tentative.sh
+++ b/utilities/precheck-tentative.sh
@@ -19,7 +19,7 @@ if [ "$KPSEWHICH" != "" ] ; then
 
 lineno_sty=`kpsewhich lineno.sty`
 lineno_ver=`grep -F '\def\fileversion' $lineno_sty | \
-	sed -E -e 's/.*\{(v[0-9\.]+)\}.*$/\1/'`
+	sed -E -e 's/.*\{(v[0-9a-z\.]+)\}.*$/\1/'`
 LINENO_AT_LEAST=v5.7
 linenosince=`env printf "$LINENO_AT_LEAST\n$lineno_ver" | sort -V | head -n 1`
 
-- 
2.43.0


