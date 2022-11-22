Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiKVBtR (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 21 Nov 2022 20:49:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E41252A1
        for <perfbook@vger.kernel.org>; Mon, 21 Nov 2022 17:49:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A718BB815DB
        for <perfbook@vger.kernel.org>; Tue, 22 Nov 2022 01:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669081753;
        bh=SbpGQOh43Rk4+jKoVROdwuzIEEHbQe50L7tf2S6uHpU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=kz0nBGzq9WaXKsh7IfuMPhrixrOt9dah6JlFXHBO+NsUMk6yNdwjLKa32URWCmc8G
         MNwdlj/naS8omw1nkOJA4Ca9Y7U4ieM0NHZ04KA2oLybABvpFX0pOKmoYXOBKlGp8L
         ZJQ7g9StvD0amYcICjn/gJHqof9HevbWFb6Ebt4ldZjx7n7D9D7aNH38403ayehrZ7
         fHRfQdAernDA4Nu80RqlKeJHLQGAGEV0EUQkbceXj7QFjEJYlrm2K77BRrePitet+5
         empaYsrrR21+C7yJBWkm2iEib0Akr3wsWfRgzHx8jHKJYNB6WFOzoOHvGwEWwUwlA8
         wlmmRjX/u0ulw==
Date: Mon, 21 Nov 2022 17:49:12 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Replace "egrep" with "grep -E" in scripts
Message-ID: <20221122014912.GA4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <8428d210-edd6-a08f-6851-1eb6cc925416@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8428d210-edd6-a08f-6851-1eb6cc925416@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Nov 21, 2022 at 11:49:36PM +0900, Akira Yokosawa wrote:
> In the NEWS section of grep 3.8 announce letter [1], there is a note
> which reads:
> 
>   ** Changes in behavior
>     ...
> 
>     The egrep and fgrep commands, which have been deprecated since
>     release 2.5.3 (2007), now warn that they are obsolescent and should
>     be replaced by grep -E and grep -F.
> 
> Replace "egrep" with "grep -E" in sh/bash scripts.
> 
> Note: There is no use of "fgrep" in perfbook tree.
> 
> Link: [1] https://lists.gnu.org/archive/html/info-gnu/2022-09/msg00001.html
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> Hi,
> 
> This change is prompted by Tiezhu Yang's patch updating a script of
> LKMM [2, 3].
> 
> [2] v1: https://lore.kernel.org/r/1668823998-28548-1-git-send-email-yangtiezhu@loongson.cn/
> [3] v2: https://lore.kernel.org/r/1669001138-12302-1-git-send-email-yangtiezhu@loongson.cn/
> 
>         Thanks, Akira
> --
>  CodeSamples/SMPdesign/maze/reduce.bash | 16 ++++++++--------
>  CodeSamples/defer/rcudelay.sh          |  2 +-
>  CodeSamples/defer/rcuscale.sh          |  2 +-
>  utilities/gitextractcontrib.sh         |  2 +-
>  4 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/CodeSamples/SMPdesign/maze/reduce.bash b/CodeSamples/SMPdesign/maze/reduce.bash
> index 40dbe2351e81..91eb58ea19b5 100644
> --- a/CodeSamples/SMPdesign/maze/reduce.bash
> +++ b/CodeSamples/SMPdesign/maze/reduce.bash
> @@ -31,9 +31,9 @@ scatter_file ()
>  	local i
>  	local j
>  
> -	for i in `ls | egrep '^[0-9]*$|^[0-9]*x[0-9]*$'`
> +	for i in `ls | grep -E '^[0-9]*$|^[0-9]*x[0-9]*$'`
>  	do
> -		for j in `ls $i/pct_* | egrep '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
> +		for j in `ls $i/pct_* | grep -E '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
>  		do
>  			ms=`echo $j | sed 's/\/pct_/\/ms_/'`
>  			mstail=`echo $ms | sed 's/^[0-9]*\///'`
> @@ -71,9 +71,9 @@ makecdf_file ()
>  	local i
>  	local j
>  
> -	for i in `ls | egrep '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
> +	for i in `ls | grep -E '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
>  	do
> -		for j in `ls $i/ms_* $i/pct_* | egrep '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
> +		for j in `ls $i/ms_* $i/pct_* | grep -E '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
>  		do
>  			makecdf $j
>  		done
> @@ -127,9 +127,9 @@ quantile_error_file ()
>  	local i
>  	local j
>  
> -	for i in `ls | egrep '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
> +	for i in `ls | grep -E '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
>  	do
> -		for j in `ls $i/ms_* $i/pct_* | egrep '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
> +		for j in `ls $i/ms_* $i/pct_* | grep -E '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
>  		do
>  			f=`echo $j | sed -e 's/^.*\///'`.quant
>  			touch $f
> @@ -158,9 +158,9 @@ average_file ()
>  	local i
>  	local j
>  
> -	for i in `ls | egrep '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
> +	for i in `ls | grep -E '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
>  	do
> -		for j in `ls $i/ms_* $i/pct_* | egrep '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
> +		for j in `ls $i/ms_* $i/pct_* | grep -E '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
>  		do
>  			f=`echo $j | sed -e 's/^.*\///'`.mean
>  			touch $f
> diff --git a/CodeSamples/defer/rcudelay.sh b/CodeSamples/defer/rcudelay.sh
> index 5296eab6947b..80b7b3470dbe 100644
> --- a/CodeSamples/defer/rcudelay.sh
> +++ b/CodeSamples/defer/rcudelay.sh
> @@ -98,7 +98,7 @@ do
>  				fi
>  			fi
>  			echo Run for $prim with $ncpus CPUs and delay $curdelay$fstr
> -			egrep '^Points: | reader duration:' $T
> +			grep -E '^Points: | reader duration:' $T
>  		done
>  		curdelay=`echo $curdelay | sed -e 's/5/10/' -e t -e 's/2/5/' -e t -e 's/1/2/'`
>  	done
> diff --git a/CodeSamples/defer/rcuscale.sh b/CodeSamples/defer/rcuscale.sh
> index 5c6588f464a1..295d760f3879 100644
> --- a/CodeSamples/defer/rcuscale.sh
> +++ b/CodeSamples/defer/rcuscale.sh
> @@ -93,7 +93,7 @@ do
>  			fi
>  		fi
>  		echo Run for $prim with $ncpus CPUs$fstr
> -		egrep '^Points: | reader duration:' $T
> +		grep -E '^Points: | reader duration:' $T
>  	done
>  	if ((ncpus >= 128))
>  	then
> diff --git a/utilities/gitextractcontrib.sh b/utilities/gitextractcontrib.sh
> index 4291c9fe8663..d4069138e47a 100644
> --- a/utilities/gitextractcontrib.sh
> +++ b/utilities/gitextractcontrib.sh
> @@ -23,7 +23,7 @@
>  #
>  # Authors: Paul E. McKenney <paulmck@kernel.org>
>  
> -git log $1 | egrep '^ *(Signed-off-by|Reported-by)' |
> +git log $1 | grep -E '^ *(Signed-off-by|Reported-by)' |
>  	sed -e 's/ *Signed-off-by: *//' -e 's/ *Reported-by: *//' |
>  	sort -u | grep -v "Paul E. McKenney" |
>  	sed -e 's/\([^<]*\)<\([^>]*\)>/\2 \1/' | sed -e 's/ *$//' |
> 
> base-commit: 64b2aa8513e974cfd9f53f744650617f1b9d66f4
> -- 
> 2.25.1
> 
