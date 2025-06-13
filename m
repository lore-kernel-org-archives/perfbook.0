Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B6F1CFBC
	for <perfbook@vger.kernel.org>; Fri, 13 Jun 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825345; cv=none; b=gQIWGqsRD5ljhuQ47m2OvtKCmQGT46UohQ9vvn2qnlMd34MTkLZ4o59A3kJk6vi2jq9Kg9PP1ZIsTJMGa4NtTa1gOydgEhTSlilpGV4lpRlvQrPdIzJ4vbC68V5GlLdC2eFiviHX3AfQkPXmX/E8TAGDPhsh+7ta5c30qraBpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825345; c=relaxed/simple;
	bh=mRz+PGBIYzpQqyayyifv4OQm2zcGxTjxP5yL898OY1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGXE8xCm9MOviV4oq4/Ke5bsexPexllJ0yHRqwmiRrnN0ZWUm1UC0V3kniVWE/i9AgXbIVs9/haKlYVGRbVXS8+Oc1i8NpjXhNkqhIJMhb+3xjo/cIdIp6reVYtb84NvSJoCazcSzTVo6o4KZEJUr+QC0MWWffagNTFH4sPeMfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8FWWx/Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8FWWx/Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14175C4CEE3;
	Fri, 13 Jun 2025 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825345;
	bh=mRz+PGBIYzpQqyayyifv4OQm2zcGxTjxP5yL898OY1c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=L8FWWx/QcPbtra1BHE67VkbKZRwRRWCLm1pGOT8jJOLM452Vz5T4IvLqn6lIw91SF
	 Jkia60x69t1ScA13UQPkov7FHFLGJWzVc5EMJ8nM0q2TqTDeo0duOIu7JWaJOMp9mB
	 nMzkp6iblpd7rA7vzYU3XK3DzDRxYVvu06DOvzLDbqSmT6n86Aj1yXlEtHttvgViW0
	 3zqX0J3XvCgquXIBbcFCHlI4ADEm1XqD9kv+LFWNDF2OdbnJed4SbY8+OPF4w0u0my
	 2k7nfozWrDTR4Wn6O6nqeZvadWwYPPw/jn5FCWuaPQwZXDIMSAfZsEadeffhBfySuL
	 RoZ1bmiNVWWlQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 73FEACE05B1; Fri, 13 Jun 2025 07:35:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 07:35:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] Convert *.log files into UTF-8 encoding
Message-ID: <bae1d886-18b6-4ee8-bc29-dd48fd71dfa8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <eec38fe7-eb86-439e-96c6-6604a5893419@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eec38fe7-eb86-439e-96c6-6604a5893419@gmail.com>

On Fri, Jun 13, 2025 at 06:33:15PM +0900, Akira Yokosawa wrote:
> pdflatex outputs .log files in iso-8859-1 encoding.  In our build
> scripts, grep assumes UTF-8 encoding for its input by default.
> 
> Practically speaking, the mismatch of encoding is unlikely to cause
> any harm.  That said, in the build log, there is a suspicious message
> from grep:
> 
>     ...
>     pdflatex 1 for perfbook.pdf
>     grep: perfbook.log: binary file matches     <===
>     ...
> 
> Converting .log files into UTF-8 on-the-fly can avoid the message.
> 
> Let's do it.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> Note 1:
>   Unicode ready modern engines such as XeTeX and LuaTex emit .log
>   files in UTF-8 encoding.
> 
> Note 2:
>   Currently, perfbook's preamble is not compatible with lualatex
>   or xelatex.
> 
> Note 3:
>   iconv should be available by default.
>   encguess should also be available where perl is installed.
> --
>  utilities/runfirstlatex.sh | 10 ++++++++++
>  utilities/runlatex.sh      | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
> index a89e8a70..676502b2 100644
> --- a/utilities/runfirstlatex.sh
> +++ b/utilities/runfirstlatex.sh
> @@ -72,6 +72,16 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
>  echo "$LATEX 1 for $basename.pdf"
>  $LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
>  exitcode=$?
> +ENCGUESS_CMD=`command -v encguess`
> +if [ "x$ENCGUESS_CMD" != "x" ]
> +then
> +	if encguess -s iso-8859-1 $basename.log | grep -q ISO-8859-1
> +	then
> +		mv $basename.log $basename-tmp.log
> +		iconv -f ISO-8859-1 -t UTF-8 $basename-tmp.log > $basename.log
> +		rm $basename-tmp.log
> +	fi
> +fi
>  if grep -q 'LaTeX Warning: You have requested' $basename.log
>  then
>  	grep -A 4 'LaTeX Warning: You have requested' $basename.log
> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
> index 358b6baf..17d833ad 100644
> --- a/utilities/runlatex.sh
> +++ b/utilities/runlatex.sh
> @@ -79,6 +79,16 @@ iterate_latex () {
>  	makeglossaries $basename > /dev/null 2>&1
>  	$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
>  	exitcode=$?
> +	ENCGUESS_CMD=`command -v encguess`
> +	if [ "x$ENCGUESS_CMD" != "x" ]
> +	then
> +		if encguess -s iso-8859-1 $basename.log | grep -q ISO-8859-1
> +		then
> +			mv $basename.log $basename-tmp.log
> +			iconv -f ISO-8859-1 -t UTF-8 $basename-tmp.log > $basename.log
> +			rm $basename-tmp.log
> +		fi
> +	fi
>  	if grep -q '! Emergency stop.' $basename.log
>  	then
>  		grep -B 10 -A 5 '! Emergency stop.' $basename.log
> 
> base-commit: a1bf2e61230301bfc12eba19abfc1c5a880f53be
> -- 
> 2.43.0
> 
