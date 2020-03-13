Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726808AbgCMAGY (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 12 Mar 2020 20:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584057984;
        bh=+4ZDodmHnKPiRrUjP46/0hR0NoqGUlUDarzrsgsaZPk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=RMs7GMkw0dkE6GJVwECbhxCYP6DjeM15hOA3XLlAheYxMksDoB8TXkAcZwsiE3LD9
         7CLI5kkvoe2MYFAwAdDQmVWlLjIOG980HHJhAMCyqJ7A/y/Z+Lrs4qo/6ioxWDxrYP
         TcwufB8vepWkD8gWlarnkKQfGzXwP+Nm6ZLikL5c=
Date: Thu, 12 Mar 2020 17:06:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Fix a typo in the quick quiz in chapter 1
Message-ID: <20200313000624.GM3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200312234048.31152-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312234048.31152-1-bp@alien8.de>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Fri, Mar 13, 2020 at 12:40:48AM +0100, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> s/through to book/through the book/
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>

Good eyes!!!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  howto/howto.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index c8c895010163..39356eec5062 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -201,7 +201,7 @@ Here are a few possible strategies:
>  	has lots of good material as well.
>  	This is an eminently reasonable approach if your main
>  	goal is to gain a general understanding of the material
> -	or if you are skimming through to book to find a
> +	or if you are skimming through the book to find a
>  	solution to a specific problem.
>  \item	If you find the Quick Quizzes distracting but impossible
>  	to ignore, you can always clone the \LaTeX{} source for
> -- 
> 2.21.0
> 
