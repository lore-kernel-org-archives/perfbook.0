Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229583AbhCTELS (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 20 Mar 2021 00:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616213477;
        bh=+6KhAWI8wkJMgiyCoaHmRgEcjRdxoo2raAANcXOU6eg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JFAqLvujhUOVVzbmdKIB304YDx4aRKJuENLuufpL9jjPEzhrC9ageCIfmFqgpB8OA
         hyjINPOIPgO7Pm/hY1MGYoBfJR1L2WwauBkQFvICQmDAdg48UlOtqRIYZ5whHJY9kk
         8jEy1YFqhVPjHBGffqvGwOZM4mL7e06fO84Fh+xwAnLjqjdNtaUnDUdB5m86/votNA
         eAXtWLzoHkWFN08bFtGMrFY6/ASVUQ8X3qun8iAlvwU7XDFG1Ti7OcITJo9f1ACVAd
         dxRCKY8BYEbqK4KzGMgkeRhUqBRLlBx0zCrmosnCcibNep0wtpZ/Fqmnjx7+H46glI
         2QIKJ1dn9n2pg==
Date: Fri, 19 Mar 2021 21:11:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Possible update candidate in whymb
Message-ID: <20210320041117.GY2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <aaa92b9c-2d25-df1c-8229-64b3fb06ab53@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaa92b9c-2d25-df1c-8229-64b3fb06ab53@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 20, 2021 at 11:23:36AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> In Appendix C, which you have not updated for a while,
> there is a statement made in commit bb869fd89bfd ("Add
> caution about cache coherence and I/O for new-to-SMP
> architectures") more than a decade ago, which might
> be an update candidate.
> 
> Thoughts?
> 
>         Thanks, Akira
> 
> ------
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index 868758a4..284d48f4 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -1639,7 +1639,7 @@ future such problems:
>         It is my painful duty to inform you that as embedded systems
>         move to multicore architectures, we will no doubt see a fair
>         number of such problems arise.
> -       Hopefully these problems will clear up by the year 2015.
> +       Hopefully these problems will clear up by the year 202x.

Good catch!  I queued the commit shown below.

							Thanx, Paul

------------------------------------------------------------------------

commit bd77de3dd7a09e189cda3c6da75628da7fbd4d88
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Fri Mar 19 21:06:56 2021 -0700

    whymb: Fix outdated date
    
    The year 2015 is no longer in the future.
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 868758a..dc9bd04 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1639,7 +1639,10 @@ future such problems:
 	It is my painful duty to inform you that as embedded systems
 	move to multicore architectures, we will no doubt see a fair
 	number of such problems arise.
-	Hopefully these problems will clear up by the year 2015.
+	By the year 2021, there were some efforts to address
+	these problems with new interconnect standards, with some
+	debate as to how effective these standards will really
+	be~\cite{WilliamGWong2019CCIX-CXL}.
 
 \item	Device interrupts that ignore cache coherence.
 
