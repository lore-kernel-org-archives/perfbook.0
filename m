Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB2A15575F
	for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 06:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502905; cv=none; b=udqOH4N2gDl94XO5BjfP2j6vHl0pifC8pFPN+kqAHg9WgCdLw1rwOotKwH8yBaQpdP8sY3w3LEZYH7u5TyxC8aGQFmJeE3HDltkQYy0PRMarUjljQ/YYxoTHsIFc5/MqER90LZI6XLjeGJzu8yr2KChrOWGv/Nb3fLVJaqn6Iwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502905; c=relaxed/simple;
	bh=iMSGo9TfzSp1PKVBeuDtSzsPHmgQu8T2rwl/VwoFv44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RidbNlReGGIPqBQF+cReHVm6/SX6FZCWGANb2JJ42B/DKWMqYTnyyFxSH7VgurWNETEcwPotuDE5JMMehGXe2DLCJfm/ChQ/rGONEFBRrBpWWZ5hTwGGEqSZ8UbVSO6DSJDYJTVm26bNWVMQvszN3IVqZrEU05UabhEcqZpGQVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chPvnnJ2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chPvnnJ2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2164b1f05caso56422485ad.3
        for <perfbook@vger.kernel.org>; Tue, 17 Dec 2024 22:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502903; x=1735107703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFFEiuM64HSsaR6CeimV3jjW4bRpc9nOTiVE1XIHdEQ=;
        b=chPvnnJ2dPpIpYmFYTqC8BkbJ15Zy4n6xx5AOCBEJLFQj1WlLKIa8iWqNYLwb2/F8h
         sUVkT9ZrxGaO+8FPHFNcXFK1YqBS0HtiNTqPFeMS/TresD3BmzeuRHPym7SxEru5EBTJ
         anm9R6U7Nuk+h1V9OpwItAy25CTorfy89jTTx7wQZ3CFxDIBOnEycujCGD7iDsmvue0X
         Tsb9+d9Vzcg4t04U4+Qf4ct77l6p+kQlx2tUu+o5sECFySqnHncN8Fkhayjqhi8YygWW
         POOqmqgOJkNr7ZVLk0aGp44sekxAp6M6c4QDfX2/C38bigK7RBIo7WHevnuI9wwBZurw
         Brmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502903; x=1735107703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFFEiuM64HSsaR6CeimV3jjW4bRpc9nOTiVE1XIHdEQ=;
        b=GSP+4wOkIzHxPSHrtz9qyIYWWNyQxMUSUQ0Xbd8DwI2PITvC9+fNh0q7gvv4OvKfPK
         isKhZrOxd+SlKnwIKV5URWzVxp3H/yQUwclrQEnPqZTken1+Pz80OOMJvRRjiwG0cpb8
         2mJeKuWOQOqsa0BtkBUOCB7Dddc19ofZMEGT363GzMO16HvRQvQPcEJbB4Ol2t1LtMWQ
         SsyGZnVoXz0uZ3PMcZwymitWLsYMfccMihLFrCiF8tS8LC56ODVZnnnyKE9T9yAi/QuP
         jK39w8KcvgxiqSeZdcJikIYmgLg1HYOpGjnTj4h6hx6wyP1e4pvjjtYFUAmAuFM+6GGP
         51CA==
X-Gm-Message-State: AOJu0YzSgSpMD0rM8vl7L9ucuXw6G4HkAse5iGJW5blBNQwI5P43wMxv
	1ZbQJhsRoF6wbre02Tg4Gp9pD1YOp2F5QWOjAD6UV1j84d8T8/4s
X-Gm-Gg: ASbGncvP2oCHzAsNl7uQvqH7gwdytq7pcw3m2HMMiAW/1FK7Wnz77CywmWKc0lSNGSM
	ob8IjAcJigOLnGEB/modB3NDD1+OxM0cJ+z1/1fGuAE6AOMkNPCR4TRIFBMe5GQ4vtGvXimJUZx
	3LQqJDaoS2P2oeEq5g1TTDW1A5kREj5JCRW8/CewNpmgYbOelAanMPCtDVKqmlUQrwTKUgaTfXf
	+HYV0rvUF1vy6zG4ROkGuNqtIhYCkc5FNp5rqWdksP4SthHRwcmErdfCFlZjD2jcQD5Ork/e1sN
	WgV80TnVpFSaHA0ayJAjM0k=
X-Google-Smtp-Source: AGHT+IFtshnJvzwDIYhbi67Ao8/gCGwqVKNnyIQXYlL4VHiPmC+TKxBBrWoO4yTzxTMg6lzqW4O3/w==
X-Received: by 2002:a17:902:eccd:b0:215:352c:af73 with SMTP id d9443c01a7336-218d70d9671mr23924845ad.18.1734502903036;
        Tue, 17 Dec 2024 22:21:43 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db755dsm69002125ad.42.2024.12.17.22.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 22:21:42 -0800 (PST)
Message-ID: <9f6a9df6-a5b2-4001-81d1-30e7001285dd@gmail.com>
Date: Wed, 18 Dec 2024 15:21:42 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
 <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com>
 <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
 <9d088173-a038-483c-a4ba-ef56f7162b62@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <9d088173-a038-483c-a4ba-ef56f7162b62@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Akira Yokosawa wrote:
> Daniel Xu wrote:
>> Hi Akira,
>>
>> Thanks for taking a look!
>>
>> On Tue, Dec 17, 2024, at 5:53 PM, Akira Yokosawa wrote:
>>> Hello,
>>>
>>> Daniel Xu wrote:
>>>> WRITE_ONCE() is needed here to prevent store tears and other unwanted
>>>> compiler optimizations.
>>>
>>> That might be true if there were chances of these two accesses to
>>> race with each other.
>>>
>>> I don't see any possibility of such races.
>>>
>>> Can you elaborate?
>>
>> My understanding is that read_seqbegin() and read_seqretry()
>> can execute at any time. That means the read side access of
>> the sequence number can occur doing an increment.
>>
>> To prevent the reader from reading a partially written value,
>> we need the WRITE_ONCE() to ensure the relaxed atomic
>> write.
> 
> OK, now I see the race there.
> 
> But see below.
> 
[...]
>  
> Those two READ_ONCE()s don't have any concurrent writes.
> So there seems to be no need of them, IIUC.
> 

Furthermore, in sequence locking, readers will retry if they see
an inconsistent sequence count due to store tearing, so WRITE_ONCE()
is not necessary, either.

READ_ONCE()s in read_seqbegin() and read_seqretry() are there for
preventing read accesses in retry loops from being optimized out.

        Thanks, Akira

