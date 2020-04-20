Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726913AbgDTO6p (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 20 Apr 2020 10:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587394724;
        bh=ekFZMiFEBHB9kvpVljzvv5x6EbnshaSoQM+wbJB4724=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=E42/wOvqwRWyeGEAje0s9hHOcvmZ0lZWl8G1MErqav9/EL2+/jAj1F+Z9BSEMCv+V
         2tCG+qMJy0qoEWxZOKvHWg584/VP4zqCtWTzaC7/ORcm4zi0TRj8K7IsZzg33l8kJO
         KYe/0wl1H2tJEdD352zeddS1mkmprHpLCPqkAA50=
Date: Mon, 20 Apr 2020 07:58:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] owned: Fix trivial typo
Message-ID: <20200420145843.GA17661@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <3f299e03-f6c6-e0a1-017d-374fefa40c91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f299e03-f6c6-e0a1-017d-374fefa40c91@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 20, 2020 at 11:16:32PM +0900, Akira Yokosawa wrote:
> >From 531deebc3597b87e9ed992d7a3f3608c846b4fe8 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 20 Apr 2020 17:10:11 +0900
> Subject: [PATCH] owned: Fix trivial typo
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, but the object of "is" is "number" rather than "mechanisms".
But yes, confusing.

Maybe "There are many such mechanisms"?

							Thanx, Paul

> ---
>  owned/owned.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/owned/owned.tex b/owned/owned.tex
> index b45fabb1..945d7144 100644
> --- a/owned/owned.tex
> +++ b/owned/owned.tex
> @@ -250,7 +250,7 @@ page~\pageref{lst:count:Signal-Theft Limit Counter Subtract Function}).
>  	What mechanisms other than POSIX signals may be used for function
>  	shipping?
>  }\QuickQuizAnswer{
> -	There is a very large number of such mechanisms, including:
> +	There are a very large number of such mechanisms, including:
>  	\begin{enumerate}
>  	\item	System V message queues.
>  	\item	Shared-memory dequeue (see
> -- 
> 2.17.1
> 
