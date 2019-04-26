Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-it1-f182.google.com ([209.85.166.182]:32904 "EHLO
        mail-it1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfDZLGZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 26 Apr 2019 07:06:25 -0400
Received: by mail-it1-f182.google.com with SMTP id v8so4345697itf.0
        for <perfbook@vger.kernel.org>; Fri, 26 Apr 2019 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZuiRcHGL/VEdJ++fRd/T9JUNKN/JCOS1Jt5nZgiRurI=;
        b=EzcQ/MtXjL48jHbOavFtDlcOFCLIv2sR1Z/C4cLw+9WvNRMWhir/mS0qszK0DLd3bE
         wKYAma6EfMzbesrbiHiq0N4kFZ/pxzt/1wKoUnkn2VNv4uICkkB/3SoUt/P1+KHgA2tB
         4MtG5NvlgU8qmWyPvZg+FuMHnJfl4V+d6UuBe+7ObL3/tNwXXzmv6sr9IzarJ6k6nAhj
         W1y36jZGxMm1bbjK7fMCFND8OVAPZofM3ctmEYY5QT0u7O9sEvl1VtrJi1iEC98pV24V
         YhBoN6pKQvIPansdaPaoXWSrN+8Wo33BVolttlbAgLz5MbWAkZxHIUqSFobNkJWVcrNa
         uSgg==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Fri, 26 Apr 2019 07:06:10 -0400
Message-ID: <CAJbg=FWZhjXARBNou6XZ55fdvRsgABR19p8pytYB+SrKFtwWxQ@mail.gmail.com>
Subject: Cost of atomic operations on new hardware
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello,

Section 3.1.3 contains the following statement:

"Fortunately, CPU designers have focused heavily on atomic operations,
so that as of early 2014 they have greatly reduced their overhead."

My experience with very recent hardware is that the *relative* cost of
atomic operations has actually increased significantly. It seems that
hardware designers, in their attempt to optimize performance for
certain workloads, have produced hardware in which the "anomalous"
conditions (atomic operations, cache misses, barriers, exceptions)
incur much higher penalties than in the past. I assume that this is
primarily the result of more intensive speculation and prediction.

--Elad

