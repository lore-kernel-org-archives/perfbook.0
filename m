Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB8B67F
	for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311407; cv=none; b=U1Xi6VUDBmoguxQ5mS4v1okWbXTr3Lhf5+SfQh2YWGFiySkoIMMCghYNdte5hxLIwjptPJuT8Pyp4G6oES3CU7DnQt5xz8Q6uiZdGrV9i9hLqeHzfCi/xWTOnV91Iq9EGHiM+HNdeLcu4BDcrVvLMIh8hEEap4ZW8pVc7C0vzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311407; c=relaxed/simple;
	bh=yS0bSD5i5hLRA8Xq5Z+0jd8JdYasTi3Peozsq1TpQdQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dwZ3lQmN2w11nO0o+kZxjmtutvD6sWwVFN4Ipw/LrAeEcNzNqE3FZQtODXsqcOssXeyiPTKfzaTueIi/SEOrKYwG4gNGy6iyTPNojlIxLvmKhuxjuMZIl/kmc9ELWpBUr9epnXCt1HtQIhxT3IE/OSEm94n9225QbjTGQkJMKZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj5GbcVH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj5GbcVH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c8b557f91so45330375ad.2
        for <perfbook@vger.kernel.org>; Sun, 10 Nov 2024 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731311405; x=1731916205; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NSwdLMRv0ikwljbpuCpSGxOACkKIbCDps1wBrDb27k=;
        b=Gj5GbcVHcFzxcyc2PuGfM9eI8PZQJMtxqxaSWy9wb+Hn6QJLxZetzLXIg+y1yaD4X9
         3tDY5YbrVv/CqiOjKgekbxgeg3d6dBk9XHMEZvcgn3RNhpykxsSIfpZ5vmz7zNr+zuLo
         tVSnlKOvNUA/IAekYU4mn8CHNVRiS6lSV9JMWlgsI/8Ug7Xep3Cst17jJPFkSC2G6fnL
         BKVysmDDupcTAE5G3RMuFoRLPr8/c+brq8N9xXrJ3CDSzDK61DLWKuuy3ko86I9Qw/ML
         NL1Mywh0xkEymTsQxP6H3H3lhu+ztunTbTYfGdfmGDQ35stkZXehoVHSwN2N0nAj7Pbf
         OXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311405; x=1731916205;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NSwdLMRv0ikwljbpuCpSGxOACkKIbCDps1wBrDb27k=;
        b=nvESe5oKeg4nkKcGN66WEei+lgXcZYHp2rk4jfwD8DrfneD+/nvQF+HS8xmjk//UKO
         Zi9+xBKGmvZFn3dyWaA5XJst6OMwNvybiTwwth0WtoBCYExFZqn9wR+SBv+qTss2EfTO
         jaEF/+2lxZXwnP7Al83+GDC3xPceqlTFu5mMHtcY1tdpU+zcTRlWWiSDofobl/x+4mIs
         tZJmqtS+JCQq6QZYPxT22zK6FnhboBBQr/wjbYcfQZ8XvRYhqVNsBXNXzTCqhT7b1ZCD
         zv+8RjJfYATnay+Pi97dcbUxcPbUGrgDavJ9Wdy6tAqTQrhpSn5UPthsgUUwAI24btmW
         miYA==
X-Gm-Message-State: AOJu0Yxq/6U27LIEJkbMUYks1TYpDzByutJN9uS2THq50TEJPzuZvFqu
	M4+jCJQN6pJz0qMCvByrPvqYcW+qZ3UqeAd2y98ExwnS8xyT3Lk4qG3rqsCDACY=
X-Google-Smtp-Source: AGHT+IFeoI+PgtEKmTxy5KiTpT+EmTgHmZG8d2Q5igHaf3i4Ke2tDaXV23y1KMeIHDdQE9Wxxu0gkQ==
X-Received: by 2002:a17:902:f70e:b0:211:6b37:8b4d with SMTP id d9443c01a7336-21183d78606mr150382635ad.45.1731311405024;
        Sun, 10 Nov 2024 23:50:05 -0800 (PST)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddd621sm70348065ad.61.2024.11.10.23.50.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Nov 2024 23:50:04 -0800 (PST)
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
In-Reply-To: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
Date: Mon, 11 Nov 2024 15:49:51 +0800
Cc: perfbook@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <82F0C62A-2952-4007-80F9-AC7B5AB8AF23@gmail.com>
References: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
To: Nan Xiao <xiaonan830818@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)

On Nov 11, 2024, at 15:45, Nan Xiao <xiaonan830818@gmail.com> wrote:
>=20
> Hello,
>=20
> Greetings from me!
>=20
> I am reading "4.3.4.2 A Volatile Solution" of perfbook, and come
> across following summary:
>=20
>    To summarize, the volatile keyword can prevent load tearing and
> store tearing in cases where the loads and stores are machine-sized
> and properly aligned. It can also prevent load fusing, store fusing,
> invented loads, and invented stores. ...
>=20
> At first I thought it means accessing volatile, aligned and
> machine-sized data is atomic operation, so I wrote a small test
> program to test on a "64-bit" Linux server:
>=20
> #include <pthread.h>
> #include <stdio.h>
> #include <stdatomic.h>
> #include <stdint.h>
>=20
>=20
> volatile uint64_t sum;
> atomic_ullong atomic_sum;
>=20
>=20
> void *thread(void *arg)
> {
>=20
>    for (int i =3D 0; i < 100000; i++)
>=20
>    {
>=20
>        sum++;
>=20
>        atomic_fetch_add(&atomic_sum, 1);
>=20
>    }
>=20
>    return NULL;
>=20
> }
>=20
>=20
> int main()
> {
>=20
>    pthread_t tid[4];
>=20
>    for (int i =3D 0; i < sizeof(tid) / sizeof(tid[0]); i++)
>=20
>    {
>=20
>        pthread_create(&tid[i], NULL, thread, NULL);
>=20
>    }
>=20
>=20
>    for (int i =3D 0; i < sizeof(tid) / sizeof(tid[0]); i++)
>=20
>    {
>=20
>        pthread_join(tid[i], NULL);
>=20
>    }
>=20
>=20
>    printf("sum=3D%llu,atomic_sum=3D%llu\n", sum, atomic_sum);
>=20
>    return 0;
>=20
> }
>=20
> But the result seems not:
>=20
> $ gcc -pthread -O3 parallel.c -o parallel
> $ ./parallel
> sum=3D221785,atomic_sum=3D400000
> $ gcc --version
> gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)
> Copyright (C) 2018 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There =
is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR =
PURPOSE.
>=20
> So my understanding is: volatile doesn't guarantee the atomic
> operation for aligned, machine-sized data, and we can only use
> atomic_xxx data types and related functions to guarantee atomic
> operations. Is my understanding correct? Or I misunderstood volatile?
> Thanks very much in advance!

Atomic doesn=E2=80=99t mean cache coherence.

>=20
> Best Regards
> Nan Xiao
>=20

