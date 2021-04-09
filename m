Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232286AbhDIORI (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 9 Apr 2021 10:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617977815;
        bh=gBn4YcDGgoeSrZXOsqwiCek/yQESbtRlCgwpA6UvAuI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=n2KrJ7C6kV6umJaXV34ixbz89+605FZJ3MB9Ac05HcCv76zkWr9XkT9exhDCYHj01
         lXsBWD3d2owDC9a8y9Ze1tpGViQb1hAVIPaqZ724czWFfZd2Lp3vGVmy++WkWfase3
         EJkM20cxThi9plLinG3dysGcmVLHBkF1vkH0nkrPTzCrmRo4NCIKuq9ysfd88jIStD
         YO595JjRkKxsztffmryfFq4fj8cAzSIcyx9uuMJuhhU848OobVzRvamD66Z+BT6dTD
         AKMHqmwTtrKDE4Hw3ToalWIXLl9agFR9saoLJjq0lThxyBLp5u1j5qwvpsFjBUiOle
         3L/kitttdrXgg==
Date: Fri, 9 Apr 2021 07:16:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] advsync/rt: Use 'vs.~' instead of 'vs.\@ 'in
 section title
Message-ID: <20210409141655.GP4510@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <51888d83-8f51-075b-7c7c-178c3abec3e0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51888d83-8f51-075b-7c7c-178c3abec3e0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 09, 2021 at 09:05:04PM +0900, Akira Yokosawa wrote:
> hyperref complains about the use of "\@" in a section title:
> 
>     Package hyperref Warning: Token not allowed in a PDF string (Unicode):
>     (hyperref)                removing `\spacefactor' on input line 1978.
> 
>     Package hyperref Warning: Token not allowed in a PDF string (Unicode):
>     (hyperref)                removing `\@m' on input line 1978.
> 
> Fixes: 9facbec307ee ("treewide: Mark non-end-of-sentence full-stop of 'vs.' as such")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Ah, I should pay more attention to the errors.  :-/

Thank you, queued and pushed!

							Thanx, Paul

> ---
>  advsync/rt.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index f5e8e685..067927e9 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -1975,7 +1975,7 @@ on \clnrefrange{upd:b}{upd:e}.
>  This example shows how RCU can provide deterministic read-side
>  data-structure access to real-time programs.
>  
> -\subsection{Real Time vs.\@ Real Fast: How to Choose?}
> +\subsection{Real Time vs.~Real Fast: How to Choose?}
>  \label{sec:advsync:Real Time vs. Real Fast: How to Choose?}
>  
>  The choice between real-time and real-fast computing can be a difficult one.
> -- 
> 2.17.1
> 
