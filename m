Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5A199384
	for <perfbook@vger.kernel.org>; Wed, 19 Mar 2025 17:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742404744; cv=none; b=kfYJCvThQMUIR4aTwVusqh2MwOSJSmisNU3FR2BZKXRA79Q6ImnmzF69aKLvGI6itJvNZ9Prey1CZWuWbDWfx7cmuiuQ/ajA4LjWJ7BN6W0xo4E5pLv8ZEc4pWW8B8hS/LAHNUx8KaCIRUvfRs/bOJyy8ZEq6crIk4hpbzmYho8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742404744; c=relaxed/simple;
	bh=mP7tG4AidkUNakxIwtpfEScwMcja5Aw89WBWcWjkFzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZ0FceWB7Fb+i4bmeNx9HnQJyX/3t77u+rUwaiCGr8+mKwJOukkR6BAbIi2ZbUcxMterzKig3OJQ1wjnAWXkYrh+tl1ERR6HU1n75yrWF5NWbFmpQtbAGb3JGpOWH9g3ar7ImNuTV5vnOOqLQt+MOl8xi9XHjGgni5DTHvrEry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHKrpuJM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHKrpuJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D30C4CEE4;
	Wed, 19 Mar 2025 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742404743;
	bh=mP7tG4AidkUNakxIwtpfEScwMcja5Aw89WBWcWjkFzQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=tHKrpuJM87Po6IzHLle6AcGY3cnJ04OPTMd5H3msahWhH2PgY9KOwEnuEQTKksXf1
	 lboPJptp+uFrvtrdEhxPs5o3+UsBk/8Azgp7PCyUQX/8kxYibgIvdvGv3rYkhcpzcT
	 FS6lSC5kUx4dO/mbQzT/zuXzCfrg/CEEV+iBSOBjPkCVYnlmEWCn8iVK3fEcNr7xz6
	 xTvLFhZqzG0ABbO8iK5jYJigSstJF8jQx4hj5hOnfARaojSw0UWnOVkwLGlBvbBvxH
	 5UlE4Ox04cXAUElnZXfCqczQgawIbk3HqpAcWZUjPHqfYchHZ9hwl6QmLy3z26hJmY
	 EoZ50ktTwuZxA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 149A5CE0BC5; Wed, 19 Mar 2025 10:19:03 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:19:03 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Ignacio Encinas Rubio <ignacio@iencinas.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Subject: Re: [PATCH perfbook v3] bib/hw.bib: Update URL info of Alpha related
 entries
Message-ID: <b221217d-f44a-42d4-834e-5ada19f4737a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <94203aeb-c930-4589-8244-9adfb01413a8@gmail.com>
 <ac4ab90c-8eba-4337-ab89-2364af30a6b9@gmail.com>
 <65cb125e-fadb-4370-a379-4fd3b5303eb4@iencinas.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65cb125e-fadb-4370-a379-4fd3b5303eb4@iencinas.com>

On Wed, Mar 19, 2025 at 03:01:37PM +0100, Ignacio Encinas Rubio wrote:
> On 19/3/25 10:35, Akira Yokosawa wrote:
> > Report from Ignacio in [1]:
> > 
> >   [Gha95] perfbook's link is down, it is also available here:
> >   https://github.com/kaitoukito/Computer-Science-Textbooks/blob/master/Memory-Consistency-Models-for-Shared-Memory-Multiprocessors.pdf
> > 
> > Instead of random github repo without any LICENSE info, use a download
> > link at http://i.stanford.edu/.
> > 
> 
> Thank you for taking care of this! Not sure if any "tag" (as in
> Reviewed-by, ...) is applicable, feel free to add any on my behalf :)

Queued and pushed with Ignacio's Reviewed-by.  Thank you both!

							Thanx, Paul
