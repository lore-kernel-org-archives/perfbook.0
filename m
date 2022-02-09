Return-Path: <perfbook-owner@vger.kernel.org>
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbiBIVbf (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 9 Feb 2022 16:31:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8A7C1DC2F9
        for <perfbook@vger.kernel.org>; Wed,  9 Feb 2022 13:31:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A5E561B6D
        for <perfbook@vger.kernel.org>; Wed,  9 Feb 2022 21:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644442290;
        bh=ZgDUpv1W/S3uL/F7y3F5eAmqtKGZTMKjC+uakP43JLY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=tkOmuLis9PJ7s0J4Mt7LlB5x/cNDbxN50Cyt/IMilpqMTu8iVopevnDvxTLRCBO9N
         Dved+pxJmtF6/C9Zcw0Eq+L57ZC7qoFybFXYXKIMwJsSEcscQIKT1VgYkA6sAZYsog
         Q8qTB8qovWQyDS02mnTTYt1YQ/0Z/bdRK8dp5hG8Yg4o5KyrgQIy+tErUMx1X5laBd
         i3diNzbYwcpONpdV2Mmj17phpram13EOZXtet47g/8xmcZudsY8NjV9bwbmHaqYa+O
         pfUoUmP9YtMZXcRV7iwREO4mx9pjdaT89OcUdmaydwCPSo5J/sdtaB/3LUQTk5verQ
         7mr81s4dOtW/Q==
Date: Wed, 9 Feb 2022 13:31:30 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/3] intro, together: Promote section-opening
 QQzs to 'essential'
Message-ID: <20220209213130.GA4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <b9607a1e-7ab2-62fb-578e-d9dec3547905@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9607a1e-7ab2-62fb-578e-d9dec3547905@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Feb 10, 2022 at 12:06:58AM +0900, Akira Yokosawa wrote:
> In "nq" builds, section-opening QQzs can result in headings which
> look like "widow" ones accompanied by small boxes of "QQ x.x".
> 
> When you start a section by a QQz, it is likely an essential one
> and would better be presented even in "nq" builds.
> 
> Promote such two QQzs to "essential" ones.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good points!  I queued and pushed the series, thank you!

							Thanx, Paul

> ---
>  intro/intro.tex       | 6 +++---
>  together/applyrcu.tex | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/intro/intro.tex b/intro/intro.tex
> index 635173e1..e39ea652 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -416,12 +416,12 @@ sequential case when analyzing the performance of parallel algorithms.
>  \subsection{Productivity}
>  \label{sec:intro:Productivity}
>  
> -\QuickQuiz{
> +\EQuickQuiz{
>  	Why all this prattling on about non-technical issues???
>  	And not just \emph{any} non-technical issue, but \emph{productivity}
>  	of all things?
>  	Who cares?
> -}\QuickQuizAnswer{
> +}\EQuickQuizAnswer{
>  	If you are a pure hobbyist, perhaps you don't need to care.
>  	But even pure hobbyists will often care about how much they
>  	can get done, and how quickly.
> @@ -435,7 +435,7 @@ sequential case when analyzing the performance of parallel algorithms.
>  
>  	Besides, if you \emph{really} didn't care about productivity,
>  	you would be doing it by hand rather than using a computer!
> -}\QuickQuizEnd
> +}\EQuickQuizEnd
>  
>  \IX{Productivity} has been becoming increasingly important in recent decades.
>  To see this, consider that the price of early computers was tens
> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> index e3a0d2fe..9aef3879 100644
> --- a/together/applyrcu.tex
> +++ b/together/applyrcu.tex
> @@ -196,13 +196,13 @@ references.
>  
>  \subsubsection{Discussion}
>  
> -\QuickQuiz{
> +\EQuickQuiz{
>  	Wow!
>  	\Cref{lst:together:RCU and Per-Thread Statistical Counters}
>  	contains 70 lines of code, compared to only 42 in
>  	\cref{lst:count:Per-Thread Statistical Counters}.
>  	Is this extra complexity really worth it?
> -}\QuickQuizAnswer{
> +}\EQuickQuizAnswer{
>  	This of course needs to be decided on a case-by-case basis.
>  	If you need an implementation of \co{read_count()} that
>  	scales linearly, then the lock-based implementation shown in
> @@ -224,7 +224,7 @@ references.
>  	with all the scalability and performance benefits of the
>  	implementation shown in
>  	\cref{lst:together:RCU and Per-Thread Statistical Counters}!
> -}\QuickQuizEnd
> +}\EQuickQuizEnd
>  
>  Use of RCU enables exiting threads to wait until other threads are
>  guaranteed to be done using the exiting threads' \co{__thread} variables.
> 
> base-commit: e4815ca92805056635d98935562ced9e41fd0fb4
> -- 
> 2.17.1
> 
