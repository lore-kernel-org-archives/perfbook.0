Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:36608 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379577AbiAaVZV (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 31 Jan 2022 16:25:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A54C6157A
        for <perfbook@vger.kernel.org>; Mon, 31 Jan 2022 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643664320;
        bh=m2EIawlj8i4wfdK+r0FxjOHmC7PjM8z93Sz2Vu/2clc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=frC9AbtKb+BMuVT76yeX/L/NytCuKlCdEADq/phSEgn2Sdmo5q3en0jePjDqEJOY2
         CWTVqvd82W6cETRCOr9OMpBHR+xwj9gymCEKS2n9TYfKMeOpavJitfJTutPd9fjiud
         dyRNXaSMfRVOEjqG3WKuFh0kpHRenAYbGue1iHc3LYSeeE1ySv9QpfeG7GaZzRS8Gu
         5BIXEOZ2y4vWDR9luHiM8xiWgh2p13xyshPH+KCmgyQWXZkMibT1zHhyX3XiYkq3AL
         VhRTLB0F9Mp13S5vMKxPouS08gFBTJvr0cjqrtH1/OTSP3onJd3Ykf9olCUrYvOjJt
         pH8g2XUN9Yv2A==
Date: Mon, 31 Jan 2022 13:25:20 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook 3/3] toolsoftrade: Fix reference to concept
 introduced earlier
Message-ID: <20220131212520.GV4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220131192826.140138-1-johann@jklaehn.de>
 <20220131192826.140138-3-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220131192826.140138-3-johann@jklaehn.de>
List-ID: <perfbook.vger.kernel.org>
To: Johann =?iso-8859-1?Q?Kl=E4hn?= <johann@jklaehn.de>
Cc: perfbook@vger.kernel.org

On Mon, Jan 31, 2022 at 08:28:26PM +0100, Johann Kl=E4hn wrote:
> The corresponding section starts ~150 lines earlier in the same file.
>=20
> Signed-off-by: Johann Kl=E4hn <johann@jklaehn.de>

Good eyes!

I queued and pushed all three, with a slight adjustment to this one.

Thoughts?

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index d2117fde..440bcb04 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1309,8 +1309,8 @@ the like.
> =20
>  The \apipf{for_each_thread()} macro loops through all threads that exist,
>  including all threads that \emph{would} exist if created.
> -This macro is useful for handling per-thread variables as will be
> -seen in \cref{sec:toolsoftrade:Per-Thread Variables}.
> +This macro is useful for handling per-thread variables as
> +introduced in \cref{sec:toolsoftrade:Per-Thread Variables}.
> =20
>  \subsubsection{\tco{for_each_running_thread()}}
> =20
> --=20
> 2.34.1
>=20
