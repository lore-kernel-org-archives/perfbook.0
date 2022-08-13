Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiHMLtc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 07:49:32 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F791F2C5
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 04:49:30 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id b7so2380621qvq.2
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=j5jCelX5EfbnVP6B6jGmD0/t2kuHEhjIAl9AfBeNSIg=;
        b=FyRqkPMHzCvYADdLUJOodTwczlWE+fldqSid0y3dmkl+3kvHMEfYSTo4re4UI2ZAQT
         bq1wH5G7eV1+03AICRNdc0dwBNHhRRXiYrsZpvRWnx+Rxnd2XHhsm+dZR2Z0vISKR8nn
         ENZlZA1/+kZeuSf0tLyOqIJkL2CBievsKd3ceeTmza0RCnJjZziEPIsf4R4cAqp9LEGV
         9+JrTGnRRWsS6EPo5vW5EfKNWjWuPuL74pTICv7tGR4vsyploL/M0W6jDQKP1EY+Z80Q
         taGXpjMH3hvDKtYqOzQe4uzNtUGPI9z4IQOo2TlCbHhtXn4IYHLgn4840d3aPMB/LpiP
         nU0g==
Received: from [192.168.2.112] (cpef85971ea0e70-cmac202ebe2430.cpe.net.cable.rogers.com. [174.112.192.43])
        by smtp.gmail.com with ESMTPSA id dt2-20020a05620a478200b006b93b61bc74sm4172313qkb.9.2022.08.13.04.49.28
        for <perfbook@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Aug 2022 04:49:28 -0700 (PDT)
Message-ID: <4a072f55-a780-d69b-9a74-a5d5aba63b7a@gmail.com>
Date: Sat, 13 Aug 2022 07:49:27 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Content-Language: en-CA
References: <20220813114559.2082323-1-e2lahav@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20220813114559.2082323-1-e2lahav@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

On 2022-08-13 07:45, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> ---

This one will probably require some back-and-forth. If we change it 
here, do other places need to be updated? Have I now removed the 
explanation of GCC's __thread storage class, which will impact the 
readability of other sections? Or are you ready to take the plunge and 
convert all code snippets?

For the record, I did build and test count_end.c.

--Elad
