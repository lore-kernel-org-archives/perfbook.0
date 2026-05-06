Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AC3E1220
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778092950; cv=none; b=gHrnT8iYu/ZFVhBpxwGXlq5sJdUgKqE/KmlX1HdSo/F2scMp0WWpHcTvrlKwRDEy3yp1LvO3c43A95KLI/WvZBBqoSRPD+Q0rVVMoW8ar/57nsZsTvMCVr5k9iNyIler1QAjHwkYf6CG57m19JGCVwXaPnLNniN6OAr7vr9XCBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778092950; c=relaxed/simple;
	bh=GptK7WI/okvSZZzD9acqWEt72Zr8wmUykAy2NeOJHMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVjml2jqHXrFpjb2/HsgYM3Vq+OSZineqVxnB4t8r1sfYS3Jtqc4eCf4h4ipfuJ3IILL2ySTDVA9f7cHYBO/QBBtA55fZXE6IdnoW/GAFugRWsER4OyEGhCDfesFyLBqAYMNnUpEZHn0F1P4J/Mgf1KSalIv1ZSE1aQO74P/jy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXuKkKgh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXuKkKgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140C9C2BCB0;
	Wed,  6 May 2026 18:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778092950;
	bh=GptK7WI/okvSZZzD9acqWEt72Zr8wmUykAy2NeOJHMg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=TXuKkKgh1P2dCc62TZo7wGEkbVcXnUhXWthgNrYUXEdaBdF+xNCwrGDXioXo59q8N
	 IXgGkf58IN+BaIX/IqZcUWj7n+e8w4lxZE8/VbQaSzieecfwnt1lu1yH2zb8ZbRMf2
	 03cPJGUO29CRUZ2WPItbt1R62VCxV9NbTPk8Mk/jsr7L//FGLZCs1yioGNCCvYHjoi
	 GvkPO2CZq9U1LUiFjTE2Iy4SPBvtzrhDGel4Qdfix/bwl5oKMc03VuAfJ/i5yx1E7L
	 YqZ/6IL1sL3FDXSSbI4OKeFRJ6h46CAu5QCG6wg5R1T9DeAVmSpCHXa6OLAsJ/y5L8
	 sGayq47bj0Jwg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 86607CE0782; Wed,  6 May 2026 11:42:29 -0700 (PDT)
Date: Wed, 6 May 2026 11:42:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/8] May 2026 updates (1st set)
Message-ID: <0d569f53-0a6b-43bc-8659-5345b0ccdc80@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>

On Wed, May 06, 2026 at 08:37:11PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I guess this is larger than what you have expected.
> I didn't expect it, either.  :-/

Sometimes you have to expect the unexpected!  ;-)

Kidding aside, thank you for finding and fixing all of these issues!

> Patch 1/8 is the usual update.  I see there were some cleanups in
> RCU code but would like to defer text updates to you.

And please see below for that text update.

							Thanx, Paul

> Patch 2/8 takes care of a regression in cleveref.  It started affecting
> perfbook as early as Debian 13, which I failed to catch ...
> 
> There's been quite a few other issues in early testing under
> Ubuntu 26.04 and Fedora 44.
> 
> Ubuntu 26.04 misses an update of lineno.sty dated in March 2026.
> Debian has updated TeX Live packages under testing, and hopefully,
> Ubuntu 26.04 will follow suit soon.
> 
> One of Fedora 44's issue looks more concerning. Please have a look
> at Patch 5/8 changelog.
> 
> FAQ-BUILD.txt and files under docker/ want further updates, but I'd like
> to see how long those issues in distro packages remain.
> 
> Thanks, Akira
> --
> Akira Yokosawa (8):
>   Update rcu-test-ratio for Linux v7.0
>   Apply hotfix for cleveref against recent LaTeX2e
>   Cope with iconv without ISO~8859-1 support
>   precheck-tentative.sh: Detect premature versions of "lineno" and
>     "microtype"
>   runlatex.sh: Add WARNEXIT variable to make "LaTeX Warning:" in .log
>     be ignored
>   precheck-tentative.sh: Fail early with suggestions for Fedora 44
>   precheck.sh: Add check of missing LaTeX packages for Fedora 44
>   FAQ-BUILD: Add needed packages for Fedora 44
> 
>  CodeSamples/formal/data/rcu-test.dat |   3 +-
>  FAQ-BUILD.txt                        |   2 +
>  Makefile                             |   1 +
>  fixcleveref.ltx                      |  12 +++
>  perfbook-lt.tex                      |   2 +
>  utilities/precheck-tentative.sh      | 106 +++++++++++++++++++++++++++
>  utilities/precheck.sh                |  40 +++++++++-
>  utilities/runfirstlatex.sh           |  15 +++-
>  utilities/runlatex.sh                |  27 ++++++-
>  9 files changed, 200 insertions(+), 8 deletions(-)
>  create mode 100644 fixcleveref.ltx
>  create mode 100755 utilities/precheck-tentative.sh
> 
> 
> base-commit: 5d4a155828dce1cda2fa1a2769462e9a11838a70
> -- 
> 2.43.0


commit 82dd3ab1629a9e93ea60eb5623a44705d485d3ce
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed May 6 11:38:07 2026 -0700

    formal/formal.tex: Update for Linux kernel v7.0
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/formal/formal.tex b/formal/formal.tex
index 5d43569d..5ea1f0e4 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -379,6 +379,8 @@ Linux kernel v6.14 moved \co{kvfree_rcu()} into SLAB (in
 \path{mm/slab_common.c})~\cite{20241212180208.274813-1-urezki}.
 Linux kernel v6.19 added a few SRCU flavors and also added a number of
 primitives to the \co{refscale} test suite.
+Linux kernel v7.0 removed RCU Tasks Trace, implementing its API in terms
+of the new SRCU-fast RCU flavor.
 Numerous other changes may be found in the Linux kernel's \co{git} archives.
 % rcutorture
 % v2.6.15: First torture test
