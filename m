Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbgLSAHn (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 18 Dec 2020 19:07:43 -0500
Date: Fri, 18 Dec 2020 16:07:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608336422;
        bh=HEkHSYMnZrxQMYm0ru/NmMYWGidqsn7xLoweu2NmzEs=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hDnoo8S40giyhjWf8JECAqhql8sjgaPJnnxUhZHjZRHwBveSWAwMxmP3bIy1VBuTe
         J1fTJOgmEUEyhqbJsck3lvcc5uVuyMq3vPCAoMe2CMhb2MLRIuFm7/bSbp+dZkM51z
         GWY19zf6a26rjRAVr/Ey2gqND2lr/EJ2l/oKHMHv2mcaL51izTet05cGWfjdCHFeu4
         aYRbhBwmxYb9fwcQPoe3S2J7D4NdoK651rj5+7sNimc4uGUyGinxAL9kgaYbYvshgG
         wdoRf7e0U4WUgDpFXExXqIVrjawoKhwzJPDNBq3Jnr5osN/I4GYdx2Sxk1GHs13wTU
         kpzLVSfQM2U/w==
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] bib/hw: Salvage link to OpenVMS ask_the_wizards
Message-ID: <20201219000702.GU2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <849b13f6-88b4-d3e6-d8ff-80eac7a14845@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <849b13f6-88b4-d3e6-d8ff-80eac7a14845@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Dec 19, 2020 at 08:26:50AM +0900, Akira Yokosawa wrote:
> >From 67fa2f09fc2e18af5894e407890d60d142d8b82d Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 19 Dec 2020 08:20:54 +0900
> Subject: [PATCH -perfbook] bib/hw: Salvage link to OpenVMS ask_the_wizards
> 
> This Q&A has been archived at www.digiater.nl and linked from
> VMS Software wiki at https://wiki.vmssoftware.com/Freeware_CD.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Nice!!!

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  bib/hw.bib | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/bib/hw.bib b/bib/hw.bib
> index b63b0622..aa9d818e 100644
> --- a/bib/hw.bib
> +++ b/bib/hw.bib
> @@ -290,9 +290,8 @@ System Programming",
>   Title="Shared Memory, Threads, Interprocess Communication",
>   month="August",
>   year="2001",
> - note="URL:
> -\nolinkurl{http://h71000.www7.hp.com/wizard/wiz_2637.html}
> -[broken, November 2020]",
> + note="Zipped archive: \path{wiz_2637.txt} in
> +\url{https://www.digiater.nl/openvms/freeware/v70/ask_the_wizard/wizard.zip}",
>  }
>  
>  @unpublished{MichaelCree2010AlphaLinux,
> -- 
> 2.17.1
> 
