Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229570AbhBGXOl (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 7 Feb 2021 18:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612739641;
        bh=WdO41YE6/JA8Fxhv8bZnov7dhksyLOPx8VMSj6Sxxrw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AP0mr7aSHLLbX6A+iEN6Mw89eHmsgfN8bn7leEtEzgpkDSrXgj2Xqk7tg5vmW2oAQ
         AiOJ6XePJHGGUSNwBVtF2y9nLHreClUHjyzhFhsCbVMmQTEqDlKQI3n4YRr6lLlmjo
         1Pvi6Kl7ySMp0mSI9KDfssYmW6f3+DMPWvDKzh2Sbx9kIM9StnFcPX4mNfR1lyVGzw
         QVBxfQ09BQN5bkRbhDrB35I9cX6xBGtsqP8gMPCQEV9HHKCRKpn2Jis95sfTnb2yu9
         3DXOagLB8yENf7UlUMA8guXDYPDVNLAp3sOJdBqknFenbS3LiH8PlwMkomM3XapPji
         y1Sa1KPUBuKfw==
Date: Sun, 7 Feb 2021 15:14:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 3/3] memorder: Substitute MIPS memory model reference
Message-ID: <20210207231401.GS2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <21a2baaf-887d-8e98-eaad-f18948e9c377@gmail.com>
 <33bbd170-4294-9eb8-9d53-91ab9f7e5810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33bbd170-4294-9eb8-9d53-91ab9f7e5810@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 08, 2021 at 12:27:09AM +0900, Akira Yokosawa wrote:
> Use an bib entry with live URL.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied all three, good eyes, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index c9c35b5b..362bff16 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -4452,7 +4452,7 @@ CPU, including those to the same variable.
>  
>  \subsection{MIPS}
>  
> -The MIPS memory model~\cite[page~479]{MIPSvII-A-2017}
> +The MIPS memory model~\cite[page~479]{MIPSvII-A-2016}
>  appears to resemble that of \ARM, Itanium, and \Power{},
>  being weakly ordered by default, but respecting dependencies.
>  MIPS has a wide variety of memory-barrier instructions, but ties them
> -- 
> 2.17.1
> 
> 
