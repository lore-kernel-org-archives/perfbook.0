Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE51DFD89
	for <perfbook@vger.kernel.org>; Mon,  6 Jan 2025 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191908; cv=none; b=Bee5b93hFbw75SjpWNu/tBIu52XvMtlCyjrP1qBBQDl2NMQhyHZC9CV4dTjbuYKcdWROpXvzu+vXE0pTgDYaLFhQvnkUo3G05Dr7PHqkofoDBRlWKE/ZsNn1Xn4txubQfsl5ycwM9EMY0d3XnQPMSQFsauexMN5e+lMK6pC81NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191908; c=relaxed/simple;
	bh=xJoBkwB+HUovx8R8TR6eY582fg+6Iukfl9Im5HKGDqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMzOX+S4kHGsvaW5qrgSBkM1pi9Mrnt/XgZx3r6B34JzjiNxjS42m+rNG1wueK8lUtxTAdx69QJZDZCkssIqWnV3CGXCG3PuAN0kkcEyZbBVw8CbIMqm/yS3fBTjN/IbFuF8ed96c823b1muB/aqBCIcbIGKDaW8uI10hDfQvt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feRsSrl2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feRsSrl2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17161C4CED2;
	Mon,  6 Jan 2025 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736191908;
	bh=xJoBkwB+HUovx8R8TR6eY582fg+6Iukfl9Im5HKGDqI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=feRsSrl2z6bkKePBOhDK7DAlH960CACBkFS9xW2NVSR+L1Zb82uFPULkVDtS7SVw9
	 O7LyhDhaY+cgn+5lfOujcn2WFYJ+i+Y3IkCX47NW/fD3sF13qvelqZt7liprxB0eFl
	 9+iG37P53u5ds6v1RVhX3Ng4mCuwR1EESyVjAMAfdu/Iu2Nvd9Jocc1AGfoYG8t4qp
	 gtouenvW0IhNIUfpm/VQMJCvbM26jmix0qafCdbBz4r5CUc6Mt7q7mTSEQZd6kAWww
	 28H/lo6D8uk08IIFlQz/dLH4ffVkHTypPvb5emmY3z8PhRt5e10vC7Pa64AFcpCPEv
	 o4xxS0fviJOIw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AC792CE383E; Mon,  6 Jan 2025 11:31:47 -0800 (PST)
Date: Mon, 6 Jan 2025 11:31:47 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] Revert "CodeSamples: Add -fcommon to GCC_ARGS"
Message-ID: <7443ed8e-0fda-4062-a17e-126b49301e7f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1034fb7b-b566-4189-9353-edc39782c9aa@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1034fb7b-b566-4189-9353-edc39782c9aa@gmail.com>

On Mon, Jan 06, 2025 at 12:00:02PM +0900, Akira Yokosawa wrote:
> This reverts commit c1f3367e5701333dd9c2bdd629754d5278b66d2a.
> 
> Commit ca0fdef62907 ("CodeSamples: Add #ifndef SUBOBJ to api-pthreads.h")
> resolved root cause of build failures that commit c1f3367e5701 had worked
> around.
> 
> The band-aid fix can be reverted now.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued, thank you!

							Thanx, Paul

> ---
>  CodeSamples/datastruct/Issaquah/Makefile | 1 -
>  CodeSamples/datastruct/hash/Makefile     | 1 -
>  CodeSamples/defer/Makefile               | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
> index ca379b3e..d3a5fcb2 100644
> --- a/CodeSamples/datastruct/Issaquah/Makefile
> +++ b/CodeSamples/datastruct/Issaquah/Makefile
> @@ -32,7 +32,6 @@ endif
>  
>  include $(top)/recipes.mk
>  
> -GCC_ARGS += -fcommon
>  LURCU_SIG := $(shell pkg-config --libs liburcu-signal 2>/dev/null)
>  
>  # NOTE:  For decent scalability on update-side tests as of early 2015,
> diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
> index 5f3d740c..a84499eb 100644
> --- a/CodeSamples/datastruct/hash/Makefile
> +++ b/CodeSamples/datastruct/hash/Makefile
> @@ -32,7 +32,6 @@ endif
>  
>  include $(top)/recipes.mk
>  
> -GCC_ARGS += -fcommon
>  LURCU_SIG := $(shell pkg-config --libs liburcu-signal 2>/dev/null)
>  
>  hash_bkt: hash_bkt.c ../../api.h hashtorture.h
> diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> index 0cb77122..69516958 100644
> --- a/CodeSamples/defer/Makefile
> +++ b/CodeSamples/defer/Makefile
> @@ -61,7 +61,6 @@ endif
>  
>  include $(top)/recipes.mk
>  
> -GCC_ARGS += -fcommon
>  LURCU_SIG := $(shell pkg-config --libs liburcu-signal 2>/dev/null)
>  
>  # Note that bug_srcu_a is disabled until completed.
> 
> base-commit: 6081ef4580d7495727eeb87beb93b3b0dedf0139
> -- 
> 2.34.1
> 
