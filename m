Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EF81FC7DD
	for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734552680; cv=none; b=lcRHryoACRDGog9KN0FbJ13jMWhvFL+5KMXAYSb99UIcuySBrMRNnCHmeplO8ZLprDSX6UKAdCwV43gp/f44KKW1zSDtUt8RE9oli43QP3Pker0E1LlaaJpWa0SZAdfgM0Fy4p5xN1pW7dAesQ7CLq7+z6gCoW5GQ/ZToFfpkpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734552680; c=relaxed/simple;
	bh=yAyLNqRy3G8gQhdQqpFLFS3kEPSfRGy3gPuRtvHbpns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JapI+W2akAeVeHNG3eHjieM7wL4ub1croDz6dLOzpGhs+ZMa8PJC4x1mrPeuG9hVU7DSjyxJUn0MqkHIjtNYQ37TIOjZAkO6Eb8NdgVMIdNBKm9B/a24FnXpbGmTgqZF/NrJNqN4v0z+rPo7RQy5fShf5MyggMgKHaisb/hFscg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+yBgZza; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+yBgZza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1020C4CECD;
	Wed, 18 Dec 2024 20:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734552679;
	bh=yAyLNqRy3G8gQhdQqpFLFS3kEPSfRGy3gPuRtvHbpns=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=B+yBgZza8BwqLTOybxOFX4/ZMCaO8ZhTtr+CuGrs3YFCPTDhiZBmSkxe3QuhSPeVs
	 9WZS3DuTJ4lAq3IX+22Q2QelrT3uDHeEer+Y6LRhbRD5Wg9lvim5zhwzKKxKRpklwO
	 mg8yNjhuynEhBCjhcoaYZyR1i1diLJIcj2M7KhuQw9geKLjauoxB2WMuyLzFlcXyP3
	 SzsCfIed37bJY2Y/f29Y7kctFqf3v7ff69F1sffpgiQMclp3InRhWVTLRYdXcR7uTX
	 pw8BzQMhiN0RNPV9YQXz518soe/TxqCXo/1hdKy/OiCC0B7A829gYsB3QZ0EC2RNh3
	 OubjOGjcKT9xw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 70321CE0B9F; Wed, 18 Dec 2024 12:11:19 -0800 (PST)
Date: Wed, 18 Dec 2024 12:11:19 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
Message-ID: <e16f8adb-7cc2-4172-8359-24633bea49e0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>

On Tue, Dec 17, 2024 at 02:22:29PM -0800, Daniel Xu wrote:
> WRITE_ONCE() is needed here to prevent store tears and other unwanted
> compiler optimizations.
> 
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>

I am pulling this in despite the misgivings on this thread.  If the kernel
gets an INC_ONCE(), maybe perfbook should too.  But in the meantime...

							Thanx, Paul

> ---
>  CodeSamples/defer/seqlock.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/defer/seqlock.h b/CodeSamples/defer/seqlock.h
> index ec00177b..842d10a6 100644
> --- a/CodeSamples/defer/seqlock.h
> +++ b/CodeSamples/defer/seqlock.h
> @@ -60,14 +60,14 @@ static inline int read_seqretry(seqlock_t *slp,		//\lnlbl{read_seqretry:b}
>  static inline void write_seqlock(seqlock_t *slp)	//\lnlbl{write_seqlock:b}
>  {
>  	spin_lock(&slp->lock);
> -	++slp->seq;
> +	WRITE_ONCE(slp->seq, READ_ONCE(slp->seq) + 1);
>  	smp_mb();
>  }							//\lnlbl{write_seqlock:e}
>  
>  static inline void write_sequnlock(seqlock_t *slp)	//\lnlbl{write_sequnlock:b}
>  {
>  	smp_mb();					//\lnlbl{write_sequnlock:mb}
> -	++slp->seq;					//\lnlbl{write_sequnlock:inc}
> +	WRITE_ONCE(slp->seq, READ_ONCE(slp->seq) + 1);  //\lnlbl{write_sequnlock:inc}
>  	spin_unlock(&slp->lock);
>  }							//\lnlbl{write_sequnlock:e}
>  //\end{snippet}
> -- 
> 2.47.0
> 
