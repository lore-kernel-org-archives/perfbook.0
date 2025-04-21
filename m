Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E899826560B
	for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243923; cv=none; b=QFN6/8pfqJBKbagOkbRKrkwqMQS3Hsdc8sRrDAe2ujV2A4EUJoHdfbu4IFF71gb56tVJEkW+sY7uLs593/07yKd+hj3uDom9FSKLWncBTuQIaLiWYp6u8W7CCvlEjO17DhXvrJSaMkpCUQ+YjRnWaKlNE6kXmgLHv1JdhDtaRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243923; c=relaxed/simple;
	bh=ARGfoEvldqiXrvWgtfC9OgZYHkCiqjFWorurhdRN6cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJOQlk/w1zmNuW/d/M8/HjBWIQhWM0C+5jbU/AYTpTS4WDhsWg/L4Pj1fCleC5kJxFqTpCo/2jWKzElhxevNK1sSYmAUyrr2cNUolGmeSQ7OWEvNFkrPj51d2id1fojPm8wnuezc/Uk0o67nOqZKrfIYze7gofJCrXgZ5Xp/I3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWXq8Qpe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWXq8Qpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6564EC4CEE4;
	Mon, 21 Apr 2025 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745243922;
	bh=ARGfoEvldqiXrvWgtfC9OgZYHkCiqjFWorurhdRN6cU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=rWXq8QpeoFDZsNb83LeKlyX6bbOaHiAZ2GxA5EKpuLYbnrucW0eGaCkRlq/C8VP4P
	 5sc2Qad1LjkQz6ca5xHY+WlLH1NBP40MVqKgWhCkvqfFqgwwiJWoyT5Lw2WTtsSPji
	 9InaxTmDBAG/MWxTViP/xbpvllUpLRx6lAfgA5ZoFlqIrK0GFaHmo4XSFPRn5Nwk7A
	 VjRbCOdo0xjjVQ/AxikmayHY7cjxQD48U1uKSMnKNGJ/thScoB5t0A304EbevUPcK8
	 IH7UAH2UIu4Q8ezvqAAZxbO50DAng1a2gkKIVvSNvxi2rob7kr3VW4FJMwnhXZMX15
	 +CMvWAGNH43kA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0C146CE0855; Mon, 21 Apr 2025 06:58:42 -0700 (PDT)
Date: Mon, 21 Apr 2025 06:58:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: Ideas on reorganizing terms in perfbook's Index pages
Message-ID: <ee594737-8a9b-4c84-925a-2f16008482af@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ec0b5744-65b9-4335-be12-6f3ff0e8c31b@gmail.com>
 <2751a064-a9d4-4753-8948-346e12bbe456@paulmck-laptop>
 <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>

On Mon, Apr 21, 2025 at 06:53:39PM +0900, Akira Yokosawa wrote:
> On Thu, 17 Apr 2025 12:43:06 -0700, Paul E. McKenney wrote:
> > On Thu, Apr 17, 2025 at 11:02:02AM +0900, Akira Yokosawa wrote:
> [...]
> >> So, I'm thinking of reorganizing them into something like, including
> >> additional markers for "memory model":
> >> 
> >>   - Memory consistency
> >>      - process
> >>      - sequential
> >>      - weak
> >> 
> >>   - Memory model
> >>      - Linux kernel
> >>      - Armv7
> >>      - Armv8
> >>      - etc.
> >> 
> >>   - Memory consistency model -> Memory model
> >> 
> >>   - Linux kernel memory consistency model (LKMM) -> Memory model, Linux kernel
> >> 
> >> How does the above sound to you?
> > 
> > That works for me, and thank you for going through this!
> 
> Hi Paul,
> 
> This patch set is my attempt taking care of above.

Looks good to me, queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> --
> Akira Yokosawa (5):
>   Refactor index markers of "memory consistency"-related terms
>   index: List LKMM under "Memory model"
>   indexsee: Add a couple of redirections to "Cache coherence"
>   together/seqlock: Remove wrong index marker for "sequential consistency"
>   indexsee: Add redirections for arch specific memory models.
> 
>  formal/axiomatic.tex     |  7 ++++---
>  formal/ppcmem.tex        |  4 ++--
>  formal/spinhint.tex      |  4 +++-
>  future/formalregress.tex | 11 ++++++-----
>  glossary.tex             |  6 +++---
>  indexsee.tex             | 27 +++++++++++++++++++++------
>  memorder/memorder.tex    | 39 ++++++++++++++++++++++++---------------
>  together/seqlock.tex     |  2 +-
>  8 files changed, 64 insertions(+), 36 deletions(-)
> 
> 
> base-commit: d4014ed9b2f2ec4074f86b2bdf0cf79953408cb0
> -- 
> 2.43.0
> 
> 
> 
