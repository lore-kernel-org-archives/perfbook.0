Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjD3Aas (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 29 Apr 2023 20:30:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1ED172B
        for <perfbook@vger.kernel.org>; Sat, 29 Apr 2023 17:30:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 552E360AD1
        for <perfbook@vger.kernel.org>; Sun, 30 Apr 2023 00:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682814646;
        bh=V61xmKEpSkUibq8eo172+2ssepDkG9d394AzBmCvqLY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=OdpbZ8On2L8uk+bcjFLCUIDLwehIyUguguTgE7K+CJ56XmyESyY0XY9SxDyyuvHfn
         rMB1L4TK5QzVqMu5kgyzlomvFm0K5sIlJhg50vcvlKCLJ4SU0ibyJbCbJduFnfv3zM
         y19gsRGm7hSHmLKoqspWx/CFy7W9qunBzZTtSSX0YMVgg56NCnwuGm9/PxwFtJP+/o
         6daSfDKRH4cAX2OB3odv9r0ySc2q/FLvgEDks9pi7pbxWAC/4VzqLVaWJWFONUiu1G
         wvP1Wtckh8acNLyoQGpIqckZLFsm93klAUaeq7NoRgL0/f78NoS7mcMzv5D75xKilP
         pNAZU328QnWqQ==
Date: Sat, 29 Apr 2023 17:30:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 6/7] Tweak TOC width params
Message-ID: <3196be30-8052-42da-acb4-b25e683e3728@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
 <94bb1aaa-3a0c-3dfc-a698-86d96be68dbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94bb1aaa-3a0c-3dfc-a698-86d96be68dbc@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Apr 30, 2023 at 08:22:29AM +0900, Akira Yokosawa wrote:
> We now have Section 15.5.10, (five digits + two periods).
> Default of the book class can not afford that much digits in
> subsection count.
> Increase width parameters to accomodate it.
> 
> Also, as for -sf builds, the Helvetica clone font needs slightly
> wider spaces in the "em" unit.  Add settings for -sf builds.
> 
> Mention default widths in the comment block for future reference.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

And I also pulled in the rest of these patches, thank you!

Huh.  Maybe this is a hint that I should drop one of the CPU families.
Alpha and Itanium would be good candidates except for their historical
significance.  ARM7 and PowerPC are significant in being non-multicopy
atomic.  z Systems is significant in being fully multicopy atomic (as
opposed to merely other-multicopy atomic).  Armv8 and x86 are heavily
used.  MIPS appears to feed directly into LoongArch, which may prove to
be a candidate for addition, as might RISC-V.  That leaves SPARC.

But that means I would be removing one and adding two, so this patch
would still be required.

So it goes!  ;-)

							Thanx, Paul

> ---
>  perfbook-lt.tex | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index cdac9d495a3a..af5e0bf30032 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -158,11 +158,28 @@
>  \setboolean{indexhier}{true}
>  \newcommand{\IfIndexHier}[2]{\ifthenelse{\boolean{indexhier}}{#1}{#2}}
>  
> -% Widen pnumwidth in TOC for ebook size build (more than 1000 pages)
> +% Tweak width params of TOC
>  \makeatletter
> -\IfEbookSize{
> +\IfEbookSize{ % for ebook size build (more than 1000 pages)
>  \renewcommand*\@pnumwidth{2.2em}
>  }{}
> +% default params defined in book.sty:
> +%  width of chapter (two digits):			1.5em
> +%  indent of section:					1.5em
> +%  width of section (three digits + one periods):	2.3em
> +%  indent of subsection:	  			3.8em
> +%  width of subsection (four digits + two periods):	3.2em
> +\IfSansSerif{	% sans serif (Helvetica clone)
> +		%  to cover section "E.10" and subsection "15.5.10",
> +		%  width of section:      2.4em
> +		%  width of subsection:   3.7em
> +\renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.4em}}
> +\renewcommand*\l@subsection{\@dottedtocline{2}{3.9em}{3.7em}}
> +}{		% serif (Times Roman clone)
> +		%  to cover subsection "15.5.10",
> +		%  width of subsection:   3.4em
> +\renewcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.4em}}
> +}
>  \makeatother
>  
>  \IfEbookSize{
> -- 
> 2.25.1
> 
> 
