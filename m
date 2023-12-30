Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA3E555
	for <perfbook@vger.kernel.org>; Sat, 30 Dec 2023 23:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAR31kjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7AEC433C7;
	Sat, 30 Dec 2023 23:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703980763;
	bh=UCIcOuANbjvY1bXSyVWsDUVdqb7Mt8d5aqkAMoBjzbI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=lAR31kjm6kdCVAP9bOw7sPu1P/yG0berBBNOnObQxZpdw7yZwr1C1GCJou2eZr8Sa
	 ks3O4TdfbQdN6jfY+lV6TuJ6wsyV2EsIjjQfurIuluj1HRfryzeGx+UmbDilsqGikM
	 uMQgJJ/K1bdW84j6MdWYNunIdBlGj8gip9oMwzBrcFazjBCybFrnzRMaVF3qZu9msF
	 vhEerNDFgNfws2iAgIda8ksE1m92Wh5aJLLUBaKgVlZwkI9xywfWJM++wxBttnUm5o
	 sQll+v6fSmr3tLb5VRpOWFsN7DUC09abbzFH9pINtW75twzwKgGSFsx1gIyhX3vjrV
	 bOK4KciTYZUHg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5D177CE0D18; Sat, 30 Dec 2023 15:59:23 -0800 (PST)
Date: Sat, 30 Dec 2023 15:59:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: zhouzhouyi@gmail.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org,
	Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>
Subject: Re: [PATCH -perfbook] toolsoftrade: fix a typo: manpages should be
 man pages
Message-ID: <cfa2e0c6-f3fc-45b0-a11a-2ebb5537f8c8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1703926769-5124-1-git-send-email-zhouzhouyi@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1703926769-5124-1-git-send-email-zhouzhouyi@gmail.com>

On Sat, Dec 30, 2023 at 04:59:29PM +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>
> 
> According to [1][2], manpages should be man pages or man-pages.
> 
> [1] https://en.wikipedia.org/wiki/Man_page
> [2] https://www.kernel.org/doc/man-pages/
> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>

I am happy either way, having seen it spelled both ways for some decades.
But those two references are good standardization points.

And before I queue this, did this also come from our Chinese editor?
If so, should she be credited?

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 645ee74b..097c18d6 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -308,7 +308,7 @@ Parent process sees x=0
>  	(such as \co{mmap()} and \co{shmget()}).
>  	In the meantime, there are any number of textbooks that cover
>  	these primitives in great detail,
> -	and the truly motivated can read manpages, existing parallel
> +	and the truly motivated can read man pages, existing parallel
>  	applications using these primitives, as well as the
>  	source code of the Linux-kernel implementations themselves.
>  
> -- 
> 2.34.1
> 
