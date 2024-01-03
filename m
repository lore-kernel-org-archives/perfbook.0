Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BCF1DA26
	for <perfbook@vger.kernel.org>; Wed,  3 Jan 2024 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtQkHJk/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92490C433C8;
	Wed,  3 Jan 2024 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704319555;
	bh=jo7n5uqhJMOuGtKl7OwXMIZ828VNTZmggtTCQxwyczA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=mtQkHJk/jZwAZLQJLF1nXUyEYMhfrE8uTLUjIDRQZSpyVlTaC0CZnkAZuIyDfiC0G
	 zVv01sNNgUckrrnIKjjYc5DdxfoY1RCVxIrPEFzfebHRo/x5R1e7MGkPlr2ZFrweEU
	 Bg7b8BSXNGuJBONEcvDz3MOs9s3faYBFVBa5ZouI890A3I9qhhLw6Lqgpfm5ROhR++
	 tk/e5HS6w2Rl1iYsq2Nlr8xJL25HDeqTp9IT+tCtPKc2zpXL/VKs3BKBil3KXcNvu7
	 HEpIYlQJUocQyRfMCg0ZfZ7QwMwSKb8n/hMJNrWrT9KfgJyPqr7fUindc3DBrobfZO
	 LW8F3fRpP1hRQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 36C1DCE08F4; Wed,  3 Jan 2024 14:05:55 -0800 (PST)
Date: Wed, 3 Jan 2024 14:05:55 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: zhouzhouyi@gmail.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook V2] toolsoftrade: fix a typo: manpages should
 be man pages
Message-ID: <f722d847-829e-499a-8123-d32cba55edbf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1704074187-6886-1-git-send-email-zhouzhouyi@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1704074187-6886-1-git-send-email-zhouzhouyi@gmail.com>

On Mon, Jan 01, 2024 at 09:56:27AM +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> According to [1][2], manpages should be man pages or man-pages.
> 
> [1] https://en.wikipedia.org/wiki/Man_page
> [2] https://www.kernel.org/doc/man-pages/
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> "From:" and "Signed-off-by:" match as suggested by Akira
> Thanks, Zhouyi

I have replaced the previous commit with this one, thank you both!

							Thanx, Paul

> --
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
