Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiHUW7t (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 21 Aug 2022 18:59:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA8B1F2C4
        for <perfbook@vger.kernel.org>; Sun, 21 Aug 2022 15:59:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C417DB80D8D
        for <perfbook@vger.kernel.org>; Sun, 21 Aug 2022 22:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661122786;
        bh=rScnqMH934916CBlGEYRa3RAMj3HlaP8adlr6odnSRk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=h1I3VIO1xUF8opl0PSxhiS7cvfWiUKqJwqsU3VkyQ436tvVIv/c5bWTRIVRlyp82w
         JkT5TkXM9N7OQKNMgPnelbpf63MxDWPZ8jOvQPtaV8a/WFjsRoVZqIi/zdmouT6iiY
         s/Sdtkvn/NI1rCz4mnKabZMs8HWIPJIKlJJBJvk+0RrytcHZmbJjaM/QNGvY2bTJBl
         6IW9xcF8ilrHnMH7NzIEI+Ku7ROIW0LXVS+agyPalS6wspM76OGE2HOiFsaPm0UpsK
         StQhGKTVutkLwg2x8JH9gN6RyGt4+B+Xl3W/6cxlgevi+V392w0MHh+Oriyhi17+zC
         kidsZ4luRLgBg==
Date: Sun, 21 Aug 2022 15:59:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] count: Switch from GCC to C11 thread-local storage
Message-ID: <20220821225945.GB6159@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220817110049.182128-1-e2lahav@gmail.com>
 <0dfcdb91-12d7-86f7-4c8d-26a101bec7b5@gmail.com>
 <CAJbg=FW02u8dCHnTE9nEUtvGvVQKpEzUZByXs0O0qc9hQK6XyA@mail.gmail.com>
 <20220819020258.GJ2125313@paulmck-ThinkPad-P17-Gen-1>
 <61a2ce14-2eb5-cab9-a454-ca7073fefef7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61a2ce14-2eb5-cab9-a454-ca7073fefef7@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sun, Aug 21, 2022 at 01:57:42PM -0400, Elad Lahav wrote:
> On 2022-08-18 22:02, Paul E. McKenney wrote:
> > Incrementalist that I am, my thought is to take this one thing at a
> > time, if and when.  ;-0
> 
> What would you like to do? I have no objection to dropping this change, but
> I think (at least in principle) that using standard language features is
> better than using compiler-specific extensions. If nothing else it makes the
> MISRA folks happy ;-)

;-)

Applied, thank you both!

							Thanx, Paul
