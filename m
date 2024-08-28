Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B064146A63
	for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 23:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724888887; cv=none; b=bvA3R81KTsYqC4tTMyUN2w1b7H9FIudDhmV0K4q+WXvTNwiIRXiOVLnOI7fa860tO/u0Ql2f7aUGCY/5H+AELKsvRgGeg6PHrUGLHWJlxcuTn2v3Md3bB95bsxXsBtURu0YMKHwoPe1HXnMEFuxnGk4g3Sx0401z1p3vuSMYZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724888887; c=relaxed/simple;
	bh=AcVleqov92w+5+kv1sCvvu4EwvhoWVKoJ8X+x5uYhOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emKVPFwvcQ3h2MFD+l8rjWKAWvfQPFNAzT/JbzgQxj0MANdtidVunXR62NI3xElzvgUuBZhPR1SkHIhWGNzJT9lWUHAQT4Om09p6ZC+k8qKiK4xuJCRlnl8Gd6vp73F4iYrERTa7NSFmdU1OOLwVwJwhHZ8pUOyGHPi6gz3msA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hf1v/hPW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hf1v/hPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB726C4CEC0;
	Wed, 28 Aug 2024 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724888886;
	bh=AcVleqov92w+5+kv1sCvvu4EwvhoWVKoJ8X+x5uYhOU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hf1v/hPWjXkZCziy19LM28wUK6k0mYLEPBaAdqV45LaCLJkPiQwYh/SXjgUoriWfV
	 jqQ4lufwNS8VLWPCQ+5dyr8VlsSSk/09uK5z+AgWmbiytXMjIRY8Eus0zf1aZN03DG
	 4ImtDtvmUo1p95/q+Eug4cywcaO/kpmt7Rd03EJhR7Q1S2GW5oYYDUIB5ztG9w078x
	 evrsKfW+DIvBw3JxcMtnMwegr1WXS0rCZp9NlNPrILHVFx6gYUsKq2YfVaWi3RAn2P
	 isUBzmwwlBX3nmpGQyGNwSkkrgvWtKD7bBwMXvFkROiUxnRE8gtlUr0tQ/r4Zxre9E
	 qjHvVbuGX+Vdg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4F3C0CE114C; Wed, 28 Aug 2024 16:48:06 -0700 (PDT)
Date: Wed, 28 Aug 2024 16:48:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>
Subject: Re: New Figure 3.13 is too tall in -eb size builds
Message-ID: <ebdcfd61-e3c2-4d70-b917-59de4c71efb9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5974cbc2-3436-41bc-84a5-b7f1b22ab4a5@gmail.com>
 <c973c3a1-f321-417b-83e0-b5a4dc521857@paulmck-laptop>
 <59df9d95-9f8d-4eab-afd9-0552ed6f054b@gmail.com>
 <f566b5cf-c7f4-41a5-9cab-e44b8d3eaacf@paulmck-laptop>
 <e74fab26-b30f-4187-9117-4d16c11e94cf@paulmck-laptop>
 <db9b9f7b-cbe2-477d-8b15-c4bcdcac30ff@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db9b9f7b-cbe2-477d-8b15-c4bcdcac30ff@gmail.com>

On Thu, Aug 29, 2024 at 08:41:10AM +0900, Akira Yokosawa wrote:
> On Wed, 28 Aug 2024 07:49:39 -0700, Paul E. McKenney wrote:
> [...]
> > I added a grey rectangle to connect the two CPUs, which allowed me to
> > halve the space between each row.  I also narrowed the gap between the
> > CPUs a bit.  For me, the result is more readable in 2c mode and also
> > builds eb without complaint.
> > 
> > How does it look for you?
> 
> Mostly looks good to me.
> 
> I see a vertical line on the right side of the grey zone.
> Having another one on the left would make the figure look more
> symmetrical, wouldn't it?

That would be because I forgot to remove the construction line that I
used to line up the right-hand boxes.  This is an old habit from back
in the days when I used a real drafting board with real pencils and a
real T-square.  ;-)

Good catch, thank you, and I will remove it.

							Thanx, Paul
