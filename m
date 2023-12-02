Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06D19453
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQnSiE3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBBFC433C8;
	Sat,  2 Dec 2023 19:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701545385;
	bh=l3NBn4dilABre34dOnnVVid14Y4glYVWI7F5lHg9OBM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=NQnSiE3heGFASdcdr5e39JJLuMtcnGVoeLmy0Fh6GIKH9/wxpjd/1Huf2hUq/hYYx
	 VbJU0Rpf7W+eI8fGkTUKRGit0FMITOUnbJaFTu8AbMYT6RPMk4Oh3ff8lPCjdTvivh
	 SXQ/qqIpc3AZaUpqR+9miBgmIbUgpuSwkqDvmZ31rPxpR0btV6OyCvzgBLaJDqQBmH
	 UgACby+hjr7/KLIYW9e0ZY8DcNzmeyIciXLwqTc9hH7/nVESKzsfrACBhVFIEm1lHS
	 52GVKeU3BvBazcID2E6nO+V/KhaP7kujR2juz/nWY3Df4xwkd75JD/cxA8Me69o6eL
	 tqZM3t3A6o3nw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1C3A0CE1071; Sat,  2 Dec 2023 11:29:45 -0800 (PST)
Date: Sat, 2 Dec 2023 11:29:45 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH 7/7] future/formalregress: Use SEL4 consistently
Message-ID: <50a43146-d9dd-45fe-8569-0e33314a4648@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20231202172614.20239-1-sj38.park@gmail.com>
 <20231202172614.20239-8-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202172614.20239-8-sj38.park@gmail.com>

On Sat, Dec 02, 2023 at 09:26:14AM -0800, SeongJae Park wrote:
> formalregress.tex is using mixed use of SEL4 and seL4.  SEL4 is used 8
> times, while seL4 is used twice over the entire repository.  Use SEL4
> for the consistency.  Note that use of seL4 in swtools.bib is not
> changed by this commit.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Nice, thank you!

I queued and pushed all but this one.  Their website [1] says seL4.
At least I *think* that this is their website.

Either way, I agree that this should be consistent with their naming.

On the Promela/spin change, should a similar change be applied in the
Formal Verification chapter?

							Thanx, Paul

[1] https://sel4.systems/

> ---
>  future/formalregress.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/future/formalregress.tex b/future/formalregress.tex
> index b1a39b29..40bf2b35 100644
> --- a/future/formalregress.tex
> +++ b/future/formalregress.tex
> @@ -701,7 +701,7 @@ so they are all yellow with question marks.
>  	Indeed there are!
>  	This table focuses on those that Paul has used, but others are
>  	proving to be useful.
> -	Formal verification has been heavily used in the seL4
> +	Formal verification has been heavily used in the SEL4
>  	project~\cite{ThomasSewell2013L4binaryVerification},
>  	and its tools can now handle modest levels of concurrency.
>  	More recently, Catalin Marinas used Lamport's
> -- 
> 2.17.1
> 
> 
