Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394AD12B86
	for <perfbook@vger.kernel.org>; Sat, 20 Jan 2024 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705783371; cv=none; b=DxhV1XOwAN/Ss8T8bMgro1EhEaFypyh5HxllNyCN0O9WUzA/22vjtGrfwFvU5f/gEY4rdEBwAsHEsJlY2s5HraSAFryGhcI0Ya+XIPr/nOF132x7DxMZHXmMqM4R9cy/SJZqH1gYOhjSHqspNzE6JVTAOynhO+sgd5YTgX8UyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705783371; c=relaxed/simple;
	bh=oNQWuycv2CHeIkTuqm8cefoQAjvRQdmz2OxaEv8I4uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucjJA7JIoP2Sg8i6QF9vCM6MR1YtV+DwVADyFWUOW6x+CBDL1747V5iWfe59rv42dv0V863ynDIFblcQTIN6Eq3KxKAqlPvGSzs7F7cRJrlPHmSM3GIyUDUEsSgzv0c65+P5NHxqLcv0xCyl1zwntLvttIUcGEqRMpvypP6dmTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeFTtHyP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeFTtHyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC78EC433F1;
	Sat, 20 Jan 2024 20:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705783370;
	bh=oNQWuycv2CHeIkTuqm8cefoQAjvRQdmz2OxaEv8I4uQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=MeFTtHyPpCfs3JhTwbLga+TDGVbqC8tKkBa0D8AW19al3t+v1natf5rLTekmUVdm0
	 fCmLgSSzj+FEq2IdYeGej9xw13c8jSyNigzuGlZzstdakHE5EKuwT/XyPEe2PHoxrJ
	 mfROogd6N14K4xmVAiiYZ3Hj+2bXXjR0v/9bD3y98Gn57KuhwC9vQ7l39tNmSmhGEU
	 lhJ8JcPjlE0tASfcIFvwjoKdt4SCaCm4rylWajH0ERsWty+hDCCnvx0F93F6A01Qv0
	 smnkTwLpsXAl82uRY8qB2M191ql+lBzkMie6WQNmRABtFM+WxxlSBjTFvlTfRoFuwn
	 lMMN70TivQ4Vg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3FB5DCE0963; Sat, 20 Jan 2024 12:42:50 -0800 (PST)
Date: Sat, 20 Jan 2024 12:42:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Hao Lee <haolee.swjtu@gmail.com>, perfbook@vger.kernel.org
Subject: Re: [RFC PATCH -perfbook 2/2] count: Update QQ 5.46
Message-ID: <442338ab-c65c-45b2-9c46-268283d23ad6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
 <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
 <20230521075425.GA13425@haolee.io>
 <71ebc20c-7e07-a029-b576-40782bb77a9d@gmail.com>
 <c518cdae-cc7a-4de0-bfb6-6bfe81434534@gmail.com>
 <ad92d88c-b48d-4a51-8640-4ad13e1271b7@paulmck-laptop>
 <554b2470-8d25-4fbd-9863-b3cdbce1e447@gmail.com>
 <3a2a5a58-1b48-42dd-b315-a6d6a4414a50@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a2a5a58-1b48-42dd-b315-a6d6a4414a50@gmail.com>

On Thu, Jan 11, 2024 at 11:05:57PM +0900, Akira Yokosawa wrote:
> Commit cee469f9a7aa ("api: Switch x86 atomics to gcc C11-like
> atomics") changed the definition of atomic_set() as follows:
> 
>     #define atomic_set(v, i) \
> 	__atomic_store_n(&(v)->counter, (i), __ATOMIC_RELAXED)
> 
> Previously, it was defined for x86 as follows:
> 
>     #define atomic_set(v, i)	(((v)->counter) = (i))
> 
> QQ 5.46 assumed the old definition and it can confuse those who have
> followed the definition under CodeSamples/.
> 
> Reword QQ 5.46 to prevent such confusions.
> 
> Add a related QQ asking the need of atomic operation for atomic_set().
> 
> Reported-by: Hao Lee <haolee.swjtu@gmail.com>
> Link: https://lore.kernel.org/perfbook/20230517120110.GA23586@haolee.io/
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed both, thank you, and please accept my apologies for
the delay!

							Thanx, Paul

> ---
>  count/count.tex | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index c82e7333..e8248b95 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2257,19 +2257,43 @@ as it is with the \co{count_register_thread()} function starting on
>  \clnref{unregister:b}.
>  \end{fcvref}
>  
> -\QuickQuiz{
> -	Given that the \co{atomic_set()} primitive does a simple
> -	store to the specified \co{atomic_t}, how can
> +\QuickQuizSeries{%
> +\QuickQuizB{
> +	How can
>  	\clnrefr{ln:count:count_lim_atomic:utility2:balance:atmcset} of
>  	\co{balance_count()} in
>  	\cref{lst:count:Atomic Limit Counter Utility Functions 2}
>  	work correctly in face of concurrent \co{flush_local_count()}
>  	updates to this variable?
> -}\QuickQuizAnswer{
> -	The caller of both \co{balance_count()} and
> +}\QuickQuizAnswerB{
> +	It wouldn't work if they were executed concurrently!
> +	But no worries.
> +	The callers of both \co{balance_count()} and
>  	\co{flush_local_count()} hold \co{gblcnt_mutex}, so
>  	only one may be executing at a given time.
> -}\QuickQuizEnd
> +}\QuickQuizEndB
> +%
> +\QuickQuizE{
> +	Does the \co{atomic_set()} primitive in \co{balance_count()}
> +	really need to be atomic?
> +}\QuickQuizAnswerE{
> +	No, it does not.
> + 	As far as the code in question is concerned,
> +	the \co{atomic_set()} updates the per-thread variable
> +	\co{counterandmax} of its own, whose value can only be updated
> +	either from its own thread's fastpaths or from slowpaths of all
> +	updaters.
> +	As the \co{atomic_set()} is in the slowpath, it can never
> +	race with other atomic operations.
> +
> +	So, even if this code is ported to an ISA where a plain store
> +	to an \co{atomic_t} can interfere with atomic read-modify-write
> +	operations, a non-atomic \co{atomic_set()} should work.
> +
> +	That said, such an optimization in slowpaths which is effective
> +	only for those peculiar ISAs might not be worth bothering.
> +}\QuickQuizEndE
> +}			% End of \QuickQuizSeries
>  
>  The next section qualitatively evaluates this design.
>  \ebFloatBarrier
> -- 
> 2.34.1
> 
> 
