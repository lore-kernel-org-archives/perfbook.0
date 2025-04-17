Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB91FFC48
	for <perfbook@vger.kernel.org>; Thu, 17 Apr 2025 19:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744918988; cv=none; b=d7eLKEniUGWBjRlbKKnUTvjUgS3v9nqws7q/3yCyadibO5CwtqabNxj/rW1TBPTkcONRDNEPd7Iu4Lyvpa1c8XHZx0mF+m48PpRJkEF6tNcIaQCgXda/UFq8dpka3OpXqPVtraofQhQnRNJ26w/PH6ON9s4iWLL3hFX9J6g1B2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744918988; c=relaxed/simple;
	bh=wpCGFvaRhsoi7mK+qaHdGpvBsCovYJV93d5PR3DULJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH/iediJyFswyzhifNIuo863cAglpVAK2HB8dnvriiPwCR1xTOB8rRmyZjJArpr0QYde7Qlt5GUJILYuevw9n7w7YstGeRzIaO5qC5mjVEPcz1l1OktA9ev79LUak+Ao5rXeq6cza1QIYPKNdinx41qDqd8FtfJ2/LqZHhkGpVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAeLKray; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAeLKray"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAE7C4CEE4;
	Thu, 17 Apr 2025 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744918987;
	bh=wpCGFvaRhsoi7mK+qaHdGpvBsCovYJV93d5PR3DULJ8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=uAeLKrayzAZwD0fRZbKcd36PMH9Qgu9mZ3EhF5rmofoXMNXd37RK/5rJ+QkQDlpDq
	 jSaQ7LUlTxyfMo8sJIDKcMuipWj9gri+lobAv71IveeYvgfBtzMXlgdqxc3K6gNxt7
	 j2z/MSdGd0H3G/FdCxkGKNObkXDtUIP4Gjp0tO8lutHDgGspxrHI+X3p2PzLorQFAB
	 +v0ci2AUIQJdZk/W07q9nlGRYeseoTm4Kf8NINcoXoUosH04yDWG+RQsbInMw0/NSv
	 qc6mbA2gkF400aYn7u28Nbikq5F8lAmoi9uz+2C5vo8qxZsWLXMktcN4/nlNM1vlyd
	 r4nt/sjXzE9uw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5FEF6CE0992; Thu, 17 Apr 2025 12:43:06 -0700 (PDT)
Date: Thu, 17 Apr 2025 12:43:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: Ideas on reorganizing terms in perfbook's Index pages
Message-ID: <2751a064-a9d4-4753-8948-346e12bbe456@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ec0b5744-65b9-4335-be12-6f3ff0e8c31b@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec0b5744-65b9-4335-be12-6f3ff0e8c31b@gmail.com>

On Thu, Apr 17, 2025 at 11:02:02AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> With regard to "memory consistency" and "memory model", currently,
> Index of Terms pages have the following:
> 
>   - Consistency
>      - memory
>      - process
>      - sequential
>      - weak
> 
>   - Memory consistency -> Consistency, memory
> 
> , and
> 
>   - Linux kernel memory consistency model (LKMM)
> 
> , which comes from markings for acronym of "LKMM".
> 
> The redirection to "Consistency, memory" looks strange to me, as
> 
>   - Process consistency
>   - Sequential consistency
>   - Weak consistency
> 
> are about "memory consistency".
> 
> So, I'm thinking of reorganizing them into something like, including
> additional markers for "memory model":
> 
>   - Memory consistency
>      - process
>      - sequential
>      - weak
> 
>   - Memory model
>      - Linux kernel
>      - Armv7
>      - Armv8
>      - etc.
> 
>   - Memory consistency model -> Memory model
> 
>   - Linux kernel memory consistency model (LKMM) -> Memory model, Linux kernel
> 
> How does the above sound to you?

That works for me, and thank you for going through this!

							Thanx, Paul
