Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C932FFDCC
	for <perfbook@vger.kernel.org>; Tue, 17 Mar 2026 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764326; cv=none; b=fIQDuP0s7HHT9Bq6clsnKK1HfMZ1dRHlJu+tFn3PMES1PgGfe0qwyROZ2dBZNRhD5ydDMmCAEfCFkVOkJQ/wimWKPVqfklqHWbdkeWn1812dHKWPOH4FE6WH8BLz9NzYdRzjW2l7sF+hD9PaZ0c/hlkw6wjOhwFMp1MFFQgUq9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764326; c=relaxed/simple;
	bh=MSd7CmFi70SrU5GYKKHVzQpq9cVOGlRkD0Att/d+pDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHcAae7LC6xg9ConyGGRIkJmn4n4W7sP0RrfFoJ5oB9vneSlRRD9uhiN/YrTVuhFfVqAw/jtkMpxW4FL9K0/pIepUKsrlR7/GNX0q6DlEV+Ir8h27LYw+RSGGeOBuOooSos/Gv+zdleeDYURF0bwA5ReR/6KGZlPXBabT3tuRN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9HVT6oQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9HVT6oQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433F5C4CEF7;
	Tue, 17 Mar 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773764326;
	bh=MSd7CmFi70SrU5GYKKHVzQpq9cVOGlRkD0Att/d+pDg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=N9HVT6oQ5Iri8Q/0yAFSnDCro5BibhPSupgQnRhYIoEGJY2MoYLUstUx8GKzOxvlh
	 VaYnTASnY76E7OoipyS/4GvXPs2btsle5GySIBl6kcu/uSSU56KqU7SWgdTsuIO/Oi
	 kZZkoXuKF1UxVM3TgqxRwF0PZ+PKTOtj7gnsS/sxjYuJbJTCqcrvPowo+NJcFC/Hl2
	 VL4k9QDURkrHfhnNHxcFnuTqlRnk2Me4jKBgrXQDEv0yYpDPyDgad/FCoVHjE4kqXh
	 tzEqoGQJMrzgQBLd+HkGBViKcCn3oJCcPOGrlHFeRBIWgyFbuj2/A3xm0xOE26i7TL
	 9B2/1+3QJuJ8A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 270A4CE0B07; Tue, 17 Mar 2026 09:18:43 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:18:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] Extend buggy fvextra version range
Message-ID: <b1eeea12-f8bd-46b2-a96b-df214c88a8c2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7e535d83-2f19-4423-9a7d-297fb4b4d8fc@gmail.com>
 <d73323f6-769b-4ca5-8a43-dc67264922a8@paulmck-laptop>
 <c4134e51-141f-4d45-9dcc-8606a965e850@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4134e51-141f-4d45-9dcc-8606a965e850@gmail.com>

On Tue, Mar 17, 2026 at 05:06:36PM +0900, Akira Yokosawa wrote:
> > On Mon, Mar 16, 2026 at 06:15:56PM +0900, Akira Yokosawa wrote:
> >> Unfortunately, the tentative fix to the regression of fvextra has
> >> failed to convince the maintainer [1] and fvextra v1.14.0 was
> >> released with the regression unresolved [2].
> >>
> >> Extend the buggy range of fvextra.
> >>
> >> Link: https://github.com/gpoore/fvextra/issues/32#issuecomment-3942491507 [1]
> >> Link: https://github.com/gpoore/fvextra/releases/tag/v1.14.0 [2]
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >> Looks like Archlinux's texlive-latexextra (2026.0-3) comes with
> >> fvextra.sty v1.14.0.
> > 
> > Rather annoying, I will admit.  But I am glad that you have a workaround!
> > 
> > Thank you very much, queued and pushed.
> 
> Well, that commit d64549469b75 ("Extend buggy fvextra version range")
> is missing S-o-b from the committer ...

Lesson to self:  Don't mess with git so soon after crossing the Atlantic
Ocean.  :-/

Thank you for spotting this, fixed and repushed.  I left the old commit
in place in case someone is using it.

							Thanx, Paul
