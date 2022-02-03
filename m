Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:47446 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiBCWBc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 3 Feb 2022 17:01:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F25D4B835DC
        for <perfbook@vger.kernel.org>; Thu,  3 Feb 2022 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643925690;
        bh=cWWMIYOcS+SmSwpZhT+Kk1D9gF2v1TkCpD8iN+jGD1E=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=l1ykaOImAQFYWaTPMg0K6+GewiViPeJrzAT9cga/ipsOuOsG0IHEa1f7+gv3MLtbX
         hu2TqKhA5rVZLTImiRumC95R21O/2uy02YKicawKffyzPBUrI9lGx0H4OgB66a0OJi
         DhDx5SgMOTPW6IELQJtTK0cv4weam7jVcjhnfIZ7Q2wxhohptWZljdMZM3swj96ba/
         n3IiRNB91V9eo+2rp8AxPWByvZ4P84r5/Yh38IlR4EHDiDFBdqiyIK+u0f93ExeRqG
         qKVQhrQdA1nb+2nl4YxSticd2xFvZx3gKdKnPAc80OMTWNTvDxXKuwFuU0xOzNrccb
         5fKrPOQv8r1Lw==
Date: Thu, 3 Feb 2022 14:01:30 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] memorder: Fix typos
Message-ID: <20220203220130.GR4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220203211001.83673-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220203211001.83673-1-johann@jklaehn.de>
List-ID: <perfbook.vger.kernel.org>
To: Johann =?iso-8859-1?Q?Kl=E4hn?= <johann@jklaehn.de>
Cc: perfbook@vger.kernel.org

On Thu, Feb 03, 2022 at 10:10:01PM +0100, Johann Kl=E4hn wrote:
> Signed-off-by: Johann Kl=E4hn <johann@jklaehn.de>

Good catches, queued and pushed, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 865eff95..9792099f 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2169,7 +2169,7 @@ from a particular store, then, courtesy of the fini=
te speed of light and
>  the non-zero size of modern computing systems, the store absolutely has
>  to have executed at an earlier time than did the load.
>  This means that carefully constructed programs can rely on the
> -passage of time itself as an memory-ordering operation.
> +passage of time itself as a memory-ordering operation.
> =20
>  \begin{figure}
>  \centering
> @@ -2588,7 +2588,7 @@ if (p =3D=3D &reserve_int) {
>  \item	Although it is permissible to compute offsets from a
>  	pointer, these offsets must not result in total cancellation.
>  	For example, given a \co{char} pointer \co{cp},
> -	\co{cp-(uintptr_t)cp)} will cancel and can allow the compiler
> +	\co{cp-(uintptr_t)cp} will cancel and can allow the compiler
>  	to break your dependency chain.
>  	On the other hand, canceling offset values with each other
>  	is perfectly safe and legal.
> @@ -2753,7 +2753,7 @@ void updater(void)		\lnlbl[upd:b]
>  {
>  	struct foo *p;
> =20
> -	p =3D malloc(sizeo(*p));		\lnlbl[upd:alloc]
> +	p =3D malloc(sizeof(*p));		\lnlbl[upd:alloc]
>  	BUG_ON(!p);			\lnlbl[upd:bug]
>  	p->a =3D 42;			\lnlbl[upd:init:a]
>  	p->b =3D 43;
> @@ -2803,7 +2803,7 @@ bitterly on \clnref{bug} if none is available.
>  \Clnrefrange{init:a}{init:c} initialize the newly allocated structure,
>  and then \clnref{assign1} assigns the pointer to \co{gp1}.
>  \Clnref{upd:b,upd:c} then update two of the structure's fields, and does
> -so \co{after} \clnref{assign1} has made those fields visible to readers.
> +so \emph{after} \clnref{assign1} has made those fields visible to reader=
s.
>  Please note that unsynchronized update of reader-visible fields
>  often constitutes a bug.
>  Although there are legitimate use cases doing just this, such use cases
> @@ -3032,7 +3032,7 @@ if (q || 1 > 0)
> =20
>  Because the first condition cannot fault and the second condition is
>  always true, the compiler can transform this example as following,
> -defeating control dependency:
> +defeating the control dependency:
> =20
>  \begin{VerbatimN}
>  q =3D READ_ONCE(x);
> @@ -3238,7 +3238,7 @@ These facts are what enables the lockless fastpaths=
 in
>  \cref{lst:SMPdesign:Allocator-Cache Allocator Function,%
>  lst:SMPdesign:Allocator-Cache Free Function},
>  respectively.
> -However, this also why the developer is responsible for providing
> +However, this is also why the developer is responsible for providing
>  appropriate ordering (for example, by using \co{smp_store_release()})
>  when publishing a pointer to a newly allocated block of memory.
>  After all, in the CPU-local case, the allocator has not necessarily
> @@ -3307,7 +3307,7 @@ As it turns out, quite a bit:
>  	Is some other CPU or thread not holding that lock guaranteed to
>  	see A and B in order?
>  \item	As above, but with the lock reacquisition carried out by some
> -	other CPU or threads?
> +	other CPU or thread?
>  \item	As above, but with the lock reacquisition being some other lock?
>  \item	What ordering guarantees are provided by \co{spin_is_locked()}?
>  \end{enumerate}
> @@ -3571,7 +3571,7 @@ One reason is modeling performance, as shown in
>  on
>  \cpageref{tab:formal:Locking: Modeling vs. Emulation Time (s)}.
>  Directly modeling locking in general is orders of magnitude faster
> -than modeling even a trivial implementation.
> +than emulating even a trivial implementation.
>  This should be no surprise, given the combinatorial explosion experienced
>  by present-day formal-verification tools with increases in the number of
>  memory accesses executed by the code being modeled.
> --=20
> 2.34.1
>=20
