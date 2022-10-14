Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiJNM2G (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 14 Oct 2022 08:28:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F2614704B
        for <perfbook@vger.kernel.org>; Fri, 14 Oct 2022 05:28:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A08A5B82342
        for <perfbook@vger.kernel.org>; Fri, 14 Oct 2022 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665750481;
        bh=fAcNDONTIjldpLJfRP4Ds3HMbbovegZXYxXi+bFZ3U8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=faAvhvRj5AthNJptiA5VG/UllRVYukXnhH/jXVUfbAcZEKcyIcsv355jovOucd6tb
         inqWIm4LdTL4GtEXQqT8tZMAuiezrvnAH6004QCVV8CA4tdihesOEzJL2+99JobqZn
         vHhXC4qg+I16MV/CwqMIXoFmavu1BN1zKXcuPvskg1qzqT/dhaefQcY74I7Epy1ZW5
         44mgqiMh6uvvxJihvm0DpBwgGkU40Wpe0HtpSmntN2Tkl4R01n1r5DjDH8Qrz0MtTs
         6GOmNKjefhb/LmVyXcm1TpbhUMMuvptaWPFKnIxeSsRjLJpy7Mr3gr6i8h1Q0hlurF
         xt+sJhYwv2Sxw==
Date: Fri, 14 Oct 2022 05:27:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v2] memorder: fix a line number reference error
Message-ID: <20221014122757.GD4221@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221014055543.8214-1-zhouzhouyi@gmail.com>
 <c033269a-5cd7-608c-6bd9-3ee47bb56023@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c033269a-5cd7-608c-6bd9-3ee47bb56023@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, perfbook@vger.kernel.org, luyang.co@gmail.com

On Fri, Oct 14, 2022 at 07:44:42PM +0900, Akira Yokosawa wrote:
> Section 15.2.3 says,
> 
>   "Listing 15.10 shows how to make this work reliably on pre-v4.15
>    Linux kernels running on DEC Alpha, by replacing line 19's
>    READ_ONCE() with lockless_dereference()."
> 
> However, the READ_ONCE() is actually on line 18 of Listing 15.9.
> 
> Fix the reference and clarify the READ_ONCE() is in Listing 15.9.
> 
> Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> v1 (from Zhouyi) -> v2
> 
>  - Reference line 18 of Listing 15.9.
>  - Adjust wording around the fixed reference.
>  - Zhouyi's Reported-by.
> 
> Zhouyi, how does this look to you?
> 
> Thanks, Akira

Queued and pushed, thank you both!

							Thanx, Paul

> --
>  memorder/memorder.tex | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index c350758d61cb..28319bfba16b 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1274,13 +1274,14 @@ exists (1:r2=x0 /\ 1:r3=1)
>  \label{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
>  \end{listing}
>  
> -\begin{fcvref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
> +\begin{fcvref}[ln:formal:C-MP+o-wmb-o+o-addr-o:whole]
>  \Cref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
>  % \path{C-MP+o-wmb-o+ld-addr-o.litmus} available at commit bc4b1c3f3b35
>  % ("styleguide: Loosen restriction on comment in litmus test")
>  shows how to make this work reliably on pre-v4.15 Linux kernels running on
> -DEC Alpha, by replacing \clnref{read}'s \co{READ_ONCE()} with
> -\apikh{lockless_dereference()},\footnote{
> +DEC Alpha, by replacing \co{READ_ONCE()} on \clnref{P1:x1} of
> +\cref{lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering Before v4.15)}
> +with \apikh{lockless_dereference()},\footnote{
>  	Note that \co{lockless_dereference()} is not needed on v4.15 and
>  	later, and therefore is not available in these later Linux kernels.
>  	Nor is it needed in versions of this book containing this sentence.}
> 
> base-commit: c2b75b99a151008c6b59bddcabb9e44e744f3678
> -- 
> 2.25.1
> 
> 
