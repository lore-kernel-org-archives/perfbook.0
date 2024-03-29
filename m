Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0510864C
	for <perfbook@vger.kernel.org>; Fri, 29 Mar 2024 01:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711675399; cv=none; b=ZIPiBt6GFeFd2H3BHvy3AUUmFfPth230DBJNB8R1TI/rAi399y1+2iQTy7vNqkZrsJ6UyA9DY9nAXR7+S+X6ZqVwKQy2VhUa2VPaMtlcxfQ1lHSpc1CqFejWXovomfznKdAodxVGj23iSVscDvvufgF4F3FQ6YOwjcjePPHH198=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711675399; c=relaxed/simple;
	bh=7VFtstKS/zkEL0YnZbtmaX5uk/0hWl/ZW1xpfTdXVQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agc578D5nrEHCj9oonoRBZ2NQw2FWbOWnXNDdm8+keuKMHtLiXVGEZazzqPdtuDAs3h5z7fn6MmeMzlX/z/dKlwb1egr+hLMok5sCKEAAE6y7cIjd6eW6/YbHUX99IE90IWRmRLchQC5G9dn1RISR6jFd4k0bhLnh7XzJ5CZ20g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUlaQ2QK; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUlaQ2QK"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so1531517b3a.1
        for <perfbook@vger.kernel.org>; Thu, 28 Mar 2024 18:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711675397; x=1712280197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+fjGk37QQhwyhdzlF9a9wanL/msJula+3H33zItDwuM=;
        b=cUlaQ2QK8TQos+3LTasHvoYf8APeHnVivGhtx/fQsZyH1GNpueOD3znAXOVxxs4Ap9
         PndGStA2O9uQM+FPQd5SAwSgD3U7bIj8HYqop9FLsxKk6nxJx6cXQy1acBoBAsXoxOWR
         z7+z2QFtF5aqGF0nAQQPCqS5mQEUdhrmDgpgSXGRxmdjJPrfjX8uT80+8zZO0Yirthy9
         QFA99HYjTQ1zzFO87XZbHrgW+MFR0TFrenWXljWc7py6sQqo99mlq5+mVTCztNF9ZNxH
         zuvau8PGFPcjcit4siMiLtYNL8AP4V4T5JBa5s6Pn9K5DUFcjRIvrXayVagjwQ2+t02s
         Ju2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711675397; x=1712280197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fjGk37QQhwyhdzlF9a9wanL/msJula+3H33zItDwuM=;
        b=e9shehHoJH1F4YokhPtFxgr5vDx0o3ZLgm3G6fGw3gffJADa3YH4mLpTZBvDADbQJI
         +J11ZxlqdriI1NSXA9bfxx8Duf/yXNPawiVwre1ytiSOxTmdx3h0KF2P3aQhfOJ+Qade
         l1pHc/9sQHjXE+X7zQ3EbUZ7c7Nlc366l9mJPqS8EQX/8fniukBN0I2pbCE2+5xR87PB
         jIqPqTT2TNrgmAHsnY2rTKgItnv65VZ9CL++PRqCIgRNOcMTUeFNBIUJNUxp47kFgJ5S
         rROG/aNAgLj6v5haHaM+tcY6/Is/Zpqx7SOBsasY6YytKm9QBBRo94LAAHOYFL3msBdv
         1/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbHVcP7k/VMymJmwovPysR40Z8Q0vEi3ep395w6c/KyNob//+4coDjWOO6vCN3lBKIx24QvHQ1MAYv7fQMdsUbG65XNrpJMZo=
X-Gm-Message-State: AOJu0YwZiFnVDTe8gCcdardjPdHHrrNp/uqR+92eEDD03YOFAIYHQ3EU
	HFo303JfJNfRJw3U8/HIc6M7JVoGs1lxOIeP9sjkfoGDZO2Y2ERD
X-Google-Smtp-Source: AGHT+IFXYcO/I4kgZtfDI+aTSRByt21BO7GX9XEk8eR+qDCu2aqKuJczaa9nCuJq+WT45+DXbKjydA==
X-Received: by 2002:a05:6a00:139c:b0:6ea:86f2:24fb with SMTP id t28-20020a056a00139c00b006ea86f224fbmr1072934pfg.25.1711675397188;
        Thu, 28 Mar 2024 18:23:17 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id y13-20020a62b50d000000b006e6c6a50e5esm2024270pfe.34.2024.03.28.18.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 18:23:16 -0700 (PDT)
Message-ID: <be702549-8f90-4351-a1cd-e5491f890a9d@gmail.com>
Date: Fri, 29 Mar 2024 10:23:14 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR
 sigatomic_t
To: Elad Lahav <e2lahav@gmail.com>, paulmck@kernel.org
Cc: Guilherme Janczak <guilherme.janczak@yandex.com>, perfbook@vger.kernel.org
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
 <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>
 <v4xac5cuhx3zzyvyg7f6q2ehrss7u7nayncskwygglwqotbfom@7oj5pnoialze>
 <36283212-fc58-4bb9-9768-e5f8cea12487@paulmck-laptop>
 <CAJbg=FXkTO1KObfi-K6fxHb5nh3CaMHXR9FcPLO5hGf=3eGX_Q@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAJbg=FXkTO1KObfi-K6fxHb5nh3CaMHXR9FcPLO5hGf=3eGX_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Somehow, all messages from Guilherme ended up in my spam folder
and I couldn't follow this thread properly earlier.  I think I now
see the context.

On Thu, 28 Mar 2024 12:30:26 -0400, Elad Lahav wrote:
> Looks like this patch wasn't merged. Regardless of my
> questions/observations, Guilherme is absolutely right that volatile is
> required for sig_atomic_t by the standard. It may also need to be
> mentioned that, despite its name, the only operations that can be
> safely done on sig_atomic_t are store and load - it does not provide
> read/modify/write atomicity, unlike the lock-free atomic types. The
> standard says so, but it's easy to miss:
> 
> "the signal handler refers to an object with static or thread storage
> duration that is not a
> lock-free atomic object other than by *assigning* a value to an object
> declared as
> volatile sig_atomic_t"

Hmm.

perfbook's (or LKMM's) style of *not* putting volatile at variable
declarations, but marking accesses to shared variable with
READ_ONCE()/WRITE_ONCE() when needed does not require the shared
object to be declared as "volatile sig_atomic_t".

As far as I can see, that is Paul's take throughout perfbook.

There are a couple of mentions to sig_atomic_t elsewhere.

Footnote 9 in Chapter 4:

    That said, the various standards committees would prefer that
    you use atomics or variables of type sig_atomic_t, instead of
    READ_ONCE() and WRITE_ONCE().

Answer to Quick Quiz 5.54:

    The theft variable must be of type sig_atomic_t to guarantee
    that it can be safely shared between the signal handler and
    the code interrupted by the signal.

If Guilherme's change is to be accepted, above sentences may need
some rewording as well for consistency, I guess.

My preference is to keep Listings 5.17 and 5.18 intact.

Sidenote:

You might be interested in Linus' recent remark on volatile
casting of LKMM vs C/C++ standards on volatile declaration at:

    https://lore.kernel.org/lkml/CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com/

(Warning: lengthy thread)

I'm not saying I agree 100% with him, but I'm accustomed to LKMM's
way so much that I don't like to see variables declared volatile... :-/

        Thanks, Akira

