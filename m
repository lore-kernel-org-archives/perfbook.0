Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A31D5ADE
	for <perfbook@vger.kernel.org>; Thu, 26 Feb 2026 02:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772074167; cv=none; b=GBLakbhQd47Jur1aI+ZooB83CD7EAT4InSz8NP4Tw595kZYPaILGV2SWgGesy2KCWMSbJlKF2orJXWT/NpipyWBZhYpY7M/Gsiyov+I8QWko3CiWoCzmtBHnALrSf/8+XqoKA1IDyXycVG2mVhZ+LyBsjn/57jcoD6ZbDRUfabk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772074167; c=relaxed/simple;
	bh=YCFFlgYWthM8f8KMbUjurHOdzeUdNn0HP0VptZB146g=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Qu9t8XOQP3EIPzOmw3g9AAG5kTpTmNJDvyA6a4ZNVhfKr79PaCAMEkoL7py4OPe3IRiPGnWEKXEj39lMznJSAFUwWCsLInmsR5p9Mg7bT0Gv4hrExltkVyq9UuseGbV7Bkg84pSzjlYfyOHY8Wmlm7g5KyO0YBP77BGbg9CqmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZAN36wfG; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZAN36wfG"
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772074164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smcVvSN+ucaC0f5KD7Ksf6yugshPyG3Uw6G+Frineyw=;
	b=ZAN36wfGDBkFuEaP5oLHlOF/xpyJzE2FQHqB5Af5vYXbHMY2+gkJ/c8jpfWcPpYql6p7oW
	j6pRo1eM9gTpdqI/PGNXSW+y5UXQohZEQUBFLZfx+Yj53V0+dTLdHRju2h409ql9E5zPHl
	g7Ym2p3AZs9/1HLlyn8EEr8o0HP3mf0=
Date: Thu, 26 Feb 2026 02:49:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <f3515ef3292777bf756941333f552ea011a7ec51@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] defer: Fix grammar issues across Chapter 9 text
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
In-Reply-To: <f301d1e0-11be-4016-a85d-b0788fcde60c@paulmck-laptop>
References: <20260225124424.3325034-1-kunwu.chan@linux.dev>
 <f301d1e0-11be-4016-a85d-b0788fcde60c@paulmck-laptop>
X-Migadu-Flow: FLOW_OUT

February 26, 2026 at 9:02 AM, "Paul E. McKenney" <paulmck@kernel.org mail=
to:paulmck@kernel.org?to=3D%22Paul%20E.%20McKenney%22%20%3Cpaulmck%40kern=
el.org%3E > wrote:


>=20
>=20On Wed, Feb 25, 2026 at 08:44:24PM +0800, Kunwu Chan wrote:
>=20
>=20>=20
>=20> Fix subject-verb agreement, singular/plural forms, pronoun agreemen=
t,
> >  and countability in Chapter 9 prose.
> >=20=20
>=20>  These wording-only edits improve readability without changing
> >  technical meaning.
> >=20=20
>=20>  Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
> >=20
>=20Again, good eyes and thank you! I applied all three, with the excepti=
on of=20
>=20this hunk:
>=20
>=20---------------------------------------------------------------------=
---
>=20
>=20diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index 0c8c2e23..23bda66b 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -559,7 +559,7 @@ tolerable, they are in fact invisible.
>  In such cases, RCU readers can be considered to be fully ordered with
>  updaters, despite the fact that these readers might be executing the
>  exact same sequence of machine instructions that would be executed by
> -a single-threaded program, as hinted on
> +a single-threaded program, as hinted at
>  \cpageref{sec:defer:Mysteries RCU}.
>  For example, referring back to
>  \cref{lst:defer:Insertion and Deletion With Concurrent Readers}
>=20
>=20---------------------------------------------------------------------=
---
>=20
>=20This one is one of the many strangenesses of English. You might start
> reading "at page 30", but you would find information "on page 30". Or
> am I misreading this?
>=20
>=20 Thanx, Paul
>=20
Makes=20sense =E2=80=94 both forms seem to be used.

I originally changed it based on my understanding of the usual phrasing,
but I also noticed the perfbook currently uses both "hinted at" and "hint=
ed on".
I can send a small follow-up patch to make them consistent if that sounds=
 good.

Thanx, Kunwu

> >=20
>=20> ---
> >  defer/defer.tex | 2 +-
> >  defer/rcu.tex | 2 +-
> >  defer/rcuapi.tex | 2 +-
> >  defer/rcufundamental.tex | 2 +-
> >  defer/rcuusage.tex | 4 ++--
> >  defer/whichtochoose.tex | 10 +++++-----
> >  6 files changed, 11 insertions(+), 11 deletions(-)
> >=20=20
>=20>  diff --git a/defer/defer.tex b/defer/defer.tex
> >  index eefb1215..3a24ee5d 100644
> >  --- a/defer/defer.tex
> >  +++ b/defer/defer.tex
> >  @@ -87,7 +87,7 @@ interface~3, and address~17 to interface~7.
> >  This list will normally be searched frequently and updated rarely.
> >  In \cref{chp:Hardware and its Habits}
> >  we learned that the best ways to evade inconvenient laws of physics,=
 such as
> >  -the finite speed of light and the atomic nature of matter, is to
> >  +the finite speed of light and the atomic nature of matter, are to
> >  either partition the data or to rely on read-mostly sharing.
> >  This chapter applies read-mostly sharing techniques to Pre-BSD packe=
t
> >  routing.
> >  diff --git a/defer/rcu.tex b/defer/rcu.tex
> >  index 13078687..9d812d77 100644
> >  --- a/defer/rcu.tex
> >  +++ b/defer/rcu.tex
> >  @@ -16,7 +16,7 @@ use explicit counters to defer actions that could =
disturb readers,
> >  which results in read-side contention and thus poor scalability.
> >  The hazard pointers covered by
> >  \cref{sec:defer:Hazard Pointers}
> >  -uses implicit counters in the guise of per-thread lists of pointer.
> >  +use implicit counters in the guise of per-thread lists of pointers.
> >  This avoids read-side contention, but requires readers to do stores =
and
> >  conditional branches, as well as either \IXhpl{full}{memory barrier}
> >  in read-side primitives or real-time-unfriendly \IXacrlpl{ipi} in
> >  diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> >  index 4e231e5a..09e7c277 100644
> >  --- a/defer/rcuapi.tex
> >  +++ b/defer/rcuapi.tex
> >  @@ -599,7 +599,7 @@ to reuse during the grace period that otherwise =
would have allowed them
> >  to be freed.
> >  Although this can be handled through careful use of flags that inter=
act
> >  with the RCU callback queued by \co{call_rcu()}, this can be inconve=
nient
> >  -and can waste CPU times due to the overhead of the doomed \co{call_=
rcu()}
> >  +and can waste CPU time due to the overhead of the doomed \co{call_r=
cu()}
> >  invocations.
> >=20=20
>=20>  In these cases, RCU's polled grace-period primitives can be helpfu=
l.
> >  diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> >  index ccfe9133..604381a9 100644
> >  --- a/defer/rcufundamental.tex
> >  +++ b/defer/rcufundamental.tex
> >  @@ -11,7 +11,7 @@ independent of any particular example or use case.
> >  People who prefer to live their lives very close to the actual code =
may
> >  wish to skip the underlying fundamentals presented in this section.
> >=20=20
>=20>  -The common use of RCU to protect linked data structure is compris=
ed
> >  +The common use of RCU to protect linked data structures is comprise=
d
> >  of three fundamental mechanisms, the first being used for insertion,
> >  the second being used for deletion, and the third being used to allo=
w
> >  readers to tolerate concurrent insertions and deletions.
> >  diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> >  index 2bbd4cef..36939300 100644
> >  --- a/defer/rcuusage.tex
> >  +++ b/defer/rcuusage.tex
> >  @@ -156,7 +156,7 @@ that of the ideal synchronization-free workload.
> >  \cref{sec:cpu:Pipelined CPUs}
> >  carefully already knew all of this!
> >=20=20
>=20>  - These counter-intuitive results of course means that any
> >  + These counter-intuitive results of course mean that any
> >  performance result on modern microprocessors must be subject to
> >  some skepticism.
> >  In theory, it really does not make sense to obtain performance
> >  @@ -241,7 +241,7 @@ As noted in \cref{sec:defer:RCU Fundamentals}
> >  an important component
> >  of RCU is a way of waiting for RCU readers to finish.
> >  One of
> >  -RCU's great strength is that it allows you to wait for each of
> >  +RCU's great strengths is that it allows you to wait for each of
> >  thousands of different things to finish without having to explicitly
> >  track each and every one of them, and without incurring
> >  the performance degradation, scalability limitations, complex deadlo=
ck
> >  diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> >  index a152b028..a11de412 100644
> >  --- a/defer/whichtochoose.tex
> >  +++ b/defer/whichtochoose.tex
> >  @@ -102,8 +102,8 @@ and that there be sufficient pointers for each C=
PU or thread to
> >  track all the objects being referenced at any given time.
> >  Given that most hazard-pointer-based traversals require only a few
> >  hazard pointers, this is not normally a problem in practice.
> >  -Of course, sequence locks provides no pointer-traversal protection,
> >  -which is why it is normally used on static data.
> >  +Of course, sequence locks provide no pointer-traversal protection,
> >  +which is why they are normally used on static data.
> >=20=20
>=20>  \QuickQuiz{
> >  Why can't users dynamically allocate the hazard pointers as they
> >  @@ -124,7 +124,7 @@ RCU readers must therefore be relatively short i=
n order to avoid running
> >  the system out of memory, with special-purpose implementations such
> >  as SRCU, Tasks RCU, and Tasks Trace RCU being exceptions to this rul=
e.
> >  Again, sequence locks provide no pointer-traversal protection,
> >  -which is why it is normally used on static data.
> >  +which is why they are normally used on static data.
> >=20=20
>=20>  The ``Need for Traversal Retries'' row tells whether a new referen=
ce to
> >  a given object may be acquired unconditionally, as it can with RCU, =
or
> >  @@ -319,7 +319,7 @@ Hazard pointers incur the overhead of a \IX{memo=
ry barrier}
> >  for each data element
> >  traversed, and sequence locks incur the overhead of a pair of memory=
 barriers
> >  for each attempt to execute the critical section.
> >  -The overhead of RCU implementations vary from nothing to that of a =
pair of
> >  +The overhead of RCU implementations varies from nothing to that of =
a pair of
> >  memory barriers for each read-side critical section, thus providing =
RCU
> >  with the best performance, particularly for read-side critical secti=
ons
> >  that traverse many data elements.
> >  @@ -622,7 +622,7 @@ Stjepan Glavina merged an epoch-based RCU implem=
entation into the
> >  \co{crossbeam} set of concurrency-support ``crates'' for the Rust
> >  language~\cite{StjepanGlavina2018RustRCU}.
> >=20=20
>=20>  -Jason Donenfeld produced an RCU implementations as part of his po=
rt of
> >  +Jason Donenfeld produced an RCU implementation as part of his port =
of
> >  WireGuard to Windows~NT kernel~\cite{JasonDonenfeld2021:WindowsNTwir=
eguardRCU}.
> >=20=20
>=20>  Finally, any garbage-collected concurrent language (not just Go!\@=
) gets
> >  --=20
>=20>  2.25.1
> >
>
