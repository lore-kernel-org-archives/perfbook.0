Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803A9253B59
	for <perfbook@vger.kernel.org>; Wed,  8 Oct 2025 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935131; cv=none; b=lksX+bS1H1y87zHmSuU0co6ImA/ERKzFjvdE8BYpllsk7YP+v+h8pgg7b/8BvgdtmrzAOZENxtEvZBE857pifejtOB1ztzCzZJqrOVg89o9HheToQabD471W79nnwxrOy58igSRJUtBYjyPoG9W31prhOv6T9eLOYWqfdsR4ng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935131; c=relaxed/simple;
	bh=ekm7PppfjGLHfyh1iVVbFX6nIZ/VeV0ZPRhpKzFWGVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZmCO017hmEo+5FmXnFmuLzM05fzcJfjgkQfiuF/Xy6qRNqcW5aCzhGfo6m6NlEbb7kcG0PHrMcqcx006cxmFtxXfjQCZ7mH3JyQQaahoKF22uw0WqM/+PSKcTLOpFOpZhXv3bUggTBvW87kgOIGW3DnaaUmyJPp46pkkaT/orE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpkMJgR5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpkMJgR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC33C4CEE7;
	Wed,  8 Oct 2025 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759935131;
	bh=ekm7PppfjGLHfyh1iVVbFX6nIZ/VeV0ZPRhpKzFWGVA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=GpkMJgR54OEWFtpBT2ZJ/MRMDBxWU2K3jWY3sK8JeukOhBOubjNA3eKk4theepwM9
	 bOzVieSycvQJEC62xMeTpHxwkAKYyjhBfQBYztAyXmO56H9CXHXMCBkx665uDNtl8e
	 650hrovPrKXadycpznd31aI6ofIweDulZN+ciq2kEozZDWul3CzJzy73t3BessKZS9
	 wnUBsK8rWu7q323B9aLZxazTm6keyuw82fnCjZUi62ZcSCdmN9LQkQyhvSz3Zdjt0I
	 Shs6bkuEB8Tob/PCeGCMWEh36rPD91P86tw1nkpxs/LocmDdaoTGOA0dT/kCfYfTIc
	 fsuCtiZ3hXe+w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7A21ECE0B32; Wed,  8 Oct 2025 07:52:10 -0700 (PDT)
Date: Wed, 8 Oct 2025 07:52:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] CodeSamples/formal/herd: Fix comment format in
 initialization
Message-ID: <fc160483-8d72-4da5-9df7-9fd7f9bb78d5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <95eff8b8-e93b-4973-835a-70d35176f2f6@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95eff8b8-e93b-4973-835a-70d35176f2f6@gmail.com>

On Wed, Oct 08, 2025 at 10:06:06AM +0900, Akira Yokosawa wrote:
> In initialization of litmus tests, comments should be "(* ... *)".
> Fix it.
> 
> Fixes: 915807a52e21 ("together/applyrcu: Use \clnref{} and its friends in Section 13.5.9")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I clearly failed to test!  Thank you for the fix, applied.

							Thanx, Paul

> ---
>  .../C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
> index 73859c24..86ea5553 100644
> --- a/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
> +++ b/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
> @@ -5,7 +5,7 @@ C C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul
>  	int a=1;
>  	int b;
>  	int c;
> -	int *p=a;			//\lnlbl[init:p]
> +	int *p=a;			(* \lnlbl[init:p] *)
>  }
>  
>  P0(int *a, int *b, int *c, int **p)
> 
> base-commit: ef86afaddd2705ea45124c967ec1ec046eaba4fc
> -- 
> 2.43.0
> 
