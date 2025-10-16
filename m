Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B95341ADE
	for <perfbook@vger.kernel.org>; Thu, 16 Oct 2025 16:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760633373; cv=none; b=BhfCqLDuPaUicT1MTDZ1jacJM23sv6duF4pJ7lvNAmDSp5XeNv5E9QlUQkQkTSqpE9l0HXdYIcym22UKruCZ3/klq0pGfodqJMphxtJVOBcM/SJ18RxhPrTKii/MhSUv2IGvOZAqWoe+7kola17GmR/hGTSOs7k8yK2ScQ9pHLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760633373; c=relaxed/simple;
	bh=p7wa2a/LQ++Ph5Pop6WvSefy2cpn+aX/Qu16TaFc/js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjNSpxG9hI5PWGb/be2mNn+NYMKV1+qgCksaEn4MiMVdRUir1qhml0+p8IuKLcGzA4pCN3LcY3zbX4sX1cOQeIaC78SiJ0FxalYjO5mWPSNGvmDJ6DxbJpKhifrSCQZQi6uS3bBv1DdyOIDq7uDbHygYoGkHf8XxMb+o4CAwNUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS2XRiNL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS2XRiNL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5266EC4CEF1;
	Thu, 16 Oct 2025 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760633373;
	bh=p7wa2a/LQ++Ph5Pop6WvSefy2cpn+aX/Qu16TaFc/js=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cS2XRiNLr6HmRn1uPJ9mUlKFZbfmAB5YEvRvYmEZPsL0xD9nrjtRWhsXFwOds+rfj
	 cW3HAnAv+gTP1cXFqsEwXqePNnecAXxKGoOU8bbKcvnSi+Cx/CFg6eeIN9biPdXjwG
	 3K6O5wnRFsnA+Evx863M4mSNCbdzY4cHxoOC6OBMW1H0p7We/XbW/5wgr/Rme26cpw
	 rUQLnCuwR9HLjgz26OpsZ1i9GJZadQwWWxaQQSj3aIWjNwgV9VmsWYo4dDRelhap8J
	 fdgNqvCiJOEljnttwPdmVSNo/m5PGcMqlsNKcE3rWqgO4LYj529gOaj03fway7It2C
	 oEiVQTYh604aQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DDE3CCE0CB1; Thu, 16 Oct 2025 09:49:32 -0700 (PDT)
Date: Thu, 16 Oct 2025 09:49:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] runlatex.sh: Detect fvextra versions with
 known minor regression
Message-ID: <0c11a91f-3412-4ce2-96f0-4ee68e17ed82@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1193cace-2484-4c4c-b14c-a40a51550117@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1193cace-2484-4c4c-b14c-a40a51550117@gmail.com>

On Fri, Oct 17, 2025 at 12:16:12AM +0900, Akira Yokosawa wrote:
> fvextra versions from v1.11.0 to v1.13.2 (latest) have a minor regression
> which ignores fancyvrb's "samepage=true" key.  It is used in perfbook to
> prevent short snippets from broken across columns/pages.  This is a minor
> regression but affects reproducible build of perfbook.
> 
> Add commands at the final phase of runlatex.sh to detect those buggy
> fvextra and emit suggestion of installing unaffected fvextra.
> 
> Unfortunately, distro texlive packages based on upstream TeX Live since
> early March 2025 are all affected by this regression, including debian
> trixie and opensuse/leap 16.0 (Long Term Support); and ubuntu plucky
> and questing (Rolling release); as well as archlinux and
> opensuse/tumbleweed (Rapid release) as of this writing.
> 
> This issue was reported upstream at [1].
> 
> Link: https://github.com/gpoore/fvextra/issues/32 [1]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queuend and pushed, and thank you very much for finding and fixing
this one!

							Thanx, Paul

> ---
>  utilities/runlatex.sh | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
> index 17d833ad..d5b1844d 100644
> --- a/utilities/runlatex.sh
> +++ b/utilities/runlatex.sh
> @@ -169,6 +169,22 @@ then
>  	echo "### Consider upgrading to Ubuntu 20.04 LTS or later.     ###"
>  	echo "############################################################"
>  fi
> +# fvextra version check (Ubuntu 25.04 and 25.10 have buggy one
> +FVEXTRA_VER=`grep -E -e 'fvextra .* v[0-9\.]+' $basename.log | \
> +		sed -e 's/.* \(v.*\) fv.*/\1/'`
> +#echo $FVEXTRA_VER
> +FVEXTRA_BUGGY_SINCE=v1.11.0
> +FVEXTRA_BUGGY_UNTIL=v1.13.2
> +
> +fvextra_since=`env printf "$FVEXTRA_BUGGY_SINCE\n$FVEXTRA_VER" | sort -V | head -n 1`
> +fvextra_until=`env printf "$FVEXTRA_BUGGY_UNTIL\n$FVEXTRA_VER" | sort -V | tail -n 1`
> +
> +if [ $fvextra_since = $FVEXTRA_BUGGY_SINCE -a $fvextra_until = $FVEXTRA_BUGGY_UNTIL ] ; then
> +	echo "Buggy fvextra $FVEXTRA_VER detected."
> +	echo "It causes undesirable page/column breaks in short code snippets."
> +	echo "Consider installing fvextra < $FVEXTRA_BUGGY_SINCE or > $FVEXTRA_BUGGY_UNTIL."
> +fi
> +
>  # to avoid redundant run of bibtex and pdflatex
>  touch $basename.bbl
>  touch $basename.pdf
> 
> base-commit: f3d75a725a3efbb5ba4822d3f1b835c6ae08c464
> -- 
> 2.43.0
> 
> 
