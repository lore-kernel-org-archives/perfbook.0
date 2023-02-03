Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233312AbjBCQrT (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 3 Feb 2023 11:47:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D4F69532
        for <perfbook@vger.kernel.org>; Fri,  3 Feb 2023 08:47:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 72A7161F87
        for <perfbook@vger.kernel.org>; Fri,  3 Feb 2023 16:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675442836;
        bh=/OQHcIkpOOWJRplCii+qDlFHvp6UQ+ebGori29cMQ0Y=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qqSaZ0mohPabvOmy0MFUQUWlQCo5yp5DfmsxQ/j8ya5wgTV8b7w8B4/ZUvY+2nud3
         MELZQwbE6UjNgHGOxAoCS3oYHjyaYSnAW8Dw3wEV7QVWE6OxZf04sLrsBbSagoVgpJ
         tVP1JbV8TSZWrrE5olM9/UIvkGCgaxtMBthX8zZjBoqt5CVI7sPSF6CBEnkl5Pn9vZ
         QgkyTnGfSKonQMvjGPenSQW0ugiWBkV1XKk0fgAin2m/cO3UgAdn4Q4PNC4pnT6K5N
         44aRpbUMk2rzgTmqLC1hVkeGyaZpmlBWARhroMReOpNGCAiVjBZjsvY6g4FCCakDSC
         pNkHDca/ebyug==
Date: Fri, 3 Feb 2023 08:47:16 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] autodate.sh: Add graceful fallback of
 commitid-only mode for shallow clone
Message-ID: <20230203164716.GJ2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <5011ac44-402f-5185-bb62-0d2ac908da5e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5011ac44-402f-5185-bb62-0d2ac908da5e@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Sat, Feb 04, 2023 at 12:23:25AM +0900, Akira Yokosawa wrote:
> Under shallow clone of perfbook repo, "git describe" can't work.
> Catch the error and use "git log" to obtain the commit id instead.
> 
> Following is the comparison of autodate.tex. 
> 
> Before:
> 
>     \date{February 3, 2023 \\ Tag: \texttt{} }
>     \newcommand{\commityear}{2023}
>     \newcommand{\commitid}{}
>     \IfQqzBg{}{\setboolean{qqzbg}{false}}
>     % tcolorbox version: 5.1
>     \tcbsetforeverylayer{autoparskip}
> 
> After:
> 
>     \date{February 3, 2023 \\ Commit: \texttt{g25bd138c30bf} (shallow clone) }
>     \newcommand{\commityear}{2023}
>     \newcommand{\commitid}{g25bd138c30bf}
>     \IfQqzBg{}{\setboolean{qqzbg}{false}}
>     % tcolorbox version: 5.1
>     \tcbsetforeverylayer{autoparskip}
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Leonardo Bras <leobras.c@gmail.com>

Thank you, Akira, and I have queued this.

Leonardo, could you please check to see whether this works for you in
your particular environment?  If it does, please include something
like this in your reply:

Tested-by: Leonardo Bras <leobras.c@gmail.com>

							Thanx, Paul

> ---
>  utilities/autodate.sh | 54 ++++++++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index e33c254d917f..6d10b5d7d2b4 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -52,27 +52,28 @@ else
>  	else
>  		modified=""
>  	fi
> -	description="`git describe --tags HEAD`"
> -	case "$description" in
> -	*-g*)
> -		release=`env printf 'Commit: \\\texttt{%s}' "$description"`
> -		commitid="$description"
> -		;;
> -	v*)
> -		release="Release $description"
> -		commitid=$description
> -		qqzbg="true"
> -		;;
> -	Edition*)
> -		release="Edition"
> -		commitid=$description
> -		qqzbg="true"
> +	if description="`git describe --tags HEAD 2> /dev/null`"
> +	then
>  		case "$description" in
> -		*P*)
> -			release="Print $release"
> +		*-g*)
> +			release=`env printf 'Commit: \\\texttt{%s}' "$description"`
> +			commitid="$description"
>  			;;
> -		esac
> -		case "$description" in
> +		v*)
> +			release="Release $description"
> +			commitid=$description
> +			qqzbg="true"
> +			;;
> +		Edition*)
> +			release="Edition"
> +			commitid=$description
> +			qqzbg="true"
> +			case "$description" in
> +			*P*)
> +				release="Print $release"
> +				;;
> +			esac
> +			case "$description" in
>  		Edition[.-][0-9]*)
>  			ednum="`echo $description | sed -e 's/^Edition[.-]\([0-9]*\).*$/\1/'`"
>  			release=`env printf '\\Ordinalstringnum{%s} %s' $ednum "$release"`
> @@ -85,11 +86,16 @@ else
>  			;;
>  		esac
>  		;;
> -	*)
> -		release=`env printf 'Tag: \\\texttt{%s}' "$description"`
> -		commitid=`echo $description | sed -e 's/.*-\(g.*\)/\1/'`
> -		;;
> -	esac
> +		*)
> +			release=`env printf 'Tag: \\\texttt{%s}' "$description"`
> +			commitid=`echo $description | sed -e 's/.*-\(g.*\)/\1/'`
> +			;;
> +		esac
> +	else
> +		description=`git log --max-count=1 | head -n 1 | sed -e 's/^commit \([0-9a-f]\{12\}\).*$/g\1/'`
> +		release=`env printf 'Commit: \\\texttt{%s} (shallow clone)' "$description"`
> +		commitid="$description"
> +	fi
>  fi
>  month=`date --date="$date_str" +%B`
>  year=`date --date="$date_str" +%Y`
> 
> base-commit: 3bfa0a092334e3a82bf75217b01d500ad78b6dc5
> -- 
> 2.25.1
> 
