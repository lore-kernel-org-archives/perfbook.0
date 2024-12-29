Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748042594A6
	for <perfbook@vger.kernel.org>; Sun, 29 Dec 2024 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735439164; cv=none; b=dkO4oxfPhhCFnN63oZbXV1OI9cVQHFTk/P4nRAhHJ1TtE9g6eq3ROk/ZnUm17lXLwKZKr7S2qqgXfzXxRQVBGDC31yHx60Y5gmjGShrzWlgPaNSFIi22lBfNVq8ln1epa2DQ7vz0nBJUKY88SDsGUCGrHTqRS75YBZP9c1+yvKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735439164; c=relaxed/simple;
	bh=K1KsvSojg2gA2GrQCQ3o7lwurWMgs91MMfWPcWxOtpA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GfP3/cG1NC2gHW/1eKZyVL6BLsDEa0hGJZWY3SnecwBX0x5/rQ7rDcZ2GR0NpM1gceojooz55qU+F2xXaKv5Vv2BgKPZrYvYRYuVyQggJf3DYmoCti5uhBUG61C+b1o33GdB2kIest/KfbK5Yeor94UA0HaLnDv9qw/NzEZFXOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3tIYBka; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3tIYBka"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef748105deso8145062a91.1
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735439163; x=1736043963; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UfAxi/xzhPwux+4T79EprIpKJqfs4P6mx89T0PDuLAY=;
        b=h3tIYBkaVvnY6da6n2jETpiIRqDlPhR1uapMHnzCrBumtlET/oUZXeyB8slgKZaiif
         ZQ8v1dE2m0TV0vWma9dzIEB9NW4bOjEt8Vp4mbElmTluPTwSSVCEYRwIxE5fNr1DqB6o
         pUm2u4ipwYSh9LEp30AtguC4vaff6CXXPxKzQ6jDbVpL38/oyLPuZiNNG/L7QxV19nPo
         Utd47jUw967T7iedRm4hyhtu71dPQRbWXnG05+GvJebm66LSxZa8Nw8B+HI+GN6UkU3U
         1hhzU32Rk5ClaWEwRNLmlXKN83V8CSyfJLUX1O/OUjwHKD+pJ0Wwo1ca6/nSwKiSzHpq
         4N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735439163; x=1736043963;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UfAxi/xzhPwux+4T79EprIpKJqfs4P6mx89T0PDuLAY=;
        b=FmOxbYSL8FMVTXoMNVKkKvGxptbsB3fR9FUjHSUouiljb/XNutV9XJeneKwquU64Wi
         XijEZHw+9jINUw5a83zikeTcFj0f10lO5hPHN40b/gA80cyhcEfHa1jAoeoff5tg6pQv
         R4BQw9SeRBsZMzp5EQbVlUIvo7QFjuL3ZpfdKRbaB58xZx/dSCMaDxJA05i3HLlM3jda
         uYn34JH1CcPOKtpGllXEeehIHrVmrSz6EL11khXo6iyfUNLpZAD3V/4EkQVhR6Cyt43Z
         OY46oA9hRgR1hBr1VQC4My3VxgOCqv/4NOh3vQnzr7wnqvr4SuJSS6GJByDPAs/qyw2U
         /39w==
X-Gm-Message-State: AOJu0Yx/HXQ4uB95YEgmShngBP8cuRhX8xAeBF+ismGf4AAC1DvT0kyh
	5WkRo76t/BXKXncdIiKBZibTjgbsD/TuO7luQ2vAOULGwjpkk5j+
X-Gm-Gg: ASbGncuQDny+UZ0cMRvM2QQPzcK3QNhQ3DfSSm482bt3AfrtkAtoh5547uI3ns6+RiG
	fzxJ8uzAYzrn2PEDCfvbwj9JgI3UzEC627u2hznrQPW0AS8UF0ddX+Y6SGOx3/KlO9vaTx5/2wS
	bgM34uZ2DEheRwJn5ftLQXv/KYuJc0lbcXp3O3zvNwBiwWJ2vMhjELfaciTvbkc//8q+iXTPOei
	bXzH8TwWaMiWVZMZB12GZqBjyKe9QAkZGUHkyEkUP/x4Kt37IeRoDhKNPEg+5NI6dh+IGYaooWi
	DdCPMgnARkckJt2bqiraDQAOMs8=
X-Google-Smtp-Source: AGHT+IHFyaUnq/9kCiVyigcOVoIHf6pdZz+UlV/UJ58DKY889w6l1Fk1SXHRB975NkdUFJwYRs7rwQ==
X-Received: by 2002:a17:90a:d648:b0:2ee:bc1d:f98b with SMTP id 98e67ed59e1d1-2f452f013fbmr39315168a91.31.1735439162676;
        Sat, 28 Dec 2024 18:26:02 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447798982sm18187000a91.1.2024.12.28.18.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 18:26:02 -0800 (PST)
Message-ID: <adcb2f2781085d86d26909fa1bb14437a29b2d35.camel@gmail.com>
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
Date: Sat, 28 Dec 2024 23:25:59 -0300
In-Reply-To: <24e3f1ee-ce06-44dc-a43f-64ec0a6f4c7b@gmail.com>
References: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
	 <e55c82dec3d28d2a88dc60c680d04b25de18ea87.camel@gmail.com>
	 <3ba48d72c81ae3aaa6dbfc9bd44fd30f455cd157.camel@gmail.com>
	 <24e3f1ee-ce06-44dc-a43f-64ec0a6f4c7b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-12-29 at 09:17 +0900, Akira Yokosawa wrote:
> Hi,
>=20
> Leonardo Br=C3=A1s wrote:
> [...]
> > > Hi Akira,
> > >=20
> > > That's a creative way of dealing with this issue, but if we want to a=
dd that
> > > complexity, I would rather use $(pkg-config --libs liburcu).=20
> > >=20
> > > Wouldn't this fix the issue as well?
> > >=20
> > > Thanks!
> >=20
> > Also, according to Paul's comment on v2 patch it shouldn't be needed:
> >=20
> > > > On the other hand, sys_membarrier() was introduced in 2015 (5b25b13=
ab08f6),
> > > > and no supported kernel (>v4.2) should still miss this syscall. Is =
it worth
> > > > the added complexity? Is so, let's do it.
> >=20
> > > If the -lurcu-signal is left off for old versions of the userspace RC=
U
> > > library, doesn't it simply fall back to using explicit memory barrier=
s?
> > > Or am I yet again misremembering?
> >=20
> > > 					Thanx, Paul
> >=20
> > Isn't the above correct?
> >=20
>=20
> I have no idea ..., but your v2 patch causes this build error with
> liburcu <15.0:
>=20
> ------------------------------------------------------------------------
> cc -g -O3 -Wall -fcommon -o route_rcu route_rcu.c ../lib/random.c -lpthre=
ad  -lurcu
> /usr/bin/ld: /tmp/ccjHTQfN.o: warning: relocation against `urcu_signal_gp=
' in read-only section `.text'
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `_urcu_signal_read_lock':
> /usr/include/x86_64-linux-gnu/urcu/static/urcu-signal.h:97: undefined ref=
erence to `urcu_signal_reader'
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `_urcu_signal_read_lock_update'=
:
> /usr/include/x86_64-linux-gnu/urcu/static/urcu-signal.h:75: undefined ref=
erence to `urcu_signal_gp'
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `urcu_common_wake_up_gp':
> /usr/include/x86_64-linux-gnu/urcu/static/urcu-common.h:96: undefined ref=
erence to `urcu_signal_gp'
> /usr/bin/ld: /usr/include/x86_64-linux-gnu/urcu/static/urcu-common.h:96: =
undefined reference to `urcu_signal_gp'
> /usr/bin/ld: /usr/include/x86_64-linux-gnu/urcu/static/urcu-common.h:97: =
undefined reference to `urcu_signal_gp'
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `futex':
> /usr/include/x86_64-linux-gnu/urcu/futex.h:72: undefined reference to `ur=
cu_signal_gp'
> /usr/bin/ld: /tmp/ccjHTQfN.o:/usr/include/x86_64-linux-gnu/urcu/static/ur=
cu-common.h:97: more undefined references to `urcu_signal_gp' follow
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `perftest_reader':
> git/perfbook/CodeSamples/defer/routetorture.h:103: undefined reference to=
 `urcu_signal_register_thread'
> /usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:126: undefined=
 reference to `urcu_signal_synchronize_rcu'
> /usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:128: undefined=
 reference to `urcu_signal_synchronize_rcu'
> /usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:130: undefined=
 reference to `urcu_signal_unregister_thread'
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `route_del':
> git/perfbook/CodeSamples/defer/route_rcu.c:124: undefined reference to `u=
rcu_signal_call_rcu'
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `stresstest_updater':
> git/perfbook/CodeSamples/defer/routetorture.h:216: undefined reference to=
 `urcu_signal_register_thread'
> /usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:260: undefined=
 reference to `urcu_signal_synchronize_rcu'
> /usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:262: undefined=
 reference to `urcu_signal_synchronize_rcu'
> /usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:264: undefined=
 reference to `urcu_signal_unregister_thread'
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `route_clear':
> git/perfbook/CodeSamples/defer/route_rcu.c:149: undefined reference to `u=
rcu_signal_synchronize_rcu'
> /usr/bin/ld: /tmp/ccjHTQfN.o: in function `smoketest':
> git/perfbook/CodeSamples/defer/routetorture.h:47: undefined reference to =
`urcu_signal_register_thread'
> /usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:62: undefined =
reference to `urcu_signal_unregister_thread'
> /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
> collect2: error: ld returned 1 exit status
> make[1]: *** [Makefile:134: route_rcu] Error 1
> make[1]: Leaving directory 'git/perfbook/CodeSamples/defer'
> ----------------------------------------------------------------
>=20
> This is under Ubuntu 22.04 LTS.
>=20
> This looks to me as an unacceptable build regression.

Oh, thanks for helping me understand. I thought previously that this would =
only
hit kernels without sys_membarrier() support, but now I get this triggers a
build error, which makes sense.

Out of curiosity, I did a new version that should take care of this. I will=
 send
it as a v4, so please give it a test.


>=20
> The use of $(pkg-config --libs liburcu) didn't occur to me.
>=20
> I'll give it a try.
>=20
>         Thanks, Akira
>=20

