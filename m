Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4035290F
	for <perfbook@vger.kernel.org>; Wed, 16 Apr 2025 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762206; cv=none; b=fwGtSyF0kYiQ1RvMXHiLqDTPV6KUX5espqwMbc8+O3UL842+aqr57F7KowIAhN9q7dSD189zJf4oLdpIG3fsjF6A0NwsmbwUMkE6C22cpEVxm/+kOEsJNqWphMD/r9c/r3nTnFLnTDXfs5uC2BSvbfmfOwcqS1IQ9P5Fl3P3lfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762206; c=relaxed/simple;
	bh=Um/HLR841KR018meZrV92PlyFbDWfOC4tZKrlBQ22mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LL1htQebbXM36sOYwTZFsLJFLvhY4sKl8fLWtih9tLqrzXDkOKWBc2bAyEUQqzZCrHBqh8SkodchFAU/jftkV6F2BgmPNwvMnlow+cepgLrsnU+y/aBl+v+idaZosJUg9CgPmNzhxq2kywon6uphgfoSgifRqtwW76pTYInNzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJ6t/aL0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJ6t/aL0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6C6C4CEE9;
	Wed, 16 Apr 2025 00:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744762205;
	bh=Um/HLR841KR018meZrV92PlyFbDWfOC4tZKrlBQ22mw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=IJ6t/aL0kNRwdYHTFRj+G3bamq3i0gd7+TxQ9cVx3twozFZcZ6L+RBdoq6H61NoKM
	 H8SAAvv5M6Wg6nYTA8Ob6r40/Stfi+viAU1K+ED1dk8nlPeOZJzwHtQkeug3c3LOfd
	 QSJaeESP7ioMferRlJyYhbqqRnDZmc71bNvvJeLNuwwdXMNo4ETFk4433VThEzM91J
	 xtUwSY8TbVHLSzT4wXtJhBm1v2b6MS9GbT3D5wNOg8DC4szPVcRX0PEjerCjdVejgv
	 cNoLG+F8u9wy3UozxJO3WxefmB1oGrfU+BxSAE7FylELKmOOxzvXXphodS5QP1UhSs
	 5oCCabDBzEJeg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0E2F4CE05B1; Tue, 15 Apr 2025 17:10:05 -0700 (PDT)
Date: Tue, 15 Apr 2025 17:10:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH perfbook 0/2] Split "Index of People" from general "Index"
Message-ID: <59c07a19-64db-4f20-badb-833a199eea5a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <044918d6-0b23-4e9f-91dc-14219b171548@gmail.com>
 <6834efcb-0108-40d7-bdea-1cf288485e02@paulmck-laptop>
 <dfe093c9-e09e-4541-ac58-53eb259c9b85@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfe093c9-e09e-4541-ac58-53eb259c9b85@gmail.com>

On Wed, Apr 16, 2025 at 08:08:26AM +0900, Akira Yokosawa wrote:
> On Tue, 15 Apr 2025 11:47:39 -0700, Paul E. McKenney wrote:
> > On Tue, Apr 15, 2025 at 06:04:14PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> Mixed list of technical terms and people's names in the Index pages
> >> doesn't look great, especially with the growing numbers of people's
> >> names.
> >>
> >> Patch 2/2 splits people's names from existing general index pages into
> >> "Index of People".
> >>
> >> Patch 1/2 is an independent fix of a minor issue in single-level index
> >> pages.
> >>
> >>         Thanks, Akira
> > 
> > Nice, thank you, and I have queued this.
> > 
> > After building perfbook.pdf twice, I have "Index of Terms" in the table
> > of contents, but not "Index of People".  Which is fine from my viewpoint,
> > but thought I should check.
> 
> Strange.
> 
> I have pushed my local branch at:
> 
>     https://github.com/akiyks/perfbook/tree/test-split-index-of-people
> 
> Appended is the screenshot of TOC in my build.
> 
> Running "make clean" might help.

And "make clean" did the trick!  I should have thought of that, and
thank you for bearing with me on this one.  I have pushed them out.

							Thanx, Paul

> >> --
> >> Akira Yokosawa (2):
> >>   Fix \IXhmr and \IXalthmr for single-level index mode
> >>   Split "Index of People" from general "Index"
> >>
> >>  perfbook-lt.tex       | 21 +++++++++++++--------
> >>  utilities/runlatex.sh |  3 ++-
> >>  2 files changed, 15 insertions(+), 9 deletions(-)
> >>
> >>
> >> base-commit: 6e66e280e548545c69dde85f8eeee400f66b4bfc
> >> -- 
> >> 2.34.1
> >>


