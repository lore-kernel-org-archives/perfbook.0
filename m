Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0E208A7
	for <perfbook@vger.kernel.org>; Thu, 19 Dec 2024 02:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734576995; cv=none; b=qS8QkMuVeUg2JdFm5UEZT5wuZ2DoqvqQvIBqoKZaaRWf8xAjdtGNvbQ1Mkh+fOXI2iPUbNbWGTMAJltYHSO9xczDAUqiRZ2emagEV9AUj160tcfLvs6J+od4W3fc4O5X0BYZqHQwVLnlu1sDtV+TPJQbUlOa28lM6kjL3bTsjU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734576995; c=relaxed/simple;
	bh=TB05CAILoFDHkOoTZpWHOGP0YJUbWmHXEtV8RCyYtJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgjKQlrkaDVZsD2Ki819KLy9QbrwXCUrfvCpmeFCBXaZI2Sp2StJKaX7jbzisqsGdEt3wfmehi6BKiOtnSWQVuAKDSOU+QGgb+DfGkj4nyZz6a+mPkxwdX1pYuSifoNwDAAV1P6yN+pM3AueBE0+QCS5pZI0enM3zlcjZQgIlw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYiv7UyX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYiv7UyX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216395e151bso2226415ad.0
        for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 18:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734576993; x=1735181793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5xA5TarSMIfZmWiNs3D12PwVcdIvnLz0txDpBM44AY=;
        b=iYiv7UyXZ+gyWRQnm3hmPUp7s/5fRorStLRFC/QvK6YXmYNlfZOtJA6mGBWSjiklsm
         FXgc77+Uu3myLLYlM905a4P9sGpofGc8Q5R0a2Bt8mPcfYGBeHya2xp6AGjXMj9QbsqT
         0C5bkO07fBHpvVHqQolV5GapSH3qh6312Rka6jSibiDmH69AFYr7b9K8z0oEV5pknW9R
         vtnBH/uzd4faB6ty6vKsbSyOwMiYxlwZ1d9h+0Xme1dfavFgYh1Y9nw3OZZo0+XMe5BB
         /cJF9uGpOGsp8NtnBlU6ppYGQSy7G7/uxu2LvpA2R3aTM4O0CtFxotWPTMFHhnu7zHIQ
         qVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734576993; x=1735181793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5xA5TarSMIfZmWiNs3D12PwVcdIvnLz0txDpBM44AY=;
        b=LKKk/MSNTkcwsXjIyX26n96snzk6VRjVEe6/gnAjpfcQY/yDnwzQniIbC6ear0Y2Dx
         BWL7RMi5Z7+voGDazE4oolfbFvURBXv/nptXNCw0TonUptnihVg37zAy4FpIUlel641H
         NURqtf8lDJ0by2bDWoi/fnz9/E96gtga071io+WEqE18Ya6W+LpkK3bOrJdL/WGqf4rC
         db2HDz159mmCFlsercuhPuzd62dq91N3F76zUjnDAbsOxYU/8rCbJaVtkD0tyacUBjE9
         Cc13hJbND9nUaMFRAU7Aw7caqQRF4DmFa9//P3vhS2rEm5TKIcXuHNhSS/v39MDkrHI6
         Bgug==
X-Forwarded-Encrypted: i=1; AJvYcCUAPvVpgJUS/2Y68dkej3Jgb1kUV4I4Nkiy2aVc3COImTuVnkoUAwALIYnPe6tkTh+mAM5h6aAeCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXl+pqF1ut65O9ZTM/k8naRJHvM+nPFYK0bo/GGYEOvvAZ8Nt6
	erF1gb9KZoPmzlMi6tbcGmKRX5SDar0Iu+fSfaTjQ2qijALQT4z0
X-Gm-Gg: ASbGncu9Jn4dKLM3QX8grXk90f0bO+3VjYNhSpI3mrWTGR3DAtFbuf/ahUhQTRlX5Px
	+4fpmOrN0rkejoXAzyXWq60WnRd3FU/hXziMGSw3PhBjR9epBz+zKyaYWvn25pQ6CVltXSAR5ri
	Z09s+PnGMEfGoUQONUqIu5XpIAyErrkSUXVZH2y1fml3w9IGVBidgY2rt5O2OCJpJqTnW1BK8Dl
	ktjZmCeJkqxdX5muVrw0fnaKW9+/ILKgkljOG6GJlWScUtn2DejreW7tALNGvD5S8IbvuRgc6T5
	y+zGNx/PGTbj9hzQpaTbASQ=
X-Google-Smtp-Source: AGHT+IE0+WEH+HWCVRiwASs3Gk2BXc14QX74UohIQI3Ced70Uq03y3nw82aTT4sw8euLBk/uVfRsaQ==
X-Received: by 2002:a17:902:c94e:b0:215:5d8c:7e46 with SMTP id d9443c01a7336-219da7fbe14mr25766135ad.27.1734576993218;
        Wed, 18 Dec 2024 18:56:33 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0256dsm2366695ad.258.2024.12.18.18.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 18:56:32 -0800 (PST)
Message-ID: <da91f21a-213c-4647-b8e7-e4735dba3081@gmail.com>
Date: Thu, 19 Dec 2024 11:56:32 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
To: paulmck@kernel.org
Cc: Daniel Xu <dxu@dxuuu.xyz>, perfbook@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
 <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com>
 <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
 <9d088173-a038-483c-a4ba-ef56f7162b62@gmail.com>
 <9f6a9df6-a5b2-4001-81d1-30e7001285dd@gmail.com>
 <17b06c2e-f97d-444a-9db6-7094677d9a38@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <17b06c2e-f97d-444a-9db6-7094677d9a38@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Paul E. McKenney wrote:
> On Wed, Dec 18, 2024 at 03:21:42PM +0900, Akira Yokosawa wrote:
>> Akira Yokosawa wrote:
>>> Daniel Xu wrote:
>>>> Hi Akira,
>>>>
>>>> Thanks for taking a look!
>>>>
>>>> On Tue, Dec 17, 2024, at 5:53 PM, Akira Yokosawa wrote:
>>>>> Hello,
>>>>>
>>>>> Daniel Xu wrote:
>>>>>> WRITE_ONCE() is needed here to prevent store tears and other unwanted
>>>>>> compiler optimizations.
>>>>>
>>>>> That might be true if there were chances of these two accesses to
>>>>> race with each other.
>>>>>
>>>>> I don't see any possibility of such races.
>>>>>
>>>>> Can you elaborate?
>>>>
>>>> My understanding is that read_seqbegin() and read_seqretry()
>>>> can execute at any time. That means the read side access of
>>>> the sequence number can occur doing an increment.
>>>>
>>>> To prevent the reader from reading a partially written value,
>>>> we need the WRITE_ONCE() to ensure the relaxed atomic
>>>> write.
>>>
>>> OK, now I see the race there.
>>>
>>> But see below.
>>>
>> [...]
>>>  
>>> Those two READ_ONCE()s don't have any concurrent writes.
>>> So there seems to be no need of them, IIUC.
>>
>> Furthermore, in sequence locking, readers will retry if they see
>> an inconsistent sequence count due to store tearing, so WRITE_ONCE()
>> is not necessary, either.
> 
> True, but this is needlessly increasing the state space.  Plus there
> are other potential optimizations.  These points were discussed for the
> Linux-kernel counterpart to this patch here:
> 
> https://lore.kernel.org/all/0eaea03ecc9df536649763cfecda356fc38b6938.1734477414.git.dxu@dxuuu.xyz/

Thank you for the link.

Hopefully, INC_ONCE() can land in the near future.

        Thanks, Akira

