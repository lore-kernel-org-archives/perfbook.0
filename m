Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7B537E9
	for <perfbook@vger.kernel.org>; Sun, 19 Jan 2025 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737307350; cv=none; b=dW75d56+mHO4pP1WbFu2/1Pi9b+csUpVuVqp0jjNrdbvFj+gRLNyKNe/bJ7qRdVnjEyEYIGD5M2r+SXaLGthEZbX3vKvW7Q7YR69/jFRuJJMpvyNHOErs/hLNycomjkULl8iA3/UAPMQ+CURt4q7asm1L6yEESIDiTNRUxkZsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737307350; c=relaxed/simple;
	bh=u2yaG047AlHHYe/+5ZZadDzr/NOsnnj7UF/5QocdkDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwiL4uQU3N1ITyh6E+DzPbfNCHCN538WwCLerjkx1IYpIcrbXMoiA3GdlgqHiQYEI5gR/Vizff+jz0W8k/Fp5cA72zJPDnNq8eZBEdoUlN5jLsI83/NWrycWT5xaPsxt1Ottn6fMI7+zmySi4gMxt1UaWObWllnvQ1VmVdv0UM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPknLBdm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPknLBdm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B71CC4CED6;
	Sun, 19 Jan 2025 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737307349;
	bh=u2yaG047AlHHYe/+5ZZadDzr/NOsnnj7UF/5QocdkDQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=pPknLBdmGyi6dfUWCyTVxgq+ex4vibw7vLxgQdgXE7p/tJiQzAmXtE0VI9onPSakn
	 CzJc92ot/se8N0ijvIAcgOmskA3zQTGfuBFdCVQFBz1e79ECaJfAsxiVev7zuyxhPS
	 lSOhHwnfGpeZV7eThEjnfyatIvobRsie6h1VkL2W3+YebOWMiGcDNWTJL0Q9Lpn5lf
	 4UAj0Upiyxdb1AmcdHhE7oY47/T7sVX3zMovtW+nrlxg7v1DgHGfqfsd0rmo/8dzOA
	 SEOesfNAZC367y/dFCzMyUr2ZtwRxwcVkrKZRAQqgFn46LnNPPSZfZHYDhVJd1wk46
	 In4sDbjC+MBVQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1DD7ECE0E7B; Sun, 19 Jan 2025 09:22:29 -0800 (PST)
Date: Sun, 19 Jan 2025 09:22:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: Atomic Limit Counter Add and Subtract, and QQ about goto
Message-ID: <d979579d-0df6-4442-93db-990c34a7a19f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <75e169509708600bc90db4cef897778929c4d4e2.camel@gmail.com>
 <14e20db14385717ef5bd02468900f5e7afc194bf.camel@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14e20db14385717ef5bd02468900f5e7afc194bf.camel@gmail.com>

On Sat, Jan 18, 2025 at 05:52:00PM -0300, Leonardo Brás wrote:
> On Sat, 2025-01-18 at 17:49 -0300, Leonardo Brás wrote:
> > Hi Paul,
> > 
> > I was reading the Counting Chapter in detail, and the QQ about avoiding a Goto
> > got my attention:
> > 
> > Listing 5.13: Atomic Limit Counter Add and Subtract
> > Quick Quiz 5.43: Yecch! Why the ugly goto on line 11 of
> > Listing 5.13? Haven’t you heard of the break statement???
> > 
> > And I was thinking on an alternate solution to those, by calling slowpath as a
> > function in this simple change:
> > 
> > ```
> > inline int add_count_slowpath(unsigned long delta)
> > {
> > 	spin_lock(&gblcnt_mutex);
> > 	globalize_count();
> > 
> > 	if (globalcountmax - globalcount - globalreserve < delta) {
> > 		flush_local_count();
> > 		if (globalcountmax - globalcount - globalreserve < delta) {
> > 			spin_unlock(&gblcnt_mutex);
> > 			return 0;
> > 		}
> > 	}
> > 
> > 	globalcount += delta;
> > 	balance_count();
> > 	spin_unlock(&gblcnt_mutex);
> > 	return 1;
> > }
> > 
> > 
> > int add_count(unsigned long delta)
> > {
> > 	int c;
> > 	int cm;
> > 	int old;
> > 	int new;
> > 
> > 	do {
> > 		split_counterandmax(&counterandmax, &old, &c, &cm);
> > 		if (delta > MAX_COUNTERMAX || c + delta > cm)
> > 			return add_count_slowpath(delta);
> > 		new = merge_counterandmax(c + delta, cm);	
> > 	 while (atomic_cmpxchg(&counterandmax, old, new) != old);
> > 
> > 	return 1;
> > 
> > }
> > ```
> > 
> > Does it make sense?
> > Does it introduce any overhead I couldn't see?
> > 
> > Thanks!
> > Leo
> 
> Oh, just to be clear, I like goto, and IMO the above is a perfectly acceptable
> way of using goto, and I would not change it. Just thinking about the QQ and
> added complexity.

Congratulations!  You are the first to have responded to the implicit
challenge in the last sentence of the answer to that Quick Quiz:

	If you really hate the goto that much, your best bet would be
	to pull the fastpath into a separate function that returned
	success or failure, with “failure” indicating a need for
	the slowpath. This is left as an exercise for goto-hating readers.

Very good!  ;-)

So why didn't I do it that way in the book?  Because that would add
several lines for the function declaration, and Listing 5.13 is long
enough as it is.

But if enough people prefer the separate slowpath function, and someone
is willing to create the patch, adjust the text, and test the result,
why not?

							Thanx, Paul
