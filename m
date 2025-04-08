Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEDD22D4FE
	for <perfbook@vger.kernel.org>; Tue,  8 Apr 2025 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129128; cv=none; b=EJOCHEJmLqGFDgP0L0X/TX1k8O4Fa6qYGLbUaDQ/Y9WTbX0cNrQ7DfYXpLNYjbz36/C7Io8IIhYPtXfaNuJhf1t1enSO2O+NZCdrMhrdEThApyONmiqx+gu3GuMMgocmGp1XQJ0frInSqRpge2WhbveNXIsEKA529yj1Xim28p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129128; c=relaxed/simple;
	bh=7Py6tEShHJoE6Ajz2uYQhGVw3W50J6aGh6AYskqfWPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSoeNeopTn2u9HP/uNrBg72hQzLWK2xtsj+1h5rBZepWI2EFPDhTB6Zq6shkC9KbgT5thdyf8kANpzDbGs6APCcQAwpmLP7ZRaY34wyv0mAwnL+lz49DWt33Zg5jNy8VuHQDlPK9znzKaTHk6CebQN9zakWh3vrIB5Y15Hc6npU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/X+3S3R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/X+3S3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980B8C4CEE5;
	Tue,  8 Apr 2025 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744129127;
	bh=7Py6tEShHJoE6Ajz2uYQhGVw3W50J6aGh6AYskqfWPQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=h/X+3S3RN6yFOx0vbHzD61mr5/IyjjxtCOEb2to1xiISKpB/hiF/Wez75X4UDK0GZ
	 u2C5a3Li0Cn3fzu/ouv2SMTEJSKzaO1urMHnQCE+nJUR1oXVQTQSUd/vPMh1XuS8fB
	 PktTFT1KRlyehrjETQuze4F+8y/JGqu/JWlnB9/SocWGJ9bEzLt8rllX7bZoPhYOaJ
	 mVud7HO4V0kkP12H16U91gWCFd2TdkgDaFxZXXrJIBzyoJUKslfE/MfioL9EhTnSY6
	 JHdccR0cIZNwF1nJ4bY/84+74D4lBOYWxt3Z7PLKHC0GnkIvvQPLB2UQOdV9KcU5PW
	 DxeR5lEu135Lg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2EAFCCE0F64; Tue,  8 Apr 2025 09:18:47 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:18:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: glossary: Add definitions of the flavors of multi-copy atomic
Message-ID: <53b7f24f-b0e4-40bf-aa10-dc681816e6d2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <e57996f3-2a63-4de8-8a83-c1a6156a1e76@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e57996f3-2a63-4de8-8a83-c1a6156a1e76@gmail.com>

On Wed, Apr 09, 2025 at 12:23:59AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Current master at commit b8bdf71fbc31 ("glossary: Add definitions of the
> flavors of multi-copy atomic") has new definitions of:
> 
>     - Multi-Copy Atomic
>     - Non-Multi-Copy Atomic
>     - Other Multi-Copy Atomic
> 
> Not a big deal, but do you mind if I changed the latter to
> "Other-Multi-Copy Atomic"?
> 
> I'm asking because the Index pages now have these terms:
> 
>     - Multi-copy atomic
>     - Multicopy atomicity
>         - full
>         - non-
>         - other-
>     - Non-multi-copy atomic
>     - Other multi-copy atomic
> 
> , which look fairly inconsistent. :-/
> 
> I think you want to say "Multi-Copy Atomic" in the glossary,
> and I can tweak index markers so that above terms can be listed
> simply as:
> 
>      - Multi-copy atomic
>          - non-
>          - other-
> 
> , and in single level indexing mode:
> 
>      - Multi-copy atomic
>      - Non-multi-copy atomic
>      - other-multi-copy atomic
> 
> , where "full(y) multi-copy atomic" is merged into plain
> "Multi-copy atomic".
> 
> Do they look acceptable to you?

Other than wanting "other" in "other-multi-copy atomic" to be capitalized
in single level indexing mode, looks good to me!  Thank you for checking,
and apologies for the hassle.  (I should have generated the index...)

							Thanx, Paul
