Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjAZByd (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 25 Jan 2023 20:54:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1570D5D11B
        for <perfbook@vger.kernel.org>; Wed, 25 Jan 2023 17:54:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4A30615B8
        for <perfbook@vger.kernel.org>; Thu, 26 Jan 2023 01:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674698072;
        bh=GDKpB5buo3pZBbLiln73BpXSYEU59Vis7I48h1m7OnU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=swTK3FP9flJwe46eaZJeCN6ghbUCjkguv48+sOHftAGOD62psY9ZkAFVS6/ihUJsW
         lLiaPp7hCH2enWr5je8loYxXA6GkYCyjOJfWD0wTZZ0IGG0hCBvIpJ8JR1BGDUIYjJ
         bESCnfTkwDXkDkWDyDq2onmLxaz2zCgaJy1gifdKRXgPsOG3h1wH7o5QcjR4PI7aL0
         GOGkYSEjrvCu3ArHreUcWy9pj55nz7Op3FRcQQMMUBRn5LN9hugkpz88EPj8lqmdq4
         Md7Hkvq3d3ebL157ajzzVO40UTXfp9Nz/US+hDPQ/2jnzm4QEWbrZZjdikUdr4zSef
         2AbWEXnbXrB9A==
Date: Wed, 25 Jan 2023 17:54:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] run{first}latex.sh: Set default of LATEX
 variable properly
Message-ID: <20230126015431.GY2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <48517b40-a485-d48d-eb95-6dce2c20010b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48517b40-a485-d48d-eb95-6dce2c20010b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 26, 2023 at 09:23:26AM +0900, Akira Yokosawa wrote:
> The default of "pdflatex" has never worked as expected.
> When these scripts run under Makefile's control, they are
> given "LATEX=pdflatex" by default, and work just fine.
> 
> When directly invoked from command line:
> 
>     $ sh utilities/runfirstlatex.sh perfbook
> 
> , it runs with LATEX="" and ends up in one of various errors.
> 
> Fix this by using the right pattern of ":=".
> 
> Fixes: 241d5350b162 ("run{first}latex.sh: Use variable for 'pdflatex' command")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  utilities/runfirstlatex.sh | 2 +-
>  utilities/runlatex.sh      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
> index b92895f332ca..f12f14886747 100644
> --- a/utilities/runfirstlatex.sh
> +++ b/utilities/runfirstlatex.sh
> @@ -67,7 +67,7 @@ fi
>  
>  basename=`echo $1 | sed -e 's/\.tex$//'`
>  
> -: ${LATEX:-pdflatex}
> +: ${LATEX:=pdflatex}
>  
>  echo "$LATEX 1 for $basename.pdf"
>  $LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
> index d4c9baf8740a..e23bc87ba978 100644
> --- a/utilities/runlatex.sh
> +++ b/utilities/runlatex.sh
> @@ -29,7 +29,7 @@
>  # Authors: Paul E. McKenney <paulmck@us.ibm.com>
>  #          Akira Yokosawa <akiyks@gmail.com>
>  
> -: ${LATEX:-pdflatex}
> +: ${LATEX:=pdflatex}
>  
>  diff_warning () {
>  	if diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
> 
> base-commit: 685184dff46ffdec02b7402a36b06359cb085f29
> -- 
> 2.25.1
> 
