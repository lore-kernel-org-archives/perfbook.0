Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbiI0Bsy (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 26 Sep 2022 21:48:54 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D168A7ABB
        for <perfbook@vger.kernel.org>; Mon, 26 Sep 2022 18:48:52 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id z13so17731877ejp.6
        for <perfbook@vger.kernel.org>; Mon, 26 Sep 2022 18:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=e3lYpvDaVUzm4XLK4olAYH+1lA1moJXoJjXbCLNODck=;
        b=bS5QBvBCG/O7Uyk4MxD7rxm0INaETv4xAv+o2oAMimkLv/Luh6xfqvFcGt8fdrWHsa
         5s36/2P24xDZhc6wi/xRkOQN1/HPdVdaMNj+wcTLOnaKryZkzfoUGxO+shYTFezn8eXD
         mr7f8FfN2byfskFNzWFKICY7//P12Okn//86W1kDlQXoKJs3Wi5AMP477hnkWN7XnRKZ
         eaOBh02jVTDHucWWiiOSHyl5aIPpSAiEAYTwsfl4KNUC9gDocc9XOR2a+21rb7Xo0KgC
         uZcN1AtV+f53+r25zY/HH3PePCr4djJoV/S4vVIcIk0DsAApcFYDmo3Dv4MQ0+a5zlJC
         QWeQ==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Mon, 26 Sep 2022 21:48:33 -0400
Message-ID: <CAJbg=FVkC51pkG_cO-bBgfYq1pcug9B=ECEkmcNHLg+3HDbB4A@mail.gmail.com>
Subject: Comments on Section 7.1
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

This started out as a longer email, but it looks like at least two of
the problems I spotted were already fixed in the latest version.

1. I think the recommendation to release all locks before invoking a
user-supplied function should come with a BIG FLASHING WARNING SIGN
(or the PDF equivalent). Whenever I review code that releases and
re-acquires a lock I look for the faulty assumptions it makes about
state being preserved from before the lock was released. 9 out of 10
times I find a bug.

2. qsort() may not be the best example to use in this section, as,
even assuming there is some version of it that requires locks, the
reader may fail to see any problems. While I'm no fan of nftw(), it
may be easier to see why you would need a lock in the library (to
prevent changes to the directory), as well as why releasing and
re-acquiring the lock can be dangerous (the iterator can become
invalid).

3. Page 106, first paragraph: "an pointer" should be "a pointer".

--Elad
