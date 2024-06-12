Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB55EA93B
	for <perfbook@vger.kernel.org>; Wed, 12 Jun 2024 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718233306; cv=none; b=VuDBusCu/Zyi6iufAWn5wyxURjDYChkU9V+OQ7e//+JaE1N+ETVuj7X/Jvph/nqkB/cFBfoltFmDJBvaA/wtqChC31Tucjp68r2fsb+zzb7lHJ7Oz+aj0+irMtCWeUm0c181XjPI/u1r8gckIK7TU6O2ydIo8ExBvCzBddN07ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718233306; c=relaxed/simple;
	bh=Dj009O/Z2feKTOE3tBRv4I1Oeg8zLVLvjGmUWrzbnkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqVo+mN6N+5VpzlZ+lZIZlgtQnt1OYjEqef6s/8rE+jwXrTF5CjnPilwHS6TdR2SY5IuF9C7Ufcgef39e+W4fMBtKA/FF2kOOZOSeVgl+tgByK0gTxkbHvRmDKSMl04Y4raMZhs5RZk/lrovedae+NNmG70CLANPSY68qqAgXv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKDWHndY; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKDWHndY"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-24c9f73ccaaso217629fac.1
        for <perfbook@vger.kernel.org>; Wed, 12 Jun 2024 16:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718233304; x=1718838104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMi7a0crFEfo+0trp3tIeH6aVr+O3wsHTSM/GeBt4xA=;
        b=IKDWHndYWxb2rVbaL97ijTxv9ChFoj/r2aE8MVGxXAxc4pPfxdAsLLO5NNiOqje9C4
         d7js6dNO+i5YV+G93dhpzdd3pgoZHoPFytovR1ZghYnsYacNI4loyWFbJp2QKMphMDym
         G0YAS6qU6aA6HNYya2SGl2+22qJenYvKErjE27T6FQ2QwWuEY/teNycwr5KyDyzRNVN4
         8GHG4v8mTtLUN4ZKFp6bcGrzc+O6PxW5LU2oN/fd9T2UWCesB3PV47T3JUM3+c7oMuEp
         EtFeV9OmgdLHMF9d47OzNXh4CVD+EYJAfeEWsRYeHA916/l7PeIoaXhhjnY1eGaOgfJo
         6uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718233304; x=1718838104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMi7a0crFEfo+0trp3tIeH6aVr+O3wsHTSM/GeBt4xA=;
        b=kpy0H+E4nCi9BofhM0qSi6prYQ0pu00CQXGWvSJJIy4xJs2hshVwX7LrwEhhSFh0Bq
         BFO/akxIg+C18fMbBJg18j6MnNe9VNeELwUMEaAtmUxt5ObPXs47F7kKOybDbIgzNLVI
         J74QAbA54RCarHQ5D9I1VcZ+r6KotfusGpemJT1c0aXhfe0VWAFs93P0XaUWM0PSonjm
         B+sRb2Lf3Mr/5QLieSUmOrKRX2kJXEtjIpRGSlqki+C5QoX96ITzpSpEC1JPSOMr/4H+
         6kgs8TY4pO8Pr2n87Vn8DYqxSLfZcR7rjwNmPhl3W/5mtd9ThbBdFs1AlphoRD6O0gu8
         F/0w==
X-Gm-Message-State: AOJu0Yy+EGTassNglIXhkPjpCxEXMPYSaYVckAuJ5N8KtZnl/AWTkYdd
	TEq8Y3pTSKcbWUy40GYYhwDLL0IHb7e8pbvYksPQYcpHvosf4ZrTgaV+0Q==
X-Google-Smtp-Source: AGHT+IEXwP8NSnkyfJORZp0oX++PLyPym83P1dskMkTclATeUtyRQpXvVvMx6ED+yYDWtj7uUHbA8Q==
X-Received: by 2002:a05:6871:594:b0:254:aaeb:d29b with SMTP id 586e51a60fabf-25514be793cmr3618236fac.13.1718233303715;
        Wed, 12 Jun 2024 16:01:43 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc91e0fbsm87800b3a.9.2024.06.12.16.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 16:01:43 -0700 (PDT)
Message-ID: <c342046b-e078-4447-92ef-d692dce09fad@gmail.com>
Date: Thu, 13 Jun 2024 08:01:44 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook v2 0/3] Work around backward incompatible
 changes in LaTeX2e 2024-06-01
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
 <c461a45b-2722-4412-8bfa-a987613ad182@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c461a45b-2722-4412-8bfa-a987613ad182@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 11 Jun 2024 05:55:13 -0700, Paul E. McKenney wrote:
> On Tue, Jun 11, 2024 at 06:34:25PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> As I mentioned earlier [1], recent updates in core LaTeX and accompanying
>> changes in the array package broke build of perfbook.
>>
>> There are two modes of incompatibilities.
>>
>>   1. arydshln assumes array's internal implementation of a past version of
>>      array, which is no longer true with array >=v2.6.
>>
>>   2. A "LaTeX Warning:" message in loading parnotes.sty.
>>
>> Neither arydshln nor parnotes is actively maintained, so here are
>> workarounds made in perfbook-lt.tex.
>>
>> Patch 1/3 adds a rollback option to array and sticks with array v2.5 or
>> earlier.
>>
>> Patch 2/3 enables a silence filter for the particular warning.
>>
>> Patch 3/3 is a follow up change to use date as rollback options of
>> glossaries related packages.  By saying [=2022-10-01] rather than
>> [=v2.07], [=v4.49], etc., it becomes obvious when those packages worked
>> well with our custom code for glossaries & indexing.
>>
>> [1]: https://lore.kernel.org/r/a3ff0522-fd2d-4c87-9c7b-00cbdd5f3c68@gmail.com/
> 
> Queued, thank you!
> 
> I have to ask...  Longer term, are we going to need to be thinking in
> terms of avoiding use of these two packages?  (I have no idea whether
> that even makes any sense, but again, I have to ask.)

Well, I have faint hope that Frank Mittelbach, the author of
TLC3 (The LaTeX Companion, 3rd edition) and the maintainer of array
(among others), might want to update those packages, as the book uses
arydshln and parnotes in a couple of examples.

Just hoping. ;-)

        Thanks, Akira

> 
> 							Thanx, Paul

