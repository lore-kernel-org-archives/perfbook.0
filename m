Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885E274641
	for <perfbook@vger.kernel.org>; Mon,  9 Mar 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069415; cv=none; b=BjaLuDoDDdBg/QRYO+eqdIotjuCfTzv+hrn/TsWLzVgsGQ1tiESfaEewINKnzakXgvpuG1LMiZxzrqayWsg+/ah9SHJ0NZRZAuxiCD7gqq6dVzE10CWvl7bImP7R9he+X3UjmLqNnYarVFPMo9io8fPAmPc5whS51DdMNpsAqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069415; c=relaxed/simple;
	bh=Zp8wW7LjZlid2eYus/5rrcEyV8BvHd0ArMPo6RYMOi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx42acYPLzuoK/DUadD+5DVJ7h1SoVM+c3ROcyXpkWLSWyqxhu+c6datwHIsHB+OfaexDl0EHtL5TtsRO65XQOo3wL+RLIVujwp1gTlVuRF4ItjX9YTGZNJ62oRTYtTwlsbrFeR096kqaV24oTgf4dnLuBeOASLtyRGIPJrCWdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BehwYLhi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BehwYLhi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55963C4CEF7;
	Mon,  9 Mar 2026 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069415;
	bh=Zp8wW7LjZlid2eYus/5rrcEyV8BvHd0ArMPo6RYMOi0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=BehwYLhiP9LQHsY7Bx+e8dsOIkSQhNo+SPiFnzc5BO6jddGhQ9lLYXhhCqJQ8sn/I
	 NdvaOHsZu3KQvTpVi0Ct2W1fCk5i2EeHh4AFxHh4Dtp7EfhQbD9cRLuVZJsCwf8E/j
	 LhMhiSsYLmWILn4rfQhqcc71IQbGZuJDatEl9a3Ek4n06xX87GC2USdK1OW9SuA2g7
	 22kEv4UcDOikprwX5vIhYtr9YsrV8yeORS47WHdJbctT0oKZDi5Wt6CB6mJ5Wkiz42
	 wplIBCtjle6zE/SqjHx8gsq4nXKKv0Z7xk+zYEYhYF+CnulSk9vEmVMf775b/X7foJ
	 KAAZaf6b5obEQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EF0CDCE0E57; Mon,  9 Mar 2026 08:16:54 -0700 (PDT)
Date: Mon, 9 Mar 2026 08:16:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: npc1054657282 <ly1054657282@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] cpu/overheads.tex: Fix terminology typo in L3 cache
 description
Message-ID: <f444bf93-c935-4858-98e9-c061c5b79314@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260309141249.394299-1-ly1054657282@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309141249.394299-1-ly1054657282@gmail.com>

On Mon, Mar 09, 2026 at 10:12:49PM +0800, npc1054657282 wrote:
> In the description of L3 cache organization, the text incorrectly
> referred to "bucket" as "Line" in parentheses. Based on the
> accompanying table, this should refer to the "Sets" column.
> 
> This commit changes "(``Line'')" to "(``Sets'')" to match the
> table headers and standard cache terminology.
> 
> Signed-off-by: npc1054657282 <ly1054657282@gmail.com>

Good eyes, queued and pushed, thank you!

							Thanx, Paul

> ---
>  cpu/overheads.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index b3bf5196..b3cadd06 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -551,7 +551,7 @@ this system.
>  Third, again referring to the figure, the caches are organized as
>  a hardware hash table with a limited number of items per bucket.
>  For example, the raw size of the L3 cache (``Size'') is almost 40\,MB, but each
> -bucket (``Line'') can only hold 11 blocks of memory (``Ways''), each
> +bucket (``Sets'') can only hold 11 blocks of memory (``Ways''), each
>  of which can be at most 64 bytes (``Line Size'').
>  This means that only 12 bytes of memory (admittedly at carefully chosen
>  addresses) are required to overflow this 40\,MB cache.
> -- 
> 2.47.3
> 
> 
