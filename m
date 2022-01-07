Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiAGPNj (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 7 Jan 2022 10:13:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CB7C061574
        for <perfbook@vger.kernel.org>; Fri,  7 Jan 2022 07:13:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE5C7B8262C
        for <perfbook@vger.kernel.org>; Fri,  7 Jan 2022 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641568416;
        bh=lteBlLPxj/Iqfa+BnYYdFsKAlaqOeCkkaZAkA5CVRBk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=H/1PVO9ge+AA5F6Wv3j8NJKJA559tjW0RU4j30BqtxpDLkQbejcnNVZi7lPNAE1Ci
         FcqzrMfFiCxt+FeUsqxrtCklkkLnW+Aq0KDNkDqd0qBRr3z7ST3ykS7q7PymOhVYDT
         D989S+I4JLtQOuDwxXpXtCfH86lEKG4zt6zuMm8gFFgcvpw7Inhjr/vzYry7iIJvIR
         9cTs8onf91pKGmvYnL4dR+fWqpanFFZseTi1Xo6Ntj9MYRqokCyzIg5RLaVOP4oT+M
         q+0ycY3h3ElTxdZ9BqWQ0pZKHZx6siqiLFd1efHJm0969huraPrhxYKMGXG1x5aMnO
         B14z8CkkiPTsw==
Date: Fri, 7 Jan 2022 07:13:35 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] punctcheck.pl: Fix false positive by
 stricter pattern for \acr{}
Message-ID: <20220107151335.GO4202@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <29dac258-de72-0b10-3778-4e34fe4005ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29dac258-de72-0b10-3778-4e34fe4005ce@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 07, 2022 at 12:48:37PM +0900, Akira Yokosawa wrote:
> A false positive in defer/rcuintro.tex by punctcheck.pl made
> Paul do a wrong band-aide change in commit 8e3364bead00
> ("defer/rcuintro: Fix ThomasEHart2006a punctuation issue.").
> 
> It was because the pattern "\{.+\}" matches all of
> "{qsbr}~\cite{ThomasEHart2006a}" and the script saw the
> sentence as if it ended with "\IXacrfst{}."
> 
> Silence the false positive by using a stricter pattern of
> "\{[^\}]+\}".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I was wondering about that.  ;-)

Queued, thank you!!!

							Thanx, Paul

> ---
>  utilities/punctcheck.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utilities/punctcheck.pl b/utilities/punctcheck.pl
> index 3488e5b6..7d23cc57 100755
> --- a/utilities/punctcheck.pl
> +++ b/utilities/punctcheck.pl
> @@ -62,7 +62,7 @@ sub check_line {
>  	$ng = 0;
>  	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:][\)\}\']*$/ ||
>  	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:]\\footnote/ ||
> -	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?(f|fst)?\{.+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ||
> +	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?(f|fst)?\{[^\}]+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ||
>  	    $line_raw =~ /\\[Cc]ref\{(cha|chp)\:app:[^\}]*\}[\.\?\!\:][\)\}\']*$/ ) {
>  	    $ng += 1;
>  	    if ($next_line =~ /^\s*$/ || $next_line =~ /^\s*%/ ||
> 
> base-commit: f21271f0939bb620a95b1bb3d76ac0259c4bb54c
> -- 
> 2.17.1
> 
