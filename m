Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjDJQkk (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 10 Apr 2023 12:40:40 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6207E56
        for <perfbook@vger.kernel.org>; Mon, 10 Apr 2023 09:40:39 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a4f88a0bd1so3683395ad.0
        for <perfbook@vger.kernel.org>; Mon, 10 Apr 2023 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681144839;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=faC5yYnd3OFAIor5VHNrgpqROoo7pPgfOqU+6qYFyqI=;
        b=lAfl6AfJkZryWIa3IA+JNQAhH2PtBHdx1y7i97D7KohrfiGczZEPW7uQZyU7oWkPn5
         lKEmBJi4EueiveJB3DHCa5RI/neSAXLW6NZLwocfC9A5//Rfdn5nwT9Iw56K38bFXq4Q
         a26YqV6DrKwrKZWJxcJd71ysCg02hqT2wqQHItZSZ5mG7M3+JCSv6jHOCIsLGwEBlQC5
         PYkWwS9J4BO4Bfd2oWrv5G3bBMOv8VtDzRyDYzvrSYbRcEp4G8g98MCnPAs7e+cDpM32
         cHxct6Al8Hl5t+09Wiu9iMeux/iq9WI6MFht0M16ahstV7Dig2fMLFvemAsyoZEtwXn0
         Ib2A==
Received: from smtpclient.apple ([2402:d0c0:2:a2a::1])
        by smtp.gmail.com with ESMTPSA id e20-20020aa78c54000000b0059085684b54sm8383948pfd.140.2023.04.10.09.40.37
        for <perfbook@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Apr 2023 09:40:38 -0700 (PDT)
From: Alan Huang <mmpgouride@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Question: What does "one thread can enter but two threads can exit"
 mean?
Message-Id: <FE0E33DE-C0A0-4065-99CC-5F0AB58E7A67@gmail.com>
Date: Tue, 11 Apr 2023 00:40:19 +0800
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

I am reading section 6.5.4, there is one paragraph said:

> The fraction of cells visited by PWQ is similar to that of SEQ. In =
addition, PWQ=E2=80=99s solution time is greater than that of PART, even =
for equal visit fractions. The reason for this is shown in Figure 6.28, =
which has a red circle on
> Figure 6.29: Effect of Compiler Optimization (-O3)
> each cell with more than two neighbors. Each such cell can result in =
contention in PWQ, because one thread can enter but two threads can =
exit, which hurts performance,

I don't know why there is competition only when a cell has more than two =
neighbors?

And as the subject said, what does "one thread can enter but two threads =
can exit=E2=80=9D mean?

After checking the code(maze_fg.c), Doesn=E2=80=99t every cell in the =
maze can result in contention?

Thanks,
Alan


