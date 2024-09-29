Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD72263A
	for <perfbook@vger.kernel.org>; Sun, 29 Sep 2024 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727633952; cv=none; b=SD3TgtbWHH/4qMc0inc36XeAzHCHDG07YGLo/fJkj9HJOENoniGYZvY+Zjx0K8fC4eGjPfh2SFDbz5HZtuFm/nxsdrm0H7PPxVuPAyOIXh5hRGA4MBaINJUuWnMrhqAndCAcPPdbs3NQAoR++uNi+9M/XqDcOZsCUaiihRgILfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727633952; c=relaxed/simple;
	bh=E8AUQPHWNME1uhUVPWJQLK9ReSvhhQvS/DYyahf+W5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTPjS0b92fOipuV1KJG4oV0VDVshJWB1k3t+rhxjAiUa1i1MhM4H/6ySEiy4l7xg36AmJG9yi/GULS+UXKdVuU7ED4w04Yz82ZkHbZIZCRBfaI105+2wF9T/N7lvBXyO9nBohY7MK6hrm/Ye249oq/3jjBh74aJHsWWmKl1Hat8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJq6Jr1W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJq6Jr1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F291C4CEC5;
	Sun, 29 Sep 2024 18:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727633952;
	bh=E8AUQPHWNME1uhUVPWJQLK9ReSvhhQvS/DYyahf+W5g=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cJq6Jr1WqHkveokyohL/tSaGy8pHHA8m8WBApojxEYMmZjVOFa53mBuoYSZgksx6X
	 jdJMIqOF3b5ZFgJC+sBSQgLUOsLL/++/g11lLHiVKXpo/tIWHpQGIdefA4Bd+AzJdY
	 ITrIpYyl54280e2y49AXbp95zLz1o4K79r0ojsba6I1fgijEnFiYZGA/ggBX2YsZmm
	 QSL5JiUZvO2/U3WOBiv7DonR/3jURQ4r+1033JlY/3bkYKb/s3cMMLqXujN2dRjPHD
	 fF79wmUpmNO7rp9dhJGt59ssJ6PyQg4g9R0CuAH13aTo/IdxNdqlhRXI/Dzam58g5j
	 Gu+abT+CzTLhA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A5AFFCE04D4; Sun, 29 Sep 2024 11:19:11 -0700 (PDT)
Date: Sun, 29 Sep 2024 11:19:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] CodeSamples/formal/rcutorture.sh: Don't
 bother with stable tags
Message-ID: <196ee56d-eeee-46cc-806d-d648b212adbf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f92aa1ae-7a8c-4b42-be76-591ea765d53d@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f92aa1ae-7a8c-4b42-be76-591ea765d53d@gmail.com>

On Sat, Sep 28, 2024 at 08:31:55AM +0900, Akira Yokosawa wrote:
> When run under a kernel repository which has a stable repository in
> remote, data for stable tags such as v6.6.1, v6.6.2, v6.6.3, etc. are
> collected as well as those for mainline releases.
> 
> Refactor the grep pattern so that only v2.6.m and v3.n, v4.n, and
> later are listed in $tags.
> Use the nice -V option of sort instead of hard-to-parse -k options.
> 
> Factor out starting point version to SINCE, which can be overridden
> by setting it as an env or shell variable.
> 
> This should continue to work with v10.0 and beyond as long as
> mainline sticks with current scheme of release numbering.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/rcutorture.sh | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/formal/rcutorture.sh b/CodeSamples/formal/rcutorture.sh
> index 23686805..5e568e24 100644
> --- a/CodeSamples/formal/rcutorture.sh
> +++ b/CodeSamples/formal/rcutorture.sh
> @@ -20,10 +20,18 @@
>  #
>  # Copyright (c) 2019 Paul E. McKenney, Facebook.
>  
> -tags="`git tag -l | grep '^v' | grep -v -e - | grep -v '\..*\..*\.' | grep -v '2.6.11' | sort -k1.2,1.2n -k1.4n`"
> +# Override by saying, e.g.:
> +#     "SINCE=v6 sh <path of this script>"
> +: ${SINCE:=v2.6.12}
> +
> +tags="`git tag -l | grep -E -e '^v(2\.6|[3-9]|[1-9][0-9]+)\.[0-9]+$' | sort -V`"
>  
>  for t in $tags
>  do
> +	tagsince=`echo "$SINCE\n$t" | sort -V | head -n 1`
> +	if [ $tagsince != $SINCE ] ; then
> +		continue
> +	fi
>  	git reset --hard $t > /dev/null 2>&1
>  	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale | grep -v refscale | grep -v Makefile | grep -v Kconfig`"
>  	ntn="`wc -l $nontorture 2> /dev/null | tail -1 | awk '{ print $1 }'`"
> 
> base-commit: 2eb3375d38e20694912f3f5fdbb744a7079c62e6
> -- 
> 2.34.1
> 
