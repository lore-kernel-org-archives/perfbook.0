Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjE2Qss (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 29 May 2023 12:48:48 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E98B5
        for <perfbook@vger.kernel.org>; Mon, 29 May 2023 09:48:48 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64fbfe0d037so1302803b3a.0
        for <perfbook@vger.kernel.org>; Mon, 29 May 2023 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378927; x=1687970927;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I5xk+5qo04F0biO6RSJ4duxBi97rJYBHXQdrQc5CnZo=;
        b=Ect07wzJZiG8bI1EhDC5Pu+RntRGQO0/6rSRe4u3i7gICVbokJBK/12KRXveG7VOAX
         fqIOUj+QVsNvOazEiS8oGvjxD3iL30TP6x58vNr3jiIHmDKIc5nNg0tPX0e9AsV6iP+B
         mgGCMd6X2A7IPwmGHiDAt5JKk2Ze0IsUMUM7mMJk4XkOzEzLjqjrn0T5rN1IUJoxoxol
         /TiDBsFLVL4Aj2WHcR2P8Ro2igD1PUkWFAxnNOvW66X+bExHqnAsQ3i4ZfpF4okNd1/s
         0XFvyYhg0u4Hm7hzWyF5eB098nWlAyiwyASZb0uj/Tuz4Be2Z7lrb1LCugkXn8iAJh6f
         8kKg==
Received: from [127.0.0.1] ([2402:d0c0:2:a2a::1])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902bccb00b001ae469ca0c0sm8459509pls.245.2023.05.29.09.48.45
        for <perfbook@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 May 2023 09:48:46 -0700 (PDT)
From: Alan Huang <mmpgouride@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Question: In what circumstances would the enqueuer fail?
Message-Id: <BC1D7582-8D92-411D-8E61-68252413A1BA@gmail.com>
Date: Tue, 30 May 2023 00:48:33 +0800
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

I=E2=80=99m reading 14.2.1.3 Half-NBS Queue, there is one sentence says:

	The enqueuer might have failed between lines 9 and 10 of the =
listing, so that the element in question is only partially enqueued.

My question is: In what circumstances would the enqueuer fail between =
lines 9 and 10 ?

Thanks,
Alan



