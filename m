Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19151F462D
	for <perfbook@vger.kernel.org>; Tue,  7 Oct 2025 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759849949; cv=none; b=tBkQWklvhS6AZ0jX5fbQikrchdm/XL6wCtWxII1mjomat6ZECRkiqIeo6SXfBiq6qbg1eiJof8w++FGtMQ2bgEUvuZJV5zG3dWWLCQRkVaSSUsGPKY2j5bi8Sj1e8qLM1eymEH8bEv3cV98lStYwSw2kb2iCrjY1oyVmtaeoVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759849949; c=relaxed/simple;
	bh=9Hc4r5YthMHqeQR9Or9BYeK8KAuV+Kc4RwKpcIT3sk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyJB9/GbSsoe7JDuCeLuzr8sGO6613q3gXeRwnY1p56IA8BO7JPZf7jM+YMzVn6CpdgLvy1+xLUhcqJRNT5SH6CGNlLdWtCEETbCdcJWQyhZrgIBTDA9XngDXTQO4/StTAZR3McFXRVKl/BSunu3DnIqr6ZCsWJvsughm7EiRoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxvcsRZF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxvcsRZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406FCC4CEF9;
	Tue,  7 Oct 2025 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759849949;
	bh=9Hc4r5YthMHqeQR9Or9BYeK8KAuV+Kc4RwKpcIT3sk0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=NxvcsRZFvot+sUffNTvq815fbrzZrOYHjOuxXpXfHKV2aZWWXu9yG0pZcDQ8nOgvZ
	 hcBP+t0rny0JRfdfUFN2DlvsjOY+wRMXI9dR/7nT6gmIE5xchiWqzJW9sp3Rwsqdmg
	 Cne3yKH0aFLLiNYPgUHk+HnvZtBG4cunOGa/Q2IdUSjGv9sQp1pi8Wk+//iOvFWNnT
	 C+dhQLvlH61SQrMGxTfFXz9plYr2FcYoP47CY+acD30JCe5aj/AQhcXoy46vnH/7iB
	 Y75FPFCIv+Rdg+q28NgxHGawOaXY6vy7PBiD2nbsVDMUh6PZJEkiplXB4o4HSDZ4UG
	 8SxsN8uhKzprg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D597DCE0B20; Tue,  7 Oct 2025 08:12:28 -0700 (PDT)
Date: Tue, 7 Oct 2025 08:12:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/5] together/applyrcu: Final touches for
 recent updates
Message-ID: <5ab7b386-345e-400e-a526-24abe0aa5278@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>

On Tue, Oct 07, 2025 at 11:48:34PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Prompted by your recent updates, I have looked into them and made final
> touches for them.
> 
> Patch 1/5 is an independent update of rcu-test.dat for Linux v6.17.
> 
> Patches 2/5 and 4/5 take care of line-count references by embedding labels
> in the .litmus sources.
> 
> Patches 3/5 and 5/5 add non-breakable white spaces around one-letter
> variables and single digit numbers.
> 
> All of them have only summary phrases, but I think they should be good
> enough.

Agreed!  Queued and pushed, and thank you very much!  Those line-count
changes especially will make any future modifications of those litmus
tests much easier.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   CodeSamples/formal: Update rcu-test.dat for v6.17
>   together/applyrcu: Use \clnref{} and its friends in Section 13.5.9
>   together/applyrcu: Use nbsp around one-letter variables in Section 13.5.9
>   together/applyrcu: Use \clnref{} and its friends in Section 13.5.10
>   together/applyrcu: Use nbsp around one-letter variables in Section 13.5.10
> 
>  CodeSamples/formal/data/rcu-test.dat          |  1 +
>  ...usync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus | 26 +++----
>  .../formal/herd/C-double-check-rcu-2.litmus   | 32 ++++-----
>  together/applyrcu.tex                         | 71 +++++++++++--------
>  4 files changed, 72 insertions(+), 58 deletions(-)
> 
> 
> base-commit: fb44848431946e5a42d42fd5dd8a05d6a2298805
> -- 
> 2.43.0
> 
