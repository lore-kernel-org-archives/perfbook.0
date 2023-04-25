Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbjDYNxK (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 25 Apr 2023 09:53:10 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FAF2100
        for <perfbook@vger.kernel.org>; Tue, 25 Apr 2023 06:53:08 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1a516fb6523so62311525ad.3
        for <perfbook@vger.kernel.org>; Tue, 25 Apr 2023 06:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682430788; x=1685022788;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMVSzq8P7GS5TKATNs5SXaiz1hoMmOflliw7P/XhnFE=;
        b=DYoBd4C7kQ/FK3sF/fyt9d+tENSWEo94Fg5NJma1MIziCE5rDZZKtVA1s43BP9gDcJ
         k4uJJaHINuMKiNSw3I1slQNuvsG4QehNneUeYIZMsHpc97Q7Lx8ACDLTl8vEe7nzlBAZ
         hk+9uCzJVrc4yCfVkytWMo90GQK369eK/3vQn0i6Qj97ZS7mxUeLGp5HoW7o0l3Mld8L
         B9awbLCdZyScv9ZSWmnypOQ3RH8UPxdh8rUNmVgh2OQaSDoBEVXm0sutyOMHQR7IVZI2
         BCDXaJmejk5DkMpIxR2Ggbd4GKb3bnO0INYr+8PkQxjqdmDiWBLcKxZ0QMBM0FMzqWdu
         13Sw==
Received: from smtpclient.apple ([2402:d0c0:2:a2a::1])
        by smtp.gmail.com with ESMTPSA id w6-20020a17090a380600b00246b7b8b43asm8098785pjb.49.2023.04.25.06.53.06
        for <perfbook@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2023 06:53:07 -0700 (PDT)
From: Alan Huang <mmpgouride@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Question:  Why does the modification of seq in write_seqlock not
 require WRITE_ONCE?
Message-Id: <77ACB1FE-73A2-4C0D-A4EE-67D108DA539C@gmail.com>
Date: Tue, 25 Apr 2023 21:52:48 +0800
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

I noticed that the modifications of seq in write_seqlock and =
write_sequnlock of Listing 9.10 use plain ++ operation.
But as Chapter 4 (especially 4.3.4.4) says, there will be store tearing =
since there are concurrent readers.

However, the kernel implementation of sequence lock also uses plain ++ =
operation.

I=E2=80=99m somewhat confused.

Why does the modification of seq in write_seqlock not require =
WRITE_ONCE?

Thanks,
Alan=
