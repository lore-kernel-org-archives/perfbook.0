Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjEALJz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 1 May 2023 07:09:55 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F931BE
        for <perfbook@vger.kernel.org>; Mon,  1 May 2023 04:09:54 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ab032d9266so1252145ad.0
        for <perfbook@vger.kernel.org>; Mon, 01 May 2023 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682939393; x=1685531393;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOVNQc5Z5xqKeqSa4FJKSpM8PiJSU1FqMnqZOharAIE=;
        b=CTREwkydRKa3O+xguJBaiNCD8D8hZMNbP4l2qtKkqkpqnzRdcWbTm3EeX3en67X2Eq
         GEHNU+xtvWElF5HZtBG9hzPAyUR8wUlV2X+7tuzS8U+tAH379DeUgKLs316m9M0SxCVW
         osgDNEtGXyMzefAeTxcxtAycZy8uxuJ2aE0YHxu6jF6+cRLqJAZRizrVtGRQxfWHfkd2
         1N0MYJZb1ga8p3FHL+CfuLv5QBv6xCxhp1/lBVEiy7qTSvZoYOIdPazGqXjHCd1KCr12
         BrPvWb134rMVVyC3McM1S5hNarT5L3K2HgcCH5Rtnr4acjJpxUtB9vQm9W/E9tcjYDpE
         RqYQ==
Received: from [127.0.0.1] ([2402:d0c0:2:a2a::1])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902d2cf00b001a96496f24bsm940275plc.43.2023.05.01.04.09.52
        for <perfbook@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 May 2023 04:09:53 -0700 (PDT)
From: Alan Huang <mmpgouride@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Question: Are there conflicts between the paragraph and the
 figure?
Date: Mon, 1 May 2023 19:09:49 +0800
References: <6FC864F5-A6CD-4C5F-BC63-9670AB95F8F7@gmail.com>
In-Reply-To: <6FC864F5-A6CD-4C5F-BC63-9670AB95F8F7@gmail.com>
Message-Id: <6146DDCA-450B-43A1-8158-2D8766E3B86F@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org


> 2023=E5=B9=B45=E6=9C=881=E6=97=A5 =E4=B8=8B=E5=8D=887:05=EF=BC=8CAlan =
Huang <mmpgouride@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi,
>=20
> I=E2=80=99m reading section 9.5.4.9, in the second to the last =
paragraph, there is:
>=20
>  Before the first horizontal line, all readers see the leftmost =
myconfig structure,
>  and after the second horizontal line, all readers will see the =
rightmost structure.=20
>  Between the two lines, that is, during the grace period, different =
readers might see different objects
>=20
> I=E2=80=99m a little confused, in Figure 9.29, the xchg is before the =
first horizontal line, in my understanding, if the=20
> reader=E2=80=99s reading is before the xchg, it will read the leftmost =
myconfg structure.

And if reader=E2=80=99s reading is after the xchg, it will see the =
rightmost structure, and because xchg is before the first horizontal =
line,
Readers before the first horizontal line may also see the rightmost =
structure.

>=20
> So, are there some conflicts between the paragraph and the figure?
>=20
> Please correct me if I=E2=80=99m wrong.
>=20
> Thanks,
> Alan
>=20
>=20
>=20

