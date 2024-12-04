Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0682500D2
	for <perfbook@vger.kernel.org>; Wed,  4 Dec 2024 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733288752; cv=none; b=VEhVSh5ot1JQO69YlZNWNIHdAKmlm7vOis/sn8UxyQ10FvwQfNUurLUUOwtkel9Xo9+TQP+5zeOTh89/lqtH2JWUKeL3zOcWL/ZS5JdB/thcmbJoIy3tLw2R7aQ3XhqplgnxQdPhkpJojasuM8fIMYQxGlC4Ct5ClLEixo3PyTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733288752; c=relaxed/simple;
	bh=oWdCcQaunit0B/CMk524i1J0pIZVtt3QFIZdqJpfHW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcSUx3SdF5ypSLYP+SPPK+Q3+CZRxDedBToLI3GwJZDGeK5EEVEPUhREKYsjUrzxx4a6lh1srqVQNyqCmkWTrcMgMfgEfdoH5e2jeamnQdS3LBgw0TbVanUrXhufkU5E4lq/gPOcUBuRJodTEfvTvwl05BlW4noJaxLAFtphq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O72Af+MN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O72Af+MN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F33C4CED1;
	Wed,  4 Dec 2024 05:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733288752;
	bh=oWdCcQaunit0B/CMk524i1J0pIZVtt3QFIZdqJpfHW4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=O72Af+MNEhqR27EQxrsJ5LJ9dItNU5Nc42hzLMcNmUrSs3CYFTtk2oeMPrICfUckJ
	 ZrNxNpRE8RHG2BqhgydPPMtSdCsPfbF18ldzTi/tEbKdHPav25/PF+iO11v1WX+kcP
	 hOczNfyEQ+aEqoxmhvRkQAMhR7rV/z65iUgprK90ryCOYsDbaiyq3KNvdfmHfLE9UI
	 pGSeb0yz+Sg+UpmojVk7YcmiinTtCdmtuskvvzSUf8RW9DFQrMNGX7eC7R8DdOjs//
	 e1x7O2y4jJ0+EY3U8GAcYwIsYF31OqxyxidhBub+6oTU41bDu8PksegjjwLBq8FCTf
	 8mwNwM76CXTJQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 61B9ACE071A; Tue,  3 Dec 2024 21:05:51 -0800 (PST)
Date: Tue, 3 Dec 2024 21:05:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] CodeSamples/formal: Update rcu-test.dat for
 v6.12
Message-ID: <ec198b05-a183-4c85-8f3e-c252c2d319dd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <3d5a7d0b-7a3d-4629-bfa9-724b820869bd@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d5a7d0b-7a3d-4629-bfa9-724b820869bd@gmail.com>

On Wed, Dec 04, 2024 at 12:33:11PM +0900, Akira Yokosawa wrote:
> As the total line count has exceeded 35000, tweak yrange of the plot
> as well.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/plot.sh      | 2 +-
>  CodeSamples/formal/data/rcu-test.dat | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/formal/data/plot.sh b/CodeSamples/formal/data/plot.sh
> index bd325d58..93b13494 100644
> --- a/CodeSamples/formal/data/plot.sh
> +++ b/CodeSamples/formal/data/plot.sh
> @@ -17,7 +17,7 @@ set ytics out
>  set y2tics 1 10
>  set y2tics out
>  set ytics nomirror
> -set yrange [0:35000]
> +set yrange [0:40000]
>  set y2range [0:50]
>  set style data histogram
>  set style histogram rowstacked
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index e56d1d7c..e984fa8a 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -98,4 +98,5 @@ v6.4  21444 11748 33192 35.4
>  v6.8  22018 12071 34089 35.4
>  ""    22108 12076 34184 35.3
>  ""    22579 12085 34664 34.9
> -v6.11 22676 12095 34771 34.8
> +""    22676 12095 34771 34.8
> +v6.12 22834 12313 35147 35.0
> -- 
> 2.34.1
> 
