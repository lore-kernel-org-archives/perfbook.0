Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjE3AkS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 29 May 2023 20:40:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D9BC7
        for <perfbook@vger.kernel.org>; Mon, 29 May 2023 17:40:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1308762347
        for <perfbook@vger.kernel.org>; Tue, 30 May 2023 00:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685407216;
        bh=sr7Lgladdcnc0uNreWSX3GaFRU5HEui5uwOW08Xp/og=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ipkhPTedokR5GeF5h24/vbe4OMiEvyBM5LQfRcyOIgvmS0ri+lR8lnCycRIw3VuTy
         wXEHebr9PKGZmDfW/ca7yMMzvsAcWvZnswGoH0fIZ/uUxK1AdgGLXFD9oOHBCvR/vt
         JUWTqaIfNHKUACHtX9C1oxljHUG0wbZKlN3mFyfKyjxFPsEOYnr3eHFQ83gdOqftiO
         avEDUL192yTlW0Zv/rggi3kH+wpiYZ9f0760+nyAhfhsdwscAh7j79j8/5ITsZe7p3
         UN2K/PMc8Qy3pL6lSehqrswEDnb79yHZZvc/EWYGld1VmTdkT3yoI4K87zzkl7aJ4P
         5A/gjkuICRkEA==
Date: Mon, 29 May 2023 17:40:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] together: Fix the description of state traversal
Message-ID: <2821caa4-1212-41ee-b853-dc20e051113d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230528164020.15935-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230528164020.15935-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 28, 2023 at 04:40:20PM +0000, Alan Huang wrote:
> There seem to be some issues with the description of state transitions.
> This patch fixes that.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  together/applyrcu.tex | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> index 09a265f7..dee027b9 100644
> --- a/together/applyrcu.tex
> +++ b/together/applyrcu.tex
> @@ -676,11 +676,12 @@ The normal path through this state machine traverses the states CLOSED,
>  OPEN, CLOSING (with an invocation of \co{call_rcu()}), and back to CLOSED
>  once the callback has been invoked.
>  If \co{open()} is invoked before the grace period completes, the
> -state machine traverses the cycle OPEN, CLOSING (with an invocation
> -of \co{call_rcu()}), and back to CLOSED once the callback has been invoked.
> +state machine traverses the cycle OPEN, CLOSING (with
> +an invocation of \co{call_rcu()}), REOPENING, and back to OPEN once the
> +callback has been invoked.
>  If \co{open()} and then \co{close()} are invoked before the grace period
>  completes, the state machine traverses the cycle OPEN, CLOSING (with
> -an invocation of \co{call_rcu()}), REOPENING, and back to OPEN once the
> +an invocation of \co{call_rcu()}), REOPENING, RECLOSING, and back to CLOSING once the
>  callback has been invoked.

I took this patch (thank you!), but wonder if we should describe the
additional callback and additional transition to CLOSED, both here
and below.  Thoughts?

							Thanx, Paul

>  Given an indefinite alternating sequence of \co{close()} and \co{open()}
> -- 
> 2.34.1
> 
