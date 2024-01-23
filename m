Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674507FBA7
	for <perfbook@vger.kernel.org>; Tue, 23 Jan 2024 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028686; cv=none; b=X4DLRMeK27QOia63iusr6RV/LAbtCCvWEREJX237YUYCQ7uShIz9IC5/KtpmgVQHHX6lxvkfucR7ewnqPlBqhedzZK7rvnynTJ/PbvZxyFJZAIyr/8fimR+eeZc8zgHkCMcApD/Yi9oJ9+3QYY2L8Gn1aESmIuiGlc/xfCkY12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028686; c=relaxed/simple;
	bh=QOM1iMnlcNBF+mgsbfVJgZ5LUhexNasUH9qCH0qgLvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxYsfz34SZDnOof1SWdw6FW/Ln1mG/U27P7YgZ6/hwafx1ezDjOKAb1VMqreWZwwww0c51rGpAEmMTQmlu/mDBYhDVuQwRYqhGDKkjNprzjCD04XO5ry2SVWVXorB9cPfwQQ/sF6CbALLrsMpF64pTT6gKp7mqMnATkuOgBggsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYWgzi93; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYWgzi93"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BC1C433F1;
	Tue, 23 Jan 2024 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706028686;
	bh=QOM1iMnlcNBF+mgsbfVJgZ5LUhexNasUH9qCH0qgLvY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=SYWgzi93ryZeGseXJGqe6Ko6bw7aivZG87SKyXOPl5o4rClMaYrH35YRimBiT1VDZ
	 GZjjt+4iUQ180dqJU+952UBy4CUNJSkXGnD9kmc6GOpw6Qpzjd/HHBBzpMdwTPjMvD
	 9vrgEDZXr8Gi8cCq7IWtX65I8Eb4HfMQdOj3EcYuV87Zg1fTAVKF6ygq9n4JvtSYYj
	 XnqJj7vUuvnFHQDuxvgmgBh9ewChX9DdDcxx3soxETClQuDJltaFHDIvv2RnGPzALH
	 pJRjeLAfaKFN8goLCmuBj5bF6DprANl0IC33T6xaY47w0aBp8I8GwXYsoCOuwH6q+M
	 0Asv1GMTcQaBw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8A0DBCE0964; Tue, 23 Jan 2024 08:51:25 -0800 (PST)
Date: Tue, 23 Jan 2024 08:51:25 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] memorder: Tweak size of figures in Answer to
 QQz on x86 memory ordering
Message-ID: <6cefb50a-4240-4e79-b038-4cdbaddb3702@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4c252203-5802-4183-af41-f6a311663df7@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c252203-5802-4183-af41-f6a311663df7@gmail.com>

On Tue, Jan 23, 2024 at 11:58:24PM +0900, Akira Yokosawa wrote:
> The use \columnwidth results in too large figures in -1c and -eb
> builds.  Instead, use \twocolumwidth (\columnwidth of 2c build) and
> make them more or less similarly scaled.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued, thank you!  And at some point, I should learn that \twocolumnwidth
is *not* the width of both columns.  ;-)

							Thanx, Paul

> ---
>  memorder/memorder.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 1c85b22c..940ef401 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2854,7 +2854,7 @@ passage of time itself as a memory-ordering operation.
>  
>  \begin{figure}
>  \centering
> -\resizebox{\columnwidth}{!}{\includegraphics{CodeSamples/cpu/data/coe-nvals}}
> +\resizebox{\twocolumnwidth}{!}{\includegraphics{CodeSamples/cpu/data/coe-nvals}}
>  \caption{x86 CPUs Can Disagree}
>  \label{fig:memorder:x86 CPUs Can Disagree}
>  \end{figure}
> @@ -2876,7 +2876,7 @@ passage of time itself as a memory-ordering operation.
>  
>  \begin{figure}
>  \centering
> -\resizebox{\columnwidth}{!}{\includegraphics{memorder/co-hopes}}
> +\resizebox{.85\twocolumnwidth}{!}{\includegraphics{memorder/co-hopes}}
>  \caption{Is Store-to-Store Counter-Temporal on x86?}
>  \label{fig:memorder:Is Store-to-Store Counter-Temporal on x86?}
>  \end{figure}
> @@ -2899,7 +2899,7 @@ passage of time itself as a memory-ordering operation.
>  
>  \begin{figure}
>  \centering
> -\resizebox{\columnwidth}{!}{\includegraphics{CodeSamples/cpu/data/coe}}
> +\resizebox{\twocolumnwidth}{!}{\includegraphics{CodeSamples/cpu/data/coe}}
>  \caption{Store-to-Store is Counter-Temporal on x86}
>  \label{fig:memorder:Store-to-Store is Counter-Temporal on x86}
>  \end{figure}
> @@ -2922,7 +2922,7 @@ passage of time itself as a memory-ordering operation.
>  
>  \begin{figure}
>  \centering
> -\resizebox{2.2in}{!}{\includegraphics{memorder/fr-hopes}}
> +\resizebox{.6\twocolumnwidth}{!}{\includegraphics{memorder/fr-hopes}}
>  \caption{Is Load-to-Store Counter-Temporal on x86?}
>  \label{fig:memorder:Is Load-to-Store Counter-Temporal on x86?}
>  \end{figure}
> @@ -2940,7 +2940,7 @@ passage of time itself as a memory-ordering operation.
>  
>  \begin{figure}
>  \centering
> -\resizebox{\columnwidth}{!}{\includegraphics{CodeSamples/cpu/data/fre}}
> +\resizebox{\twocolumnwidth}{!}{\includegraphics{CodeSamples/cpu/data/fre}}
>  \caption{Load-to-Store is Counter-Temporal on x86}
>  \label{fig:memorder:Load-to-Store is Counter-Temporal on x86}
>  \end{figure}
> @@ -2958,14 +2958,14 @@ passage of time itself as a memory-ordering operation.
>  
>  \begin{figure}
>  \centering
> -\resizebox{\columnwidth}{!}{\includegraphics{memorder/rf-hopes}}
> +\resizebox{\twocolumnwidth}{!}{\includegraphics{memorder/rf-hopes}}
>  \caption{Is Store-to-Load Counter-Temporal on x86?}
>  \label{fig:memorder:Is Store-to-Load Counter-Temporal on x86?}
>  \end{figure}
>  
>  \begin{figure}
>  \centering
> -\resizebox{\columnwidth}{!}{\includegraphics{CodeSamples/cpu/data/rfe}}
> +\resizebox{\twocolumnwidth}{!}{\includegraphics{CodeSamples/cpu/data/rfe}}
>  \caption{Store-to-Load is Temporal on x86}
>  \label{fig:memorder:Store-to-Load is Temporal on x86}
>  \end{figure}
> 
> base-commit: 9caac64bfabf85439c480ce928dddef969354369
> -- 
> 2.34.1
> 
