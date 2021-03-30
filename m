Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232001AbhC3QQS (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 30 Mar 2021 12:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617120978;
        bh=ERHr5+kwUi2CTJlKyoVIllgtGnvfyFeu4lRVvXLuLLA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hQmX7MZSKKXDbFtYoBJolceDaYeHZ+rUu4a3Iq7333fZQQ/prEmpIHODn2NhHeeRb
         menDJRCPARIa4SDhoLzI42nPcpUj81A9I1DEcPIoIpJOArfkRkBPRSPQ1lGgZn9rHb
         ai0lsS393YxSNjWE/I+oYjl97WE7rfKV/1f16uyONn7t5zcvRYkqy/wmyxIbL52LwM
         EM0fs+si3EkEVpdNDRw8sT/Isn6Skzfn57NMkTWXFP/HN2+Se37OWYgdrZrv1tYZzR
         vAXX071ww4cV1peVu7cnSk0EbShdXAW5OJMaL4K8wXgYxTw5BNVhQeoT0uUt81zKDz
         1aTnQ3m7fxzBw==
Date: Tue, 30 Mar 2021 09:16:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] howto: Fix uneven space due to uncommented
 line break in \IfQqzChpEnd
Message-ID: <20210330161618.GW2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <736430d2-2786-669a-9eb0-a80e66f10510@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <736430d2-2786-669a-9eb0-a80e66f10510@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 30, 2021 at 08:01:46PM +0900, Akira Yokosawa wrote:
> These line breaks cause extra space at
> 
>     "... found in  the final"
>                  ^^
> 
> in -nq build and
> 
>     "... found in  Appendix E"
>                  ^^
> 
> in the other builds.
> 
> Fix them by commenting line breaks within the macro.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  howto/howto.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 8f06d3f3..ad63a586 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -148,12 +148,12 @@ the next section.
>  
>  ``Quick quizzes'' appear throughout this book, and the answers may
>  be found in
> -\IfQqzChpEnd{
> +\IfQqzChpEnd{%
>  the final section of each chapter.\footnote{
>  	In the official release/edition of this book, all the answers are
>  	gathered in an Appendix.
>  }
> -}{
> +}{%
>  \cref{chp:Answers to Quick Quizzes} starting on
>  \cpageref{chp:Answers to Quick Quizzes}.
>  }
> -- 
> 2.17.1
> 
