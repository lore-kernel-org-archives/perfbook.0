Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjCPSbF (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 16 Mar 2023 14:31:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8101B54D
        for <perfbook@vger.kernel.org>; Thu, 16 Mar 2023 11:31:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1854D620B8
        for <perfbook@vger.kernel.org>; Thu, 16 Mar 2023 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678991463;
        bh=tHyvx5Zb9MxRgyEWS5FcGZYucPb6b7Ye24jrAVJBqaI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=s8QdoOUeoIUyVXfqwlfqyfDWyw46aqw+sCtyNOq6h8aSHtnQBqs57E174NEVj2Aod
         06+nA1h/GJz41YrvCsfpdf4IkoHRIPrqCtJ37rDZdpyY+YgzLdIzRNvo7rgsf1LtuL
         UOoQfde0f/t75xdzPJ14NIuhuAwGgxLgWvx6J1/0JTR8+EQEpAyQdNDXu4KWj6yJZj
         HVaWBjmlJdZhHUmFl4QQCpEZcuKa/qqZ3A7zT6yIllWjOxP8UPuoF38VSUj12Hj4WW
         e2Wzrsu360llIHDsC22WO4YW2S/KI7M5dXZxNicFePapoiU9vGbGNHvajKNqFIWmbp
         MthvZTkubHVnQ==
Date: Thu, 16 Mar 2023 11:31:03 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] autodate.sh: Allow alternative name for sed
Message-ID: <5e819aae-2210-4b1f-8ab2-89fcd2af0a77@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <116f11cf-4763-0b74-10b4-b5c2074ae696@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <116f11cf-4763-0b74-10b4-b5c2074ae696@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Mar 16, 2023 at 09:26:18AM +0900, Akira Yokosawa wrote:
> It turns out that native sed on FreeBSD doesn't work well in
> autodate.sh. GNU compatible sed can be specified by make/shell
> variable SED.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed both, thank you!

							Thanx, Paul

> ---
>  utilities/autodate.sh | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index b1db0ec166d8..1efdbdee5290 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -28,6 +28,7 @@ qqzbg="false"
>  fn="autodate.tex"
>  
>  : ${DATE:=date}
> +: ${SED:=sed}
>  
>  # check if we have tcolorbox
>  tcolorbox_sty=`kpsewhich tcolorbox.sty`
> @@ -77,24 +78,24 @@ else
>  			esac
>  			case "$description" in
>  		Edition[.-][0-9]*)
> -			ednum="`echo $description | sed -e 's/^Edition[.-]\([0-9]*\).*$/\1/'`"
> +			ednum="`echo $description | $SED -e 's/^Edition[.-]\([0-9]*\).*$/\1/'`"
>  			release=`env printf '\\Ordinalstringnum{%s} %s' $ednum "$release"`
>  			;;
>  		esac
>  		case "$description" in
>  		*-rc[0-9]*)
> -			rc="`echo $description | sed -e 's/^.*-rc\(.*\)$/\1/'`"
> +			rc="`echo $description | $SED -e 's/^.*-rc\(.*\)$/\1/'`"
>  			release="$release, Release Candidate $rc"
>  			;;
>  		esac
>  		;;
>  		*)
>  			release=`env printf 'Tag: \\\texttt{%s}' "$description"`
> -			commitid=`echo $description | sed -e 's/.*-\(g.*\)/\1/'`
> +			commitid=`echo $description | $SED -e 's/.*-\(g.*\)/\1/'`
>  			;;
>  		esac
>  	else
> -		description=`git log --max-count=1 | head -n 1 | sed -e 's/^commit \([0-9a-f]\{12\}\).*$/g\1/'`
> +		description=`git log --max-count=1 | head -n 1 | $SED -e 's/^commit \([0-9a-f]\{12\}\).*$/g\1/'`
>  		release=`env printf 'Commit: \\\texttt{%s} (shallow clone)' "$description"`
>  		commitid="$description"
>  	fi
> @@ -125,7 +126,7 @@ env printf '\\newcommand{\\commitid}{%s}\n' $commitid$modified >> $fn
>  env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg >> $fn
>  
>  # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
> -tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
> +tcbversion=`grep ProvidesPackage $tcolorbox_sty | $SED -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
>  tcbold=4.39
>  env printf '%% tcolorbox version: %s\n' $tcbversion >> $fn
>  if [ $(echo $tcbversion $tcbold | awk '{if ($1 > $2) print 1;}') ] ;
> 
> base-commit: 71129aa0193b4cd29bc59ac6f5ee22982f20901b
> -- 
> 2.25.1
> 
