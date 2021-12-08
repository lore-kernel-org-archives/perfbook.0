Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239922AbhLHT7Y (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 8 Dec 2021 14:59:24 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58E2C061746
        for <perfbook@vger.kernel.org>; Wed,  8 Dec 2021 11:55:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 140B4CE2340
        for <perfbook@vger.kernel.org>; Wed,  8 Dec 2021 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638993348;
        bh=6eT8POzu5tgCFqgUwNzj+XguHOz7vzwTzq034DrMB2I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gZI0B8Ut9raNwIiYnNBrX5iwaNEWz22j2fn4AN8ETISClSMO7APQXfzpZTtmt6ovJ
         0OiwXmQFw+zabGc0m8PrqWRLy3oUb3AKUg6y8nfXli6vA3H5XFUm6Q2wmOREMHU9LC
         vfEIzAusJMbW8ebbos5UmPU//pLuO9cICXtUM7RTkNCXsbY340vBhuJ/pDUg5nwE9G
         97ZJ0e502YsAwdRzttaBdejJY5L/zkyHG7uQtuw9vBjwFLItY5ZkaMPVYx0FRw7XhJ
         Eg2XyU4SlpiozHKKFJpFIRWBxzfV6NqMpvsUUI+QrSK6PUuFjywliT8d47B/8V2u+i
         S1nj1UlEWwafw==
Date: Wed, 8 Dec 2021 11:55:47 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/4] Address potential widowing of headings
Message-ID: <20211208195547.GY641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 08, 2021 at 04:37:26PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> There was some confusion on my side WRT undesired page/column
> breaks.
> 
> While testing the added checks in cleverefcheck.pl, I saw too
> many potential such cases flagged.  This made me do some tests
> to reproduce unfortunate page/column breaks.
> 
> There are three such patterns I have confirmed.
> 
> 1. "listing" environment (with contents of fancyvrb) next to proper
> LaTeX headings (\chapter, \section, \subsection, etc.)
> 
> 2. Any environment (not necessarily float) next to QQA heading
> of "Answer:"
> 
> 3. Any environment (not necessarily float) next to epigraph
> 
> This means commit f106e0e6dc43 ("defer/rcuusage: Move float objects
> away of section titles") has no merit.  It is safe to revert it if
> you'd like.  I was confused by patterns 2 and 3 and thought that
> floating objects can cause undesired breaks. 
> 
> Patches 1/4--3/4 add tests in cleverefcheck.pl that check patterns
> listed above respectively.
> 
> Patch 4/4 fixes problematic places flagged by the updated script.
> Feel free to wordsmith the leading phrases I added in QQAs.

Queued and pushed with minor wordsmithing to parts of 4/4,
thank you!

						Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   cleverefcheck.pl: Add test of listing next to heading
>   cleverefcheck.pl: Add test of \begin{...} at head of QQA
>   cleverefcheck.pl: Add test of \begin{...} next to epigraph
>   treewide: Address potential widowing of headings
> 
>  appendix/questions/after.tex  |  4 +++
>  datastruct/datastruct.tex     | 14 +++++-----
>  defer/refcnt.tex              | 24 ++++++++---------
>  formal/axiomatic.tex          | 22 +++++++--------
>  locking/locking-existence.tex |  9 ++++---
>  memorder/memorder.tex         |  6 ++---
>  utilities/cleverefcheck.pl    | 50 +++++++++++++++++++++++++++++++++++
>  7 files changed, 92 insertions(+), 37 deletions(-)
> 
> 
> base-commit: f106e0e6dc436683bb119dd8992c6f173994d182
> -- 
> 2.17.1
> 
