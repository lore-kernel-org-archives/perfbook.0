Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BDA522A
	for <perfbook@vger.kernel.org>; Mon,  6 Jan 2025 04:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736137724; cv=none; b=T9VjBAFtyZbf4I4ZLakm09D6Eh+xCf/crt4Gu89bklIz2VVXECXdmjDekt2/OEHvNFtLLzxXaCahsVO4VjVogDos/jJDPo4EqTdd2/Yh7Z/y+90p8IG96uHz/HgNt6vXVqB0h4CW0Iqtr9UdUUVkmQrFAGJNlk/V3BJ/rQXiaHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736137724; c=relaxed/simple;
	bh=UrCYerJkiosuOIt/GubjMODSRBN+3DddBUDM9BVONaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft2QQv6rAorxXT59qfyZzNhyTMXj9xFozV+USP7dHGGpFvaGoBBTNcatBebGB63aKsTtC435XR7S50ejhsJlmSszpI5MWsviVGej7PKGKUyMUd2IwBn5XkSYddiAU8/EAJbkNTDVitH3o3obpbhWyRZIdhzO0PxaYZQA2cSMGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5ZSSSiT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5ZSSSiT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D76DC4CED2;
	Mon,  6 Jan 2025 04:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736137724;
	bh=UrCYerJkiosuOIt/GubjMODSRBN+3DddBUDM9BVONaU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=m5ZSSSiTetxav+bvCODHopSLi+PeXAuXzdjPs3Kw5K8iE4szvlqmZXq0xC4DxozSL
	 FlRdwaYAjQkPkHMXykq/RrcaJnm0SU4G6muY1cIXNJABfeYabvEVa2IIk8X8caShXq
	 Jw071uNxXo7qjVgtSINXmgq0k51m4Ig1J4Dxc+M1D6vXe9w18npJ06s4q69RfGGn5p
	 Cz4us5KN0pitWeDxqSMPCG1NrVUYlZ+6YW/PfwwxTjn/+tq3QWlIFw3i2A0vePl1/y
	 z2haa1Ela49bu22bzw6/DjigocZiHV+aY9XOXbef4f5mdO4pEkP/2wU64WHLQzLSE2
	 wUAR/GgOnlbNg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DB564CE0DCA; Sun,  5 Jan 2025 20:28:43 -0800 (PST)
Date: Sun, 5 Jan 2025 20:28:43 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/6] CodeSamples: Make non-default combinations
 of cc and -O levels happy
Message-ID: <3829c7a0-fdf3-45b5-90e3-18657a8ec90a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
 <a5d64bed-4e80-40e9-aa66-86165f31e3ea@paulmck-laptop>
 <c05a99ae-a043-4355-a6bc-591543c55c55@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c05a99ae-a043-4355-a6bc-591543c55c55@gmail.com>

On Mon, Jan 06, 2025 at 11:57:49AM +0900, Akira Yokosawa wrote:
> On Sun, 5 Jan 2025 11:02:11 -0800, Paul E. McKenney wrote:
> [...]
> > 
> > Queued and pushed, thank you very much!  And happy perfect-square
> > new year!
> 
> You mean: 45**2 == 2025 ?
> 
> You can go further:
> 
>    (1+2+3+4+5+6+7+8+9)**2 == 2025
> 
> , and
> 
>    1**3 + 2**3 + 3**3 + 4**3 + 5**3 + 6**3 + 7**3 + 8**3 + 9**3 == 2025

And (int(2025 / 100) + 2025 % 100)**2 == 2025.

This is more rare that the others, the last time being the year 1 and the
next time being the year 3025.

And much less rarely, 2025 == 5^2 + 20^2 + 40^2.

I am not sure why there is so much interest in year-2025 numerology,
but it can be fun.  ;-)

						Thanx, Paul

> Happy new year!
> 
> Akira
> 
