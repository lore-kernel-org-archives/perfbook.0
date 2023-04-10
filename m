Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjDJCm5 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 9 Apr 2023 22:42:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9982721
        for <perfbook@vger.kernel.org>; Sun,  9 Apr 2023 19:42:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 57275611B4
        for <perfbook@vger.kernel.org>; Mon, 10 Apr 2023 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681094575;
        bh=OKF0//p4MVS9VjCERRR621uFL510J2dfExOM+xPtAGw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KtMGhwA6gXSS/yT/6t6FXy2bf9SW6qyiFeoQyetjY88znlBfIhqUI18G9jAqPVhgb
         GWTYfDdhZIerLnwCC9py30sOlvlQ4AWBY84w+c4InQOdGy1A0eaRecdAV1PRCZ/jPa
         M289/3AnnDHuAETCo6dZf893Yrp++TALBTbwor++54JiCCg+/Q4lPMDy6rVXHOeFei
         pOgVjHa/HXMgycKHV8duIi7s0wWROGsBaLidaGjAEsWiN3KUnxLoSGGNSDwkVv0V2B
         Embh55UGFb2NlhBncUL5xN1VHlDq6agnZYSifmjxjine0h7f2M7vC0RRYvCqtbKNbR
         KoTzz/8dwf78g==
Date: Sun, 9 Apr 2023 19:42:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/12] formal: Trivial fixups
Message-ID: <cda423e8-4eae-4f79-b7b9-6fc51d9a8553@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230408173309.5543-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

On Sat, Apr 08, 2023 at 10:32:57AM -0700, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> This patchset contains trivial fixups for formal/, which found from
> its Korean translation[1].
> 
> [1] https://github.com/sjp38/perfbook-ko_KR

Queued and pushed, thank you!!!

							Thanx, Paul

> SeongJae Park (12):
>   formal/formal: Drop cppmem from 'Special-Purpose State-Space Search'
>     section explanation
>   formal/spinhint: Use \qco{} instead of ``\co{}''
>   formal/spinhint: Enclose example code snippets with \co{}
>   formal/spinhint: Do not call 2013 paper as recent
>   formal/dyntickrcu: Quote 'trail' file consistently
>   formal/dyntickrcu: Use \qco{} instead of ``\co{}''
>   formal/ppcmem: Use uppercase 'S' for Spin
>   formal/ppcmem: Use \qco{} instead of ``\co{}''
>   formal/ppcmem: Add missed non-breakable spaces
>   formal/ppcmem: Enclose example code snippets with \co{}
>   formal/ppcmem: s/powerpc/PowerPC/ on sentences
>   formal/ppcmem: Fix label name for Fail1:
> 
>  formal/axiomatic.tex  | 30 +++++++++++++++---------------
>  formal/dyntickrcu.tex | 10 +++++-----
>  formal/formal.tex     |  2 +-
>  formal/ppcmem.tex     | 26 +++++++++++++-------------
>  formal/spinhint.tex   | 16 ++++++++--------
>  5 files changed, 42 insertions(+), 42 deletions(-)
> 
> -- 
> 2.17.1
> 
