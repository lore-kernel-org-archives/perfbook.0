Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EF3143C72
	for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731317930; cv=none; b=t/qOXzL268ZsDVhmz75ViYg6Ja6pQjXS+qeIsvfcooCHIYepfZIb6KsdtvvVOWtj1CEXEK+pozGtHJcB+wGlaz4HlRO0en2cLnmqDol7vtzy8id1dB4FV9jN9qodE1OP7r8dunr8kgPFjm+Y2NGjkixvGfDccUAv/2neHk7l890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731317930; c=relaxed/simple;
	bh=nS4m34l+f3I6QcKMz/8GLfemMdI2jc2cWbw8snOgrGI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=u59hJ1hnz9UAm9TXjLmGVcuvnhN3tGWalnxm1tceREDR7cZhXCPteV/VlxkhQOdNKucgzfvh1Hjpf+AappNjd2OVbG4/jRJnoMXcsmQ1IhFR8pP0S5WetoIDW0twoq+wLq8YC1J7klL6UMIjW7kt7hB4VNL/0yHtiVoejg/EqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOdNPnJ6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOdNPnJ6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so3503488a91.0
        for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731317928; x=1731922728; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Dws0jMUxVMRD5OIL9VWuq018fCoof8UlkafKvZfIzs=;
        b=YOdNPnJ6sbf/l4EpXH8uMDdn7uiapPoPucTPqsuY4Clg0Fpnp2+8jwr3esNkGZ/xMd
         nSwwn3dw9QYr9R1i1tDfZjiUjJJ1bnKLJgN/SXGVY7yqaVr/sw/97iJk+tME5no4ohoW
         w+2dVa6kKdz1rC9NVWrvBzdkWSCpLR0nMVUfWYr7s3Sa6fRa8BwTxSNsQCg9Vk7jBO5n
         A98yzpy5h1dO0Wdj3VZmxYPDAyjndJ6VDzQepNO8PFyL944ykquHjAYjlrUUSHZgC2Up
         jccEJTFPwiD2EBLKiLNVRDkCJezZiAIHtxMtWpTMWRPPziFWD9aSX/fjh2bhMMOh35Re
         KReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317928; x=1731922728;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Dws0jMUxVMRD5OIL9VWuq018fCoof8UlkafKvZfIzs=;
        b=Ps8J+hB5iLtq9i8l88U63dwFZw+bqcAwHWJCzTpowNkn+WGrxgnzSTmmSH8Y5Brb6K
         lFs4T7u5ie6gJiyKQ6GKDcij15hAC6N8z7gUIYwm6ZDB19qIMc/H3zJvPOrnhtI0rNxv
         aK1SYaKyldtZ/8fUk2qTmAY39Y1bdFXgHpnC9JpnqsqFUaOu0B9XRmknpmDWLQAO8tyC
         uNi/dV2OC0CB8C6VlOKUI6pWqlvBEvmtA7OsivJJTyKU4W+kDjb9IFAuc38CWV9VDDk4
         1oe0gOmyvQvD+9JcfkHIPM1adXKqOQsrZp+8SbWboeqG2iqu/3I1wFQdGivN4Z+exy4R
         cUFw==
X-Forwarded-Encrypted: i=1; AJvYcCWrxHQOaAh8UwHmVJ5TNuzZdTvBRO/ed3QXDQaa0EP4I4FIcrgHwR0nll/WWflsfJsWsMpHoQmuvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqDhldH299FFt5eVNOIjPBNwluut58/WbFb96RmBJhT21Dy27A
	SByeT+pky5CMWVxnS6kk7PeMpU1sYuU1l3p1NTWCYGs7Ix8mEpL7PMb9heozy/8=
X-Google-Smtp-Source: AGHT+IF3W/VsJVTU0KZ917uGe0NP7w9mdO4ONctrQHIVWITS50oaNW92EzhslqQz3PCH/hO5Sksvwg==
X-Received: by 2002:a17:90a:d886:b0:2e2:857e:fcfb with SMTP id 98e67ed59e1d1-2e9b16aabc9mr15923866a91.19.1731317927693;
        Mon, 11 Nov 2024 01:38:47 -0800 (PST)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a62bde6sm11363748a91.47.2024.11.11.01.38.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:38:47 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: A question about "4.3.4.2 A Volatile Solution" of perfbook
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <CA+MhoaM4O-WFsc7pDBHiPoin0dqt0ZDLrZRq-SQ4z=i_T_5r+g@mail.gmail.com>
Date: Mon, 11 Nov 2024 17:38:33 +0800
Cc: Akira Yokosawa <akiyks@gmail.com>,
 perfbook@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7C3222F1-80F2-4EA5-AB70-F9922DBE4210@gmail.com>
References: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
 <317b9b3f-9dc9-4a5f-9d47-8d5b9d32b55e@gmail.com>
 <CA+MhoaM4O-WFsc7pDBHiPoin0dqt0ZDLrZRq-SQ4z=i_T_5r+g@mail.gmail.com>
To: Nan Xiao <xiaonan830818@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)

On Nov 11, 2024, at 17:30, Nan Xiao <xiaonan830818@gmail.com> wrote:
>=20
> Hi Alan and Akira,
>=20
> Thanks very much for your answers! I have another question from
> "4.3.4.2 A Volatile Solution". In this section, it mentions:
>=20
>   1. Implementations are forbidden from tearing an aligned volatile
> access when machine instructions of that access=E2=80=99s size and =
type are
> available. ......
>=20
> Then later it also mentions:
>=20
>   To summarize, the volatile keyword can prevent load tearing and
> store tearing in cases where the loads and stores are machine-sized
> and properly aligned.
>=20
> TBH, I am a little confused. Does volatile prevent load tearing and
> store tearing for aligned and machine-sized data type only? Or as long
> as the data type has related machine instructions, no matter whether
> its data type is machine-sized or not, volatile can also prevent load
> tearing and store tearing?

Machine-sized means smaller than or equal to sizeof(long).

Take a look at the implementation of WRITE_ONCE or READ_ONCE of linux.

>=20
> Thanks very much in advance!
>=20
>=20
> Best Regards
> Nan Xiao
>=20
> On Mon, Nov 11, 2024 at 4:39=E2=80=AFPM Akira Yokosawa =
<akiyks@gmail.com> wrote:
>>=20
>> On Mon, 11 Nov 2024 15:45:22 +0800, Nan Xiao wrote:
>>> Hello,
>>>=20
>>> Greetings from me!
>>=20
>> Hi!
>>=20
>>>=20
>>> I am reading "4.3.4.2 A Volatile Solution" of perfbook, and come
>>> across following summary:
>>>=20
>>>    To summarize, the volatile keyword can prevent load tearing and
>>> store tearing in cases where the loads and stores are machine-sized
>>> and properly aligned. It can also prevent load fusing, store fusing,
>>> invented loads, and invented stores. ...
>>>=20
>>> At first I thought it means accessing volatile, aligned and
>>> machine-sized data is atomic operation, so I wrote a small test
>>> program to test on a "64-bit" Linux server:
>>>=20
>>> #include <pthread.h>
>>> #include <stdio.h>
>>> #include <stdatomic.h>
>>> #include <stdint.h>
>>>=20
>>>=20
>>> volatile uint64_t sum;
>>> atomic_ullong atomic_sum;
>>>=20
>>>=20
>>> void *thread(void *arg)
>>> {
>>>=20
>>>    for (int i =3D 0; i < 100000; i++)
>>>=20
>>>    {
>>>=20
>>>        sum++;
>>>=20
>>>        atomic_fetch_add(&atomic_sum, 1);
>>>=20
>>>    }
>>>=20
>>>    return NULL;
>>>=20
>>> }
>>>=20
>>>=20
>>> int main()
>>> {
>>>=20
>>>    pthread_t tid[4];
>>>=20
>>>    for (int i =3D 0; i < sizeof(tid) / sizeof(tid[0]); i++)
>>>=20
>>>    {
>>>=20
>>>        pthread_create(&tid[i], NULL, thread, NULL);
>>>=20
>>>    }
>>>=20
>>>=20
>>>    for (int i =3D 0; i < sizeof(tid) / sizeof(tid[0]); i++)
>>>=20
>>>    {
>>>=20
>>>        pthread_join(tid[i], NULL);
>>>=20
>>>    }
>>>=20
>>>=20
>>>    printf("sum=3D%llu,atomic_sum=3D%llu\n", sum, atomic_sum);
>>>=20
>>>    return 0;
>>>=20
>>> }
>>>=20
>>> But the result seems not:
>>>=20
>>> $ gcc -pthread -O3 parallel.c -o parallel
>>> $ ./parallel
>>> sum=3D221785,atomic_sum=3D400000
>>> $ gcc --version
>>> gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)
>>> Copyright (C) 2018 Free Software Foundation, Inc.
>>> This is free software; see the source for copying conditions.  There =
is NO
>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR =
PURPOSE.
>>>=20
>>> So my understanding is: volatile doesn't guarantee the atomic
>>> operation for aligned, machine-sized data, and we can only use
>>> atomic_xxx data types and related functions to guarantee atomic
>>> operations. Is my understanding correct? Or I misunderstood =
volatile?
>>> Thanks very much in advance!
>>=20
>> Your code above does mostly the same things as Listings 5.1 and 5.2 =
in
>> Section 5.1 "Why Isn=E2=80=99t Concurrent Counting Trivial?".
>>=20
>> "Atomic (or volatile) accesses" and "atomic increment operations"
>> are quite different.
>>=20
>> Please read on!
>>=20
>>        Thanks, Akira
>>=20
>>>=20
>>> Best Regards
>>> Nan Xiao
>>=20
>=20

