Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844DE30BF4F
	for <perfbook@vger.kernel.org>; Mon, 16 Mar 2026 21:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695009; cv=none; b=p3tni6xSZllYpfusbmokf8WbyeKj+0t2oWVQQhuoRyyznruBG2kERHIOlIUUgE6hL3ebJk50Yh2Ue0i2lJ4uPqCa8OM7uELQEdgvwNMjGdWAtUrt72HFzEQcq2WNtUO9Q1W/xLROR9hGDmknuULQ9m7IQ9rEO6I2c/00ihBexv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695009; c=relaxed/simple;
	bh=RRmn9msfdeG5Tze+v1X5T1wy6BgRy1gkRn2lbqUnQ8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzKr/TTaBxfdy4no41vy4bJKjowFNgCE8DBNtSCDkup2621KTOOuu/8jOGpIlWZIHY47Gk0ClTok8sa5XcRkBa/Z5UPQAPBRSQlRjhojl1LerpeozPbAVCkZ4anIXyyKRy5SyxywFIcsqYNAKFNdOk8AohnlEyGqwt0YQ+nMvc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4Zc45zK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4Zc45zK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FACC19421;
	Mon, 16 Mar 2026 21:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773695009;
	bh=RRmn9msfdeG5Tze+v1X5T1wy6BgRy1gkRn2lbqUnQ8Q=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=t4Zc45zKU1MVohx+V5uxIaEm4gx9HX9pZMYWlyotZODU0dNco8ZlNbLkxBDF0tqAK
	 RC1Jmyq+5wdTlN5WeYUAwCEyNfbk+fPsoOhSS01OoxZxfko2mhTNjHkq3OE19PDKE5
	 siZD3dkQdnCKiEBAWlUVwqFoRIo7acTGXgk+8I49/0mQVjXFrx5ssbStAxTQNdtxLf
	 0AxUYDDcedsBaLFR0z4YNsgbI00ECIeQ9kcCDhYXf77iScSuTfmy+y0e3B4Ny4J5PX
	 VmVshAoJlFzILiOxJy/qiv4t/XP6n0WyNsP2bX0dnMrdlHcB3pkzDFjIMboqoZzqJZ
	 2XC3WnY30IkQw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 04783CE0DB9; Mon, 16 Mar 2026 14:03:26 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:03:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] SMPdesign: Fix a typo
Message-ID: <26c22162-3f2e-4bc7-851e-62ebd339ddc4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260316021424.39111-1-leobras.c@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316021424.39111-1-leobras.c@gmail.com>

On Sun, Mar 15, 2026 at 11:14:24PM -0300, Leonardo Bras wrote:
> philophers -> philosophers
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
> Re-reading, found a typo accidentally. :)

;-) ;-) ;-)

Good eyes, applied, and thank you!

							Thanx, Paul

>  SMPdesign/SMPdesign.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 246182c2..0d94ec3a 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -19,21 +19,21 @@ The word ``design'' is very important:
>  You should partition first, batch second, weaken third, and code fourth.
>  Changing this order often leads to poor performance and scalability
>  along with great frustration.\footnote{
>  	That other great dodge around the Laws of Physics, read-only
>  	replication, is covered in \cref{chp:Deferred Processing}.}
>  
>  This chapter will also look at some specific problems, including:
>  
>  \begin{enumerate}
>  \item	Constraints on the classic Dining Philosophers problem requiring
> -	that all the philophers be able to dine concurrently.
> +	that all the philosophers be able to dine concurrently.
>  \label{sec:SMPdesign:Problems Dining Philosophers}
>  \item	Lock-based double-ended queue implementations that provide
>  	concurrency between operations on both ends of a given queue
>  	when there are many elements in the queue, but still work
>  	correctly when the queue contains only a few elements.
>  	(Or, for that matter, no elements.)
>  \label{sec:SMPdesign:Problems Double-Ended Queue}
>  \item	Summarizing the rough quality of a concurrent algorithm with only
>  	a few numbers.
>  \label{sec:SMPdesign:Problems Quality Assessment}
> -- 
> 2.53.0
> 
