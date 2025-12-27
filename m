Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56743219EB
	for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870303; cv=none; b=lSSt5BMA75jG+tq5BPHnedN4PgVEC9hQwTmmQEPT8y2HdgwruEdPshr6a4EasyhCNoKoESqIRw2efPULrbnp6olDZnIJmCAJvqcRTxkxuT/FyJm4rEG4t6uzmtKqWcVyiHtAbSW27xOwjtFyotlCgEFyCDd329dzX5fuuWQ8wfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870303; c=relaxed/simple;
	bh=8ZRVIPsiHTZxCgL0w1ZAfA2uL+oqYLTqLTiGzQDMENI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS94w74YL94/9RtSHu7aasAmtAPhghWnZkBE1OUjrNxiXp+NP+Hz16ihg482ds8XQID4fsrSgUESF1OL6AY2I0Vkd7L4IZRwJtU8iZU8E+x8wifoLyN5pUp8EEvj2FoPVbU02iOtyTpb6KbH0Qh6Aqej0vL+jHsQLmWANBvSUek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAq7bhfz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAq7bhfz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB90CC4CEF1;
	Sat, 27 Dec 2025 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766870302;
	bh=8ZRVIPsiHTZxCgL0w1ZAfA2uL+oqYLTqLTiGzQDMENI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=VAq7bhfzLVKqCIcS4Hciz0F0nHgb82Hsk9tZYBD7el8CPzaZwoUHc3T9QHyub8KrM
	 aBSapPfSlYjhY/E73QFcrUll/RRZDEyHdV+tHNhqK6YkO+mV4jLov+rrrV6O2I4XnI
	 9wCR6Rb+o/DykE48LAGOPoWs0JBHEFQKu27ijUvwkJh+vykQ5mXRgVz2MqTV1KsRRB
	 UDXDKIKy++3EHyv6GMhH+NH2D4PDW2i8uSVil2i5vV7zTX91aPrO/eQkZFxEJkidd5
	 KBKTJ6XynoGLC29XLMBXrPz8DmFiaOnAioQ79pVjNTpDV8xO9CF5rtTyOSJQ9Tv5aA
	 7i7zHXr8s8yUg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5886BCE0C98; Sat, 27 Dec 2025 13:18:22 -0800 (PST)
Date: Sat, 27 Dec 2025 13:18:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/5] December updates
Message-ID: <f9f07379-ad16-4bca-b2e4-aa35fde03b9b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>

On Sat, Dec 27, 2025 at 05:36:50PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here is a small set of patches for December.
> 
> Patch 1/5 is another routine update of rcu-test.dat
> Patch 2/5 mediates longer run time of RCU related litmus tests under
> kltimus7 by exclude those tests from default list of tests.
> Patch 3/5 works around a strict policy on ghostscript (gs) under Ubuntu
> 25.10's apparmor.
> Patches 4/5 and 5/5 are obvious fixes to your recent updates in toyrcu.
> 
> As for Patch 2/5, klitmus7 converts synchronize_rcu() into
> synchronize_rcu_expedited() by default ever since herdtools7 7.45
> released in 2017.  So, the longer time to run suggests decreasing
> trend in "throughput of synchronize_rcu_expedited()".
> Have you done any benchmark on such a thing/concept?
> 
>         Thanks, Akira

Queued and pushed, thank you!

I clearly was not doing well when I added that \co{} to toyrcu!  Thank you
for fixing that and for converting the list.

On synchronize_rcu_expedited(), my usual runs focus on functionality
and further just check synchronize_rcu(), and I have not set up anything
to check trends.  I will run tests on various kernel versions.  I will
be running this via rcuscale in a guest OS, initially on my laptop in
a preemptible kernel.  Please let me know if there are any special
settings I should be using.

My first run on a recent kernel showed surprisingly long expedited grace
periods, enough to make me suspect that they are somehow being mapped
into normal grace periods.  Ditto for v6.0.  More later!

							Thanx, Paul

> --
> Akira Yokosawa (5):
>   CodeSamples/formal: Update rcu-test.dat for v6.18
>   CodeSamples/formal/herd/Makefile: Add KLITMUS7_EXTRAOPTS variable
>   Makefile: Let ghostscript access under /tmp
>   toyrcu: Replace \co{} with \cref{}
>   toyrcu: Mark inline enumerate list as such
> 
>  CodeSamples/formal/data/rcu-test.dat |  1 +
>  CodeSamples/formal/herd/Makefile     |  3 +-
>  Makefile                             |  5 ++-
>  a2ping-rule.mk                       | 40 +++++++++++++++++------
>  appendix/toyrcu/toyrcu.tex           | 13 +++++---
>  epstopdf-rule.mk                     | 48 +++++++++++++++++++++-------
>  6 files changed, 83 insertions(+), 27 deletions(-)
> 
> 
> base-commit: f10ba2161229db12af9a1e38fd23850483721b7d
> -- 
> 2.43.0
> 
