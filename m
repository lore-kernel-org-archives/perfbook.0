Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05503A9D83
	for <perfbook@vger.kernel.org>; Thu,  7 May 2026 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778176346; cv=none; b=ZxY06zBO9ivMZIzp3IYjJW9czOSw06zvC9+coDg17aEE/BGKpXOr02nehZx2+nOZ+d9w8nUspgs7BZkkQZfD73LoCWQMc02avOFXMC1sBgKhH1hNuhKxkGQdhqXOFW2WV1axC5p9di8LyuYVyKZBX0sikVShI7+ACjv3XsIJEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778176346; c=relaxed/simple;
	bh=uMOsZyZzIvMbKL2czEO/W/WSBDxE0EFRqHgt2O7Ui9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aH1aBhqLEoltnZpkorUE86x1K1hy63ca3hiHVxxRnAIBdTgy64B9nsSUIEq/vlKA7gxTrHzdmGHoOJwGtBKYA+wHiukjKs5T0tcTEV4cM6i5jPxtgPfQwBiRvnt6lMoCRKOA00pSz7neiOd+3j3wKMl+2QnTXVUK8kPmOFGn32Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu2O/UF1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu2O/UF1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8BFC2BCB2;
	Thu,  7 May 2026 17:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778176346;
	bh=uMOsZyZzIvMbKL2czEO/W/WSBDxE0EFRqHgt2O7Ui9Y=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gu2O/UF1Zh1J06dbqZGt8mZDjl5TzHzSD6ivvEFXKf77+ONepx2MZeNPwj4o49+bS
	 N3Ah6rt5MLHclw0kZNL7zHIxUv5ysMqWpLnF90nYxXyl97tTNwil0KGekIwW0HwNHp
	 yGI13i9kVPmhwlNHxbJevlEbrfZA3uPPqD6dEq2SCqFazs5MJVl80VDnECfMrMYTcX
	 JuO/WkjoumGEPGGqdC3VR97WUoTGR3tGaWSs3usHoH9r69JgTQrFqz/QdngpJTlIU8
	 EDMkGPoclKYChS487j12q7AEfbfXOWskNaUpOdSJNvj5Hn17WOI/KSqP01DPsPSFzv
	 dcY9y/akDN4YA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EB9DCCE0863; Thu,  7 May 2026 10:52:25 -0700 (PDT)
Date: Thu, 7 May 2026 10:52:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, Kunwu Chan <kunwu.chan@gmail.com>,
	perfbook@vger.kernel.org
Subject: Re: [PATCH] precheck-tentative.sh: Make array.sty probing fail-fast
 and deterministic
Message-ID: <fa82e08b-eeff-4b43-be7d-10a92f079eab@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260507095011.1551131-1-kunwu.chan@linux.dev>
 <e3237552-6671-434d-a3b9-53a7a5257685@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3237552-6671-434d-a3b9-53a7a5257685@gmail.com>

On Thu, May 07, 2026 at 07:37:48PM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Thu,  7 May 2026 17:50:11 +0800, Kunwu Chan wrote:
> > On systems where kpsewhich cannot resolve array.sty, the script fed an
> > empty path into the version-parsing pipeline and then compared an empty
> > array_req_ver against latex_ver in the non-pdflatex-dev path. The
> > result depended on environment and produced no actionable error.
> > 
> > This is reproducible by overriding kpsewhich to return nothing for
> > array.sty while keeping other lookups intact.
> > 
> > Add a guard before parsing array.sty, set array_req_ver only when the
> > file exists, fail fast with a clear diagnostic when it does not, and
> > correct the warning text typo ("arary.sty" -> "array.sty").
> > 
> > Fixes: 4cad3dd1174a ("precheck-tentative.sh: Fail early with suggestions for Fedora 44")
> > 
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  utilities/precheck-tentative.sh | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> > 
> 
> I didn't think of running "make" before installing texlive-tools bundle.
> That said, this can be helpful in setting up brand new installations.
> And thanks for the typo fix!
> 
> Acked-by: Akira Yokosawa

Queued and pushed, thank you both!

							Thanx, Paul

> Regerds, Akira
> 
> > diff --git a/utilities/precheck-tentative.sh b/utilities/precheck-tentative.sh
> > index 96d2fe2f..1e106877 100755
> [...]
