Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0035263899
	for <perfbook@vger.kernel.org>; Wed, 26 Nov 2025 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171812; cv=none; b=rJzMU0O6VAJWFYy8Cv6aYUKyQkYCCp+dVKLpLJNYlP14ARh13oQUdqtO68OyFgLSzO3gnz1kTFHJp8vbBEkhrAy8CVp8vqf1Vuc9q63aKgSRFmqfn1WYtpWKe/T7kBLcZ3aJgMh2FViGHCdeF38fskwCvajSy+L3nn8nWDENGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171812; c=relaxed/simple;
	bh=NZs8NL2q+mKOl40Rje6mcONmssk6kiofc2MtEX9l67M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dnwmClo+ZBAt6QZN+muUnh0aqdNEwXI+qOJ7eitI4et9i0LuV1DYtJlqQkXP/xXPd5idHpIjHVRvWWWyIGLhYAeqb1BvSqFhcqZPZz/W6LSbpHnN4leRafn8ErCVal6veKWzSzvlGcxSqiHNEUTKGyFyXQyaLIieBAoxMWUQsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy+qlOIC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy+qlOIC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10845815b3a.3
        for <perfbook@vger.kernel.org>; Wed, 26 Nov 2025 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764171810; x=1764776610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EqWPC8VrnJAuMZFNy/C2NxjpnTQchoDrBuBlJco175Y=;
        b=Sy+qlOICXtIT7K/FDJp3pobhN0vHPIHwLrtQchklEzrHh0zLJSrG968+AdVAWhV4aU
         EaSu2+DlFOB95eiCY0SLC79QNNObHQzpMDaa8azYtwWMF+0V0HXe61jwqofg/M26M8Jt
         bTmMBaimGyPKuTbyQU3jB322YR2Vly3RKO2hVM0Jgyc4bZ3oQHzwHpxjgqV5wSrCKTj5
         8Huo9ep/ayLXdK5Dxj6DtNaOrMHuC5eEI3gRM5kz9Fvi+Q06d1x2dzouJDMkq8qNkBQW
         LmmldBaM4HevmbL7zWo2PwcjziKj7fwdKoA/bjpmOWi7o5kB9iVWHVOkCxY/fRnePStE
         O//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171810; x=1764776610;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqWPC8VrnJAuMZFNy/C2NxjpnTQchoDrBuBlJco175Y=;
        b=fyMH21VqbS9YT8qqj0I7grmzhJx6o53REGo/VfPzhTGEcde9HzgSfTmLWhD/tSEgRH
         gITQgE9l9DBjFHM/bhCMf4yhIHD0JP0/RERmXIorsAq65E/sYra3loFxTSvZhJkX4gSu
         DXyBtCrBUDTKc5sl30HJXO3cxVfUDsYsH9kueUv8w5By5a3KDsK7KtRJndSPEu+0cX8+
         Y+M7b35M9ODsVHc6dP7PIxtvrFgsVbWW/o+dr7KzrcSDpOH7ldwyVKj/bv8ul+WhHS96
         xARfItAO0vAAEgXKSnsq+q1lo1GUVvbPL28d3TcPD9zf/24cAApzR+UBPU8HjB4HQtxk
         i0ew==
X-Gm-Message-State: AOJu0Yzsu3vTccCZyVJHmd6U2L5AJz4KGrDp44ZbYkObESyYShjL5OY3
	1CHE27N9F+NOdQlAWnaBmBKusTUtWh5WOU7NX2T5z34iLR0vcidKnQju
X-Gm-Gg: ASbGnctWQ/O5EEQ0huHpYvk/aB/YHYBWcwdj68ShME31DosRKpzOCKJIM30UMWGNFCz
	ksNRwXSEOYw/Hjg9lHzSIaKuanE/Z8ku/r0GHhc6jSItZ9LneAJHYyRlOmfBBzL04Y4LHBlWsso
	0P3eKFoYhwe5O32HoscR6GiXtIBi1BgJVaO3MO+UKTNXjme01V3BIZLaZh5UMaOpvnSKYHIknaR
	CrgF6x8tc1GgO6YR7gHxcYVMpbJ5WDA78RyTPmld5tMbsatKNEvWwoiJXvUWOpGPLIo891pvFrw
	GtznuCALkbovjSch7uRPHDSkdr8n3Dzu3A+nW/mzBrNMlLvSxke8ZZ91geuS3ksLLTZH4okgPOx
	rWBMG/3ToyBti3n+s7+rzBYDDSv90ryABRLNVDJXABj7qMOvEwOyWXoXWnLudUPeGG9wHUzTLdS
	UvD6xE7Lx9JbhYzfGp/lyc4ePcKAkfQwVuzXGzPL+RWyJ12hB+tYZ2cHDl
X-Google-Smtp-Source: AGHT+IGt0nYRfG+OzV1W6R4hblhJjvakbpc9D0rA2tm5AIaHYedNYkghU3yaRKGNA86i+lISciUNxQ==
X-Received: by 2002:a05:6a00:198e:b0:7a9:8770:ce5a with SMTP id d2e1a72fcca58-7ca8975eeeemr7691963b3a.20.1764171809961;
        Wed, 26 Nov 2025 07:43:29 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0a67a4csm22152125b3a.48.2025.11.26.07.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:43:29 -0800 (PST)
Message-ID: <a6128f7a-a811-4121-b877-4103782f3fdc@gmail.com>
Date: Thu, 27 Nov 2025 00:43:28 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH -perfbook 0/3] CodeSamples/formal/herd: Tweaks for new
 litmus tests
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
 <7c5487c4-1ecd-4522-b14e-dd00d4c52319@paulmck-laptop>
Content-Language: en-US
In-Reply-To: <7c5487c4-1ecd-4522-b14e-dd00d4c52319@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 24 Nov 2025 09:14:57 -0800, Paul E. McKenney wrote:
> On Mon, Nov 24, 2025 at 06:10:56PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I see a couple of minor issues in running
>>
>>    - make cross-klitmus; cd klitmus; make
>>    - make run-herd7
>>
>> under CodeSamples/formal/herd/.
>>
>> This patch set should resolve those issues.
> 
> Queued and pushed, thank you!

Paul, this is a side note with regard to klitmus7.

In the old days with Linux kernel <6.0, tests listed in KLITMUS_READY
took less than a minute.

That have changed a lot.  Litmus tests with RCU primitives tend to
take much longer.

In the list of processes shown by "top", such klitmus threads are
accompanied by a single (and fairly busy) "rcu_exp_gp_kthread_worker".
Yes, the frequency RCU primitives are invoked in those litmus tests,
especially synchronize_rcu(), is unusually high.  In realistic workloads,
such burst of synchronize_rcu()s would indicate you are doing something
wrong.  So the longer time to complete does not mean any performance
regression.

Following is a list of summaries from C-RomanPenyaev-list-rcu-rr runs
under several VMs:

- Ubuntu 20.04 POWER8 (kernel: 5.4.0-223-generic #243-Ubuntu SMP, 8 CPUs)

  Hash=890796f9231134fff935fc64b2b98940
  Observation C-RomanPenyaev-list-rcu-rr Never 0 4000000
  Time C-RomanPenyaev-list-rcu-rr 17.85

  no rcu_exp_gp_kthread_worker.

- Ubuntu 24.04 POWER9 (kernel: 6.8.0-88-generic #89-Ubuntu SMP, 8 CPUs)

  Hash=890796f9231134fff935fc64b2b98940
  Observation C-RomanPenyaev-list-rcu-rr Never 0 4000000
  Time C-RomanPenyaev-list-rcu-rr 153.49

  no rcu_exp_gp_kthread_worker observed.

- Ubuntu 24.04 x86_64 (kernel: 6.8.0-88-generic #89-Ubuntu SMP PREEMPT_DYNAMIC, 6 CPUs)

  Hash=890796f9231134fff935fc64b2b98940
  Observation C-RomanPenyaev-list-rcu-rr Never 0 3000000
  Time C-RomanPenyaev-list-rcu-rr 60.46

  no rcu_exp_gp_kthread_worker.

- Ubuntu 25.10 x86_64 (kernel: 6.17.0-7-generic #7-Ubuntu SMP PREEMPT_DYNAMIC, 6 CPUs)

  Hash=890796f9231134fff935fc64b2b98940
  Observation C-RomanPenyaev-list-rcu-rr Never 0 3000000
  Time C-RomanPenyaev-list-rcu-rr 311.79

  rcu_exp_gp_kthread_worker consumes a lot of time.

- Fedora 43 x86_64 (kernel: 6.17.8-300.fc43.x86_64 #1 SMP PREEMPT_DYNAMIC, 6 CPUs)

  Hash=890796f9231134fff935fc64b2b98940
  Observation C-RomanPenyaev-list-rcu-rr Never 0 3000000
  Time C-RomanPenyaev-list-rcu-rr 326.54

  rcu_exp_gp_kthread_worker consumes a lot of time.


Just out of curiosity, is there any knob I can tweak to reduce the time
to complete, preferably some kernel boot arg?

        Thanks, Akira
