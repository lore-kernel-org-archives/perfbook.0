Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883EC3EBF2D
	for <perfbook@vger.kernel.org>; Wed,  4 Feb 2026 00:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166116; cv=none; b=FSNIaEHYy1BDbE8Q+W1QApkkjssqbckDddbac14W1jOuyCrsFIVjzwbm+u056wb0JR7yDni10ZoeJVsM20GhFCgDvCwRWTbmTf7DBaTyOlni0yZbHSg/pVj/AZPoxjBgBHG0RMTqg/izs9RHlo9MHmvYIhDBWgr5K/5gM4LDlv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166116; c=relaxed/simple;
	bh=tD0j9qzIucEqi2+jESFaeuUErAacWZn1kq+Ei6QYmrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ3wFqfuRU3jSTSJgwRGHbmN5/iinqxI2RyqbM/8u5HfcQKzAwGNCmS5b/lAgGRDeV5TkMqj+4ULMlaf6JOHbELX8cFcwXVhJYfyGQl318P57F1qhcxoXaLgZbD9RiI7vr7zue7+ftT5uEXNwGVz9L3z6svHlMk5rvicVfsnNEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkbVr1C7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkbVr1C7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B64DC116D0;
	Wed,  4 Feb 2026 00:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770166116;
	bh=tD0j9qzIucEqi2+jESFaeuUErAacWZn1kq+Ei6QYmrY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=kkbVr1C7jIYfGwfeRsDp8owXu4kLVzcFxwu9GE0pSJlGnjLGNkC1u0VQCHoEj38aU
	 HwE39HTbklTIp/ZEtmIJPNo8tvco5QYK7y0jct8u70VsqmQ4gJWMXuuIxBLc2uW9lF
	 zkUcX7jMsggcstd/UKYWr8kvVHXrWjf1cUAgASkvS5j7O7GKnAaOO5y6H32tR1Yx/U
	 z5BObDUPMK1FVrQ2gRO/UaUvLh81gVkv9ZrcNdv1w9NRu49+5MoInNfZXw8xjXmRvb
	 4nLFwdREUkpDMCMz19TfySr/OgFedpVJIufQ+mHY0GbILqhujF+GKkiifvRP2VSuMG
	 D8fzm4Esg0E6A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7BAAFCE0DC7; Tue,  3 Feb 2026 16:48:35 -0800 (PST)
Date: Tue, 3 Feb 2026 16:48:35 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] defer/hazptr: Fix line number reference in Section 9.3
 Hazard Pointers
Message-ID: <cb0057c6-f97f-4349-9d6b-5d5e2edfad20@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260119151130.2886564-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119151130.2886564-1-kunwu.chan@linux.dev>

On Mon, Jan 19, 2026 at 11:11:30PM +0800, Kunwu Chan wrote:
> The text incorrectly stated that 'line 8 finds' the pointer condition,
> but in Listing 9.4, line 7 contains the if statement that performs
> the check, while line 8 contains the return statement.
> 
> This commit:
> 1. Adds a label (htr:check) to the if statement on line 7
> 2. Updates the text to reference the if check (htr:check) instead of
>    the return statement (htr:race1) for the condition check
> 3. Clarifies that the if check finds the condition and the return
>    statement returns the value
> 
> This makes the description more accurate and reflects the actual
> code execution flow.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>

Good catch, applied, thank you!

							Thanx, Paul

> ---
>  CodeSamples/defer/hazptr.h | 2 +-
>  defer/hazptr.tex           | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
> index bdeb5c15..2d5a098f 100644
> --- a/CodeSamples/defer/hazptr.h
> +++ b/CodeSamples/defer/hazptr.h
> @@ -74,7 +74,7 @@ static inline void *_h_t_r_impl(void **p,		//\lnlbl{htr:b}
>  	void *tmp;
>  
>  	tmp = READ_ONCE(*p);				//\lnlbl{htr:ro1}
> -	if (!tmp || tmp == (void *)HAZPTR_POISON)
> +	if (!tmp || tmp == (void *)HAZPTR_POISON)	//\lnlbl{htr:check}
>  		return tmp;				//\lnlbl{htr:race1}
>  	WRITE_ONCE(hp->p, tmp);				//\lnlbl{htr:store}
>  	smp_mb();					//\lnlbl{htr:mb}
> diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> index 22fca499..50ff0996 100644
> --- a/defer/hazptr.tex
> +++ b/defer/hazptr.tex
> @@ -69,8 +69,8 @@ Finally, if it fails due to racing with an update, it returns a special
>  }\QuickQuizEnd
>  
>  \Clnref{htr:ro1} reads the pointer to the object to be protected.
> -If \clnref{htr:race1} finds that this pointer was either \co{NULL} or
> -the special \co{HAZPTR_POISON} deleted-object token, it returns
> +If \clnref{htr:check} finds that this pointer was either \co{NULL} or
> +the special \co{HAZPTR_POISON} deleted-object token, then \clnref{htr:race1} returns
>  the pointer's value to inform the caller of the failure.
>  Otherwise, \clnref{htr:store} stores the pointer into the specified
>  hazard pointer, and \clnref{htr:mb} forces full ordering of that
> -- 
> 2.25.1
> 
> 
