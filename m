Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbiIZPOO (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 26 Sep 2022 11:14:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB2E1122
        for <perfbook@vger.kernel.org>; Mon, 26 Sep 2022 06:56:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89444601D2
        for <perfbook@vger.kernel.org>; Mon, 26 Sep 2022 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664200607;
        bh=Q1Bq0ZSFwmVFZ1MthtMQEAvCFEJi/IFV4m8LklL6fP4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=dn2XteJOA2HDbKbopDclOLl4rblB7isC6CjZ8HHRRWDWx80DZBMocsXUeKv2qYhU9
         WxPzVAF9IOn+8fhHhwThk4U6lqwbi3bOZHu704RboEH3zPJJPKSgDmWSZhn2TQB6Ob
         vGQICaJwA5Qp2aYax9+BecOfHeuqCu++ZfiVvJz/jPkVGdodfNqbKsCnEr9JIMdmsu
         cZ2Ic4GOPY3NL1k32El/kGrYZh5ctwnX1bJhvx9Buj+ogVlqPvNqm76po7kGrYSU9G
         lit0MCqOlGiOklnhyTeca52Tuu/wsDDQ8Tz3Hav3f3Xz+pu4PY4xxXwT/gRTt0RLNT
         pOFeXZ9MIfzNA==
Date: Mon, 26 Sep 2022 06:56:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: And, at long last, another perfbook release
Message-ID: <20220926135647.GJ4196@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220925225024.GA549132@paulmck-ThinkPad-P17-Gen-1>
 <69602cd9-49af-7842-db73-53d1f19c2914@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69602cd9-49af-7842-db73-53d1f19c2914@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: e2lahav@gmail.com, johann@jklaehn.de, sj38.park@gmail.com, maplewish117@gmail.com, zhouzhouyi@gmail.com, perfbook@vger.kernel.org

On Mon, Sep 26, 2022 at 09:05:52PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> On Sun, 25 Sep 2022 15:50:24 -0700, Paul E. McKenney wrote:
> > Hello!
> > 
> > The new v2022.09.25a release of perfbook is available, and the draft
> > announcement is here:  https://paulmck.livejournal.com/68537.html
> > Thank you all for your contributions to this release!
> > 
> > Please let me know if changes are needed.
> 
> Not on my contribution, but
> 
>     The code samples now use C11 thread-local storage instead of the
>     GCC __thread storage class, courtesy of Elad Lahav.
> 
> IIUC, Elad touched one of many code samples, namely count_end.c.
> So the conversion has just started.
> 
> For me, Elad's contribution of adding QNX as a platform for building
> code samples looks much more interesting.

Both good points, thank you!

I updated that paragraph as follows:

	One of the code samples now use C11 thread-local storage instead
	of the GCC __thread storage class, courtesy of Elad Lahav. Elad
	also added support for building code samples on QNX.

Does that work better?

							Thanx, Paul

> Just my 2 cents.
> 
>          Thanks, Akira
> 
> >                                           If I don't hear otherwise, I
> > will post this more widely by the end of tomorrow (Monday), Pacific Time.
> > 
> > 							Thanx, Paul
