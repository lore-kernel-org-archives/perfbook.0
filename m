Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642541E9B32
	for <perfbook@vger.kernel.org>; Thu, 30 Jan 2025 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253222; cv=none; b=a1fEFmnTaoi85oo4vdnWmfJTz2nlwTTRYFYyCnY7Ng4MeWDsZutVN8KKbiIeUPbqsDad1g/y4V6nXA9/MPBblJcN18byi911XA5/iztpEWeOvchU+Xaxp0TG1LZd1FcUOwoZnLRWBdZTDr1e/0XPcsx5R0CcwS/bV2lQK7khfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253222; c=relaxed/simple;
	bh=1L1N8eqqtojmHnq2xzu7ESn8vO9B156JwTn9G3VFyFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d95E+eO5ZyLvu34Ws7SCc7cPM7779SpgrTDjtIznbTZeMqLjz5gYvIXUeCR7wDZjAEPorI2RBWsgJv+J24kVPyKOadttKz2AV5yFaqjMBh4AO7nwyLrrgCa6/05AQvtbY94aBn3x4EAu8tZfOhqORwakq/DlyQO9D+CdCoV4ypU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0G8Vt4E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0G8Vt4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38327C4CEE0;
	Thu, 30 Jan 2025 16:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738253222;
	bh=1L1N8eqqtojmHnq2xzu7ESn8vO9B156JwTn9G3VFyFQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=L0G8Vt4EqqjxOheJNPBQqad4FZaNUzDOivvLIbq+gHU7qPGmohucBImoBPfoxI1Jm
	 PQD53UKbUrwGLfFNYrHhT9gorb4Qw3hbAqktSGpK9jHhvONG03ZnAHqsxRO3qvcGzG
	 Taa8QK3dLriijs5s2ZuAhQdi/aQg3CyfpLWyBwhMGkRe6fH5SRxWZWHZ7WI2yW8BU2
	 stMBa8kgJNjTCSC+zF7Sc3Xh8iqK/Up/NezsUYgA6aSiCRZlcnHIctZadZPMVpWK99
	 hzPU4zbGr2v+lD+inbgCzZzjXVIgE+g/g3vaXMVN1S5VIztY7MAnpZrQh/+aqy99+e
	 o6awxtrit/k1w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C9D4DCE37D9; Thu, 30 Jan 2025 08:07:01 -0800 (PST)
Date: Thu, 30 Jan 2025 08:07:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] CodeSamples/formal: Update rcu-test.dat for
 v6.13
Message-ID: <b47c291a-6209-4819-a893-cc3298e7df35@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <9ade7bc8-2937-4117-9fb5-f52d8a44d75a@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ade7bc8-2937-4117-9fb5-f52d8a44d75a@gmail.com>

On Thu, Jan 30, 2025 at 07:28:16PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued, and thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/rcu-test.dat | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index e984fa8a..acb29ae2 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -100,3 +100,4 @@ v6.8  22018 12071 34089 35.4
>  ""    22579 12085 34664 34.9
>  ""    22676 12095 34771 34.8
>  v6.12 22834 12313 35147 35.0
> +""    22961 12414 35375 35.1
> 
> base-commit: ff5ebfc467117f34c4d4066d83b7883b151da63b
> -- 
> 2.34.1
> 
