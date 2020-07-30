Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728047AbgG3Xs7 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 30 Jul 2020 19:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596152938;
        bh=+hjEm2fImMQtfjauPfqhx+sJw7iG9NLfl5HJ7+uHlFo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=08RbMBKlbs91A0w4VTse7IRsLjfsJxJYBB3pSNDBZjoBvqO0U/GVeGpXqC2A1lnfl
         Wo4VNhK2zjJ+EeQkpyRA/k66Y265Rrt5ATDG6f56Df0pJtkrKP2eXjERdwQ/MI6L7w
         Fu2gMqcxp/tpE12A2343lzWsI3bRiiiOU1zY3nEY=
Date: Thu, 30 Jul 2020 16:48:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] qqz.sty: Add page number to the QQZ heading for 'nq'
 build
Message-ID: <20200730234858.GE9247@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <d21641e4-ad62-8cee-3479-98b059994661@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d21641e4-ad62-8cee-3479-98b059994661@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 31, 2020 at 06:40:15AM +0900, Akira Yokosawa wrote:
> >From 7b56ddf382f836201b9e88e2f7b185fae422314e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 31 Jul 2020 00:18:58 +0900
> Subject: [PATCH 1/2] qqz.sty: Add page number to the QQZ heading for 'nq' build
> 
> Excerpt of Paul's message:
> 
>     For a printed book, would it make sense to put the page number of the
>     quick-quiz source (the location of the little box containing "QQ" and
>     the quick-quiz number) into each answer?  Or after each question?
> 
> This commit adds the page number at the right-hand side of quiz heading
> in framed box.  It is also a hyperlink to the little box in the text.

Looks great, thank you!!!  Queued and pushed.

							Thanx, Paul

> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  qqz.sty | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/qqz.sty b/qqz.sty
> index 6d87e192..897d1ab6 100644
> --- a/qqz.sty
> +++ b/qqz.sty
> @@ -59,6 +59,8 @@
>  \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}
>  
>  \newcommand{\QuickQHeading}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}}
> +\newcommand{\QuickQHeadingPage}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}%
> +	\hfill\raisebox{0.5ex}{\footnotesize\fbox{p.\pageref{#2.#3}}}}
>  \newcommand{\QuickQHeadingLight}[3]{\scriptsize QQ~\hyperref[#2.#3]{#3}\label{#1.#3}}
>  \newcommand{\QuickQHeadingBegin}[3]{\scriptsize QQ~\hyperref[#2.#3]{#3}\label{#1.#3},}
>  \newcommand{\QuickQHeadingMiddle}[3]{\scriptsize\hyperref[#2.#3]{{ #3}}\label{#1.#3},}
> @@ -219,7 +221,7 @@
>  \newcommand{\QuickQ}[1]{
>  	\begin{tcolorbox}[breakable]
>  	\refstepcounter{quickquizctrC}
> -	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} \\
> +	\QuickQHeadingPage{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC}\\
>  }
>  
>  \newcommand{\QuickA}[1]{%
> -- 
> 2.17.1
> 
