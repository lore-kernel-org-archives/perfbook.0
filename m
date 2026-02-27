Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752B923314B
	for <perfbook@vger.kernel.org>; Fri, 27 Feb 2026 02:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772159695; cv=none; b=njvQoI7aGb6czn8RHBOuUTQw2krzbLNShJh5+1pWdtoimYijZcu/k39CNHxPwMfjp0fSaZ4JVApyeis8nWba84cZBZC/isJgpfV8RKDcgFsZuvVp/BOMf2SU6Swy6dunjcyCUXRpPvLal40O+ggutC/+mlHA5ZTo8xJOy/ZCnYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772159695; c=relaxed/simple;
	bh=495UliEy6rbUqtQllVrCwJni8a0hvIJA8+NeUijLNWQ=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Gy7z6l3PPIHZHH4owgcNIwxb/AgrLRcLOBCk9gLxJgUSRwwXLcMPWDz2CdoxcwXnhSGxVC/SiQ/3Rh+4tp6PBtnaBGQJmHIOXTBpOBAwRJ8aYCTs3wQGzna4EUvUiGLbd3BJh7+n60nGjzrPpp7RVu/UiqInSuYBpitFg6DQH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xrP6dXhZ; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xrP6dXhZ"
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772159691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/61txViUPIRVduQfcJSn3WorVSWptlBUI+Qo12hIe0=;
	b=xrP6dXhZXRJ099BjVrynlpvnGi5A/CT+evu5ktesH512p6I4/Ioiqm6vN+KLVwUvLuZjzR
	9ZwsZPPoI1JS/6iJrMH9q3ZYo4vxVEWrV8mRVvt44bksXODnuJbw+lzQEWOpZ0658k7k8S
	pijyCm3Gn+72E29fPe78FN9ofOqrUqs=
Date: Fri, 27 Feb 2026 02:34:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <f55228123f7b2b1dd6c4fc0c25a8623ba692f771@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] defer: Fix grammar issues across Chapter 9 text
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
In-Reply-To: <e55cfdd7-919f-46c8-b5b9-1d83e3aaefca@paulmck-laptop>
References: <20260225124424.3325034-1-kunwu.chan@linux.dev>
 <f301d1e0-11be-4016-a85d-b0788fcde60c@paulmck-laptop>
 <f3515ef3292777bf756941333f552ea011a7ec51@linux.dev>
 <e55cfdd7-919f-46c8-b5b9-1d83e3aaefca@paulmck-laptop>
X-Migadu-Flow: FLOW_OUT

February 27, 2026 at 3:09 AM, "Paul E. McKenney" <paulmck@kernel.org mail=
to:paulmck@kernel.org?to=3D%22Paul%20E.%20McKenney%22%20%3Cpaulmck%40kern=
el.org%3E > wrote:


>=20
>=20On Thu, Feb 26, 2026 at 02:49:16AM +0000, Kunwu Chan wrote:
>=20
>=20>=20
>=20> February 26, 2026 at 9:02 AM, "Paul E. McKenney" <paulmck@kernel.or=
g mailto:paulmck@kernel.org?to=3D%22Paul%20E.%20McKenney%22%20%3Cpaulmck%=
40kernel.org%3E > wrote:
> >=20=20
>=20>=20=20
>=20>=20=20
>=20>  On Wed, Feb 25, 2026 at 08:44:24PM +0800, Kunwu Chan wrote:
> >=20=20
>=20>  >=20
>=20>  > Fix subject-verb agreement, singular/plural forms, pronoun agree=
ment,
> >  > and countability in Chapter 9 prose.
> >  >=20
>=20>  > These wording-only edits improve readability without changing
> >  > technical meaning.
> >  >=20
>=20>  > Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
> >  >=20
>=20>  Again, good eyes and thank you! I applied all three, with the exce=
ption of=20
>=20>  this hunk:
> >=20=20
>=20>  ------------------------------------------------------------------=
------
> >=20=20
>=20>  diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> >  index 0c8c2e23..23bda66b 100644
> >  --- a/defer/rcufundamental.tex
> >  +++ b/defer/rcufundamental.tex
> >  @@ -559,7 +559,7 @@ tolerable, they are in fact invisible.
> >  In such cases, RCU readers can be considered to be fully ordered wit=
h
> >  updaters, despite the fact that these readers might be executing the
> >  exact same sequence of machine instructions that would be executed b=
y
> >  -a single-threaded program, as hinted on
> >  +a single-threaded program, as hinted at
> >  \cpageref{sec:defer:Mysteries RCU}.
> >  For example, referring back to
> >  \cref{lst:defer:Insertion and Deletion With Concurrent Readers}
> >=20=20
>=20>  ------------------------------------------------------------------=
------
> >=20=20
>=20>  This one is one of the many strangenesses of English. You might st=
art
> >  reading "at page 30", but you would find information "on page 30". O=
r
> >  am I misreading this?
> >=20=20
>=20>  Thanx, Paul
> >=20=20
>=20>  Makes sense =E2=80=94 both forms seem to be used.
> >=20=20
>=20>  I originally changed it based on my understanding of the usual phr=
asing,
> >  but I also noticed the perfbook currently uses both "hinted at" and =
"hinted on".
> >  I can send a small follow-up patch to make them consistent if that s=
ounds good.
> >=20
>=20Good point!
>=20
>=20But when I took a quick look, I found reasons for the divergence.
> Maybe the best way forward is for you to send me a list of (say) 25 of
> them, and for me to explain why what is there is correct on the one han=
d
> or to not the needed change on the other.
>=20
>=20Then you could use that information to create the patch for those
> needing change.
>=20
>=20Seem reasonable?
>=20
>=20 Thanx, Paul
>=20
Hi=20Paul,

Sounds good. I went through the current PDF and gathered the occurrences=
=20
of=20"hinted at/on" that I could find. Here is the list for review:

Using PDF file: perfbook.2025.12.18a.pdf.

1) PDF location:
   p.98 (PDF page 110/686), Chapter 6 (Beyond Partitioning)
   Source location: SMPdesign/beyond.tex (line 14)

   =E2=80=9CThis chapter has discussed how data partitioning can be used =
to
   design simple linearly scalable parallel programs.
   \Cref{sec:SMPdesign:Data Ownership} hinted at the possibilities of
   data replication, which will be used to great effect in
   \cref{sec:defer:Read-Copy Update (RCU)}.=E2=80=9D

2) PDF location:
   p.142 (PDF page 154/686), Chapter 9.4 (Sequence Locks)
   Source location: defer/seqlock.tex (lines 411=E2=80=93416)

   =E2=80=9CAs hinted on
   \cpageref{sec:defer:Mysteries sequence locking},
   both the read-side and write-side critical sections of a sequence
   lock can be thought of as transactions, and sequence locking
   therefore can be thought of as a limited form of transactional
   memory, which will be discussed in
   \cref{sec:future:Transactional Memory}.=E2=80=9D

3) PDF location:
   p.155 (PDF page 167/686), Chapter 9.5 (RCU)
   Source location: defer/rcufundamental.tex (lines 559=E2=80=93563)

   =E2=80=9CIn such cases, RCU readers can be considered to be fully orde=
red with
   updaters, despite the fact that these readers might be executing the
   exact same sequence of machine instructions that would be executed by
   a single-threaded program, as hinted on
   \cpageref{sec:defer:Mysteries RCU}.=E2=80=9D

4) PDF location:
   p.184 (PDF page 196/686), Chapter 9.5.4.12 area
   Source location: defer/rcuusage.tex (lines 2052=E2=80=932054)

   =E2=80=9CAnd so it is that RCU's use cases are conceptually more compl=
ex than
   is RCU itself, as hinted on
   \cpageref{sec:defer:Mysteries RCU Use Cases}.=E2=80=9D

5) PDF location:
   p.533 (PDF page 545/686), Quick Quiz answers area
   Source location: defer/rcuintro.tex (lines 141=E2=80=93145)

   =E2=80=9CAs hinted at in
   \cref{sec:cpu:Hardware Optimizations,sec:cpu:Hardware Free Lunch?},
   speed-of-light delays mean that a computer's data is always stale
   compared to whatever external reality that data is intended to model.=
=E2=80=9D

Please let me know which ones you=E2=80=99d prefer to keep as-is and=20
which=20should be adjusted, and I=E2=80=99ll prepare a patch accordingly.


Thanx, Kunwu

> >=20
>=20> Thanx, Kunwu
> >=20=20
>=20>  >=20
>=20>  > ---
> >  > defer/defer.tex | 2 +-
> >  > defer/rcu.tex | 2 +-
> >  > defer/rcuapi.tex | 2 +-
> >  > defer/rcufundamental.tex | 2 +-
> >  > defer/rcuusage.tex | 4 ++--
> >  > defer/whichtochoose.tex | 10 +++++-----
> >  > 6 files changed, 11 insertions(+), 11 deletions(-)
> >  >=20
>=20>  > diff --git a/defer/defer.tex b/defer/defer.tex
> >  > index eefb1215..3a24ee5d 100644
> >  > --- a/defer/defer.tex
> >  > +++ b/defer/defer.tex
> >  > @@ -87,7 +87,7 @@ interface~3, and address~17 to interface~7.
> >  > This list will normally be searched frequently and updated rarely.
> >  > In \cref{chp:Hardware and its Habits}
> >  > we learned that the best ways to evade inconvenient laws of physic=
s, such as
> >  > -the finite speed of light and the atomic nature of matter, is to
> >  > +the finite speed of light and the atomic nature of matter, are to
> >  > either partition the data or to rely on read-mostly sharing.
> >  > This chapter applies read-mostly sharing techniques to Pre-BSD pac=
ket
> >  > routing.
> >  > diff --git a/defer/rcu.tex b/defer/rcu.tex
> >  > index 13078687..9d812d77 100644
> >  > --- a/defer/rcu.tex
> >  > +++ b/defer/rcu.tex
> >  > @@ -16,7 +16,7 @@ use explicit counters to defer actions that coul=
d disturb readers,
> >  > which results in read-side contention and thus poor scalability.
> >  > The hazard pointers covered by
> >  > \cref{sec:defer:Hazard Pointers}
> >  > -uses implicit counters in the guise of per-thread lists of pointe=
r.
> >  > +use implicit counters in the guise of per-thread lists of pointer=
s.
> >  > This avoids read-side contention, but requires readers to do store=
s and
> >  > conditional branches, as well as either \IXhpl{full}{memory barrie=
r}
> >  > in read-side primitives or real-time-unfriendly \IXacrlpl{ipi} in
> >  > diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> >  > index 4e231e5a..09e7c277 100644
> >  > --- a/defer/rcuapi.tex
> >  > +++ b/defer/rcuapi.tex
> >  > @@ -599,7 +599,7 @@ to reuse during the grace period that otherwis=
e would have allowed them
> >  > to be freed.
> >  > Although this can be handled through careful use of flags that int=
eract
> >  > with the RCU callback queued by \co{call_rcu()}, this can be incon=
venient
> >  > -and can waste CPU times due to the overhead of the doomed \co{cal=
l_rcu()}
> >  > +and can waste CPU time due to the overhead of the doomed \co{call=
_rcu()}
> >  > invocations.
> >  >=20
>=20>  > In these cases, RCU's polled grace-period primitives can be help=
ful.
> >  > diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> >  > index ccfe9133..604381a9 100644
> >  > --- a/defer/rcufundamental.tex
> >  > +++ b/defer/rcufundamental.tex
> >  > @@ -11,7 +11,7 @@ independent of any particular example or use cas=
e.
> >  > People who prefer to live their lives very close to the actual cod=
e may
> >  > wish to skip the underlying fundamentals presented in this section=
.
> >  >=20
>=20>=20=20> -The common use of RCU to protect linked data structure is c=
omprised
> >  > +The common use of RCU to protect linked data structures is compri=
sed
> >  > of three fundamental mechanisms, the first being used for insertio=
n,
> >  > the second being used for deletion, and the third being used to al=
low
> >  > readers to tolerate concurrent insertions and deletions.
> >  > diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> >  > index 2bbd4cef..36939300 100644
> >  > --- a/defer/rcuusage.tex
> >  > +++ b/defer/rcuusage.tex
> >  > @@ -156,7 +156,7 @@ that of the ideal synchronization-free workloa=
d.
> >  > \cref{sec:cpu:Pipelined CPUs}
> >  > carefully already knew all of this!
> >  >=20
>=20>  > - These counter-intuitive results of course means that any
> >  > + These counter-intuitive results of course mean that any
> >  > performance result on modern microprocessors must be subject to
> >  > some skepticism.
> >  > In theory, it really does not make sense to obtain performance
> >  > @@ -241,7 +241,7 @@ As noted in \cref{sec:defer:RCU Fundamentals}
> >  > an important component
> >  > of RCU is a way of waiting for RCU readers to finish.
> >  > One of
> >  > -RCU's great strength is that it allows you to wait for each of
> >  > +RCU's great strengths is that it allows you to wait for each of
> >  > thousands of different things to finish without having to explicit=
ly
> >  > track each and every one of them, and without incurring
> >  > the performance degradation, scalability limitations, complex dead=
lock
> >  > diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> >  > index a152b028..a11de412 100644
> >  > --- a/defer/whichtochoose.tex
> >  > +++ b/defer/whichtochoose.tex
> >  > @@ -102,8 +102,8 @@ and that there be sufficient pointers for each=
 CPU or thread to
> >  > track all the objects being referenced at any given time.
> >  > Given that most hazard-pointer-based traversals require only a few
> >  > hazard pointers, this is not normally a problem in practice.
> >  > -Of course, sequence locks provides no pointer-traversal protectio=
n,
> >  > -which is why it is normally used on static data.
> >  > +Of course, sequence locks provide no pointer-traversal protection=
,
> >  > +which is why they are normally used on static data.
> >  >=20
>=20>  > \QuickQuiz{
> >  > Why can't users dynamically allocate the hazard pointers as they
> >  > @@ -124,7 +124,7 @@ RCU readers must therefore be relatively short=
 in order to avoid running
> >  > the system out of memory, with special-purpose implementations suc=
h
> >  > as SRCU, Tasks RCU, and Tasks Trace RCU being exceptions to this r=
ule.
> >  > Again, sequence locks provide no pointer-traversal protection,
> >  > -which is why it is normally used on static data.
> >  > +which is why they are normally used on static data.
> >  >=20
>=20>  > The ``Need for Traversal Retries'' row tells whether a new refer=
ence to
> >  > a given object may be acquired unconditionally, as it can with RCU=
, or
> >  > @@ -319,7 +319,7 @@ Hazard pointers incur the overhead of a \IX{me=
mory barrier}
> >  > for each data element
> >  > traversed, and sequence locks incur the overhead of a pair of memo=
ry barriers
> >  > for each attempt to execute the critical section.
> >  > -The overhead of RCU implementations vary from nothing to that of =
a pair of
> >  > +The overhead of RCU implementations varies from nothing to that o=
f a pair of
> >  > memory barriers for each read-side critical section, thus providin=
g RCU
> >  > with the best performance, particularly for read-side critical sec=
tions
> >  > that traverse many data elements.
> >  > @@ -622,7 +622,7 @@ Stjepan Glavina merged an epoch-based RCU impl=
ementation into the
> >  > \co{crossbeam} set of concurrency-support ``crates'' for the Rust
> >  > language~\cite{StjepanGlavina2018RustRCU}.
> >  >=20
>=20>  > -Jason Donenfeld produced an RCU implementations as part of his =
port of
> >  > +Jason Donenfeld produced an RCU implementation as part of his por=
t of
> >  > WireGuard to Windows~NT kernel~\cite{JasonDonenfeld2021:WindowsNTw=
ireguardRCU}.
> >  >=20
>=20>  > Finally, any garbage-collected concurrent language (not just Go!=
\@) gets
> >  > --=20
>=20>  > 2.25.1
> >  >
> >
>
