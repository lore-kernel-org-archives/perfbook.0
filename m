Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231156AbhECQW3 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 3 May 2021 12:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620058896;
        bh=/v4p8n091pNADB+0mfj8CRN1jbrkRHaEXv3GZVxb6I4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ij3IsJGozhwwRrgmC6Yne962VKQwLoS0+1Ye5ZQ6icr18WHUTQH906mEC16yRtKqa
         eHZ3y8IJh5JXeF6oSzLmvwoedYr6JKhHdDTP046jycCRLuSi0H6D+YO8E3CCGe2sU2
         w44Xbulc13DXYIcui2H6iTNmvWoehretPR93lwTDbZpKhJeB8J56SoJ8QdtIYGJb72
         ma621hgP3UyleIabNzYwzDCfSbHKxuen6cEzjJdtCxwBZiUF1gtuc3O9oNZsICIeOC
         0EeHBneiCUcw11QfIOpAeCTVql8+zWZh4MLYYH23hOU9n3ZVCwYQIX4FADzbPyG+Ig
         YCxOp5GrX102A==
Date: Mon, 3 May 2021 09:21:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Fix the description of rcu_gp_ongoing
Message-ID: <20210503162135.GT975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210503121554.4520-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503121554.4520-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: luyang.co@gmail.com, perfbook@vger.kernel.org

On Mon, May 03, 2021 at 08:15:54PM +0800, Zhouyi Zhou wrote:
> Hi Paul,
> 
> I am going to revise Chinese Edition of Appendix with
> Yang Lu's unreserved help.
> 
> During the process of reading, I examined the definition of
> rcu_gp_ongoing in CodeSamples/defer/rcu_nest.h
> Would it better to describe rcu_gp_ongoing in the book as:
> 'it checks the set of bits indicated by RCU_GP_CTR_NEST_MASK.' because
> I think 'it checks the bit indicated by RCU_GP_CTR_BOTTOM_BIT'
> is a little confusing.

Good eyes, thank you very much!

I just made "bit" be plural, so it now reads "the bits indicated by
RCU_GP_CTR_NEST_MASK".  Queued and pushed, and again, thank you!

							Thanx, Paul

> Thanks alot
> Zhouyi Zhou
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
>  appendix/toyrcu/toyrcu.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index 8fd2aef0..830e4478 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -1215,7 +1215,7 @@ adds \co{RCU_GP_CTR_BOTTOM_BIT} to the global \co{rcu_gp_ctr}
>  instead of adding the constant ``2'',
>  and the second is that the comparison on \clnref{ongoing}
>  has been abstracted out to a separate function,
> -where it checks the bit indicated by \co{RCU_GP_CTR_BOTTOM_BIT}
> +where it checks the set of bits indicated by \co{RCU_GP_CTR_NEST_MASK}
>  instead of unconditionally checking the low-order bit.
>  \end{fcvref}
>  
> -- 
> 2.25.1
> 
