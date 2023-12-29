Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A1414AA2
	for <perfbook@vger.kernel.org>; Fri, 29 Dec 2023 23:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccgYQVrd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17DBC433C7;
	Fri, 29 Dec 2023 23:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703891360;
	bh=tdjC7Es4t95GbgHGA5t0pepv3+uVT6dFwNRsMwa22/k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ccgYQVrdb+AeVGbuRb7oya07pZ2nNwLv1r4BXeJ0IdlY7nFBN5PGSTQcpkZU/L9E1
	 eqLl/oQx5J57vGN8XRcMjAwGpdXHpxb3laVRf+BzqqP0huPyrZAT/wyHFwSGeDbQCV
	 kZE9bws3HV4YHpdha7V+hbZicaceDxObmbufaVkpeTeJ4mP6MIqqglpnk5+4SkhrA9
	 jWethLyUHObtU8oBJw0AbKS+ZC6nrHXHNqv0zgl1K4o8GAuC7cng4lFjaxF023yiHG
	 k/DpYKZrEVHkH8D95pNy0VppmxATLKawHbaE0M284k833QYBYFSpnfl19+Y/fRLpmq
	 PEJPbTx8XtUTg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 34959CE095F; Fri, 29 Dec 2023 15:09:20 -0800 (PST)
Date: Fri, 29 Dec 2023 15:09:20 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: zhouzhouyi@gmail.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] cpu: make Quick Quiz 3.6 more explicit
Message-ID: <1b63ce71-8fad-4f43-9ccf-f857f6604c1e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1703735700-611-1-git-send-email-zhouzhouyi@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1703735700-611-1-git-send-email-zhouzhouyi@gmail.com>

On Thu, Dec 28, 2023 at 11:55:00AM +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> Rewrite Quick Quiz 3.6 for clarity and explicitness, so that the
> firsttime reader know that another choice is CPU 0 sharing a core
> with CPU 1.
> 
> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
> ---
> hi Paul and Akira
> 
> This minor fix is also reported by our Chinese version editor
> Yunjing Li.

I have pulled this in, thanks to both you and the editor!  Would it be
appropriate to have the editor's reported-by?  (I trust your judgment
on this.  I am only asking, not in any way suggesting a change.)

							Thanx, Paul

> Thanks
> Zhouyi
> --
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
