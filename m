Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242410AbiHOKm2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 15 Aug 2022 06:42:28 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52AA21834
        for <perfbook@vger.kernel.org>; Mon, 15 Aug 2022 03:42:25 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id s11so5145613qtx.6
        for <perfbook@vger.kernel.org>; Mon, 15 Aug 2022 03:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9bsiD0S2oPe5YFPke84t8zVK/dh1AwJAmjunbK1i+O0=;
        b=bTTmZmktF5836XTx19m4bmfXMu7BVjQPwr7u+k7Nay3xd4HyVHeMCvHAQTUmQs1Cz4
         VWu1s50B/i6P7PBFM5SkCswV6yLvAYsLDqUsEqLmpW0NhyXdlnqNkZDg+109eQj/ind5
         5FrpdqOvhNnbiPIiiGKl74KOSOdWbFkaf5LkpNBC8e/XO/gdXLeO9nOYPIeVsK6mpt0k
         tWilqS/jDYahZbs8vM4iLRw68dPtcGxI7C/Bm9fQAsau2EIL4CDBcqpCVf+JNqSctiLW
         77wJMsLflp3NGTOI2fEtDWB6BUASs+vKfcNg000kev8SQnf1Cpe0GgYnv37+m332cqsp
         Xh5w==
Received: from [192.168.2.112] (cpef85971ea0e70-cmac202ebe2430.cpe.net.cable.rogers.com. [174.112.192.43])
        by smtp.gmail.com with ESMTPSA id b8-20020ae9eb08000000b006b8f4ade2c9sm8352300qkg.19.2022.08.15.03.42.23
        for <perfbook@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 03:42:24 -0700 (PDT)
Message-ID: <07ed4c84-976a-cb4a-072f-47a7599cc434@gmail.com>
Date: Mon, 15 Aug 2022 06:42:22 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2] CodeSamples: Support for building on different
 operating systems
Content-Language: en-CA
References: <20220815103717.7454-1-e2lahav@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20220815103717.7454-1-e2lahav@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

On 2022-08-15 06:37, Elad Lahav wrote:
> +	cat api-pthreads/api-$(os_compat).h >> api.h

I didn't want to go overboard here, so it's just the minimum required 
for having a single per-OS header with specific definitions.


> +#ifndef CLOCK_MONOTONIC_RAW
> +#define CLOCK_MONOTONIC_RAW CLOCK_MONOTONIC
> +#endif

This one wasn't moved to the per-OS header because of the order in which 
headers are included, which I didn't want to fiddle with.
That said, would you be open to changing the ARM64 get_timestamp() to a 
simple read of the hardware clock? It is architecturally-defined.

--Elad
