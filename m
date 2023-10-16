Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjJPEBn (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 16 Oct 2023 00:01:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786D3C5
        for <perfbook@vger.kernel.org>; Sun, 15 Oct 2023 21:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697428900;
        bh=3eHBZhZsiEBONclPB9Ceaw1j9ufm0J0kxKVXyoRc2LM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qE4t70XLpKPBC6lYmz3u+NwWMUqpyIWayvvShR7TRPAM/TUD95sA2tyvRutrx+IA/
         yiL6SzhgIzaBo+4C6HfBkEJ+hEwkmgpSBxTkYS03teoIMr1HpC6Zj7+kSZIiPxqm2v
         LZs+x75J2W5R7KHIQS7GLJQfwwLqxkO9N/42nZwHqOpudjel8Hs8QKHkr30O/t++4y
         IL8CoyalpVnb3M9aojj6gFszAz92n+tHJt7Dzx0FMkjh2Z427qL3zncMvosv9WvA01
         B3mwRNoR83JbBKQ8psUHwLdphajZf7PNq3h1qsBnN+f7bgN+MqHQctxlBuR0YpOaj9
         XpGE35oFZTUpw==
Date: Sun, 15 Oct 2023 21:01:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v2 0/3] memorder: Add info on recent x86
 implementation of smp_mb()
Message-ID: <b89ac639-10f8-440f-8a80-2bc942934d12@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20231013012238.1455140-1-joel@joelfernandes.org>
 <91cf01c3-3e67-4763-ab27-9070e50cb245@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91cf01c3-3e67-4763-ab27-9070e50cb245@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>, perfbook@vger.kernel.org

On Sat, Oct 14, 2023 at 05:37:04PM +0900, Akira Yokosawa wrote:
> Hi Joel,
> 
> So this is v2 based on your patch.
> 
> As is often the case in perfbook workflow, I split the bib
> update into Patch 1/3.
> 
> Patch 2/3 includes much more changes than I thought.
> Please see notes under "---".
> 
> Patch 3/3 is my own adjustment of the paragraph in front of
> your update.
> 
> And I dropped "Cc: Paul", as Paul is the one who will be in
> the SOB chain.

Queued and pushed, thank you both!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (1):
>   memorder: Update of ordering SSE non-temporal memory move instructions
> 
> Joel Fernandes (Google) (2):
>   bib/memorymodel: Add Tsirkin2017
>   memorder: Add info on recent x86 implementation of smp_mb()
> 
>  bib/memorymodel.bib   | 10 ++++++++++
>  memorder/memorder.tex | 16 ++++++++++++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> 
> base-commit: a01629a5f734b7617ee0ac4d4ded28b0605cf7cd
> -- 
> 2.25.1
> 
> 
