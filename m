Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20BCA50
	for <perfbook@vger.kernel.org>; Sun, 29 Dec 2024 00:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735431443; cv=none; b=pnameDQXZ3j1KceF5C6faoAkJOZDAEgIJrp0aPZSagdJDBjTFgdlqEhnANod0v1F8HMdBds+Xp9wzctPjPJdeBdkT11jNCvzc3j/07U04RiB898GIt3gavCbRikNQYvmg9u8rBuIQtXuqzNqVe7PaBuCqgBwaK3v7kySW1eoo1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735431443; c=relaxed/simple;
	bh=vy/d8Wuy5rFvW8s0leYVsRt6AxIsxhrT5HDkUtre90g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9IvL6YE1CSotGMOuPzPnYKZQYJiCspIu1TY3ViZkEpgtjiP7s1kh/6duHvCFTqng+uXz+BqkYAuFcHWXuzS+V6kultbDtxEmo/LV8oLwlGTORAmb1BtLxrg1TDpm6XCxvTBcw215NSU7uCH8RgEfVPZO7qOp/pL6pOESTUap64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxN5toY1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxN5toY1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2163b0c09afso101509785ad.0
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 16:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735431441; x=1736036241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTG117ZSrSdRL3GUAa15aXm2T8MhuaQfpnkD5wYtLfI=;
        b=XxN5toY1iJyDSxY2l5PNisd1z8fjZcANFFgf61jUboWGrjc5TZ0UZNPIqieB5s3wak
         fxNaye+M524qhV+OvXs3oDSEnXXKQKskbmN9oCNIjx+NCzXnMSYoafF65G24UC2wsZSg
         p9ZMTDDLN4D7bC26hRCWyywfh4CQ+gPv7A0YbC9x3Qi5tlSKK74ml79tQYIbU/4pbJ4Q
         so6xr0pdMeAfpwG/9ryGfpjVb5S/PWyKxjVC/4SMZpLcE6IvFoSfMORdfgjA6Uxe4JZ4
         j81jYdLINE5p/X3SZ8nKQJ/bJAcxljO0IEK0wAinUtTL51XqTgiD9ysi3D9ZuSR7f2xh
         MNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735431441; x=1736036241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTG117ZSrSdRL3GUAa15aXm2T8MhuaQfpnkD5wYtLfI=;
        b=ILFLMhBp+7A6b9PCMKhsp8XVQw1XNH/FmDzrL7xgMBMVV8RUDnRov5YI1EcFzSnBhw
         dzW+EK7UBS2/jULW/tK3YXvwP5UuhvYn5+9pu33vA0+vnFBVUMX0LnhTmpIVGOYIi1fd
         BTxx2fmVHEcYhXyMf/0rAuSXL+nbtssentLCIdiJyDUY0lNSte0st5bUf3GChyzF3HaO
         fYnttQC23eszqQVZJwXVvIJg9hohfsJVVskfpt/0uZfEGnkmEUNdZWLd3IBEV5Pxp7Y9
         61shiW7tGHPNLOMMW+AMJ8IN386uPTBrei4csS4v7nttcVJb7vmhsD7adiE27oJQXfHj
         FEvA==
X-Gm-Message-State: AOJu0Yx5LUUr4t63Qaq+oU9jtVv6ZlkURImu2CtEI3pz5ZVWJHnkvt4P
	vEnilZ/mKW6z48/U0pO7QwIr+bIr16do5KiWbhQ4m3gkI5vEOPZx
X-Gm-Gg: ASbGncvkF77lh5CBZyfaxc3ccwuUaZRAemsAip/pdXa948vr6tlU1t9o63/eFFX61B6
	GIuleRhzlQYBebF64+1+GK8lkgXgwBru4Dztlmu51bo9nqbVVO9Z8eNVwM5FDlDzWeacqyNcAtE
	zsSgX6DpYF7w3h3Ha8Yv4Xe556Vd8MqHkpqgoOyMzLyZb2fN61yJx9Eck7rbtpVZRFA6NYDOpmg
	CDrNKLb9uHGGZbw2l0d0uggocjooET4LbrErmGDDwQ+CNXiND00lAfbe4bFCj12HvHCXNLHeCOe
	6kmN3V00puxnBucXAB3CMLg=
X-Google-Smtp-Source: AGHT+IG0mum8iojvle1fRNhUA8d6z4TqUS60kS67X+cpunku5TfJSSX7hj1G+vF3ifdqIjlq6bYLKg==
X-Received: by 2002:a05:6a21:99a8:b0:1d9:c64a:9f72 with SMTP id adf61e73a8af0-1e5e0458821mr47012220637.2.1735431440902;
        Sat, 28 Dec 2024 16:17:20 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd4e2sm16684872b3a.169.2024.12.28.16.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 16:17:20 -0800 (PST)
Message-ID: <24e3f1ee-ce06-44dc-a43f-64ec0a6f4c7b@gmail.com>
Date: Sun, 29 Dec 2024 09:17:16 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
 <e55c82dec3d28d2a88dc60c680d04b25de18ea87.camel@gmail.com>
 <3ba48d72c81ae3aaa6dbfc9bd44fd30f455cd157.camel@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <3ba48d72c81ae3aaa6dbfc9bd44fd30f455cd157.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Leonardo Brás wrote:
[...]
>> Hi Akira,
>>
>> That's a creative way of dealing with this issue, but if we want to add that
>> complexity, I would rather use $(pkg-config --libs liburcu). 
>>
>> Wouldn't this fix the issue as well?
>>
>> Thanks!
> 
> Also, according to Paul's comment on v2 patch it shouldn't be needed:
> 
>>> On the other hand, sys_membarrier() was introduced in 2015 (5b25b13ab08f6),
>>> and no supported kernel (>v4.2) should still miss this syscall. Is it worth
>>> the added complexity? Is so, let's do it.
> 
>> If the -lurcu-signal is left off for old versions of the userspace RCU
>> library, doesn't it simply fall back to using explicit memory barriers?
>> Or am I yet again misremembering?
> 
>> 					Thanx, Paul
> 
> Isn't the above correct?
> 

I have no idea ..., but your v2 patch causes this build error with
liburcu <15.0:

------------------------------------------------------------------------
cc -g -O3 -Wall -fcommon -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu
/usr/bin/ld: /tmp/ccjHTQfN.o: warning: relocation against `urcu_signal_gp' in read-only section `.text'
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `_urcu_signal_read_lock':
/usr/include/x86_64-linux-gnu/urcu/static/urcu-signal.h:97: undefined reference to `urcu_signal_reader'
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `_urcu_signal_read_lock_update':
/usr/include/x86_64-linux-gnu/urcu/static/urcu-signal.h:75: undefined reference to `urcu_signal_gp'
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `urcu_common_wake_up_gp':
/usr/include/x86_64-linux-gnu/urcu/static/urcu-common.h:96: undefined reference to `urcu_signal_gp'
/usr/bin/ld: /usr/include/x86_64-linux-gnu/urcu/static/urcu-common.h:96: undefined reference to `urcu_signal_gp'
/usr/bin/ld: /usr/include/x86_64-linux-gnu/urcu/static/urcu-common.h:97: undefined reference to `urcu_signal_gp'
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `futex':
/usr/include/x86_64-linux-gnu/urcu/futex.h:72: undefined reference to `urcu_signal_gp'
/usr/bin/ld: /tmp/ccjHTQfN.o:/usr/include/x86_64-linux-gnu/urcu/static/urcu-common.h:97: more undefined references to `urcu_signal_gp' follow
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `perftest_reader':
git/perfbook/CodeSamples/defer/routetorture.h:103: undefined reference to `urcu_signal_register_thread'
/usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:126: undefined reference to `urcu_signal_synchronize_rcu'
/usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:128: undefined reference to `urcu_signal_synchronize_rcu'
/usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:130: undefined reference to `urcu_signal_unregister_thread'
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `route_del':
git/perfbook/CodeSamples/defer/route_rcu.c:124: undefined reference to `urcu_signal_call_rcu'
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `stresstest_updater':
git/perfbook/CodeSamples/defer/routetorture.h:216: undefined reference to `urcu_signal_register_thread'
/usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:260: undefined reference to `urcu_signal_synchronize_rcu'
/usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:262: undefined reference to `urcu_signal_synchronize_rcu'
/usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:264: undefined reference to `urcu_signal_unregister_thread'
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `route_clear':
git/perfbook/CodeSamples/defer/route_rcu.c:149: undefined reference to `urcu_signal_synchronize_rcu'
/usr/bin/ld: /tmp/ccjHTQfN.o: in function `smoketest':
git/perfbook/CodeSamples/defer/routetorture.h:47: undefined reference to `urcu_signal_register_thread'
/usr/bin/ld: git/perfbook/CodeSamples/defer/routetorture.h:62: undefined reference to `urcu_signal_unregister_thread'
/usr/bin/ld: warning: creating DT_TEXTREL in a PIE
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:134: route_rcu] Error 1
make[1]: Leaving directory 'git/perfbook/CodeSamples/defer'
----------------------------------------------------------------

This is under Ubuntu 22.04 LTS.

This looks to me as an unacceptable build regression.

The use of $(pkg-config --libs liburcu) didn't occur to me.

I'll give it a try.

        Thanks, Akira

