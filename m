Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732198AbgCPRBt (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 16 Mar 2020 13:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584378108;
        bh=XrL0E1goEYNjnGP6FzDh+PVWrQG/ukZFZgkS85Qki0U=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PiKefQCzGcnLo3RUJbJruOOpX55KA79rKF/QU87w2p7MIYAnhQZ9iCsNGQI96vw8f
         RsrmRlvIjCP07OAwnCywpxzsSOzIMwA7zISrzPCU4ySzevYO/1mZMLyZKzQ/mkiphm
         YkxfISll7daBEJ6xZ75dRVReCYfhKSBnruLIFzHQ=
Date: Mon, 16 Mar 2020 10:01:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/3] howto: Update Answer to QQZ 1.3 to mention inline
 QQA is not easy
Message-ID: <20200316170148.GY3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <70bc6ef5-e823-ae3f-7753-169ba1190d5f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70bc6ef5-e823-ae3f-7753-169ba1190d5f@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 17, 2020 at 12:16:26AM +0900, Akira Yokosawa wrote:
> >From f4a50f79fdd13552b482b5e0f8ef0ff9b199e24b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 8 Mar 2020 00:59:39 +0900
> Subject: [PATCH 1/3] howto: Update Answer to QQZ 1.3 to mention inline QQA is not easy
> 
> The macro \QuickQuizAnswer{} defined in qqz.sty currently discards
> its argument.  If you modify it to enable inline QQA, pdflatex will
> end up in error due to verbatim contents and other fragile elements
> within macro arguments.
> 
> Appendix E's code (qqz.tex) works because the macros \QuickQ{}
> and \QuickA{} have no argument.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed all three, thank you!

							Thanx, Paul

> ---
>  howto/howto.tex | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index b0b0e487..18757934 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -207,10 +207,14 @@ Here are a few possible strategies:
>  	to ignore, you can always clone the \LaTeX{} source for
>  	this book from the git archive.
>  	You can then modify \path{Makefile} and \path{qqz.sty} to eliminate
> -	the Quick Quizzes from the PDF output.
> -	Alternatively, you could modify these two files so as
> -	to pull the answers inline, immediately following
> -	the questions.
> +	the Quick Quizzes from the PDF output.\footnote{
> +		On the other hand, modifying these two files does not
> +		suffice at the moment if what you'd like to do is to pull
> +		the answers inline, immediately following the questions.
> +		This is due to the fragility of verbatim environments
> +		within arguments of \LaTeX\ macros.
> +		It should still be possible, for example, by editing every
> +		\path{.tex} source by a script, though.}
>  \item	Look at the answer immediately rather than investing
>  	a large amount of time in coming up with your own
>  	answer.
> -- 
> 2.17.1
> 
