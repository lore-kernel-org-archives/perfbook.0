Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjEALGD (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 1 May 2023 07:06:03 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CB41B8
        for <perfbook@vger.kernel.org>; Mon,  1 May 2023 04:06:02 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso1639596b3a.0
        for <perfbook@vger.kernel.org>; Mon, 01 May 2023 04:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682939162; x=1685531162;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCJAsxVxvxFi/eErC6C7ROrIxlnXklHSDUl+nugJ1dk=;
        b=BZfESki5C1f5KIyTUn3WFvIJDRYCp1C9eWBoudLdnalxQMmSNSBgRp8U5fh98kUvrl
         UhhQs97VAVQWO2Nyw4o+2GlBTqHQ8FqSvjiVXwZqhuKbZIXNxoe2NnWTQXQVhJ51Q88h
         V7k0aiGB0TOsBfbWjHeA2DyRPC0ltj9JdJOLR++1oWz/Ho28ylfU7BaduWIIZ5BtQ29G
         edYoxFzndWm7WYZDw5t0mvaAk1FsqC/PfEFGULWVZzBCc0LfeQQ0UztVgjzxIPkGHU6b
         NmaOhlqqWY/ur2EMyu5hpFoYp1jxQLi2ZqFLjfIUKXYGEBkr018I5ltby/fRsK8rNHM1
         8xdA==
Received: from [127.0.0.1] ([2402:d0c0:2:a2a::1])
        by smtp.gmail.com with ESMTPSA id h7-20020aa796c7000000b00642ea56f070sm1223102pfq.30.2023.05.01.04.05.59
        for <perfbook@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 May 2023 04:06:01 -0700 (PDT)
From: Alan Huang <mmpgouride@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Question: Are there conflicts between the paragraph and the figure?
Message-Id: <6FC864F5-A6CD-4C5F-BC63-9670AB95F8F7@gmail.com>
Date: Mon, 1 May 2023 19:05:56 +0800
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

I=E2=80=99m reading section 9.5.4.9, in the second to the last =
paragraph, there is:

  Before the first horizontal line, all readers see the leftmost =
myconfig structure,
  and after the second horizontal line, all readers will see the =
rightmost structure.=20
  Between the two lines, that is, during the grace period, different =
readers might see different objects

I=E2=80=99m a little confused, in Figure 9.29, the xchg is before the =
first horizontal line, in my understanding, if the=20
reader=E2=80=99s reading is before the xchg, it will read the leftmost =
myconfg structure.

So, are there some conflicts between the paragraph and the figure?

Please correct me if I=E2=80=99m wrong.

Thanks,
Alan



