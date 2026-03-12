Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C81E22E9
	for <perfbook@vger.kernel.org>; Thu, 12 Mar 2026 02:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773280846; cv=none; b=LRfX2b6DHghne8ZBhAmK7bz+/5BXOfp/CyZ3PG6ALP5xSQrA99iWhDSr1X3JWfyllqEMSZuX3DQniS6BXs5aC78XsrCRaxsiv94y8guI4+y+pIwUfTnjyr4w2l0/Hij9qve2pseI2pbXB/bXoGOUGPqWkVrQips7PGYyq5ih7mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773280846; c=relaxed/simple;
	bh=bNPj34cQyDDyHLqrhiDhBLKOb9Yhl2tKuYYd8gnxe6s=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=rs4QAQHljmu7TAv4hzto6lEzFLJG/261yiVDk0V7PHcExYO+5N9dQjR4ymD0V5pP5bJo6BXtc8zHeUyoajKYXG6LbYEQ9VAOxwhAsYBUWCvLBz/Jliwyu4csaBSbVIKODNPt5gbCKjOFaLucm/rU97puJAjpjwh6Gf5cge2ZsIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Hptio/g/; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Hptio/g/"
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773280841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eprCh4UIYFRWdp4vZAFN6w3VQwLTtuYNm3K86gVeMUA=;
	b=Hptio/g/2KQLWpOGO2jtL0lirSsJxY7xMkgg8wJolyuCJ/E66SEQCUql5bxUS5+4T6Afml
	C0PvjIGM7OFsxPlk1SWvcm14dAeua6lfGpkrqQaRTViOZu9vSq35M6qxQLx2102IU06OBX
	QRBRIFQVQjKg3iuOR/STF2kQ5mTKvCM=
Date: Thu, 12 Mar 2026 02:00:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <f23e0457d77d509a58fd9ee6e4bef5aa7feed4cb@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] memorder: Reconcile Figure 15.15 notation with W+RWC
 z-flow semantics
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
In-Reply-To: <15acbc05-3b54-4d9e-8a74-f763a990ba3f@paulmck-laptop>
References: <20260311084813.969200-1-kunwu.chan@linux.dev>
 <15acbc05-3b54-4d9e-8a74-f763a990ba3f@paulmck-laptop>
X-Migadu-Flow: FLOW_OUT

March 11, 2026 at 10:39 PM, "Paul E. McKenney" <paulmck@kernel.org mailto=
:paulmck@kernel.org?to=3D%22Paul%20E.%20McKenney%22%20%3Cpaulmck%40kernel=
.org%3E > wrote:


>=20
>=20On Wed, Mar 11, 2026 at 04:48:13PM +0800, Kunwu Chan wrote:
>=20
>=20>=20
>=20> State explicitly that Figure 15.15 uses x as a schematic variable n=
ame, while the surrounding W+RWC analysis in Listing 15.18 follows the co=
ncrete z-flow (P2 -> z -> P1). This eliminates notation drift across cros=
s-references and preserves propagation-argument fidelity.
> >=20=20
>=20>  Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
> >=20
>=20Again, good eyes, and thank you! I queued and pushed all three, and
> added a fourth commit that converted this to a footnote and mentioned
> both variables and the listing, shown below. Please check it to make
> sure that I have not messed something up.
>=20
>=20 Thanx, Paul
>=20
Hi=20Paul,
Checked =E2=80=94 LGTM.
The footnote conversion is the right call. It cleanly resolves=20
the=20Figure 15.15 x vs. W+RWC z notation mismatch.
Thanks for landing this promptly.

Best, Kunwu

> >=20
>=20> ---
> >  memorder/memorder.tex | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20=20
>=20>  diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> >  index 2357e7ea..8eb14a29 100644
> >  --- a/memorder/memorder.tex
> >  +++ b/memorder/memorder.tex
> >  @@ -2760,6 +2760,8 @@ that \co{P1()}'s read from \co{z} happens much=
 later in time, but
> >  nevertheless still sees the old value of zero.
> >  This situation is depicted in
> >  \cref{fig:memorder:Load-to-Store is Counter-Temporal}:
> >  +The figure uses \co{x} as a generic variable name for the same
> >  +counter-temporal pattern.
> >  Just because a load sees the old value does \emph{not} mean that
> >  this load executed at an earlier time than did the store of the
> >  new value.
> >  --=20
>=20>  2.25.1
> >=20
>=20---------------------------------------------------------------------=
---
>=20
>=20commit d2c790e9077625e2e28ee919619b4d18175c3665
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date: Wed Mar 11 07:34:07 2026 -0700
>=20
>=20 memorder: Convert Figure 15.15 variable-x commentary to footnote
>=20=20
>=20 Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>=20
>=20diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 388903b6..4503c0a6 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2759,9 +2759,10 @@ It therefore takes time for the effect of the \c=
o{P2()}'s store to
>  that \co{P1()}'s read from \co{z} happens much later in time, but
>  nevertheless still sees the old value of zero.
>  This situation is depicted in
> -\cref{fig:memorder:Load-to-Store is Counter-Temporal}:
> -The figure uses \co{x} as a generic variable name for the same
> -counter-temporal pattern.
> +\cref{fig:memorder:Load-to-Store is Counter-Temporal}:\footnote{
> + The figure uses \co{x} as a generic variable name for the same
> + counter-temporal pattern that uses the variable \co{z} in
> + \cref{lst:memorder:W+RWC Litmus Test With Release (No Ordering)}.}
>  Just because a load sees the old value does \emph{not} mean that
>  this load executed at an earlier time than did the store of the
>  new value.
>
