Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjFJABh (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 9 Jun 2023 20:01:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3EB35B1
        for <perfbook@vger.kernel.org>; Fri,  9 Jun 2023 17:01:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F11063456
        for <perfbook@vger.kernel.org>; Sat, 10 Jun 2023 00:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686355295;
        bh=R+AK57/qx3yqPtx3LlOaSIkqZxsy/Y4N0Gqat6hgOtg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JuTjuQ0USOH4oq/zUm6+qqWl5J9NDfwyj1t60O+YcwsWNi8pAIIGsoWNoW1+t/OFA
         7XwubnPvYm2dGqwaxAmVB2fYtDKtCgb/R/nb0TiskT1nhih8UuL8/NV4gLPRZ+2kkQ
         z9CXhrCt2O0ztWOzmcfqwDw3cWW6rSQXbYKu8BWeMUUEmT5QR83SzkGDM2qB8dgSML
         fr5CQsNeZEGwQpBRk3fzgn+cECd6cfcc6rafxzctMJL6E1LNsS3XDmOjMFP8LcAx4t
         J8ubNaJ46edHdNfIKpeJBBRB9UwHhdCx/4iXqFOqYAHWFbusgWRs2Z9sqIwZZ5xxjr
         By4SS/8TBZynA==
Date: Fri, 9 Jun 2023 17:01:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question about commit 94f01e467566("together/applyrcu: Note
 possibility of lost counts")
Message-ID: <9af444bc-ff74-48af-a825-6532b90cb580@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <68A3E1AD-093D-4EA7-930D-0BED8BF42A3F@gmail.com>
 <246323b4-4f1a-4631-923a-bd45a90b6b5b@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <246323b4-4f1a-4631-923a-bd45a90b6b5b@paulmck-laptop>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jun 09, 2023 at 03:54:33PM -0700, Paul E. McKenney wrote:
> On Mon, Jun 05, 2023 at 11:29:22PM +0800, Alan Huang wrote:
> > Hi Paul,
> > 
> > I noticed this commit 94f01e467566("together/applyrcu: Note possibility of lost counts”) said that:
> > 
> > 	count_unregister_thread()  can result in the outgoing thread's counts being lost. 
> >         This can happen when read_count() is invoked between lines 66 and 68.
> > 
> > However, line 66 NULLs the local data, and it has not been published, I don’t think 
> > count_unregister_thread()  can result in the outgoing thread's counts being lost.
> > 
> > Or, am I missing something?
> 
> You are missing nothing.
> 
> Some days it does not pay to touch the keyboard, and apparently last
> week had at least one of those days.  :-/

(And I did revert that change with your Reported-by, in case you were
wondering.)

							Thanx, Paul
