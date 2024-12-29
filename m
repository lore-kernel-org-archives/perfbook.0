Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3282B9BB
	for <perfbook@vger.kernel.org>; Sun, 29 Dec 2024 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735468102; cv=none; b=ARqSU2T8MCITKtX01V0WNScV0mqVwgaLRpbUbzd+iTcO16h3e6YQuQYf9HwkEt8PatVforud4kyh882q/zq3mv0NfYIRsK3L/hzi3h9KlRcEByb3XHQfH8xr+OwH/sQPR8i5z+OL54X7IOkgrEVJeuYUYRNCsF+C5hzkYfGle+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735468102; c=relaxed/simple;
	bh=EGBlaDWiZFbi0F7uHcqJ5NjOOx3f4DFXXeobfbJ+8z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZSshSgOF9aRFNYjfgKIorS1vM3g69SlhhHyk6JPKxrTjJ86Bo4pmMz0abF+c8sBXAhlu69WH2zG8ULntCHeNbZ8FkwKteh7oCi2UfZ99gNSdb/DXW8Gcs/6seD76XarvB5qQdtB94PLn++Q6K6Zp8PcGc/1Gau5atCu2QtvlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=car346E4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="car346E4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166022c5caso93378885ad.2
        for <perfbook@vger.kernel.org>; Sun, 29 Dec 2024 02:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735468101; x=1736072901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ph2QkDfgNYEfqLLBLvyzoHIiBkPYDiMwly47wuy7gPw=;
        b=car346E4K5yf33dWbKPsPsxoBzrM30CxAsT/7YTeVxHOFBcNTDfuc27xBiWMXSWQSx
         TSVqhijfSUiXVXNIZi5MBIuR8uG4HTNAdqLGy5zC5KT4zh2zn5JbnjkCUzws7oPOgF3K
         OpEwBb1sXZuW8VGdsO/Er+8qlOkwIe/s5cw56KNC1pn0updalEZb5MRwNefyb0oAylIu
         3dEpYNweR0WAA41cF5/DVqMtf1Mt6c4ApR4CvjsBAyo/J/480R4nhDTiASfnmQPm0K7x
         ZXOOh2VzL/sahh2NNXy0pelkOSJFmY29X4Nb8ZWrUWY3O3FK3MFqLmf3/YiNKF+dwX+B
         3ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735468101; x=1736072901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ph2QkDfgNYEfqLLBLvyzoHIiBkPYDiMwly47wuy7gPw=;
        b=o2GKDEw0xwvR9yucIFbQb0DkmEh1TQhizcdacNPfU28/hyBn+Sv+UcEpXUWNPfSYWa
         ONvwVuWsDFcPYZ8q/DI3AbDXxt4U7SLd59fIRtW+owx4rWsHyLIO6tadlwieWd7UOi86
         DzITyP3lxbkJ4OPZWuq39la2RXLuVgxY64+VuYcp7HkobMsOnNc/Sqltbx43DN7mWC00
         k9CECbOa7VXH3gJyP4sPvCD4k2ZAS32mmU27xGgjdn8ligYLG+binBmX/jGfLhc7U949
         XWQ574xEL91ifSjJFb/594rzPsty/HScfVtsfl08lVR6D+J+wQlwdxB1lxpeMTVr1H/i
         U14A==
X-Forwarded-Encrypted: i=1; AJvYcCV1pqKxDk95FNZlnyFdZ/e3AsZCD7IWIs5vB6LzKTiQYQNF5XXg6qQG/0g9uu3YxxrAoNTCsbAxiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS8xFJPuhhGpfZpGPLvUblr2DOKmfOlcfb2D60Zj8uH6MrdXQ1
	uF1N2JcSdZwgv+gAxLB/s2YvFi8xYtOkHjwi6ezk2wJbYaT3Yo4u
X-Gm-Gg: ASbGncsvsa0xwUBmKGuW5WycGiJTnzs+wBCmZE7jIV+9EV0lgR/AokQnVAtCOR44lmh
	avvjo2kdUUw70PfcpCPWn7HKuxWEdqn4Qg3FmkyCijjpUBVcBjNVzh7wicGJeb1hoKKR/kJrqMC
	DxS3Yv8yopYmzL0RLkwOZGsWNWXvc6u69Bs+bpPiEBZoEJzAaRZccEJJTR9ht+AjAOc5ZnBKkCY
	H2BcPLtWxr7dxgsCVQhRSoh7iwRQ5yGDjPk7ynpyEwhvzQiwLEHwsGzh5UqmcAfzHYbB/DEhtWV
	iool/WGJqZ5NN60vbBR3NJ8=
X-Google-Smtp-Source: AGHT+IF2IdL9lsyEYiht0ng1JOIJVcn1eus70NmdHavb5hqbrd+c0LSiWSh9TAITIDam7YV6x2GMrg==
X-Received: by 2002:a17:902:db05:b0:216:725c:a11a with SMTP id d9443c01a7336-219e6e8c9ccmr406821995ad.10.1735468100713;
        Sun, 29 Dec 2024 02:28:20 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d4474sm161946875ad.142.2024.12.29.02.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 02:28:20 -0800 (PST)
Message-ID: <dc7b5ba8-eb2b-4777-a12a-3bd762194f6c@gmail.com>
Date: Sun, 29 Dec 2024 19:28:04 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] CodeSamples: Fix liburcu-signal support deprecation
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>,
 perfbook@vger.kernel.org
Cc: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <50dd7b4054a31ea2fe7f8cf61cb285162bea8107.camel@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <50dd7b4054a31ea2fe7f8cf61cb285162bea8107.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024/12/29 11:29, Leonardo Brás wrote:
> Gitlab-CI is failing[1] on building CodeSamples due to liburcu v0.15
> deprecating[2] support for liburcu-signal:
> 
> %%%
>    * Deprecation of liburcu-signal
> 
> Users can migrate to liburcu-memb with a kernel implementing the
> membarrier(2) system call to have similar read-side performance without
> requiring use of a reserved signal, and with improved grace period
> performance.
> %%%
> 
> So, in order to avoid breaking builds with liburcu >=0.15 while keeping
> support for older systems without sys_membarrier(), check for the existance
> of liburcu-signal before adding it to the build command.

Thank you!  This is elegant.
Tested OK against Ubuntu 20.04 LTS, Ubuntu 24.04, and Fedora 41.

> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Filling in missing link tags from v2 so that Paul can apply.

Link: https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799 [1]
Link: https://lists.lttng.org/pipermail/lttng-dev/2024-December/030893.html [2]
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
Tested-by: Akira Yokosawa <akiyks@gmail.com>

> ---
>  CodeSamples/datastruct/Issaquah/Makefile  |  5 ++--
>  CodeSamples/datastruct/existence/Makefile | 34 ++++++++++++-----------
>  CodeSamples/datastruct/hash/Makefile      |  7 +++--
>  CodeSamples/datastruct/skiplist/Makefile  |  5 ++--
>  CodeSamples/defer/Makefile                |  7 +++--
>  5 files changed, 32 insertions(+), 26 deletions(-)
> 

        Thanks, Akira

