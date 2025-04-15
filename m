Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87D22D7A6
	for <perfbook@vger.kernel.org>; Tue, 15 Apr 2025 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742860; cv=none; b=GRgs+97Oeauun6unBGF4Q5kVvAu6vf4a8lTivL2OLOxfzpChi0hXQ1r9CQ/uVjQe3DTs0UHEslVKE5JeRjLP5Aw1abEHsPd1vChH5THQhqVRqBqFNndawV0azJd2Ia2iiQQQo1hsRROHkeJRh7IRlbBmhFdGuSRhETrMdDxMNFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742860; c=relaxed/simple;
	bh=aooCyKUXYJ1sWM5XgoIShW3Rb6/XTd5gRMhAqUzT6B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mROJTbfeqWh+2/WtMc2nN3M3jEF4cGMEAtY+jD6WmlNBSVtMISfkLOukKzMCAcLOvjYBNUbnFLSQJc00/30av3QSlvP+hoPJdfI+0iAXz6XG+4OTsvTqbcg7Kf/Gk4vHsGp+zX5T4/C12zy7ym8bkY9KEXpF7Q2+38XO7G2D6JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLmeuAv4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLmeuAv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474B6C4CEE9;
	Tue, 15 Apr 2025 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744742860;
	bh=aooCyKUXYJ1sWM5XgoIShW3Rb6/XTd5gRMhAqUzT6B4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=JLmeuAv4OHuwns13+zH2CZrvCZvy6czFqj0gETshVEY1wAJlFQ/09G9d0Lfx0uwH5
	 N/OZo3F734UzP+2iyMFF820gKVzM5micuojnz42J8Tn7eJSUJYs7iXuQ9xZAukjaK0
	 nb9rmwI4d5NwY/FqssNQ2Ko13QOScXmlIBhQ9agXA2sMzERRfYGfSDZbjnTVq844a+
	 SY56RFCmwFwNR2TTO2BUjeVY0qN1t4U7GyGv0YGH2AfNG3y8aNVED+SpP9E/QX/UTT
	 WoculIPBAYT6nTfVvZK0dJiBXa1skeH7OypBrcb7Km5yOKbLCue8zQeFuUOaLcwArz
	 slV8nCJOAqgoA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C66C4CE0592; Tue, 15 Apr 2025 11:47:39 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:47:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH perfbook 0/2] Split "Index of People" from general "Index"
Message-ID: <6834efcb-0108-40d7-bdea-1cf288485e02@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <044918d6-0b23-4e9f-91dc-14219b171548@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <044918d6-0b23-4e9f-91dc-14219b171548@gmail.com>

On Tue, Apr 15, 2025 at 06:04:14PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Mixed list of technical terms and people's names in the Index pages
> doesn't look great, especially with the growing numbers of people's
> names.
> 
> Patch 2/2 splits people's names from existing general index pages into
> "Index of People".
> 
> Patch 1/2 is an independent fix of a minor issue in single-level index
> pages.
> 
>         Thanks, Akira

Nice, thank you, and I have queued this.

After building perfbook.pdf twice, I have "Index of Terms" in the table
of contents, but not "Index of People".  Which is fine from my viewpoint,
but thought I should check.

							Thanx, Paul

> --
> Akira Yokosawa (2):
>   Fix \IXhmr and \IXalthmr for single-level index mode
>   Split "Index of People" from general "Index"
> 
>  perfbook-lt.tex       | 21 +++++++++++++--------
>  utilities/runlatex.sh |  3 ++-
>  2 files changed, 15 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 6e66e280e548545c69dde85f8eeee400f66b4bfc
> -- 
> 2.34.1
> 
