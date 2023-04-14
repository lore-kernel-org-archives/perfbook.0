Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDNAPU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 13 Apr 2023 20:15:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90942448F
        for <perfbook@vger.kernel.org>; Thu, 13 Apr 2023 17:15:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0845A641D8
        for <perfbook@vger.kernel.org>; Fri, 14 Apr 2023 00:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681431295;
        bh=xaP2AM96TIghria6R50hK6HcOOmCYQUMapmTBdv7XoA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qbLJiverKO8Vk9xHlbgloulYp2FJPQFV5Jwbr0mentQ6+5GPxE9cQ3IitX+YZtIRL
         J497zAzm6i7GqZh2x3PrZpuBzfsvQFDdfReXJdycQMC0AgQNp4YtQifZ+3E8MLU+LJ
         sOoEXf7JPm4QG+TARmZrd0fTlj46Q18tosh3893qCuy9KRvbT3sZsjLfWe60CPKOq9
         IhGG2+itqDE3adcxPdX83lfILi1dSN9zPVz3w8jnkkuLtxZ96f++Ink09aJUt7R23t
         FZhg792fjzWga3ZLov0LHIXlNm8QvXrZNphzadroH+fubPHqzqN5WcmD9DaMgpQ2Cs
         gOetwEAudLWNg==
Date: Thu, 13 Apr 2023 17:14:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: On travel this coming week
Message-ID: <35e90e12-4eee-404c-8440-dc6e9a762738@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a7df2e3c-fa3a-4f1a-ad5f-b8004300b31a@paulmck-laptop>
 <CAABZP2wG8J658Vmv=0O8fGZEvkzkv08yC2=paSRaZ5=mSc4OCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABZP2wG8J658Vmv=0O8fGZEvkzkv08yC2=paSRaZ5=mSc4OCg@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 14, 2023 at 06:55:35AM +0800, Zhouyi Zhou wrote:
> On Fri, Apr 14, 2023 at 3:41 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > Hello!
> >
> > I will be on travel for a week starting tomorrow (Friday), Pacific Time.
> > I may be off the grid for extended periods during this time, but will
> > catch up upon my return.
> >
> > Have a great week!
> Happy to see our mentor go vacationing ;-)
> Please defer processing our possible patches ;-)
> Have a great week!

Thank you very much!

							Thanx, Paul
