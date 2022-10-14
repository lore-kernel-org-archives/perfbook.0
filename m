Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiJNMBs (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 14 Oct 2022 08:01:48 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3E91781D0
        for <perfbook@vger.kernel.org>; Fri, 14 Oct 2022 05:01:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id b2so9993507eja.6
        for <perfbook@vger.kernel.org>; Fri, 14 Oct 2022 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EEWKWFuEmHMkCPPmgYjoiGDr+hXYSWO23/u9rZscyUI=;
        b=Ez32zg1Xj3A+2l6XpvCie7U1M0Yqbkfv/UWt3A9R9AERoUFTFwHolh232ndBmeVQ7I
         xy25ZtrEacZs6GaWRDjVP9iuXlNj2qqz/YjIS21D2Acr5QmGBSbIVI5EqV+d40QBsPj+
         r0yr4aSffdr+D/wvfzyQGlDwpBDFf3BIORAVhT7IJa36saZQNzBr/qdU57NiMnjQv3+I
         2e5fkfl4xB7OzmsH5335sx5kWX58LUBFpJNeuPnnGDxRDmaL7xJcMqu/1ku41WQfVtDH
         i7O2vwpYbIN5NoTg0C2KoSbcjXXOJdpu97gC/rn1ca4pueBMNzAluDjLRNX2KuSe5F20
         W0Fg==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Fri, 14 Oct 2022 08:01:29 -0400
Message-ID: <CAJbg=FXoEOio8u72S20cWxJYcu1Z5No7n9bpNOQB8THnVzraqA@mail.gmail.com>
Subject: Section 7.3.2: Mention of futexes
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello,

I'm not sure about the statement made in this section: "In contrast,
Linux avoids these hints, in-
stead getting similar results from a mechanism called futexes".
Futexes are just wrappers around kernel mutexes, to speed up the case
of acquiring a free lock. As such they do not solve the priority
inversion problem, and are certainly not a replacement for disabling
pre-emption when using spin locks.
Kernel-level mutexes may address priority inversion by employing one
of the established protocols (priority inheritance or priority
protection).

Am I missing something?

--Elad
