Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B18AD2F
	for <perfbook@vger.kernel.org>; Mon,  6 Jan 2025 02:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132274; cv=none; b=Y7UwnZMR5dqTjz33lVcw51OQUu31jziAzu+uiQ1g9FFjnvnIZAFd+X7isdr83fADt66yKOydo5KXAK+Kl/+Ykzga5HHo/bPmRaGhiHTvNfxaqpE2KsqSTXpfXZe1Fohbs7fuZyjUIPKgBS+Kaqw9pEEN5jfqrpK/Mbd6VVK1mIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132274; c=relaxed/simple;
	bh=XzRKtPhHJE6GxaB3IxSkwbyu/tBSomnk+FTHDll2vvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4yi4fX3SAjg6+3pcAnjN6gB1alICPkwWJKlYhdnvrb6o65kwM7cbzgW1cVJx4WGn/rnyupHCQCtDPeggs1oXxmCzjjwWRJVNOy0eZXkpyV+h0CIWRkbEnejmZ9/nC7NNiyF7vxkaBs4GuLhF2y63gOKvVX2UM4yAFPaG+6P3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PloD5PDD; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PloD5PDD"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so20041145a91.3
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 18:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736132272; x=1736737072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Ir8P/pHBwhXpNJA4couVahiZG0MqjBz5sX835/jxpY=;
        b=PloD5PDDfNukaf+nQ4z1lGtlUJ4+ZEUIjRoQyDQZZV2RwpMoLYbgyXstDEsSoZGf/x
         dgtSxPAYx/jSbxOPIu4D18lE4TnaFko/WylxXNAbXHAdxJvzLlluFaO0WsTfGZh1tfxH
         0vhmRRdaYF59jLjlawvsFo4WlOg3l5eMW4i5HAaP8AVGEdCNq6I/eJKLHp/DP8IxQPLt
         J44zO0kjhb6jhthaahCrsG1G7rSC/icQulNAIw8tEyxLxazqbvJJ9g/7uBFZbJn080cb
         65jKwlTjD8UupBU2g4zBSmpbf/GUp512e19F6kji/UlqO1HsNValaAjAifg0zgFPFgsF
         fhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132272; x=1736737072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ir8P/pHBwhXpNJA4couVahiZG0MqjBz5sX835/jxpY=;
        b=u0W9b2AgVYJTv22Aac0ajhTTE5jJjDrw4dxbzIsTCtfIV59ZH/tKI4kwokOdkSrvR2
         6gqNjEtbdEpjQQgclsPohemQyi1mqwV7KTsD6oTBTSSSxGoSGThkKrIoAaxN91QAj9td
         MbGCBUeDw61h4WgHAHdE3HbqPS/uBACdBmeOvqBeqZDH40oCLOe2zbBDs0abxLv8j472
         yMQOab1tL1Sy4k+pFcbHsejE/158Gd8fcKK2Vtl/Tsh7EC5c9vOrT1uh/b+UxO/NzwGX
         leGiWukPaYA9oV+1KK9sKvE5EEm1fv3WWrBuuDx0xyetNPjqCoM9449RdtoObB8FA3PO
         2uiQ==
X-Gm-Message-State: AOJu0YwCV/EZq3lGiN3mHvOchjdkaaJy7H02OLiPE81SOtYP8joFuL3o
	IFHtqyAESvC4Yl/ZNyiBVekDt04OXDcL8u+Jq9cfob7o8Uh5Hq2m
X-Gm-Gg: ASbGnctXvEYMC0hygq1xCqfXxSsApp1pv1mZSHtX+B38lare2e1DoPqYx0ngyPeScWN
	uGKpx1LT+h4RBzMMIKpfXZUOcleLsX1f/nG9fExprWS3qX599pXuUacHCXDStR/h0gLNBqMgeEx
	PgIAbVeOs5VldyPcf0MvlM6eTp73BSGZUJRwiq9mVVkdplU6H1Ym+nhvxOnAbHuquMhKicskZW6
	cix4EyHfM/dUMyL1zh6d8EAbQJBNlpmcMhmh5JTWe500O5OycrnGb8r0Lj3jJdMKtbF8+SpbTho
	x+cD1HCYB0ClMiCzERgecqY=
X-Google-Smtp-Source: AGHT+IHyQ8QERO3XHt1QkgEn6P86hjXoAcOX/aK8fTfz5+INIBWG9zeVukPxzUc4i08jjT3CIyjnWQ==
X-Received: by 2002:a17:90b:3a08:b0:2ee:cd83:8fe6 with SMTP id 98e67ed59e1d1-2f452f0280emr88556288a91.35.1736132271868;
        Sun, 05 Jan 2025 18:57:51 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c84d0sm32797975a91.14.2025.01.05.18.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 18:57:51 -0800 (PST)
Message-ID: <c05a99ae-a043-4355-a6bc-591543c55c55@gmail.com>
Date: Mon, 6 Jan 2025 11:57:49 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook 0/6] CodeSamples: Make non-default combinations
 of cc and -O levels happy
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
 <a5d64bed-4e80-40e9-aa66-86165f31e3ea@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a5d64bed-4e80-40e9-aa66-86165f31e3ea@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, 5 Jan 2025 11:02:11 -0800, Paul E. McKenney wrote:
[...]
> 
> Queued and pushed, thank you very much!  And happy perfect-square
> new year!

You mean: 45**2 == 2025 ?

You can go further:

   (1+2+3+4+5+6+7+8+9)**2 == 2025

, and

   1**3 + 2**3 + 3**3 + 4**3 + 5**3 + 6**3 + 7**3 + 8**3 + 9**3 == 2025

Happy new year!

Akira

