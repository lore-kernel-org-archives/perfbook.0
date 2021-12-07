Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238306AbhLGXph (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 7 Dec 2021 18:45:37 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F78C061574
        for <perfbook@vger.kernel.org>; Tue,  7 Dec 2021 15:42:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C75EBCE1E73
        for <perfbook@vger.kernel.org>; Tue,  7 Dec 2021 23:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638920522;
        bh=7Kmja42tkZETm3wNLnjwNh8r4e7LndsiLIWUicL5JfE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hjD02nsqw7yS+66FDN2wckz/Hy0xU//LaQbASbwmjOU8bftjUgLBgz9uKLov12TO/
         XTHPSmRYmk/uidqE0Qr4zdiX84rSxNoDfXVjz/L9w+hUqIITWrGnQ+Ee1Rk711bR8t
         LFej8d3/l8KF8IGl23b1d4QS+dqsi/GxReRwQWLKAVcrmLPdF+4slbuV2H6joPox5M
         RhVZoAoO+cV6ubshKepFofG95X4IHVLTrLcLClR4D7Ume5t4BGlbAg1ffu4VULXm27
         Tr8ma5Tx4TzdTvsj1CN/HjoE6hVEfUyXdepa6DFVeXnhJG3aSs2MljxUODsYmiIwgT
         VFn8t+YL6BGVw==
Date: Tue, 7 Dec 2021 15:42:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: My learning experience of how irq_disable affects Linux IPI
Message-ID: <20211207234201.GO641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAABZP2x9SCeYLLnpe1LCt4BqhYpJcR+vQQt_rN94ahubPWo0dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2x9SCeYLLnpe1LCt4BqhYpJcR+vQQt_rN94ahubPWo0dQ@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Dec 07, 2021 at 10:07:58AM +0800, Zhouyi Zhou wrote:
> Hi Paul,
> 
> During the study of RCU, I encountered confusion about how X86's
> irq_disable affects Linux IPI delivery.  So I spent a week trying to
> find out the fundamental mechanism by debugging the qemu virtual
> machine. I think my experience may help others, and I guess the
> perfbook mailing list is the best place to share my experience. Please
> correct me if it is improper.

No objections here.

> I learn how Linux IPI is blocked by irq_disable by means of debug qemu
> virtual machine:
> Fig 1 (https://ibb.co/Ypv3hNm)  CPU 1 sending IPI;
> 
> Fig 2 (https://ibb.co/162sVyV)  CPU 0 receive the interrupt;
> 
> Fig 3- Fig4 (https://ibb.co/bzFkckM, https://ibb.co/TmC3rn4) but CPU 0
> has irq disabled, so the IPI will not be served at that moment;

Yes, if interrupts are disabled at the receiving CPU, then the
interrupt must be deferred ...

> Fig 5 (https://ibb.co/k8BpBMq)  CPU 0 enable irq;
> 
> Fig 6 (https://ibb.co/zNBrMJk) now IPI got served

... as you say, until that CPU enables interrupts.  This of course
applies to all interrupts (other than non-maskable interrupts, which
are usually called NMIs), not just to IPIs.

Which is why disabling interrupts for long periods of time is not a
good thing.

> Thanks for your continuous encouragement ;-)

You are welcome.  ;-)

							Thanx, Paul
