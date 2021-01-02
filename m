Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbhABWFP (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 2 Jan 2021 17:05:15 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E612C061573
        for <perfbook@vger.kernel.org>; Sat,  2 Jan 2021 14:04:35 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id s85so12537301vsc.3
        for <perfbook@vger.kernel.org>; Sat, 02 Jan 2021 14:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=eYkTsUzUAsjVCl2rxMvdOuRrfVpPx8oeBPgFFZtK+0A=;
        b=DFM0HnuvikLVRUJj62C8+jn8Px5PFpw5KZT59br3mAN56mRDAQGEIgo185iP8GL8K5
         AtcM6xW5K+TF5WX10Ik5AY2LuzYFM6jJ1b2jNkToZ0xlYPsNJQgenPsc2NZA4FJVYlD5
         5stCIc2qvw/qSscc/HK8WkZWSaT6Fbp2FkXWysob+FjWPX4vODQ1vl0D5zFfBDlPDRUA
         uuwToOc7xnbdHSO5l12tA4m+UisK2VUeNcJqSFzipEf716gGvHs/hCJy0C4xQTUDTpTM
         64uHy+wd1JkpYfxN+SPqXhyTCGp68hQ3N3vvf5qxiYZPKnIh8UCm/nDeO5epRMrpjnHn
         e2Wg==
MIME-Version: 1.0
From: Daniel Nitzan <danny.nitzan@gmail.com>
Date: Sun, 3 Jan 2021 00:04:24 +0200
Message-ID: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
Subject: Request for clarification on Alpha reordering
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

In 15.5.1 (Alpha) - In regard to the following statement: "Yes, this
does mean that Alpha can in effect fetch the data pointed to before it
fetches the pointer itself, strange but true."
I'd appreciate it if someone could clarify what this means. I don't
understand this statement in light of the actual data-dependent
reordering presented in this section, i.e. the pointer itself is
fetched, points to the correct location in memory, but the data is
stale.
