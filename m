Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:40482 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239984AbiBCBnA (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 2 Feb 2022 20:43:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5A724B832E4
        for <perfbook@vger.kernel.org>; Thu,  3 Feb 2022 01:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643852577;
        bh=+V6LPd4qHczPfwbLDLMcs3ylV+yUhoNF6bIB75jNtAA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=WrdpLYg4DrkJGNbJvfU/BMU56LQSPd+L/uyUb50Z1jK4DgtbniXyHaEdJ8YUgHCag
         03azr31PhASEuSF0JKvsDEWguEFb6ljtp4fHoGHNdf9vNXBwnsf/uEHp2WHhEv17sI
         Y0NaQS6MOLB2z3wI4+e5evjeO0wu21Qe/yuCxJyKdYM9Lq0Xc3lfdLwLSNBLxx0ZDk
         1NH2gH8VGEjTpk0ESeyOBNkMvN05jdT0LPF5BS21vA8uRhBjTSnjWerZLEU7ZZt7Fq
         br0xPrvT5fY6aVODUZNMiL9InPlpxtEnsnXcvGnGGos7nQRVjF3vsirIN6gzfiOFly
         BNNBInTQteMjg==
Date: Wed, 2 Feb 2022 17:42:57 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook 2/2] advsync: Fix call to free
Message-ID: <20220203014257.GP4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220202173345.49738-1-johann@jklaehn.de>
 <20220202173345.49738-2-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220202173345.49738-2-johann@jklaehn.de>
List-ID: <perfbook.vger.kernel.org>
To: Johann =?iso-8859-1?Q?Kl=E4hn?= <johann@jklaehn.de>
Cc: perfbook@vger.kernel.org

On Wed, Feb 02, 2022 at 06:33:45PM +0100, Johann Kl=E4hn wrote:
> Signed-off-by: Johann Kl=E4hn <johann@jklaehn.de>

Good eyes!

Both queued and pushed, thank you!

							Thanx, Paul

> ---
>  advsync/rt.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index ee0e7474..7b8af008 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -1947,7 +1947,7 @@ bool update_cal(short a, short b, short c)		\lnlbl[=
upd:b]
>  	if (old_p =3D=3D &default_cal)
>  		return true;
>  	synchronize_rcu();
> -	free(p);
> +	free(old_p);
>  	return true;
>  }							\lnlbl[upd:e]
>  \end{VerbatimL}
> --=20
> 2.34.1
>=20
