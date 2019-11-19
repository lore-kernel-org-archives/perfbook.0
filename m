Return-Path: <SRS0=aj67=ZL=foxmail.com=laokz@kernel.org>
Message-ID: <5dd3f840.1c69fb81.26205.0055SMTPIN_ADDED_BROKEN@mx.google.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1574172711;
	bh=vHM3636TnhLqgFVjmolfgkoLeGywNSdPlTQyCcDNBGw=;
	h=Message-ID:Subject:From:To:Date:MIME-Version;
	b=OkBKMXychfLn8OFsoYClNB55Idm+Vd1byYJKe3aNbFCVkqdocsAt9ba6F/d9BeWDn
	 9f4xsfN3nVxgIOQutazl1S0PLJ0A/zWej6EFCrZ/OphRezIONl0c4xyywRawtXsBES
	 CFng7HXlGhS2QzExJYYQ2yJ+oToOK2x8kAMBpXSQ=
Subject: how to understand cpu in-order commit
From: laokz <laokz@foxmail.com>
Date: Tue, 19 Nov 2019 22:11:48 +0800
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook mailing list <perfbook@vger.kernel.org>
List-ID: <perfbook.vger.kernel.org>

Hello Paul,

With your perfbook help, now I can understand base memory-model issue. Such
as tools/memory-model/litmus/LB+fencembonceonce+ctrlonceonce.litmus :

P0(int *x, int *y)
{
	int r0;

	r0 = READ_ONCE(*x);
	if (r0)
		WRITE_ONCE(*y, 1);
}

P1(int *x, int *y)
{
	int r0;

	r0 = READ_ONCE(*y);
	smp_mb();
	WRITE_ONCE(*x, 1);
}

exists (0:r0=1 /\ 1:r0=1)

But wonder how about cpu in-order commit. So I removed smp_mb(), the litmus
test showed the result exist! This confused me. In my understanding, cpu in-
order commit means out-of-order-execution results commit to register/memory
in compiled program order. That is cpu P1 must retire r0=y first then x=1,
thus P0 can see P1's update of x. So P1's r0 should never be 1.

Is this caused by LKMM's compatibility with out-of-order commit
architectures? Or what's wrong with me?

Wish your kind help.
laokz



