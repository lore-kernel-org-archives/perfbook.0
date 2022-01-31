Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiAaBzG (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 30 Jan 2022 20:55:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49906C061714
        for <perfbook@vger.kernel.org>; Sun, 30 Jan 2022 17:55:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 362F16117F
        for <perfbook@vger.kernel.org>; Mon, 31 Jan 2022 01:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643594104;
        bh=QFuUW2z6DoVloMHZhJ0iAklHkpJ/3Fq/EPlchjyZlJY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PoCOd5lW61OxdRcf7TIthIW4Z/LJ0zyIrRmwbOmRQ0KCBocFJT0WaQckcCBUmY4fE
         RZR5DGifel+lTg4+dE3lRffSvq8Z9vhCU+mJPwBcVcm5q3GubUWIW735NHFRp1AlHw
         1/4qhJfDy3kAD2JIvriRDIqbZWpmcTT6v3ni4TJPaXfw9V5hQM5xeBq9V7dyauuE5I
         Bb6/BJrMF2Hj+AL4SAAePxkD0+Y0eOl0IoTQ/r9Rt4Dq/Xc88rS7cHRTGESmq2StfC
         TG/aWrRozja3qaN38hZCu7VG6We/6hboBOkGOlM943EGzq6UZHzb3aEONGHcLhl/Oy
         8uFHHSUkf3Qaw==
Date: Sun, 30 Jan 2022 17:55:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] count: Fix typos
Message-ID: <20220131015504.GU4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220129221815.89451-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220129221815.89451-1-johann@jklaehn.de>
List-ID: <perfbook.vger.kernel.org>
To: Johann =?iso-8859-1?Q?Kl=E4hn?= <johann@jklaehn.de>
Cc: perfbook@vger.kernel.org

On Sat, Jan 29, 2022 at 11:18:15PM +0100, Johann Kl=E4hn wrote:
> Signed-off-by: Johann Kl=E4hn <johann@jklaehn.de>
> ---
> Hi Paul,
>=20
> I'm really enjoying the book and hope that I can contribute back a little=
 bit in
> the form of small fixes.  As this is my first patch to this list, please =
point
> out anything I could improve in the future (e.g., granularity of patches).

Queued and pushed, thank you!  I did take the liberty of changing your
added "can" to a "nevertheless".  Does that work for you?

							Thanx, Paul

> Thanks
> Johann
> ---
>  count/count.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/count/count.tex b/count/count.tex
> index d2b39904..f4e74c13 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -3237,7 +3237,7 @@ Summarizing the summary:
>  	\Cref{fig:count:Atomic Increment Scalability on x86}
>  	illustrates this point:
>  	Atomic increment might be completely acceptable for a two-CPU
> -	system, but be completely inadequate for an eight-CPU system.
> +	system, but can be completely inadequate for an eight-CPU system.
>  \end{enumerate}
> =20
>  \begin{figure}
> @@ -3251,7 +3251,7 @@ Summarizing still further, we have the ``big three'=
' methods of
>  increasing performance and scalability, namely
>  (1)~\emph{partitioning} over CPUs or threads,
>  (2)~\emph{batching} so that more work can be done by each expensive
> -synchronization operations, and
> +synchronization operation, and
>  (3)~\emph{weakening} synchronization operations where feasible.
>  As a rough rule of thumb, you should apply these methods in this order,
>  as was noted earlier in the discussion of
> --=20
> 2.34.1
>=20
