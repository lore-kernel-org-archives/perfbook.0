Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbhL0UVL (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 27 Dec 2021 15:21:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255DDC06173E
        for <perfbook@vger.kernel.org>; Mon, 27 Dec 2021 12:21:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D89C5B81131
        for <perfbook@vger.kernel.org>; Mon, 27 Dec 2021 20:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640636468;
        bh=pHXkxu/1FcTyxp2E6hv975KrF9BzYduj/39vkwzolNY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CxAZlYnb86OwOLlhvEZBPaG9Tc2VhAzlNMakNE4Hp/QAgia3qlb3Z10NpPwZ4ffCD
         7uLgoxaHbf8r7JlKGktdZA2O6WHQ6wqfz+mhmWtuB3bZoCqwPwqN19T1cy+EvD01bN
         J5mm0osn968ifeQFhxvC4ut0e6kocF7vXTPvxf9EMKeTd4dnQLS6cvn/2KqIsgJC04
         tceg7QJG5hjIbrrDNrF8XX50J/F+2Kp904ix4J+slgncRqH/ReHtDXfCBSS+9sZSvU
         ZME61SREgSaxxb6IBzZ6GaGLPD+b4NU4TTfRAepewFERFj9NxU75mbKZ9AJ9C2Cgra
         czy/q0CepQktg==
Date: Mon, 27 Dec 2021 12:21:08 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] count: Fix trivial nits
Message-ID: <20211227202108.GV4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211227085213.9246-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227085213.9246-1-sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Dec 27, 2021 at 09:52:11AM +0100, SeongJae Park wrote:
> This patchset contains two fixes for trivial nits in 'count' chapter.
> 
> SeongJae Park (2):
>   count: Adds a missed unbreakable space
>   count: Add missed parentheses for balance_count()

Good eyes!  Queued and pushed, thank you!

							Thanx, Paul

>  count/count.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> -- 
> 2.17.1
> 
