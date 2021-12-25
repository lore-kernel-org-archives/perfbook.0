Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhLYIDw (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 25 Dec 2021 03:03:52 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFE0C061401
        for <perfbook@vger.kernel.org>; Sat, 25 Dec 2021 00:03:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 34BD9B8075D
        for <perfbook@vger.kernel.org>; Sat, 25 Dec 2021 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640419427;
        bh=Rb0noxnVSgYN86H7ajO4thcaVpoMKXAtvOUv592gc/Y=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=POZBKsc2zUuaHszglVcJP9FSRKdTzQMZvPUOOLRcGRdL/31UlNWGyEAWsGOirXYsy
         Bb0X7sz54x4CLqCFvxPRB5uxL7qgrfW2D0IUH6d36+3P3Lea7cf1k2fbEWCnzoZOFH
         ghHugFkSFlJfSiCqhHoqNEHWDgAunJqQKWS5W7QvZAB1iAAJBwT5SUZLqB/ZoC/H9+
         weRZrGYLZzt5kFiNO57wH9gLgmzEY8ZPCFBRVDaUWVbBDJgKtJzJqK32jsQCU9+q86
         0NvkHWfNtD6M9YGN21k2Izjz1HzLo5sJdi4LNgiMzAqUblOpZHfTN+RgOasbod+psx
         lrEj+VYG4Bv8g==
Date: Sat, 25 Dec 2021 00:03:47 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Draft blog post on v2021.12.21a release of perfbook
Message-ID: <20211225080347.GS4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211224205309.GA1015523@paulmck-ThinkPad-P17-Gen-1>
 <a120d22c-50e4-c74d-8968-81744ad99c2e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a120d22c-50e4-c74d-8968-81744ad99c2e@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, sj38.park@gmail.com, bsingharora@gmail.com, shiyn.lin@gmail.com, e2lahav@gmail.com, luyang.co@gmail.com, zhouzhouyi@gmail.com, pat.github@tullmann.org

On Sat, Dec 25, 2021 at 09:40:01AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> On Fri, 24 Dec 2021 12:53:09 -0800, Paul E. McKenney wrote:
> > Hello!
> > 
> > I have drafted a blog post for the new release here:
> > https://paulmck.livejournal.com/66892.html
> > 
> > I have also added the epub build to the landing pages:
> > https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
> 
> Well, it's not epub as (ebook-size PDF) != EPUB.

Good catch!  I changed from "epub format" to "ebook-sized PDF".

Better?

> Also, there remains the old remark on "horrible results" of such builds.
> I think there are still rooms to improve, but it looks mostly reasonable now. 

I had forgotten about that, and just now reworked it.  Thank you for
the reminder, and please let me know if additional adjustments would
be helpful.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Finally, I updated the Arxiv version at https://arxiv.org/abs/1701.00854.
> > This is in "submitted" state, and may take a day or three to become visible.
> > 
> > In the meantime, please let me know of any errors or omissions!
> > 
> > I will post to my personal social media in a few days.
> > 
> > 							Thanx, Paul
> > 
