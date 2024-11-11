Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37373B67F
	for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311137; cv=none; b=V3ZlMWMeLd88KvK+/huprjWb0xDpWjwCxanwiGGr6aWGmVkIoY5L9ZCXdsdtM4kRCfFytN2oPqVrsDn8V/o2ipPulv5eqKyZH4Ul2B/hh6cyhttjOMbSso29lLyxpDraJXjJvdSLIbNGIe5zEKh2+hcIlAWQgg1jHbK5RF7cDYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311137; c=relaxed/simple;
	bh=QWFqfNpDMjlCb9IzXOY/4B/nm8GznbOsYPqYUjJa7MY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=c3H80Srt6j3Z1pE5b63O5PLagCGdzjLxjIBBcufXSixAtxxxsoB139qVkk7FIDn2z85ENAATs05DRnHEaZeyzEZSnlqW7NJWT0kucpnP41q+lvmvkJrS0SnAj12HBRagUU83cIpyOiQ5dOQ5nvIEs3agdMXs0o9LFPTZk+KQ0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG4rYiaG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG4rYiaG"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so6231126a12.0
        for <perfbook@vger.kernel.org>; Sun, 10 Nov 2024 23:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731311134; x=1731915934; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RgjaDhGC1eacF2GpcpNzByWOJ4Tzi/6jJnaaQWmuUt8=;
        b=OG4rYiaGPnfTiw/7AiFsg+ZSMNjVmGtEvr2SO4Te8rUeWzkjvCRgywA5b4FxLrzG2C
         BRj7sBy6rphSYQlvZJeMuT7Mgmtwk6Df24gms0VoIgqmaO21Yzndns7n8pOWATyWaT5g
         IQjpXDj7JdWFYSYSiwE+/uviZfIOF8xz3p4fpkOEWSABNGDeFzJdkt7f43DEskRCiBvN
         fQ1S1JGa9q31NXhkBjGFRjiyWfKVGjfdf45hWkCDYWnyr0pgPI3gfoyWYjODmtkKF1L4
         ko/+j9cmKe2V+PDyHz8lmJ5Un+njjYeOOeDFI4/lHDzW4gMZyEYys4IyaFoP+17+PW+N
         Pnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311134; x=1731915934;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgjaDhGC1eacF2GpcpNzByWOJ4Tzi/6jJnaaQWmuUt8=;
        b=ZbCFgnchnvAjsXYln1+orFvP/FMnG0li7ZZtR3yCAimBgqzkzQvmUpYvALTFFJvPZY
         8wv5RY3A18V2jRE2/2m85iWJZCCqc4VuoukY9Qkq2Jc58crApqW/F6FIcDQtqnLm1wC8
         uUISg5nJ/ZDCXG6Q9IS35R+m8m1FNYLpdURYzc6AkKVo9serKBFDBm9kO6UOeJ3p3bg/
         aLoOYfPFuoxIly40xX/OtW9hUf+UFzpIbcLFg/L+U4KshdW7uzbm8QjkCQ4AW/Ji0a9S
         c5twHXZpugNc5YmyJQfrqXrXxd7LOXSK43NkXAjOfK5WvQKdjWBsWfGxusBWbieQd8YA
         w+Rw==
X-Gm-Message-State: AOJu0YzTQ0Rt2C6zlD5BPU5tllX6HFVZ8KmoiCHm4KTUSQjyrArkq1oo
	HHZq2f3g2oY3wcXQH1vIadGZun9Nsi/Y1Vb742lzhuk5w5rLFdsiK6uFD5ojlry6h6ZHiV23UMN
	kqCHWNKka0SNPlMBzXcx2PdeDxXU9+8c+
X-Google-Smtp-Source: AGHT+IG3s14Vqznj6isTvhyzRgf4Dqlydp3Nk0zekrKxUh3UwkP+alp5cwjUMOb990qnzf5AZVmLv/bvAoJ5dB0Pv3o=
X-Received: by 2002:a05:6402:34c8:b0:5c7:2209:e937 with SMTP id
 4fb4d7f45d1cf-5cf0a32061cmr8932141a12.12.1731311134153; Sun, 10 Nov 2024
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Mon, 11 Nov 2024 15:45:22 +0800
Message-ID: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
Subject: A question about "4.3.4.2 A Volatile Solution" of perfbook
To: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Greetings from me!

I am reading "4.3.4.2 A Volatile Solution" of perfbook, and come
across following summary:

    To summarize, the volatile keyword can prevent load tearing and
store tearing in cases where the loads and stores are machine-sized
and properly aligned. It can also prevent load fusing, store fusing,
invented loads, and invented stores. ...

At first I thought it means accessing volatile, aligned and
machine-sized data is atomic operation, so I wrote a small test
program to test on a "64-bit" Linux server:

#include <pthread.h>
#include <stdio.h>
#include <stdatomic.h>
#include <stdint.h>


volatile uint64_t sum;
atomic_ullong atomic_sum;


void *thread(void *arg)
{

    for (int i = 0; i < 100000; i++)

    {

        sum++;

        atomic_fetch_add(&atomic_sum, 1);

    }

    return NULL;

}


int main()
{

    pthread_t tid[4];

    for (int i = 0; i < sizeof(tid) / sizeof(tid[0]); i++)

    {

        pthread_create(&tid[i], NULL, thread, NULL);

    }


    for (int i = 0; i < sizeof(tid) / sizeof(tid[0]); i++)

    {

        pthread_join(tid[i], NULL);

    }


    printf("sum=%llu,atomic_sum=%llu\n", sum, atomic_sum);

    return 0;

}

But the result seems not:

$ gcc -pthread -O3 parallel.c -o parallel
$ ./parallel
sum=221785,atomic_sum=400000
$ gcc --version
gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

So my understanding is: volatile doesn't guarantee the atomic
operation for aligned, machine-sized data, and we can only use
atomic_xxx data types and related functions to guarantee atomic
operations. Is my understanding correct? Or I misunderstood volatile?
Thanks very much in advance!

Best Regards
Nan Xiao
