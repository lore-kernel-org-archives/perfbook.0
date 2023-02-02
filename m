Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjBBBxj (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 1 Feb 2023 20:53:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391AA38677
        for <perfbook@vger.kernel.org>; Wed,  1 Feb 2023 17:53:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9EEA2619AB
        for <perfbook@vger.kernel.org>; Thu,  2 Feb 2023 01:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675302818;
        bh=p8JgJTV7Zc9D/oDv9f40TDkiW6r4po1TY50E8ijeI40=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZTJODs4zg7YAHRKjuM4BRBFc0+GHuzKHVrrF+ykWC3LaDWar2OXV+y8uhw4ISm7F3
         0EzLX1Ievve3SIfx8zCd6Ff3hwgqg+r/gX4gb9dt2zvht2m7fLEFUMlyoJ39EERtGQ
         FL4P9HRyjfFdhXbjbu27h2aE1OKEmRSV68DVrU9IoSmLBzOZorIWS+m6uzzzgN7A/W
         dqR/LJa/ABLP4vBXZCSHiYDAQFDTb0ZGVAY/l7Sz7Da9TkfnRDaWvvhSMZX9umP3h7
         p0rwKP51lySmy0WiYbhMtckG9EcetVAemOgSTwBcWckMNMnStoenbAntJEfKBfz5IK
         z6ercuiwKaBhw==
Date: Wed, 1 Feb 2023 17:53:37 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
Message-ID: <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230201201529.901316-1-leobras.c@gmail.com>
 <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Thu, Feb 02, 2023 at 10:49:15AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Wed, 1 Feb 2023 14:13:02 -0800, Paul E. McKenney wrote:
> > On Wed, Feb 01, 2023 at 05:15:29PM -0300, Leonardo Bras wrote:
> >> Having this file merged on the main repository will trigger the Gitlab-CI
> >> on the mirror: https://gitlab.com/linux-kernel/perfbook/ after each push.
> >>
> >> The way it works:
> >> - Compile-test CodeSamples
> >> - IF pass, build PDFs: regular, 1c, eb
> >>
> >> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > 
> > Queued and pushed, thank you!  Let's see how github (as oppoed to your
> > gitlab) reacts to this.  ;-)
> 
> I happen to have a perfbook repo at gitlab where CI is not set up.
> When I pushed this change, I got a mail from gitlab saying:
> 
> >  Subject: perfbook | Failed pipeline for gitlab-ci | 55c81b9b
> >
> >  Pipeline #764856510 has failed!
> 
> I don't think it is reasonable for Paul's repo to have gitlab
> specific settings like this.
> 
> Paul, can you please revert this?

Done, and apologies!

Leonardo, would another approach be to create a separate branch in your
repo that contained this file, then automatically cherry-pick or merge it
with each perfbook update?

							Thanx, Paul
