Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229540AbhGDPyS (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 4 Jul 2021 11:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625413903;
        bh=FYzVrXiowX9ZJsWC6df8dIXjZCjoSs+fW5BxIbP+rQk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nR5WlyxcG5T4Eq+zT7t4M9Sl+ebn/aW/8tceGk06aRPDn+fVKVEE0M8Dp00jX0Cf5
         mgVLmshka1sUQxFGTZm+dgJiQLDhyUnBpm96fsLsiJfd+iPhwq8I4YBtM8HTNuMmwJ
         Ncl5HN/O6Lq2P6jESv1DoHnq5mnisiaJ7T9DnIeJqfEZSiIbTaKiAFA+J3ynsswGGq
         ozKWWTmZMJWCMHGj2nTYbYeJ4u1EReJL/mnRRyqjZ96ZKEENqPvOY/49THqSlPZUYJ
         UdypTAqz0LSZso8VSfddFmK5vLcA3PZq253m+05sibKXpDrPjp9LTDUD3vQL3i4GKs
         sDYj5eqIoFmcA==
Date: Sun, 4 Jul 2021 08:51:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v2] future/htm, summary: Fix typos (missing '\'
 in indexing macros)
Message-ID: <20210704155142.GQ4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <3b7aac15-128e-56d4-6662-9fa686f94dd1@gmail.com>
 <cea0f767-c1dd-731c-a2cb-3e28e80a0ad0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea0f767-c1dd-731c-a2cb-3e28e80a0ad0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 02, 2021 at 08:08:26PM +0900, Akira Yokosawa wrote:
> Fixes: b97d9921b0fd ("acronym: future/htm: Tag TM, HTM, STM, and RCU via acronym dictionary")
> Fixes: de25a117a9c6 ("index: Add index and acronym tags, take one")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi again,
> 
> I said:
> 
> > I'm thinking of adding some rules in the check script to catch
> > this sort of typo.
> 
> , and a tentative script caught two other typos.
> 
> This v2 patch fixes three typos at once.
> 
> Updated check script will be posted later along with other punctuation
> convention fixes.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
>  future/htm.tex | 4 ++--
>  summary.tex    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/future/htm.tex b/future/htm.tex
> index dc67ba23..7458f436 100644
> --- a/future/htm.tex
> +++ b/future/htm.tex
> @@ -150,7 +150,7 @@ HTM is therefore a very real possibility for large non-partitionable
>  data structures, at least assuming relatively small updates.
>  
>  \QuickQuiz{
> -	Why are relatively small updates important to IXacr{htm} performance
> +	Why are relatively small updates important to \IXacr{htm} performance
>  	and scalability?
>  }\QuickQuizAnswer{
>  	The larger the updates, the greater the probability of conflict,
> @@ -252,7 +252,7 @@ write~\cite{RaviRajwar2012TSX}.
>  schemes~\cite{CScottAnanian2006,KevinEMoore2006}
>  use DRAM as an extremely large victim cache, but integrating such schemes
>  into a production-quality
> -IXalt{cache-coherence}{cache coherence} mechanism is still an unsolved
> +\IXalt{cache-coherence}{cache coherence} mechanism is still an unsolved
>  problem.
>  In addition, use of DRAM as a victim cache may have unfortunate
>  performance and energy-efficiency consequences, particularly
> diff --git a/summary.tex b/summary.tex
> index 63187998..2ed43920 100644
> --- a/summary.tex
> +++ b/summary.tex
> @@ -86,7 +86,7 @@ And that goes at least double for concurrent code.
>  where combining concurrency mechanisms with each other or with other
>  design tricks can greatly ease parallel programmers' lives.
>  \Cref{sec:advsync:Advanced Synchronization} looked at advanced
> -synchronization methods, including lockless programming, IXacrl{nbs},
> +synchronization methods, including lockless programming, \IXacrl{nbs},
>  and parallel real-time computing.
>  \Cref{chp:Advanced Synchronization: Memory Ordering} dug into the
>  critically important topic of memory ordering, presenting techniques
> -- 
> 2.17.1
> 
> 
