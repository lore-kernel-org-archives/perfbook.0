Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229645AbhFNEnu (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 14 Jun 2021 00:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623645708;
        bh=mKZl4w7fuGl0uWE1AfV8xLVHj1u+BYoHDAB4cr5/Nr0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=cfCw3MLPDBsjfc5qfBfWbznIOGP19XYESivUgowhSdxofpf28gUzuaDsgFZzCO6e/
         da4J6Ggr2Loy2P/0QckZyHvRF2lG8SCeEnH18Gd4LNr2vgPb3MCVgQNNmSodk8RAQF
         LkRO/8VrTo825+DKEyC4ZcZn9bqRn/CF1AQ8yGajFgYC5/bS3He7Odo1OT+tcJNz9I
         ITzXcE44c0dihBSs6bGdgv+gAqXzkm31b0iKM/SOrqEkGfJWnTTq9VNZXLELvhhEP+
         FI5neTOBm7AAzW99ydwJtYRnCpixDjGxZU9nQrftxOjNhZ5v22BFgsIHZtXO2urGXE
         2853g6p4S9L7Q==
Date: Sun, 13 Jun 2021 21:41:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] defer/rcuusage: Put path name of singleton
 get/set code snippets
Message-ID: <20210614044147.GQ4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <f3899671-ca23-631b-af10-cb20e0bf84d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3899671-ca23-631b-af10-cb20e0bf84d1@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jun 14, 2021 at 01:00:25PM +0900, Akira Yokosawa wrote:
> As Listing 9.20 shows set_config() as a whole, replace the reference
> to the line-count range with that to the Listing itself.
> Also adjust conjugation of verbs.
> 
> Fixes: 787eb4586767 ("defer/rcuusage: Add RCU space-time code and diagram")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> These patches are trivial fixes independent of the planned
> colon-related changes.

Good eyes on both patches, queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
>  defer/rcuusage.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 8e705ce4..b3d79d13 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -798,7 +798,7 @@ by the RCU singleton data structure illustrated in
>  \cref{fig:defer:Insertion With Concurrent Readers,fig:defer:Deletion With Concurrent Readers}.
>  This structure is defined on \clnrefrange{myconfig.b}{myconfig.e} of
>  \cref{lst:defer:Singleton Get}, and contains two integer fields,
> -\co{->a} and \co{->b}.
> +\co{->a} and \co{->b} (\path{singleton.c}).
>  The current instance of this structure is referenced by the \co{curconfig}
>  pointer defined on \clnref{myconfig.e}.
>  \end{fcvref}
> @@ -828,9 +828,9 @@ with each other.
>  \end{fcvref}
>  
>  \begin{fcvref}[ln:defer:singleton:set]
> -The structure is updated by the \co{set_config()} function shown on
> -\clnrefrange{set_config.b}{set_config.e}.
> -\Clnrefrange{allocinit.b}{allocinit.e} allocates and initializes a
> +The structure is updated by the \co{set_config()} function shown in
> +\cref{lst:defer:Singleton Set}.
> +\Clnrefrange{allocinit.b}{allocinit.e} allocate and initialize a
>  new \co{myconfig} structure.
>  \Clnref{xchg} atomically exchanges a pointer to this new structure
>  with the pointer to the old structure in \co{curconfig}, while also
> -- 
> 2.17.1
> 
