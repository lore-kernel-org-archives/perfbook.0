Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731467AbgFOUVr (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 15 Jun 2020 16:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592252506;
        bh=kF0iwOfpKmwP9Ux7M8n7WF86+nfDPzsp+J+WawNCUdQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=eC3OTgiPvtkc3UK4M1GwDgniea8bxenXubPpm7L/dMm1HHzUZG28WscMRKQetN/y3
         5SOeSIblEaaap9U9x7JkyIICfk3pX+ZlcHnyjOazXgPR/fZi68Cu4mZdrRNunZbhJW
         ucdDNwBxIQuACGkHsxCXwJF6tfNcGAGnRFDcxoYI=
Date: Mon, 15 Jun 2020 13:21:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] bib/RCU: Use short-cut URL of git.kernel.org/linus/
Message-ID: <20200615202146.GM2723@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <277f0200-992e-7ebb-5389-418859f0f90e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <277f0200-992e-7ebb-5389-418859f0f90e@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jun 16, 2020 at 12:11:37AM +0900, Akira Yokosawa wrote:
> >From c03e0aa0d7a8ad1b561f5069bbd963457f9561ea Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 14 Jun 2020 13:29:07 +0900
> Subject: [PATCH 1/2] bib/RCU: Use short-cut URL of git.kernel.org/linus/

Applied and pushed both, thank you!

And yes, the bar chart does look better than the tables.  ;-)

							Thanx, Paul

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  bib/RCU.bib | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/bib/RCU.bib b/bib/RCU.bib
> index f3474b6e..f3aefda7 100644
> --- a/bib/RCU.bib
> +++ b/bib/RCU.bib
> @@ -1280,7 +1280,7 @@ Revised:
>   day="17",
>   year="2007",
>   note="Git commit:
> -\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=97b430320ce7}",
> +\url{https://git.kernel.org/linus/97b430320ce7}",
>   lastchecked="December 17, 2017",
>  }
>  
> @@ -1364,7 +1364,7 @@ lot of {Linux} into your technology!!!",
>   day="19",
>   year="2008",
>   note="Git commit:
> -\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ae66be9b71b1}",
> +\url{https://git.kernel.org/linus/ae66be9b71b1}",
>   lastchecked="April 6, 2019",
>  }
>  
> @@ -1386,7 +1386,7 @@ lot of {Linux} into your technology!!!",
>   day="12",
>   year="2008",
>   note="Git commit:
> -\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d7c0651390b6}",
> +\url{https://git.kernel.org/linus/d7c0651390b6}",
>   lastchecked="April 6, 2019",
>  }
>  
> @@ -1409,7 +1409,7 @@ lot of {Linux} into your technology!!!",
>   day="11",
>   year="2008",
>   note="Git commit:
> -\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c3cdc1f83a6}",
> +\url{https://git.kernel.org/linus/9c3cdc1f83a6}",
>   lastchecked="December 17, 2017",
>  }
>  
> @@ -1496,7 +1496,7 @@ lot of {Linux} into your technology!!!",
>   day="18",
>   year="2008",
>   note="Git commit:
> -\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=64db4cfff99c}",
> +\url{https://git.kernel.org/linus/64db4cfff99c}",
>   lastchecked="April 15, 2019",
>  }
>  
> @@ -3130,7 +3130,7 @@ Andrew Hunter and Geoffrey Romer and Lance Roy",
>   day="27",
>   year="2017",
>   note="Git commit:
> -\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b899a850431e}",
> +\url{https://git.kernel.org/linus/b899a850431e}",
>   lastchecked="December 17, 2017",
>  }
>  
> -- 
> 2.17.1
> 
