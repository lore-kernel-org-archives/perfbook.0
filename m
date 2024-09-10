Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7423208A5
	for <perfbook@vger.kernel.org>; Tue, 10 Sep 2024 06:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725950373; cv=none; b=aTVQl5m6J94Lm5FnQOmO7LtDmBb7Hb6vcZm5lI755SKyLA8jU1ot4taCvQ6wCSGl/597WSyq3GMCfVVaA3zfGWRZSzwtPAYf6J7YugXmvBkzTx9E75yOubGDm6yGtUiZPAg5t8uBCnee2UVw7ZZHdm5I1MlxmqSe5Yrj7IQBLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725950373; c=relaxed/simple;
	bh=neysJWizsMMRdfDSRH4++e6ATC/Mem5n3MdD11TBxCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KarsdUfV4pVvWtJLXMTHsQsu1lF7OrYIFManrA4WkXKujNue/hNqX7N5VB/5xKMIxht73b/7vMy5rn4DghZkHJeY2VyUqf2WNoR8Gsf16e38DVxQAWUUrQPNH6fPSmOe4fggeKH/RUB6uvlyvsFrDcaNTlZL9Qr+tFZtIpi+RhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PP6R0/77; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP6R0/77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C13BC4CEC3;
	Tue, 10 Sep 2024 06:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725950372;
	bh=neysJWizsMMRdfDSRH4++e6ATC/Mem5n3MdD11TBxCA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=PP6R0/77nt1tXKfO2hWfNmMfDsdfaUgw10eiREEuH38mSvzx1j2mdflo3RRE94Fcr
	 vT5Do3liioUp6JMfoRWncVt2cPCeIKL4o2tgqcWjDw17wGEoHpsdPL0upTIznYnXTM
	 y9TJhzmfR0pQip9GjWmB/CaoJn6iQwpQ2Rw5nHzuWT46PdUODz2sXC1pVbz40x97u2
	 OnDt/g25fPL6+6CIkWFTHnC9bnlzXuLoKwENERu/Qg6AOi9LSD5fO7lSGrg9QONUBd
	 8OooslMhhmUlHmVS6Ugo9NRhNhMlDhfzUP0KAGDCR4d5htSe1ynwCtBMyOKsXAOYMK
	 Z4sYP7oDBgjDw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id F2692CE0FEB; Mon,  9 Sep 2024 23:39:29 -0700 (PDT)
Date: Mon, 9 Sep 2024 23:39:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] punctcheck.pl: Expand hint message on
 mid-line punctuation
Message-ID: <23c22ca0-b21a-4866-aa64-45a4223c1c11@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <be9a8fe7-b63d-4035-a72d-accc88e69309@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be9a8fe7-b63d-4035-a72d-accc88e69309@gmail.com>

On Tue, Sep 10, 2024 at 09:29:46AM +0900, Akira Yokosawa wrote:
> Cover mid-sentence punctuation. 
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed both, thank you!!!

							Thanx, Paul

> ---
>  utilities/punctcheck.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utilities/punctcheck.pl b/utilities/punctcheck.pl
> index 94cbafc9..317329b4 100755
> --- a/utilities/punctcheck.pl
> +++ b/utilities/punctcheck.pl
> @@ -83,7 +83,7 @@ sub check_line {
>  		$line =~ /^(?=[\s]*+[^%])[^%]*.*[\.:][\)\}\']*\s+\\\\/ ) {
>  		$ng -= 1;
>  	    } else {
> -		print "vvv Hint: end of sentence needs new line vvv\n";
> +		print "Hint: Break at end of sentence or mark mid-sentence punct as such (xxx.\\@).\n";
>  	    }
>  	}
>  	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^~]\\cite/) {
> 
> base-commit: 4c0bf4331a91401672dda6d45a91e17f2a6ac944
> -- 
> 2.34.1
> 
