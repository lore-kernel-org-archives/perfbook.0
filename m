Return-Path: <perfbook-owner@vger.kernel.org>
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:46254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiBVF2A (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 22 Feb 2022 00:28:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825392AC3
        for <perfbook@vger.kernel.org>; Mon, 21 Feb 2022 21:27:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2AFF0B81856
        for <perfbook@vger.kernel.org>; Tue, 22 Feb 2022 04:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645504815;
        bh=NJ/vo4MZJMl05yVPQx7yXhFuJNi/z/JN4VvUfMvAlCA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jKBlBXyuBzRXodkoSuUcVnIPvQszCJM6L3UaWmYAg3npT9QYnBScGuR4CL4R8t3++
         6yPgMnHHBlEJ6G+R6KrzXQzHJAbFenvXybY7S2voN9HqSKCCYXLpvGm6QvGPAlbxlG
         Zyck6rhMborciW2SWzdwIdCICNQGBQLnETDEKTFGQ8iOkhOfcrXuUbcrPdBfvVgSCb
         0rU3chZ8eRb17UV9Bxhfd5wtQ2vNCLMOi+3NgrjYhNlux2o7vnjlHu49IQFX2GdmvV
         G49KM2J2n7dG9ogyPPolooBOrMZ2i6pEEsdwerOpF8dzkzlwADaBZprvmiUV8/SemK
         cDjg6NUw18HwA==
Date: Mon, 21 Feb 2022 20:40:15 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] future: formal: Fix an indefinite article
Message-ID: <20220222044015.GG4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220222021857.4002-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222021857.4002-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com

On Tue, Feb 22, 2022 at 10:18:57AM +0800, Zhouyi Zhou wrote:
> In section formal regression test, "an question" should be "a question" instead.
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul,
> 
> I think in the first paragraph of section formal regression test,
> "an question" should be "a question" instead.

Good eyes!

But the fix is to make it read "However, it is an open question as
to whether hard-core formal verification will ever be included in the
automated regression-test suites used for continuous integration within
complex concurrent codebases, such as the Linux kernel", that is, to
add the word "open".

I made this change with your Reported-by, thank you!

> I am very interested in this section. I have published a paper
> related to formal methods 17 years ago, you may like it ;-)
> 
> "A formal description of SECIMOS operating system"
> https://dl.acm.org/doi/10.1007/11560326_22

Thank you for the tip!  I will take a look.

							Thanx, Paul

> Many thanks
> Cheers
> Zhouyi
> --
>  future/formalregress.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/future/formalregress.tex b/future/formalregress.tex
> index e33c5161..279f4596 100644
> --- a/future/formalregress.tex
> +++ b/future/formalregress.tex
> @@ -11,7 +11,7 @@
>  
>  Formal verification has long proven useful in a number of production
>  environments~\cite{JamesRLarus2004RightingSoftware,AlBessey2010BillionLoCLater,ByronCook2018FormalAmazon,CaitlinSadowski2018staticAnalysisGoogle,DinoDistefano2019FBstaticAnalysis}.
> -However, it is an question as to whether hard-core formal verification
> +However, it is a question as to whether hard-core formal verification
>  will ever be included in the automated regression-test suites used for
>  continuous integration within complex concurrent codebases, such as the
>  Linux kernel.
> -- 
> 2.25.1
> 
