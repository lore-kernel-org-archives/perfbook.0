Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC461FC0FB
	for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 20:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734552029; cv=none; b=kqKy1WDIIkOnWJ5laUfK43wcFI/4/acIz02VGih2oturj/AdMfdoWwVC5Zt5kmpnuDUvJLgOJhSB/3CvNyN6jQ2f6I2tHOWMTK3/+zM+GkMMR3+kTHSCx+gWq/0UhP+s+gfbTMMeqaTfMCCw3eS26lRWOu80ai3RDggfrz994Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734552029; c=relaxed/simple;
	bh=fZk5g9OFlMjzB5LBHGRSmwDGzMxMPLl+XYSAO10HI3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUCR37wqmhXFL16dKyGn/xg7d/cmHrkwT8iOsyWM0SXiYYpTpaVbDCHuC4dXbyBM/UBGm6n5YlmkNRz6SlFMCeupFWsaH04vAz/H/Y2+7cij7IbOAo+G87D1uAT36m6v7BtN8TGnw+/E0nA2qBETzri+nFWaThTEPExtn8roHBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8tgg//g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8tgg//g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABD7C4CECD;
	Wed, 18 Dec 2024 20:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734552028;
	bh=fZk5g9OFlMjzB5LBHGRSmwDGzMxMPLl+XYSAO10HI3w=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=A8tgg//gMzF6bblPNex54h/FtIQ+Nitpjqwpt6PsClPd+1pjlBAkzTXNFuX/mdyXs
	 PLjwRe6W4u2mmfD6g5xcwncQCPXQOG4UsIj1HgIgnbdNMAmF0K3xEP3M28xWQDCP6p
	 WrREcByAzppz+cNPiqNQWdC8JdeFzs1z34bo6uhwHJI5DKBg9OScLUY7ltmGNE//eR
	 I8CesqPcocDN5CQkmvuFcIjVVUrhY7DrD9Czh6z4oiqLyxV/2InrrtZ6fT7TKsm4+A
	 aU+6ZYaY0Fq4LotAzw8IGDyr0wTZx21bkF9W0YFnyeQNV7uN57OpWTmJiDmGLvAzyI
	 JVoJIWlxIOgdA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 45975CE09CE; Wed, 18 Dec 2024 12:00:28 -0800 (PST)
Date: Wed, 18 Dec 2024 12:00:28 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Daniel Xu <dxu@dxuuu.xyz>, perfbook@vger.kernel.org
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
Message-ID: <17b06c2e-f97d-444a-9db6-7094677d9a38@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
 <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com>
 <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
 <9d088173-a038-483c-a4ba-ef56f7162b62@gmail.com>
 <9f6a9df6-a5b2-4001-81d1-30e7001285dd@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f6a9df6-a5b2-4001-81d1-30e7001285dd@gmail.com>

On Wed, Dec 18, 2024 at 03:21:42PM +0900, Akira Yokosawa wrote:
> Akira Yokosawa wrote:
> > Daniel Xu wrote:
> >> Hi Akira,
> >>
> >> Thanks for taking a look!
> >>
> >> On Tue, Dec 17, 2024, at 5:53 PM, Akira Yokosawa wrote:
> >>> Hello,
> >>>
> >>> Daniel Xu wrote:
> >>>> WRITE_ONCE() is needed here to prevent store tears and other unwanted
> >>>> compiler optimizations.
> >>>
> >>> That might be true if there were chances of these two accesses to
> >>> race with each other.
> >>>
> >>> I don't see any possibility of such races.
> >>>
> >>> Can you elaborate?
> >>
> >> My understanding is that read_seqbegin() and read_seqretry()
> >> can execute at any time. That means the read side access of
> >> the sequence number can occur doing an increment.
> >>
> >> To prevent the reader from reading a partially written value,
> >> we need the WRITE_ONCE() to ensure the relaxed atomic
> >> write.
> > 
> > OK, now I see the race there.
> > 
> > But see below.
> > 
> [...]
> >  
> > Those two READ_ONCE()s don't have any concurrent writes.
> > So there seems to be no need of them, IIUC.
> 
> Furthermore, in sequence locking, readers will retry if they see
> an inconsistent sequence count due to store tearing, so WRITE_ONCE()
> is not necessary, either.

True, but this is needlessly increasing the state space.  Plus there
are other potential optimizations.  These points were discussed for the
Linux-kernel counterpart to this patch here:

https://lore.kernel.org/all/0eaea03ecc9df536649763cfecda356fc38b6938.1734477414.git.dxu@dxuuu.xyz/

> READ_ONCE()s in read_seqbegin() and read_seqretry() are there for
> preventing read accesses in retry loops from being optimized out.

Completely agreed!

							Thanx, Paul
