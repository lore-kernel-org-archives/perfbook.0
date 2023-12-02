Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91CC22098
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 23:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChdMRa1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186A8C433C9;
	Sat,  2 Dec 2023 23:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701560105;
	bh=EaucAecgcvWq0S8vVIhKr4geQDihbt3t7UWM0/26t6k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ChdMRa1tjcePvKTmFwBdi1ocsKjXX5LycKTNBeNvi2wEO4GU/TLfOnL6W6zqVjtkJ
	 jv0/9zy2CqL4A6kGzGzgyzOiJwNWea/mRuZcWsBUuX2AUcbd+0LbnGFY2el/u/2Aaw
	 WVl2RMfEPjqTOilTSn287uzjcXyKHLooeJcQHqdZZPeZ0sAfyB2wWmrSawUULv1fYo
	 oM+d4XIo/hlYRQaum2UoKbzuh9u+pMNz809oZrSstiLJTsSy/V63R0L6cez2ozvHhU
	 64G+pTHXjDmS7QtZx055SXicIRwu++RW7AvrsGUqm5M3e3jPteO8qYsJeUFQlnYH2C
	 zc4prYXsi5vrA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A42D8CE1448; Sat,  2 Dec 2023 15:35:04 -0800 (PST)
Date: Sat, 2 Dec 2023 15:35:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH v2] future/formalregress: Use seL4 consistently
Message-ID: <a3892c7e-872d-41f4-a048-f831f67f2b66@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20231202213346.23070-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202213346.23070-1-sj38.park@gmail.com>

On Sat, Dec 02, 2023 at 01:33:46PM -0800, SeongJae Park wrote:
> formalregress.tex is using mixed use of SEL4 and seL4.  SEL4 is used 8
> times, while seL4 is used twice over the entire repository.  That said,
> seL4 seems the intended name since their website[1] uses the name.  Use
> seL4 consistently.
> 
> [1] https://sel4.systems/
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued, and thank you very much!

							Thanx, Paul

> ---
> Changes from v1
> - Use seL4 instead of SEL4
> 
>  future/formalregress.tex | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/future/formalregress.tex b/future/formalregress.tex
> index b1a39b29..63c9021f 100644
> --- a/future/formalregress.tex
> +++ b/future/formalregress.tex
> @@ -118,23 +118,23 @@ that the compiler is correct.
>  An alternative approach is to take the binary produced by the C compiler
>  as input, thereby accounting for any relevant compiler bugs.
>  This approach has been used in a number of verification efforts,
> -perhaps most notably by the SEL4
> +perhaps most notably by the seL4
>  project~\cite{ThomasSewell2013L4binaryVerification}.
>  
>  \QuickQuiz{
>  	Given the groundbreaking nature of the various verifiers used
> -	in the SEL4 project, why doesn't this chapter cover them in
> +	in the seL4 project, why doesn't this chapter cover them in
>  	more depth?
>  }\QuickQuizAnswer{
> -	There can be no doubt that the verifiers used by the SEL4
> +	There can be no doubt that the verifiers used by the seL4
>  	project are quite capable.
> -	However, SEL4 started as a single-CPU project.
> -	And although SEL4 has gained multi-processor
> +	However, seL4 started as a single-CPU project.
> +	And although seL4 has gained multi-processor
>  	capabilities, it is currently using very coarse-grained
>  	locking that is similar to the Linux kernel's old
>  	Big Kernel Lock (BKL)\@.
>  	There will hopefully come a day when it makes sense to add
> -	SEL4's verifiers to a book on parallel programming, but
> +	seL4's verifiers to a book on parallel programming, but
>  	this is not yet that day.
>  }\QuickQuizEnd
>  
> -- 
> 2.17.1
> 
