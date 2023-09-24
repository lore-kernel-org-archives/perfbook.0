Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjIXO6H (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 24 Sep 2023 10:58:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81721FC
        for <perfbook@vger.kernel.org>; Sun, 24 Sep 2023 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695567481;
        bh=mept68lO9NAYOqx3bNhqLXfm/qyqK+ojbCTeKLiMBUI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=REFW25DDcXpHc27/v16sOgjvs6OPY02DaYj61iUZs9eQwtpG8/n1d/VTuiRrTvdlO
         HckS0uWrBZBd2cUQQwfYmFdfHD/fIYYtwXSYfGYJb/gPwZ+keRJs0AdrcEas6VRDrj
         H0aeCMEpo/kfY94CGiJdPZGEPdPQqvOkCDGXI8MMN99HeQ4krh6NstzYGTrwsdd8PS
         2NBmGUZGTT085NQefN1nKjhIjNGyY8BASl/NDWEYx0zHQ1haWzKSwPCMDPhw+D2p7D
         eAOL2lKLDs4FumlAR3HEoZpv9+w37PIzKpJky/aYkLdI117KPxQMfv/DHHvejFxEcU
         rWhFq7yJ6PgJQ==
Date: Sun, 24 Sep 2023 07:57:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/10] memorder: Trivial fixups
Message-ID: <e15693f4-8192-4b83-a6c0-04718265df47@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230923163204.14558-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

On Sat, Sep 23, 2023 at 09:31:54AM -0700, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> This patchset contains trivial fixups memorderdebugging/, which found
> while doing Korean translation[1].
> 
> [1] https://github.com/sjp38/perfbook-ko_KR

Very good, thank you!!!  I have queued and pushed all but the last one.

							Thanx, Paul

> SeongJae Park (10):
>   memorder: Fix typos: s/,/./
>   memorder/memorder: Add a missing space between column name and
>     'column'
>   memorder: Add missing unbreakable spaces between 'values', 'and', and
>     numbers
>   memorder: Remove an empty fcvref block
>   memorder: Remove braces for single line if-else blocks
>   memorder: Consistently use \co{} instead of {\tt } for code
>   memorder: Consistently use '\co{}' for 'herd'
>   memorder: Remove a redundant sentence for memory barrier strength
>   memorder: Make clear the scope of READ_ONCE()/WRITE_ONCE() heavy uses
>   memorder: Fix wrong primitive names in a quick quizz
> 
>  memorder/memorder.tex | 72 ++++++++++++++++++++-----------------------
>  1 file changed, 33 insertions(+), 39 deletions(-)
> 
> -- 
> 2.17.1
> 
