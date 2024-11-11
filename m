Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7936742A8A
	for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731314390; cv=none; b=UtvcAW2XKQj3AuqEnPXKX6+VsaSOOUx+DmUsTTQo5KgUIpjjm2ZlHtyRv1UvjYSMU0QgNbvFcpH6rdutQIpjGd5pyFywX2ddoLrKxm9zqSpwacEAS+q+gFpSm/e4SbrNt1DANYAqoa3AIyq39aW6H7OY+4HBDANwMdZo0pd7Unk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731314390; c=relaxed/simple;
	bh=ulP+ZEXaSPXc8YWzGEzT4dCPE0PGGy6BvSGFkJa0WIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=W1H5ZAO+CQV+CXI4VileAMAPrwDYgEjjBVvLeZVFXfQXer6ROozU2Vzn3dhFS/kThCn+B0Q/GkZ0RoLzyWAeCoh7yQHnWBtf0FSPEZBFT5GL7qDo+lRt1ZMelYti7ip4CFupyby1cEJI6ZeMtyvAFVKEmL586tQxPJ5yDCONVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWcjb5KM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWcjb5KM"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c8c50fdd9so35660005ad.0
        for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 00:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731314389; x=1731919189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2965K5nmt3Ln7y230RXP1xOChjqFEh7JovqlvSO9kQ4=;
        b=TWcjb5KM1OGiAkWgw2pakzK8hCIQLEH/GSHygdbv5fOrd1S8wFnAI7SQS2GdEN/iuv
         7z2usaSKertoJhZlvmKPWQ8hlwtPEZcGoIYRL5Hs9ZgfHw3eQPUQ/nPnVoJUUmBoP9iX
         3684HgxMq2ysC2zWgvyEYQyhLgex7yt8kv9iS0VW2n5BcWaJ8VCK7NpNKUMwZW9HhY8J
         ple+g6N3CswERLcfIvCfxCq+gzCwPH5JbMyI1gZ5kXLCFiPykny4Ubl/nWLdC9reBony
         j3xElht/XR5VYxx5kB7hfpwKGOAaKOZAZbBKiNcG2c5K2UgCFXg35VWDMcRL8n2OP1zz
         WhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314389; x=1731919189;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2965K5nmt3Ln7y230RXP1xOChjqFEh7JovqlvSO9kQ4=;
        b=KrtqYVOFX2qOcByF/LmICJKiXtEXbeIsiC6pfl+SjW/ZSmYHCKyS9P6gTiFYuE81TH
         f0JaSu2TOU+J2P35FV+kW0lB6npOi/92TiHpXTda+/cLLazbJTahVa8WvIYtod/MvlYT
         eRH+TpovjnzSd82/6b1tMyPWPvAZpehG7X845OS+ZFx2XkNnzoYb8yVWWuwL3FCQgvPi
         j8YuXZ49mdhryMXzvOxsRdKVABm9bqK4v11XIA++E8P836To/B3SvaZcSt0zvPOaZAlj
         b8BtN/mnFMTQ5/pa5IJhRgtAHM93Ew3GqHQed1Fs0LI2ZiVGIQoSFHJN1nh39lozw7lm
         X8bQ==
X-Gm-Message-State: AOJu0YwrVMWxvTmnWEZhDqaWnxgmLCqr9cG75Vxv4a/QEbLFTk+kdrD6
	MvVeqIFBWhwmYaKDoP+6qjT/B2d9Bt+HU6Scj0fpNOHaZSOxksVQgDM8eA==
X-Google-Smtp-Source: AGHT+IHRtuO46Xg0GsVxisOB3+gOOLrh5qxRTKVxkz+HWRrvL9fTmto+Aees0b/9tRN4ro1k3r4SVQ==
X-Received: by 2002:a17:902:c94e:b0:20c:72e8:4eb7 with SMTP id d9443c01a7336-211822215dbmr181792185ad.25.1731314388502;
        Mon, 11 Nov 2024 00:39:48 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e416casm71234465ad.146.2024.11.11.00.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 00:39:48 -0800 (PST)
Message-ID: <317b9b3f-9dc9-4a5f-9d47-8d5b9d32b55e@gmail.com>
Date: Mon, 11 Nov 2024 17:39:48 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: A question about "4.3.4.2 A Volatile Solution" of perfbook
To: Nan Xiao <xiaonan830818@gmail.com>
References: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
In-Reply-To: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 11 Nov 2024 15:45:22 +0800, Nan Xiao wrote:
> Hello,
> 
> Greetings from me!

Hi!

> 
> I am reading "4.3.4.2 A Volatile Solution" of perfbook, and come
> across following summary:
> 
>     To summarize, the volatile keyword can prevent load tearing and
> store tearing in cases where the loads and stores are machine-sized
> and properly aligned. It can also prevent load fusing, store fusing,
> invented loads, and invented stores. ...
> 
> At first I thought it means accessing volatile, aligned and
> machine-sized data is atomic operation, so I wrote a small test
> program to test on a "64-bit" Linux server:
> 
> #include <pthread.h>
> #include <stdio.h>
> #include <stdatomic.h>
> #include <stdint.h>
> 
> 
> volatile uint64_t sum;
> atomic_ullong atomic_sum;
> 
> 
> void *thread(void *arg)
> {
> 
>     for (int i = 0; i < 100000; i++)
> 
>     {
> 
>         sum++;
> 
>         atomic_fetch_add(&atomic_sum, 1);
> 
>     }
> 
>     return NULL;
> 
> }
> 
> 
> int main()
> {
> 
>     pthread_t tid[4];
> 
>     for (int i = 0; i < sizeof(tid) / sizeof(tid[0]); i++)
> 
>     {
> 
>         pthread_create(&tid[i], NULL, thread, NULL);
> 
>     }
> 
> 
>     for (int i = 0; i < sizeof(tid) / sizeof(tid[0]); i++)
> 
>     {
> 
>         pthread_join(tid[i], NULL);
> 
>     }
> 
> 
>     printf("sum=%llu,atomic_sum=%llu\n", sum, atomic_sum);
> 
>     return 0;
> 
> }
> 
> But the result seems not:
> 
> $ gcc -pthread -O3 parallel.c -o parallel
> $ ./parallel
> sum=221785,atomic_sum=400000
> $ gcc --version
> gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)
> Copyright (C) 2018 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> So my understanding is: volatile doesn't guarantee the atomic
> operation for aligned, machine-sized data, and we can only use
> atomic_xxx data types and related functions to guarantee atomic
> operations. Is my understanding correct? Or I misunderstood volatile?
> Thanks very much in advance!

Your code above does mostly the same things as Listings 5.1 and 5.2 in
Section 5.1 "Why Isn’t Concurrent Counting Trivial?".

"Atomic (or volatile) accesses" and "atomic increment operations"
are quite different.

Please read on!

        Thanks, Akira

> 
> Best Regards
> Nan Xiao

