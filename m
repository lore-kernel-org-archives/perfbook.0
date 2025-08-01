Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B01D5CE5
	for <perfbook@vger.kernel.org>; Fri,  1 Aug 2025 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754073325; cv=none; b=rghyadrN0/PmB9nkQAIvU/zoD2XEbU0pIhoZxlEm6AisFW9ZyCf9nQP3Fk44Gatfwaapdi5RazDyDkA20hFJOlbAKIIBTeS9P2YCCNMZFi9gKWRd+9ai4lWMi3xetGh2MEmV+YOe8aCbOKl+Q1P9MvaSiFS+vN4/0F2+nGJ1CSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754073325; c=relaxed/simple;
	bh=/r5oPn81b/haneoW7Ai9ndwIn1XfJV9kjub4eR11bOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFdPIbtlQLkEA7NpyBviS8gGLXkeYmOm+xv0NS5dLinlc9WqlBDoy6g9izCsEBPZeWlf7xWonWv+DAitTl7xiJ95pBRAAKAD0Jhw7nyrNQR5QYPoFJVKFlkj42OVKfOjhXnwdq3SnasR2E4rlYDMZxtpXSmBVf4N/Gk7uUiBo9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uhl/b8Gy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uhl/b8Gy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB42C4CEE7;
	Fri,  1 Aug 2025 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754073324;
	bh=/r5oPn81b/haneoW7Ai9ndwIn1XfJV9kjub4eR11bOA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Uhl/b8Gy2Gr7mnoltItfRIerC2EBK75qC2jDXXy4q9qind63hKyHxqdiCXJoHWP18
	 9uwgeHqD0bfKMPtgYVbhybJReUNFkjtiyU2r06QIeIojD2G/PujdxGRakpS4T13buH
	 cEI4jw7plIGqflv4anGjTJBKXJOt4sq8UTV+puhDlVmAtXJybnw387hrj5dL1LMwo/
	 Su8ABhZ4Xe5vBEH7sphiaHGqsreAMYknoE/CvqgTCNNGLwBk0+6kEwxa42MrCLz3rX
	 aUGFt/BB2H7O9p9gT85pq3OYclr6EdjgYgEwYZ/3txw8eZxaBlJgSdobn7feOvVuBp
	 VxK4jNM1x8N1Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 75A87CE0CAC; Fri,  1 Aug 2025 11:35:24 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:35:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] CodeSamples/formal: Update rcu-test.dat
 for v6.16
Message-ID: <c893aeba-d0b7-42d0-8bc1-8352c09691c6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <29fc47c4-7ad5-4ac8-98e8-0e6cd76988f2@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29fc47c4-7ad5-4ac8-98e8-0e6cd76988f2@gmail.com>

On Fri, Aug 01, 2025 at 08:30:15PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/rcu-test.dat | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index dc7ac7ec..d63c1bd7 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -102,4 +102,5 @@ v6.8  22018 12071 34089 35.4
>  v6.12 22834 12313 35147 35.0
>  ""    22961 12414 35375 35.1
>  ""    22107 12620 34727 36.3
> -v6.15 22300 12758 35058 36.4
> +""    22300 12758 35058 36.4
> +v6.16 22370 12983 35353 36.7
> 
> base-commit: 7348873f5c9fc45a42a6a6b1463631f212bd2661
> -- 
> 2.43.0
> 
