Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiHPMtg (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 16 Aug 2022 08:49:36 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8658FD5E
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 05:48:58 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id i24so7958628qkg.13
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=pF+lerQgcyIAdYm0zYyvMP+W5052PD3j7g+IsHKcSEc=;
        b=Pyn7K3UZ4HUeDfKcNrxHCxu6ETBHT0CyPtfQayj3lpuITAsNAmDdWxQ5oDyFETVrIb
         iKXCE8cmEq1h+TbEuGEmrS9zD0OQAQ+pNO+anNkCuJ8xTynakSbnPxe2/d5osqDAd4kf
         NaQNo/D6OoA6tXDjq20MM7axBBCGPxAJnwkibYEbaoCqPy/o3/2+3lG3tqF/oPcczCsd
         GvpQ4/OcLCsIFJMlFx3UebR/Pz3Jx0S5JTXsHGVW2KgyxxqPouRApuenKmh2sL1e90E2
         ct0aJwnDNYJJ5YSzZlwA/O1a9getH+mbHQ+OlYfTy+FF03fwBmRix6kU65FmQznN1TWR
         6ydg==
Received: from [192.168.2.112] (cpef85971ea0e70-cmac202ebe2430.cpe.net.cable.rogers.com. [174.112.192.43])
        by smtp.gmail.com with ESMTPSA id o4-20020a05620a2a0400b006ba9b2167a2sm10805243qkp.16.2022.08.16.05.48.55
        for <perfbook@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 05:48:56 -0700 (PDT)
Message-ID: <66962abc-94ce-b9ab-e75f-92d8bd03e8c9@gmail.com>
Date: Tue, 16 Aug 2022 08:48:54 -0400
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] CodeSamples: Switch ARM64 get_timestamp() to use the
 hardware counter
Content-Language: en-CA
References: <20220816124647.75220-1-e2lahav@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20220816124647.75220-1-e2lahav@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

On 2022-08-16 08:46, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>

I tested the change on an aarch64 board on both QNX and Linux. The Linux 
results show quite the change in performance from the clock_gettime() 
version, which is probably expected.

Before:
root@localhost:~/src/CodeSamples/defer# ./gettimestamp
d3f5e50a7d
d3f5e50af5 120
d3f5e50b6d 120
d3f5e50be5 120
d3f5e50c5d 120
d3f5e50cd5 120
d3f5e50d25 80
d3f5e50d9d 120
d3f5e50e15 120
d3f5e50e8d 120

After:
root@localhost:~/src/CodeSamples/defer# ./gettimestamp
73706dac1
73706dac2 1
73706dac4 2
73706dac5 1
73706dac6 1
73706dac8 2
73706dac9 1
73706dacb 2
73706dacc 1
73706dacd 1

--Elad
