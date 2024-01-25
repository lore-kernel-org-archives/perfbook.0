Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E351009
	for <perfbook@vger.kernel.org>; Thu, 25 Jan 2024 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706187952; cv=none; b=Kxiv4Qi3alTLN9hi6UyGJtOP/TH6t6ADk+LwCen6MQbuwp3hJ7cHSfaz8kmPgcR5r5MGvDrDDdQhIFs0Z462mv4SUAyRqjj6u90h3Bf/ERXwdPk3MZGzSu/e6A9FR1q1U1rCbYtoSLbAgsN9KcawQxa6wdtzt8TWypcf+p2eJR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706187952; c=relaxed/simple;
	bh=UVaQ+j1BHa8Djwk7LxUOUkZD1vyeQLLONDymUxTWqjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzJvopmpo+4bRm2wRl62qXzPvaeZH19tX0eBttk7dl3APELsPZdBaUVRRFuwDEIr4LfXPNR5tlSExHpB9hrcIY/NEF0OpAQJFh8OrQl6bqWsQKBNJDPuzU9TEc8jcJf7NeAeIt11y5/1Ia/5MvQZUD5uPFZuIxrM9IppoPZCLfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bctAXr9P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bctAXr9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A727C433F1;
	Thu, 25 Jan 2024 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706187952;
	bh=UVaQ+j1BHa8Djwk7LxUOUkZD1vyeQLLONDymUxTWqjE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=bctAXr9P/jJA+O3xEr2l0fy9FFI3dGzMmPinsV/ACAqK5j27k/pL/m4A21NrizAg1
	 lEyokb8nplntZGQInZNiOriRqfFR000vy3TTHqX+aCLgJRCo/7HGRWEPgP8v9XYOo4
	 vPSaLFP6pQM/dBMWWLHtjdNX/OUIZ/uQVpzCk8gO5FCuj96VpjLuCo8lvMGm0Eh2P3
	 Cow03yVjjmSYmHORdwQAsFXAFiPdgWI1tu6nO3Rphwap4WHXf7bDWtTBMPN7dG8GT3
	 DM2YYpqKKQZE9XbV7vFIsYCpyB1xHt0rx4dx4Zi6Td9BUjvW22GFIyp0dEl4ZoyWuf
	 yTG47ctXwP4BA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id F1271CE12D9; Thu, 25 Jan 2024 05:05:51 -0800 (PST)
Date: Thu, 25 Jan 2024 05:05:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] memorder: Tweak size of figures in Answer to
 QQz on x86 memory ordering
Message-ID: <a92f174f-6f48-4cda-8f61-6e91b3494c2f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4c252203-5802-4183-af41-f6a311663df7@gmail.com>
 <6cefb50a-4240-4e79-b038-4cdbaddb3702@paulmck-laptop>
 <b083ef95-a20d-4e77-a0cc-63c26a4a3ad5@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b083ef95-a20d-4e77-a0cc-63c26a4a3ad5@gmail.com>

On Thu, Jan 25, 2024 at 08:15:22PM +0900, Akira Yokosawa wrote:
> On 2024/01/24 1:51, Paul E. McKenney wrote:
> > On Tue, Jan 23, 2024 at 11:58:24PM +0900, Akira Yokosawa wrote:
> >> The use \columnwidth results in too large figures in -1c and -eb
> >> builds.  Instead, use \twocolumwidth (\columnwidth of 2c build) and
> >> make them more or less similarly scaled.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Queued, thank you!  And at some point, I should learn that \twocolumnwidth
> > is *not* the width of both columns.  ;-)
> 
> That would be \twocolumntextwidth.
> 
> Yes, those namings (by me) are confusing.
> 
> How about calling \twocolumnwidth as \columnwidthofTwoCol,
> \onecolumntextwidth as \textwidthofOneCol, and
> \twocolumntextwidth as \textwidthofTwoCol ?
> 
> I'd love to use "1c" and "2c" in these names, but numbers are
> not allowed in command names of LaTeX.

I cannot think of a short name that would not be confusing.  :-(

So it is probably best for me to get myself used to the current name.

							Thanx, Paul
