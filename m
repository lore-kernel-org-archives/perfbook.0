Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:47330 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242176AbiBAUid (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 1 Feb 2022 15:38:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 81DAA61663
        for <perfbook@vger.kernel.org>; Tue,  1 Feb 2022 20:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643747913;
        bh=1OfuWMFi0/NWBwP+ffY1HN9Q2tf4PBVs7Hjw6hXyhpg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=a3lTSyi7uS4ydIG2Ii1942QjTkPOqmVurbuHydZnlFB2bcLJ/kd6k7Tv5Qlj5dvnK
         Hxb8Zyy3Fej0r1YwY4Ov8fddRobTODuXQG3RlbaKnIMtXBbgbFrhLIaVA5bakSw3OQ
         6ZTUdV+ywZqWHZQw6gt8Yow06Hlj/V/xOOrL6JRXh7uP1DpLe6MUOcgkuG2A8FyBQq
         eXpEU45rSn5JfQAbtX40vbJshIQwrGokd/HSqxMQ+DuFcB/3BCR6IjX94hUwj9pJJD
         +ASoke15g68yXyWTCsrVFCesiZi+5rCfwFBkYVpgT8KgLbdVVT6C/45DSSgTPlrh2p
         XhFYUO65Svytg==
Date: Tue, 1 Feb 2022 12:38:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook 4/4] glossary: Use more common definition of RAII
Message-ID: <20220201203832.GG4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220201200751.23589-1-johann@jklaehn.de>
 <20220201200751.23589-4-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220201200751.23589-4-johann@jklaehn.de>
List-ID: <perfbook.vger.kernel.org>
To: Johann =?iso-8859-1?Q?Kl=E4hn?= <johann@jklaehn.de>
Cc: perfbook@vger.kernel.org

On Tue, Feb 01, 2022 at 09:07:51PM +0100, Johann Kl=E4hn wrote:
> Cf. https://en.cppreference.com/w/cpp/language/raii or
> https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization.
>=20
> Signed-off-by: Johann Kl=E4hn <johann@jklaehn.de>

Huh.  I definitely remember it being "resource allocation is
initialization".  And I do see older uses of "allocation" rather than
"acquisition".  Perhaps it changed once RAII locking entered the picture.

Might as well keep up with the times.  ;-)

I took all but the hazptr change.  I am not necessarily opposed to that
one, but I did want to check whether you had built and tested it.

Thank you!!!

							Thanx, Paul

> ---
>  glsdict.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/glsdict.tex b/glsdict.tex
> index 194f364d..d1468859 100644
> --- a/glsdict.tex
> +++ b/glsdict.tex
> @@ -237,8 +237,8 @@
>  \newacronym{numa}{NUMA}{non-uniform memory architecture}
>  \newacronym{qsbr}{QSBR}{quiescent-state-based reclamation}
>  \newabbreviation{qsbr:m}{QSBR}{quiescent-state-based-reclamation}
> -\newacronym{raii}{RAII}{resource allocation is initialization}
> -\newabbreviation{raii:m}{RAII}{resource-allocation-is-initialization}
> +\newacronym{raii}{RAII}{resource acquisition is initialization}
> +\newabbreviation{raii:m}{RAII}{resource-acquisition-is-initialization}
>  \newacronym{rcu}{RCU}{read-copy update}
>  \newacronym{smp}{SMP}{symmetric multiprocessing}
>  \newabbreviation{smp:m}{SMP}{symmetric-multiprocessing}
> --=20
> 2.34.1
>=20
