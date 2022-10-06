Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiJFNAJ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 6 Oct 2022 09:00:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CD9205EE
        for <perfbook@vger.kernel.org>; Thu,  6 Oct 2022 06:00:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82647618F8
        for <perfbook@vger.kernel.org>; Thu,  6 Oct 2022 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665061206;
        bh=pqK4BQmmEM34KX0z4TmRcfjc3y7e3XqPzcfhv+Pj/Fo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DApCkb9XnUelgOFIa/HdOtTCa4miODINelLWrFeTAt2niIsTmhfh3wmhyXPu5kwQf
         6jH0GRQraIZssXX7ZPh44iM/rpjobVzXs8+RrVbtjmleOyu7JjQyBxq1THrU6Tqv5E
         WGDe3kaKz1ggZ56CG0+17XGisrRShFgXLjQf3s3OmSacOFZLIZVLgXgMr6jTPMe/yD
         A+f3WnGXnJ6vjVRF9ObKmGdXdJamA7bhuJlrZgdd3l3FXR8rUStWeQPl5aB9j1801t
         6Jpx8ayn36e+ZmlMtw0Bmpw3MSfem2wJIAE/47vKwm3l6pH0KzDqoZvvamG92e6kyE
         NZu7uTvPGG0AQ==
Date: Thu, 6 Oct 2022 06:00:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] locking: fix small typo
Message-ID: <20221006130006.GU4196@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220930014636.429996-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930014636.429996-1-e2lahav@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 29, 2022 at 09:46:36PM -0400, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>

Good eyes!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  locking/locking.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 45a12caa..032bd13d 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -1473,7 +1473,7 @@ Should readers be allowed to continue to acquire the lock, possibly
>  starving the writer?
>  Similarly, suppose that a writer holds the lock and that a large number
>  of both readers and writers are waiting to acquire the lock.
> -When the current writer release the lock, should it be given to a reader
> +When the current writer releases the lock, should it be given to a reader
>  or to another writer?
>  If it is given to a reader, how many readers should be allowed to acquire
>  the lock before the next writer is permitted to do so?
> -- 
> 2.25.1
> 
