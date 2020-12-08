Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728981AbgLHUj1 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 8 Dec 2020 15:39:27 -0500
Date: Tue, 8 Dec 2020 10:41:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607452888;
        bh=F5hzrFIMrmZOTFzeu7l3uBn/KcgWCiv07to4XRkhqUg=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=XzyVBi+ew889d1GtditauFVU825u6bRjctVqEeodlV/U84f+TYIMbHHet5GGzZzgo
         UBv1zFeLYbZlA6aNOofxA4eoLNVq28Qgh36d5dK7IAWW5kpHbcIVD9mdK7ZdQb4GAc
         5+lqyAGNBE2IxJCAR6BnEr2HxQd4+ZZ4Ect9eygCzHan5qnG13odePUIQUj5/3aY4q
         XX882TgPprIPQpgsDwYTjCv4+JvuTZkToZTKYSQr3RSgF1B1xHKQMRrkc+kmQQLrcc
         bXGQFhjOv13PdmirU6PWCPuecuBa6HPg0B8ZqQHqRa2ceIXM9SJH9GDxd7vVHMc2QE
         DNkttxOz5YDqQ==
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v2] whymb: Fix typo in variable name
Message-ID: <20201208184128.GU2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <7e76cd30-1879-bdff-f693-e0671c8d77d4@gmail.com>
 <999131aa-68ff-8774-8172-d804dcde3cea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <999131aa-68ff-8774-8172-d804dcde3cea@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Motohiro Kanda <kanda.motohiro@gmail.com>, perfbook@vger.kernel.org

On Mon, Dec 07, 2020 at 07:40:26AM +0900, Akira Yokosawa wrote:
> >From ff659ff1a4927bf0ebfbe5a28a3edc208c688e2d Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 7 Dec 2020 07:36:07 +0900
> Subject: [PATCH -perfbook v2] whymb: Fix typo in variable name
> 
> It is the variable "b" that CPUs 1 and 2 observe in Listing C.3.
> This typo was pointed out by Motohiro in his Japanese translation [1].
> 
> [1]: https://sites.google.com/site/kandamotohiro/perfbook-d/perfbookappendixc
> 
> Also add a couple of nbsps ("CPU~1 and 2" -> "CPU~1 and~2").
> 
> Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> v1 -> v2: Add a couple of nbsps
> 
>  appendix/whymb/whymemorybarriers.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index e6c24f6e..1dae3fc5 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -1506,12 +1506,12 @@ All variables are initially zero.
>  
>  Note that neither CPU~1 nor CPU~2 can proceed to line~5 until they see
>  CPU~0's assignment to ``b'' on line~3.
> -Once CPU~1 and 2 have executed their memory barriers on line~4, they
> +Once CPU~1 and~2 have executed their memory barriers on line~4, they
>  are both guaranteed to see all assignments by CPU~0 preceding its memory
>  barrier on line~2.
> -Similarly, CPU~0's memory barrier on line~8 pairs with those of CPUs~1 and 2
> +Similarly, CPU~0's memory barrier on line~8 pairs with those of CPUs~1 and~2
>  on line~4, so that CPU~0 will not execute the assignment to ``e'' on
> -line~9 until after its assignment to ``a'' is visible to both of the
> +line~9 until after its assignment to ``b'' is visible to both of the
>  other CPUs.
>  Therefore, CPU~2's assertion on line~9 is guaranteed \emph{not} to fire.
>  
> -- 
> 2.17.1
> 
> 
