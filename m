Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiGQQ10 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 17 Jul 2022 12:27:26 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D62513D69
        for <perfbook@vger.kernel.org>; Sun, 17 Jul 2022 09:27:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 65B12CE0B26
        for <perfbook@vger.kernel.org>; Sun, 17 Jul 2022 16:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658075241;
        bh=zhE6uydHVZu/QNU3VXJkZjqevKTBcfi5wMdL20v8+QA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Qz0pEJ/n7GOnPQ7kZVrlwX0M84+EgEPtTCtJuFZ8+6DZDop4TUXQ/KfMqx1qOaTqt
         cvV66n+0BaUlVCugNf6Bc2B8QerrX1ufVsTi2Cn6kf558a5649fScuORSeEijafmUX
         bJw4qzlpY6mRe9rYLPuZYiH7ZwRy1S+XGAb3KMBexAbiDBCrp3WzXgokdTBV9MJ5T4
         Qpkuaatrm3WuFQCVGMoRUcuUKa+YXbkVY3Dw3YzXt1o2iF7AXm6L1lDo0bv8EvoCA9
         I/ybM1NUJkhwNnaJNtnsc8+zjGFWE72w5ON5FI8/Xpg7OcdNFy7ZcHz9RCJT3HgVFr
         MADw8DcGlrSwA==
Date: Sun, 17 Jul 2022 09:27:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] SMPdesign: Fix typos
Message-ID: <20220717162721.GD1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <c784e9e1-7cf5-bb7e-18e1-4aa7ae7665ef@gmail.com>
 <a3b49e75-590b-9346-96e1-90d7cf5c87fe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3b49e75-590b-9346-96e1-90d7cf5c87fe@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jul 17, 2022 at 01:11:03PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> I'm not 100% sure these are the right fixes.
> Sending this one in the hope of getting Paul's attention.

You got them all right, thank you!

I queued and pushed both patches.

							Thanx, Paul

> 
>         Thanks, Akira
> --
>  SMPdesign/SMPdesign.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 4d93c6e72f0b..05b86ec7271b 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -260,7 +260,7 @@ of time during which no CPU owns this hash table.
>  
>  \QuickQuiz{
>  	``Partitioning time''?
> -	Isn't that is an odd turn of phrase?
> +	Isn't that an odd turn of phrase?
>  }\QuickQuizAnswer{
>  	Perhaps so.
>  
> @@ -593,7 +593,7 @@ Another important instance of data ownership occurs when the data
>  is read-only, in which case,
>  all threads can ``own'' it via replication.
>  
> -Where data locking partitioned both the address space space (with one
> +Where data locking partitions both the address space (with one
>  hash buckets per partition) and time (using per-bucket locks), data
>  ownership partitions only the address space.
>  The reason that data ownership need not partition time is because a
> -- 
> 2.25.1
> 
> 
