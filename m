Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816513A0B2E
	for <perfbook@vger.kernel.org>; Tue, 31 Mar 2026 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774959197; cv=none; b=i0OZ0z8kXzsikZwwH4iuK0bkCueszq/mKfQURRQt4/5DhWD0QKQ7/zeTYE/5EF4D0QFwiMp0G39hL+CfFBW3f5ays5gnK7SGLr+0ihyFsEMkp8KfeKp1Ym7meHQIfGVr/NundIZhkDqeKlLUTWZEgsUPYQGXoDIjw1EW8q0ryyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774959197; c=relaxed/simple;
	bh=9Zia2oWzVDJUXNIF2+kR0xa2R+4wsaAPCny3b7aCRt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1IuEQWuDgi3T8mOUJoJmuqzOhD7HKLLLkeVdvm86mWGmcr23Xih0AO17vAaTz732pFjMZVCMoO2E/nq41lvcONeFfIgFcG57dU4xsINgcCRc9HY6QODhq0LdCix/87oyyzvqtDacCmdgYltP2N0sSLQth+VgFtO9Nyyi3U0oWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uplXBMm4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uplXBMm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1318C19423;
	Tue, 31 Mar 2026 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774959196;
	bh=9Zia2oWzVDJUXNIF2+kR0xa2R+4wsaAPCny3b7aCRt0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=uplXBMm4eJYfJict/xmsMpayYHP0L3TBamOteLhoajBet9iruaGWH7jeh5TBS9NU9
	 uLcl12aK88meDzL8Y6D9vgZCgkHTMNoIN6G/32Wtkx3Ggp5mb97NeC3qxaJSXXjfSA
	 1EzbPF+raNxSc7UZMw9UcvJ/luWSddfByRAJ6PeT6MXWukODctKTEmffqmet9eH5p+
	 kdrwZoZigEGDbsRQWcMSgqf4IFKST/vXR4h0c0XodkWAkjVq4Sqgidk/1etgin+6Vl
	 QOZCeyWVXnRmP8E0BKzbaFLFifMOFlG+185ztv9eDuRzLsiG3+HhWNJeKtqPdrHmXU
	 eVHgxU5zy0Itg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 402EBCE00EE; Tue, 31 Mar 2026 05:13:14 -0700 (PDT)
Date: Tue, 31 Mar 2026 05:13:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/3] adjustindexformat.pl: Cope with recent
 hyperref change
Message-ID: <81984896-bf8a-4280-97e8-9499daf1fdf4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7304a7e5-2b6d-4109-9387-01fa4015cbf0@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7304a7e5-2b6d-4109-9387-01fa4015cbf0@gmail.com>

On Tue, Mar 31, 2026 at 04:52:39PM +0900, Akira Yokosawa wrote:
> hyperref 7.01n (released in July 2025) made a change in the name of
> its macro for formatting page counts in index [1].  It ended up in
> a regression in our Index pages, namely, missing most page counts
> with bold shape or underlined.
> This issue is observed in recent CI-builds at
> https://gitlab.com/linux-kernel/perfbook/.
> 
> Add regex'es to cover the patterns of "hyperxindexformat{...}".
>    (in addition to those for existing "hyperindexformat{...}")
> 
> Link: https://ctan.org/ctan-ann/id/aFgfN-aRU1t7L2XT@prptp [1]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you very much!

Note to self: When doing anything that affects the index, build
perfbook.pdf in addition to the usual perfbook-df.pdf.

							Thanx, Paul

> ---
>  utilities/adjustindexformat.pl | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/utilities/adjustindexformat.pl b/utilities/adjustindexformat.pl
> index 584b3232..52cfaae6 100755
> --- a/utilities/adjustindexformat.pl
> +++ b/utilities/adjustindexformat.pl
> @@ -38,5 +38,11 @@ while($line = <$fh>) {
>      $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\gl(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\GL\}\}/ ;
>      $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\gl(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\GL\}\}/ ;
>      $line =~ s/(\\makefirstuc )\{([^\)]+)\} \<([^\]]+)\>\|hyperpage\}/$1\{$2\} \($3\)|hyperindexformat\{\\GL\}\}/ ;
> +    $line =~ s/\{([^\|]+)(\|hyperxindexformat)\{\\bf(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\BF\}\}/ ;
> +    $line =~ s/\{([^\|]+)(\|hyperxindexformat)\{\\bf(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\BF\}\}/ ;
> +    $line =~ s/(\\makefirstuc )\{([^\)]+)\} \[([^\]]+)\]\|hyperpage\}/$1\{$2\} \($3\)|hyperxindexformat\{\\BF\}\}/ ;
> +    $line =~ s/\{([^\|]+)(\|hyperxindexformat)\{\\gl(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\GL\}\}/ ;
> +    $line =~ s/\{([^\|]+)(\|hyperxindexformat)\{\\gl(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\GL\}\}/ ;
> +    $line =~ s/(\\makefirstuc )\{([^\)]+)\} \<([^\]]+)\>\|hyperpage\}/$1\{$2\} \($3\)|hyperxindexformat\{\\GL\}\}/ ;
>      print $line ;
>  }
> 
> base-commit: bfce6d84f45d7aa5ffb4ea2202ca6a248adf5dff
> -- 
> 2.43.0
> 
