Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjD3S2H (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 30 Apr 2023 14:28:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92701735
        for <perfbook@vger.kernel.org>; Sun, 30 Apr 2023 11:28:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 441B860A13
        for <perfbook@vger.kernel.org>; Sun, 30 Apr 2023 18:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682879284;
        bh=oAweaFFpnHHX9hTB4xQZEeeGmI4OFsvKRyyf9x+gPj0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=uVM9a/P3JB2gBlovFHb1GlxldLpsNFEneA6+laRYOvU93HdhXtxaJPpcEFFByb0pI
         I9HQYzewtqOwmsUJnwWnYrhEjDXdexlAmXYMf7fco8PK0qveg7Lpzy+/8Dwxi0MXff
         IFagEgiLUUnpHrjDSG19EAhmlFrWoHdnoLWW27s4HUXwlp4EO0hfNfeY1SKqyQ1lRx
         JxbjddUC+etpOK7KMDAkG1vxcHBqqDuMx0HNgrChvnhFk6l47PL9XcMgYU+axok92J
         P5oT4M+NhMzrI7ZXqBEiAt5kKZz0TUvrfy1LWON6MOaReDjJ3WACnYXHbWcZN11Os6
         osP6yNvcfhCQw==
Date: Sun, 30 Apr 2023 11:28:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] together/refcnt: Use \qco{} for code quoting
Message-ID: <b1e496e7-e20a-4393-8b27-d2c85b29dc46@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230430154411.28410-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430154411.28410-1-sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Sun, Apr 30, 2023 at 08:44:11AM -0700, SeongJae Park wrote:
> \tco{} is for code in tabular environment, while \qco{} is for
> non-breaking code with quotation marks.  However, commit 0e96cb8283ca
> ("together/refcnt: Use \tco{} for code quoting") has mistakenly used
> \tco{} for quoted code, by mistake.  Fix it by replacing the \tco{} with
> \qco{}.
> 
> Fixes: 0e96cb8283ca ("together/refcnt: Use \tco{} for code quoting")
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  together/refcnt.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/together/refcnt.tex b/together/refcnt.tex
> index 4abe1c60..11596f4e 100644
> --- a/together/refcnt.tex
> +++ b/together/refcnt.tex
> @@ -467,15 +467,15 @@ as shown below.
>  
>  \QuickQuiz{
>  	Why can't the check for a zero reference count be
> -	made in a simple \tco{if} statement with an atomic
> -	increment in its \tco{then} clause?
> +	made in a simple \qco{if} statement with an atomic
> +	increment in its \qco{then} clause?
>  }\QuickQuizAnswer{
> -	Suppose that the \tco{if} condition completed, finding
> +	Suppose that the \qco{if} condition completed, finding
>  	the reference counter value equal to one.
>  	Suppose that a release operation executes, decrementing
>  	the reference counter to zero and therefore starting
>  	cleanup operations.
> -	But now the \tco{then} clause can increment the counter
> +	But now the \qco{then} clause can increment the counter
>  	back to a value of one, allowing the object to be
>  	used after it has been cleaned up.
>  
> -- 
> 2.17.1
> 
