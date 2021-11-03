Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhKCSdJ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 3 Nov 2021 14:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635964233;
        bh=GKOneCa4rve0xfmZ3hmLsypUpfOMDhePz9O1c1Ha9Vc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rDnlmyqP8jNaeMek0cba2XD0gb8d4teBUgg4UTw/rvCdDxy3szhUiuLvP9stw7Kal
         9TltL8agMpi6wKG42TcKCQfuqfy+tTJxMEeRELHXkHMpW7sg7uVeETQpHtGGINwH5Q
         KwKActDQ4rAfzsgLSQfeeVRW84DnmiOF95BbPbS8i+1oW0u/1qohfc62KmBQkQxwA/
         ncwOZBx885oexxV1F/HTemik2F6iCrQlCGxdH0MI5pyWKSHC95Q8YVo+xtwSphxwq1
         6XOwrSnud49WLVTyCblMbuGovhw0pkWTNGwY9TlHrn2MGBlVGSoWmmg20i61ouLzPs
         GhqdKQoHV4FDw==
Date: Wed, 3 Nov 2021 11:30:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] future: fix a typo in answer to QQ 17.3
Message-ID: <20211103183032.GU880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211103075645.19983-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103075645.19983-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com

On Wed, Nov 03, 2021 at 03:56:45PM +0800, Zhouyi Zhou wrote:
> In answer to Quick Quiz 17.3, MV-RCU should be MV-RLU.
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul,
> 
> In answer to Quick Quiz 17.3, MV-RCU should be MV-RLU.

Queued and pushed, good eyes, thank you!

							Thanx, Paul

> Thanks Zhouyi
> --
>  future/tm.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/future/tm.tex b/future/tm.tex
> index ce071bc8..50e7d6dc 100644
> --- a/future/tm.tex
> +++ b/future/tm.tex
> @@ -1047,7 +1047,7 @@ internally~\cite{UCAM-CL-TR-579,KeirFraser2007withoutLocks,Gu:2019:PSE:3358807.3
>  	\end{enumerate}
>  
>  	It is surprising that the anonymous reviewers of this paper did
> -	not demand an apples-to-apples comparison of MV-RCU and RCU\@.
> +	not demand an apples-to-apples comparison of MV-RLU and RCU\@.
>  	Nevertheless, the authors should be congratulated on producing
>  	an academic paper that presents an all-too-rare example of good
>  	scalability combined with strong read-side coherence.
> -- 
> 2.25.1
> 
