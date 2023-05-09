Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjEIRsK (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 9 May 2023 13:48:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048BD35BB
        for <perfbook@vger.kernel.org>; Tue,  9 May 2023 10:48:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 880E662F05
        for <perfbook@vger.kernel.org>; Tue,  9 May 2023 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683654487;
        bh=cU7JmXA6YNAFVt2D8mB2KlJDUFzgpzmDmB1cEW4VMv4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=bRue2gK8D/82OT7sFBLr0R5lmpLPqpZgGdKUJbjDpQDbPqhaRnZOpQUZj05gz+heJ
         FZ2WpZjAXJ5xAWethIBAOTG1JcLRPNrUypyXwNr65A3aN4tXEnmDm1P9SvszjPPpGk
         XiJMSMZxO3+WPmYbhNNGy3nW4AkCoRLuGLpHtFFJQn4aAy5+X6Z0HyvyMhz/RfSXEG
         AYEWfCcbqO6Odo1kj2JSA5sU0oUH2YIkd4xN/yifob2XC5lUBt9j4m/u/xxo3ynj84
         4fLiaya/2z4en9IWmOt+R6ejjBHKkBHKctalznCx6PSK/sOa9wo03W5Ke9P4nAVPWv
         Gg3mXonLKzh1Q==
Date: Tue, 9 May 2023 10:48:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] datastruct: Remove outdated content
Message-ID: <3f3846c0-95f5-4a95-9632-e15807dcc0fc@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230509105318.32998-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509105318.32998-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Tue, May 09, 2023 at 10:53:18AM +0000, Alan Huang wrote:
> The code of resizable hash table has been updated so that it doesn't
> need to compute the hash twice since 2019. Here are some related
> commits:
> 	2ea492bbab9d ("datatruct/hash: Don't recompute hashes in hashtab_add()")
> 	2a7f20d234e7 ("datastruct/hash: Don't recompute hashes in hashtab_del()")
> 	  ...
> So, the patch removes the outdated content.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Good catch!  Queued and pushed, thank you both!

							Thanx, Paul

> ---
>  datastruct/datastruct.tex | 29 +++--------------------------
>  1 file changed, 3 insertions(+), 26 deletions(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 8c2bfc16..0242ccc7 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -2017,32 +2017,10 @@ which could allow the compiler to inline the resulting fixed functions,
>  eliminating not only the overhead of the call instruction, but the
>  argument marshalling as well.
>  
> -In addition, the resizable hash table is designed to fit an API
> -that segregates bucket selection from concurrency control.
> -Although this allows a single torture test to exercise all the hash-table
> -implementations in this chapter, it also means that many operations
> -must compute the hash and interact with possible resize operations twice
> -rather than just once.
> -In a performance-conscious environment, the \co{hashtab_lock_mod()}
> -function would also return a reference to the bucket selected, eliminating
> -the subsequent call to \co{ht_get_bucket()}.
> -
> -\QuickQuizSeries{%
> -\QuickQuizB{
> -	Couldn't the \path{hashtorture.h} code be modified to accommodate
> -	a version of \co{hashtab_lock_mod()} that subsumes the
> -	\co{ht_get_bucket()} functionality?
> -}\QuickQuizAnswerB{
> -	It probably could, and doing so would benefit all of the
> -	per-bucket-locked hash tables presented in this chapter.
> -	Making this modification is left as an exercise for the
> -	reader.
> -}\QuickQuizEndB
> -%
> -\QuickQuizE{
> +\QuickQuiz{
>  	How much do these specializations really save?
>  	Are they really worth it?
> -}\QuickQuizAnswerE{
> +}\QuickQuizAnswer{
>  	The answer to the first question is left as an exercise to
>  	the reader.
>  	Try specializing the resizable hash table and see how much
> @@ -2051,8 +2029,7 @@ the subsequent call to \co{ht_get_bucket()}.
>  	instead be answered with respect to a specific use case.
>  	Some use cases are extremely sensitive to performance and
>  	scalability, while others are less so.
> -}\QuickQuizEndE
> -}
> +}\QuickQuizEnd
>  
>  All that aside, one of the great benefits of modern hardware compared
>  to that available when I first started learning to program back in
> -- 
> 2.34.1
> 
