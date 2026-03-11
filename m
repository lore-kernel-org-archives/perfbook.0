Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2923C9ED3
	for <perfbook@vger.kernel.org>; Wed, 11 Mar 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239969; cv=none; b=lW4MgGZJZpvy1mdEOD5B3dPnloo0J94B99eWlZnUukKTR43c3uA/w1bRKCeenuIutNi4UV1+Gegne++O8fR6zsmPCjaOz1NE2QaAYkJ5nUufO4F3fJ2r+wsDQIQ7KhC7x6N7mwK6QMSIMUPcjBxDff9y1hm3sBr+Ei4J11oehpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239969; c=relaxed/simple;
	bh=sQue1nKDlk3uDIJ+mgPx6KgVDpAlAAPSkWXfErFwNPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7gAsNjnsLx8vzAT7iDHtLD8ag3sBR25QrxbJSSSAds0FxBJc+Cp7Z+BOnelpfnOzdU2rtI8BJRS/WCzNVYv4w09mKcka7NilOnbMTLj9foF2xpgYMIxz9iDei1X3KlKgs8seLDiddkHaPAc2NhssizJTNfSWr9zL39KELt6qfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX5shtSm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KX5shtSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4308BC19421;
	Wed, 11 Mar 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773239969;
	bh=sQue1nKDlk3uDIJ+mgPx6KgVDpAlAAPSkWXfErFwNPg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=KX5shtSmCIxv4erLdErwhr7zNu4Bit8TmcFB8wWpM1fHWwC79C4V/v25i11ODCxf1
	 9N26GdXAgFIPvR26WxxjxddB050227M+fO4SPPSgQy3jaY1wsgDdwKuCQNoWg5DWOM
	 lkjUGJJrAG1QO76ZIs62CCkLTZQV50ybuEsgimzkQE7ptuGF5nnN9IsFZ8D9F2wUHr
	 REc6rHo+ZFcq5hE+3r9ICtmmbu6iQUln57VUDv6UIrirOLcmB0CiZ3Ui6qOUexJXDT
	 toVSgVxhxTMFRdcETO1WZuRXMlbRCeUKjMoC3wK158B4BNR5spjQ9QCjqjo9f6Kwb5
	 63rKGBcUeYlcQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B74C8CE0C4A; Wed, 11 Mar 2026 07:39:28 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:39:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] memorder: Reconcile Figure 15.15 notation with W+RWC
 z-flow semantics
Message-ID: <15acbc05-3b54-4d9e-8a74-f763a990ba3f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260311084813.969200-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311084813.969200-1-kunwu.chan@linux.dev>

On Wed, Mar 11, 2026 at 04:48:13PM +0800, Kunwu Chan wrote:
> State explicitly that Figure 15.15 uses x as a schematic variable name, while the surrounding W+RWC analysis in Listing 15.18 follows the concrete z-flow (P2 -> z -> P1). This eliminates notation drift across cross-references and preserves propagation-argument fidelity.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>

Again, good eyes, and thank you!  I queued and pushed all three, and
added a fourth commit that converted this to a footnote and mentioned
both variables and the listing, shown below.  Please check it to make
sure that I have not messed something up.

							Thanx, Paul

> ---
>  memorder/memorder.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 2357e7ea..8eb14a29 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2760,6 +2760,8 @@ that \co{P1()}'s read from \co{z} happens much later in time, but
>  nevertheless still sees the old value of zero.
>  This situation is depicted in
>  \cref{fig:memorder:Load-to-Store is Counter-Temporal}:
> +The figure uses \co{x} as a generic variable name for the same
> +counter-temporal pattern.
>  Just because a load sees the old value does \emph{not} mean that
>  this load executed at an earlier time than did the store of the
>  new value.
> -- 
> 2.25.1

------------------------------------------------------------------------

commit d2c790e9077625e2e28ee919619b4d18175c3665
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Mar 11 07:34:07 2026 -0700

    memorder: Convert Figure 15.15 variable-x commentary to footnote
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 388903b6..4503c0a6 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2759,9 +2759,10 @@ It therefore takes time for the effect of the \co{P2()}'s store to
 that \co{P1()}'s read from \co{z} happens much later in time, but
 nevertheless still sees the old value of zero.
 This situation is depicted in
-\cref{fig:memorder:Load-to-Store is Counter-Temporal}:
-The figure uses \co{x} as a generic variable name for the same
-counter-temporal pattern.
+\cref{fig:memorder:Load-to-Store is Counter-Temporal}:\footnote{
+	The figure uses \co{x} as a generic variable name for the same
+	counter-temporal pattern that uses the variable \co{z} in
+	\cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}.}
 Just because a load sees the old value does \emph{not} mean that
 this load executed at an earlier time than did the store of the
 new value.
