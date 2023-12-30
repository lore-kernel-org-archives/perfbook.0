Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D9D30B
	for <perfbook@vger.kernel.org>; Sat, 30 Dec 2023 23:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BS3OYzw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45574C433C8;
	Sat, 30 Dec 2023 23:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703979213;
	bh=CjmBzA68Je6Lgk4st6Cudrjs0G19X2kIGapaNJd1M2A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=BS3OYzw9UtxiyKn4EVeEL+Cqv4AuuKmCcJnLwIun4SN3E5UiKW3vQzABamjIcamP1
	 6sn+GDGA1SVpdtbVK19ygmMOaKd7rbAa3GzzSsXFeTMrqrJ2QvpzgoJIC5GhFw7yGP
	 i0cLw0el3QvL0/nDHHUyBqHVDjlGlY9zETL7xX2dHSuYnYE0GpGTpb36DTLQHYfOd4
	 J10XZHj68BXce7aanvsmVmr5vqAMo7TjbmkNR17vRJElJF48EJ/6NUPgjudvv2kZXC
	 nMkvtY+LBgTXKhk2iybAH4EGyyztXRORfFOc/a2hLkACgetLyZRyJInutSIVNAiytf
	 +1GnjaUL1dwDw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C7B72CE0D18; Sat, 30 Dec 2023 15:33:32 -0800 (PST)
Date: Sat, 30 Dec 2023 15:33:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: zhouzhouyi@gmail.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook v2] cpu: make Quick Quiz 3.6 more explicit
Message-ID: <73d75184-f6f0-4a70-81f7-f7d2e3bc51ef@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1703894844-20798-1-git-send-email-zhouzhouyi@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1703894844-20798-1-git-send-email-zhouzhouyi@gmail.com>

On Sat, Dec 30, 2023 at 08:07:24AM +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> Rewrite Quick Quiz 3.6 for clarity and explicitness, so that the
> firsttime reader know that another choice is CPU 0 sharing a core
> with CPU 1.
> 
> This change was identified by Chinese version editor Yunjing Li in 
> the course of translating the book to Chinese.
> 
> Reported-by: Chinese version editor YunJing Li
> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>

Thank you!  I have queued this one in place of your original.

							Thanx, Paul

> ---
>  cpu/overheads.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 1ee9c52f..a2ec2998 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -262,7 +262,8 @@ CAS and lock, respectively.
>  \QuickQuiz{
>  	\Cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
>  	shows CPU~0 sharing a core with CPU~224.
> -	Shouldn't that instead be CPU~1???
> +	However, isn't it more logical for CPU 0
> +	to share a core with CPU 1 instead of CPU 224???
>  }\QuickQuizAnswer{
>  	It is easy to be sympathetic to this view, but the file
>  	\path{/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_list}
> -- 
> 2.34.1
> 
