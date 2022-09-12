Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiILOjt (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 12 Sep 2022 10:39:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7253B2631
        for <perfbook@vger.kernel.org>; Mon, 12 Sep 2022 07:39:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1B6D2B80D4F
        for <perfbook@vger.kernel.org>; Mon, 12 Sep 2022 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662993582;
        bh=lVjM1A1AtNPRrWVJwzLCSFwmdEjCX+A1TY/n00a6/Ck=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=E3asAo4WGrPEf8Fp68nkdlowY0+PjyybLE+HGeWkB/64RIRaB2BMZbVJbYaFh70fI
         6/fc/OAKiD0e6+J65nmOwOyxce1MI3+PGrzb7paMZ2MTFWhFB3R9RTKEjqR39/qocy
         v/oYffLe02C/RhLkwInTgV1Xg8v2p64TuZnpH0ai/IaLMz8t0PWbkvgcFVcLEH9tn/
         1mwlaZEGuMl7FCHNR37K2cIeXx/xpwiaMByIth/64nWrZyc2I3id5F5ggk7ngpPjP6
         Ao8MGDZzmdLPr0jogk2bXQZq/7pCPIxAnFY3c6QR05RBJs2Q0ARsY5OdvJFjoMlrUo
         t5KZO+9Y9rRiw==
Date: Mon, 12 Sep 2022 07:39:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Missing brackets in Listing 6.x?
Message-ID: <20220912143940.GN246308@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FURQ5+Uo8g2f-qx6_OH+rp9niHcw9tGHUrGuu4Ui423Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FURQ5+Uo8g2f-qx6_OH+rp9niHcw9tGHUrGuu4Ui423Zg@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 12, 2022 at 06:24:36AM -0400, Elad Lahav wrote:
> I was dumbfounded by  the code in Listing 6.4 and 6.5 until I realized
> it was missing brackets around "key % h->nbuckets". Feeling all
> superior I was about to fix that and submit a patch, but as it turns
> out the source looks just fine (SMPDesign.tex, line 153).
> 
> Paul, Akira - does it render properly for you? I've attached a
> screenshot of the result for comparison.

Good catch!

I see the "[" and "]" in Listing 6.6, but not in the two prior or the
two subsequent.  I don't see a difference in the latex commands that
explain this.

Thoughts?

							Thanx, Paul
