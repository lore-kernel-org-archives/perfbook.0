Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230518AbhECQYD (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 3 May 2021 12:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620058990;
        bh=5x7YrAiaZzBlpjWmGQm0W5xexOcYn7RwcOSXclQOD+o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PvenAC/wFK56S+X3xa9tmegakAqMY7ZV4TuXrjaltYF5YnNe/049dq8eGHxCsAWTI
         bsBJo4WQNUX6fuDsgBDHsMqKW2d3MceLhKAlstTZ5Ga6RhennfkYcw8RzVWKFC3vR3
         tYU/kSqrrNj1D1DDcFrwBKqZvvgGh3hiHJlN5Ng5QAH0EkbJTWiZr36kLiwdzRn15X
         ye+/l0CvDIJvnPCueZj1DGqFm9nIgxRdM7lfIxDGrOxRihDkyr2nsVOItoTlGjTDg7
         3QGvEdQ+GUQGAM4UBOZSY1EnR9to9+NKh0qkpUdwbjd5gDBaRhmkhy/ldC/BOkKGlg
         GXmfXCQv65v8g==
Date: Mon, 3 May 2021 09:23:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v4] utilities/autodate.sh: Fix potential
 hung-up on missing tcolorbox
Message-ID: <20210503162310.GU975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
 <782c56e7-59ac-609f-261f-2aaefedbe1bf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <782c56e7-59ac-609f-261f-2aaefedbe1bf@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, May 03, 2021 at 09:47:18AM +0900, Akira Yokosawa wrote:
> "kpsewhich tcolorbox.sty" can be empty if tcolorbox is not
> available.
> 
> If this is the case, "grep" in `grep ProvidePackage | sed ...`
> will wait forever.
> 
> Add existence check of tcolorbox early in the script and error-exit.
> 
> To prevent empty autodate.tex from left behind, modify the behavior
> of the script so that it doesn't rely on the redirection in Makefile.
> 
> Fixes: b2f19231bcc5 ("utilities/autodate.sh: Make newer tcolorbox behave as before")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> Changes since v3:
> 
> o Fix typo of "See See" in the error message.
> o Move existence check of tcolorbox to the beginning.
> o Use redirection in the script, not in the Makefile
> 
> Change since v2:
> 
> o Refer to #5 in FAQ-BUILD.txt, as tcolorbox is not a font package.
> 
> Change since v1:
> 
> o Fix string comparison operator of shell script ("=").
> 
> --
>  Makefile              |  2 +-
>  utilities/autodate.sh | 24 ++++++++++++++++--------
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index dc6b68e0..b23a7096 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -234,7 +234,7 @@ endif
>  autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) \
>      $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
>      $(GITREFSTAGS) utilities/autodate.sh
> -	sh utilities/autodate.sh >autodate.tex
> +	sh utilities/autodate.sh
>  
>  perfbook_flat.tex: autodate.tex
>  ifndef LATEXPAND
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index 7bd7cbb8..e33c254d 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -19,12 +19,21 @@
>  # along with this program; if not, you can access it online at
>  # http://www.gnu.org/licenses/gpl-2.0.html.
>  #
> -# Copyright (C) Akira Yokosawa, 2017--2020
> +# Copyright (C) Akira Yokosawa, 2017--2021
>  #
>  # Authors: Akira Yokosawa <akiyks@gmail.com>
>  
>  export LC_TIME=C
>  qqzbg="false"
> +fn="autodate.tex"
> +
> +# check if we have tcolorbox
> +tcolorbox_sty=`kpsewhich tcolorbox.sty`
> +if [ "$tcolorbox_sty" = "" ]
> +then
> +	echo "Error: package 'tcolorbox' not found. See #5 in FAQ-BUILD.txt." >&2
> +	exit 1
> +fi
>  
>  # check if we are in git repository
>  if ! test -e .git
> @@ -90,17 +99,16 @@ then
>  	release=`env printf '%s %s' '\\\\' "$release"`
>  fi
>  
> -env printf '\\date{%s %s, %s %s %s}\n' $month $day $year "$release" $modified
> -env printf '\\newcommand{\\commityear}{%s}\n' $year
> -env printf '\\newcommand{\\commitid}{%s}\n' $commitid$modified
> -env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
> +env printf '\\date{%s %s, %s %s %s}\n' $month $day $year "$release" $modified > $fn
> +env printf '\\newcommand{\\commityear}{%s}\n' $year >> $fn
> +env printf '\\newcommand{\\commitid}{%s}\n' $commitid$modified >> $fn
> +env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg >> $fn
>  
>  # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
> -tcolorbox_sty=`kpsewhich tcolorbox.sty`
>  tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
>  tcbold=4.39
> -env printf '%% tcolorbox version: %s\n' $tcbversion
> +env printf '%% tcolorbox version: %s\n' $tcbversion >> $fn
>  if [ $(echo $tcbversion $tcbold | awk '{if ($1 > $2) print 1;}') ] ;
>  then
> -	env printf '\\tcbsetforeverylayer{autoparskip}\n';
> +	env printf '\\tcbsetforeverylayer{autoparskip}\n' >> $fn
>  fi
> -- 
> 2.17.1
> 
> 
