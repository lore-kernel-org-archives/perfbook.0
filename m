Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-il1-f172.google.com ([209.85.166.172]:40630 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbfJYNcs (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 25 Oct 2019 09:32:48 -0400
Received: by mail-il1-f172.google.com with SMTP id d83so1837731ilk.7
        for <perfbook@vger.kernel.org>; Fri, 25 Oct 2019 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=r675MrIFRwwANG6dqRaNrVkg19giv8Jtol7zoP4wQe0=;
        b=GnzU25hogRIh7J5fNXfxqpZznZEsFdHReoRY8PZvkWJHfCk2ljtG4vtjXRR2P3XVJy
         Ycy6TFh3mtIU1WMmx9SZ03USVyockY70rlo3W/WnmZtgcTVtCnXbiulPS/019gxGAUyj
         J4q6dkMBzb6Q9jNrFh3yD0EBYoTo5EAtVf+56gi+WbB/XdLF3CVllv+Bhyj28tm++FJl
         /7Zauc8h7JrbKjj70PljNPv3rt9awHUneVVxGrA7J7D7hVE5ECqU+plowRVExd4dXHsa
         WAcjxq1thyzyQlDCJ2fuDqd2bVonlLaqNren/bSF0K17sEE2bnDzXpXsXpW5EdZXkVhl
         4dKg==
MIME-Version: 1.0
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Fri, 25 Oct 2019 21:32:35 +0800
Message-ID: <CA+MhoaNUYKgS02EOjNGQi1+5D_Uzw4aWf2_y_gxtBF9ZU8muKA@mail.gmail.com>
Subject: Question about volatile usage
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi Paul and perfbook members,

Greetings from me!

I have a question about 4.3.4.2 A Volatile Solution:

> To summarize, the volatile keyword can prevent load tearing and store tea=
ring in cases where the loads and stores are machine-sized and properly ali=
gned. It can also prevent load fusing, store fusing, invented loads, and in=
vented stores. However, although it does prevent the compiler from reorderi=
ng volatile accesses with each other, it does nothing to prevent the CPU fr=
om reordering these accesses. Furthermore, it does nothing to prevent eithe=
r compiler or CPU from reordering non-volatile accesses with each other or =
with volatile accesses. Preventing these types of reordering requires the t=
echniques described in the next section.

Does this summary apply for both C and C++? Or C only=EF=BC=9F

Thanks very much in advance!

Best Regards
Nan Xiao
