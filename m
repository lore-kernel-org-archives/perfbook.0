Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiJNMPB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 14 Oct 2022 08:15:01 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DECD36413
        for <perfbook@vger.kernel.org>; Fri, 14 Oct 2022 05:15:00 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a26so10089422ejc.4
        for <perfbook@vger.kernel.org>; Fri, 14 Oct 2022 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nKVAbB4xc/2Vz++35l15JC2eJeU4OsBdq8dAwW5EwWY=;
        b=ce6032nk/UGGJrEOG33aSOoq/j+RP0H9CNv/eF+PjbxvE2wz9VQV0yIt6Vc6M/yYD7
         jF+Uamt5+YpQnSTinu97hN8md8vzd3b+BHbOEJlrt+ECcjXXwK8bI/vCqtYPrjcxD2Cw
         yuoqKBvUwCos3I5rhNnUW/3iFUh1KmJ9R+t0OjLENQtpFImh1yyRZtZPhSA9rip8itYA
         ZzcmaZc+t0EyriSkdzR0P7gZz1ge8zniKTgRS4gEmdEoaUesKMtq9Wq7193SGOJP+/AA
         Yw8d9aDmBm98INMJzD4MfUmWLz5XUfT8rQZjnLJQh8g6yRhapO4a0TMCKU6csj/+ccjZ
         PN6g==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Fri, 14 Oct 2022 08:14:42 -0400
Message-ID: <CAJbg=FU6Sa=vc6DRGsewXMP6N1Hz2HHUsKkgNTUzPx9Bh0VuKQ@mail.gmail.com>
Subject: 7.5.2.7: Library Functions Used Between fork() and exec()
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Ah, multi-threaded fork, my arch-nemesis.

A few points, though I'm not sure any of these are worth mentioning in the book:

1. It should perhaps be made clear that the child's copy of the lock
is, in fact, a separate lock. The statement that the lock is held by a
parent thread is somewhat inaccurate. That is, unless the lock is in
explicitly-shared memory (i.e., the result of mmap(MAP_SHARED)), in
which case the lock is indeed the same and is (presumably) meant to be
shared between the parent and child.

2. POSIX explicitly says that you can't execute any
non-async-signal-safe functions between fork() and exec(), which
pretty much eliminates any function that acquires a lock.

3. posix_spawn() is a safer alternative to the fork()/exec() pair
(though not to fork() by itself), at least with sensible
implementations that don't devolve to fork() and exec().

--Elad
