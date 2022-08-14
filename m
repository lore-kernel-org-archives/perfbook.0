Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiHNKZC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 14 Aug 2022 06:25:02 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C8724F0F
        for <perfbook@vger.kernel.org>; Sun, 14 Aug 2022 03:25:01 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id a15so3389007qko.4
        for <perfbook@vger.kernel.org>; Sun, 14 Aug 2022 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Ym3Q+kWey/tekYuvPm6CJpWvF15ncpQY4leZdeoDFKM=;
        b=pZ3z0IL2hetLO8E8NV7aALRFYZwvt61qBa+POWwkqe8DHjy3HxEu3e4CBQ525/mZFu
         gVfyYB84qD7RUshYEJd4XSDlmRx79k06v+n6oiAYAkEkPlIkec9vApWFlM8Dn767Z2S2
         Xb31eoGMrNjBPiRVHwa5wuQ3vl/M89C6Yny2AObnFXNfRv1JsWtRPpyahw6HYyvGQ2fQ
         J4Dntv5L96fUx++ZVVZi+gR1LknyoJ6acI1FAjH9/kN0DBFCz9bYzTa5Jxac2elboMF8
         OsnOCJHdX+hz6s4w4JeD+dFE29L3LLVYvc2BSLH5KuZiufmGl3UbxGzd1TrgC9gavu35
         tHcA==
Received: from [192.168.2.112] (cpef85971ea0e70-cmac202ebe2430.cpe.net.cable.rogers.com. [174.112.192.43])
        by smtp.gmail.com with ESMTPSA id de28-20020a05620a371c00b006b999c1030bsm5908078qkb.52.2022.08.14.03.24.58
        for <perfbook@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 03:24:59 -0700 (PDT)
Message-ID: <ed00a63b-1d65-16e5-700e-19137871118f@gmail.com>
Date: Sun, 14 Aug 2022 06:24:58 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] CodeSamples: Enable building on QNX
Content-Language: en-CA
References: <20220814102135.2141663-1-e2lahav@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20220814102135.2141663-1-e2lahav@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

On 2022-08-14 06:21, Elad Lahav wrote:
> +#elif defined (__QNX__)
> +    uintptr_t runmask;
> +    int ret;
> +
> +    runmask = (1UL << cpu);
> +    ret = ThreadCtl(_NTO_TCTL_RUNMASK, (void *)runmask);
> +	if (ret) {
> +		perror("sched_setaffinity");
> +		abort();
> +	}

Argh, I've just noticed the mix of tabs and spaces here. What's the 
protocol for updating a patch?

--Elad
