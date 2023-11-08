Return-Path: <perfbook-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE33CC4167D
	for <perfbook@archiver.kernel.org>; Wed,  8 Nov 2023 03:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjKHD4e (ORCPT <rfc822;perfbook@archiver.kernel.org>);
        Tue, 7 Nov 2023 22:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjKHD4e (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 7 Nov 2023 22:56:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD7710EB
        for <perfbook@vger.kernel.org>; Tue,  7 Nov 2023 19:56:32 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA725C433C8;
        Wed,  8 Nov 2023 03:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699415791;
        bh=BL3f/2ePAmZAI8U/lkLQeJzvc9RhZ17+7pawZVohU0w=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PQSgDNUfRjGRBzKVhuyA3YOpmLMxVsiEScCTjm9bTQia4dAV7L8BzKIUqc3owS4kM
         Tc9QlHqXfJUZXkawCgwz7EaLvFp0jyrE+kZTaYb52CsTxl3SOdQrKnqh9K2yTfdAGO
         P0X5e1nFaxzwbrqZmH12PVwoOh/lwzzbJvppwALzowP1n1ZTexO4bYYHv3ioxjru87
         Fyfy+395lnfTZhLyS3edY49mMlZPngIVZDwusQnAg7Mx4cjfLJ2JYtXkm/yKvhzI/9
         76mgtesjBIvm28W2d4tfMumw2eTfotADy4qK01XU79LqqknoS039oYM+0CdzPIMsNK
         VAFsCk9iOMOCA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 6AC96CE0906; Tue,  7 Nov 2023 19:56:30 -0800 (PST)
Date:   Tue, 7 Nov 2023 19:56:30 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] Load xcolor before loading newtxtext
Message-ID: <76299560-a2b3-4f8d-82b7-a4585fead94e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f306add5-cf32-4988-8fd2-21d25a944fdd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f306add5-cf32-4988-8fd2-21d25a944fdd@gmail.com>
Precedence: bulk
List-ID: <perfbook.vger.kernel.org>
X-Mailing-List: perfbook@vger.kernel.org

On Tue, Nov 07, 2023 at 05:35:34PM +0900, Akira Yokosawa wrote:
> newtxtext v1.73 loads xcolor for its new option called "supscolor"
> without any options.
> This conflicts with the later loading of xcolor with the option
> list of [table,svgnames].
> Resolve it by loading xcolor with our option list just before
> loading newtxtext.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Next Ubuntu LTS (24.04) will likely have newtxtext >= 1.73.
> Note that as of this writing, newtxtext v1.73 is not compatible
> with our -sf (sans-serif) builds.  This issue is expected to
> be fixed soon in v1.732 or higher.

Queued and pushed, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
>  perfbook-lt.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index cddff24f..8db77cb6 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -15,6 +15,7 @@
>  \usepackage[full]{textcomp} % use symbols in TS1 encoding
>  \usepackage{lmodern}
>  \usepackage[T1]{fontenc} % use postscript type 1 fonts
> +\usepackage[table,svgnames]{xcolor} % newtxtext v1.73 loads xcolor without options
>  \usepackage[defaultsups,helvratio=0.9]{newtxtext} % use nice, standard fonts for roman
>  
>  % Improves the text layout
> @@ -44,7 +45,6 @@
>  \setlist[sequence]{label*=\arabic*}
>  %\usepackage{enumerate}
>  \usepackage{ifthen}
> -\usepackage[table,svgnames]{xcolor}
>  \usepackage[shortcuts]{extdash}
>  \usepackage{changepage}
>  \usepackage{listings}
> 
> base-commit: 6e4fc392e080383f29b6eac5fc2e94ef7ec13876
> -- 
> 2.34.1
> 
