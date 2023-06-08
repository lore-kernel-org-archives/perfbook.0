Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbjFHSbV (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 8 Jun 2023 14:31:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C14133
        for <perfbook@vger.kernel.org>; Thu,  8 Jun 2023 11:31:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4F4964D0C
        for <perfbook@vger.kernel.org>; Thu,  8 Jun 2023 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686249079;
        bh=DF41LqXyDb7CMuo9TckiDZAIjQo3rNbUttB0XqersZQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HNAUHGAXUyZUFUxN91+jHpqBosmAbXjKw6SvXh+h1VASYJMHS3m7cmRx+uAWIIVjo
         5jO/zNX+NfKV9n+BoF17WFAsEe5tuhsZkZPDWcq19E3IN/PjQnnj3DvJBkvB/3P4cq
         zZTm7HrST6+AP9WcPZ/TUEu2faRPSbzFpneMlzBHg4g35EBukTpG+c9gx1WU+4YKW5
         GOQwdnxO2y625dsadmXDyOPFaIJSNg/DhEGfZMZ4GNIrh1GyLuVN/7bb72M057mthX
         5Kkx7RgnW27OYHY++nJydTNC54OvfQGps5LMS2AmwUAwalINoFwDpVXkYqF5TMepEr
         6avo+Qr5gYZNg==
Date: Thu, 8 Jun 2023 11:31:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] advsync: Fix typos
Message-ID: <35dbd50d-9ae7-46d3-b280-a4863173cb8d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230607114838.4582-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607114838.4582-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 07, 2023 at 11:48:38AM +0000, Alan Huang wrote:
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Good eyes!  Applied, thank you!

							Thanx, Paul

> ---
>  advsync/rt.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index 8e0347b0..c4d9c3c2 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -1228,7 +1228,7 @@ read-side critical section and both the \co{rt_read_unlock()} and the
>  This is necessary because non-realtime kernels' reader-writer locking
>  functions disable preemption across their critical sections, and
>  there really are reader-writer locking use cases that rely on the fact
> -that \co{synchronize_rcu()} will therefore wait for all pre-exiting
> +that \co{synchronize_rcu()} will therefore wait for all pre-existing
>  reader-writer-lock critical sections to complete.
>  Let this be a lesson to you:
>  Understanding what your users really need is critically important to
> @@ -1745,7 +1745,7 @@ These constraints include:
>  \end{enumerate}
>  
>  \QuickQuiz{
> -	I couldn't help but spot the word ``includes'' before this list.
> +	I couldn't help but spot the word ``include'' before this list.
>  	Are there other constraints?
>  }\QuickQuizAnswer{
>  	Indeed there are, and lots of them.
> -- 
> 2.34.1
> 
