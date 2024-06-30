Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5434913C9A7
	for <perfbook@vger.kernel.org>; Sun, 30 Jun 2024 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719761522; cv=none; b=PkuDAMff7BKH8rg/wNP1XbY56kkgDeBsBvov2FbvJhVcXFOcNNIYK5+gx08lgnSj1ExRkpS3LaETqTY7rS/Uyk4H1BLeS+fZvB5+bnJP5VaKs0TWLRV8nUmJ2T4EHENugBXRhtLiwYNplvn8aOntUNznWfN/nDBa8VnxjbDsguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719761522; c=relaxed/simple;
	bh=wYQlmCEwnNBh8PtawMmnNUq/cZjDlc+j2DWzqMyN8Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvtHfHwt1dQ2ut6eDyY0Qneqo81Cz3OXMTpcypkPFilaFFlRPTxE9U8BpFR4SEmBP+H/K+ZV8yO/Lc8+CIh+q1O+bhLKMkbfR2jbyEgl42cMI72Xo84UHzIYVR5qlAKgWT4qYrC0pq294B5VAflhp7Fqc9z0v9px+p+msyyHljY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkCb41EN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkCb41EN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF27AC2BD10;
	Sun, 30 Jun 2024 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719761521;
	bh=wYQlmCEwnNBh8PtawMmnNUq/cZjDlc+j2DWzqMyN8Nk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AkCb41ENHABJylTd9lC/jiSAQqN89VXrqGOLvTy8iCCe1vFL6BiKpWhxtQ+bl1glY
	 iIV/174gisZMvTIxshfWxGsbeBOdJH+/o96/Oc3wXbNaxmIgbEWtcbOtHnv1MVYWvw
	 rMB2TQluREzxnmmdh6z7g55P8jEyqCtrOiDB5ZZuLdJaIZetGyQR/iBnq0tkMs41zH
	 G3ou9M0eWk6NkLy5VEejCSRkRK+Owlsqxano+W5BV6re/J+9mRTlD87Q8gj6JZq9oi
	 FGTt1CA2VxWiUrha90AxH07TpRP3GZJVDPp2UzSTNHZrxF7PV357TWoVcP8AeE0w70
	 csV4eblPMUIHw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7EA24CE0414; Sun, 30 Jun 2024 08:32:01 -0700 (PDT)
Date: Sun, 30 Jun 2024 08:32:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] Revert "Work around conflict between arydshln
 and array v2.6"
Message-ID: <e0af0382-a2ce-485b-a6c0-88655d481307@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <66ea8c7a-27ca-4335-8b77-11ebb1ef6c87@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66ea8c7a-27ca-4335-8b77-11ebb1ef6c87@gmail.com>

On Sun, Jun 30, 2024 at 09:30:23AM +0900, Akira Yokosawa wrote:
> This reverts commit c1fdb7c375c71bd580d8b914c0fc76e8fa8f62c9.
> 
> The issue is now taken care of by latex-firstaid 1.1f (not a usual
> .sty file, but a collection of hotfix patches to be loaded during
> latex format generation) released June 26, 2024 [1].
> 
> Revert the rollback of array.
> 
> Link: https://ctan.org/pkg/latex-firstaid # [1]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  perfbook-lt.tex | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 21713a91..0fa51425 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -9,9 +9,6 @@
>  % within a page. See: https://tex.stackexchange.com/questions/183149/
>  \ifdefined\pdfsuppresswarningpagegroup \pdfsuppresswarningpagegroup=1 \fi
>  
> -% Work around conflict between arydshln and array since array v2.6c
> -\RequirePackage{array}[=2024-05-01] % One month before the release date of v2.6c
> -
>  % standard packages
>  
>  % A more pleasant font
> 
> base-commit: c47b401fb4c031592552e56020aa2c6ddc2dc8d9
> -- 
> 2.34.1
> 
