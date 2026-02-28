Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD9318B83
	for <perfbook@vger.kernel.org>; Sat, 28 Feb 2026 02:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772244798; cv=none; b=hTftXZbReTl8F9N8EPixQ0ulmZF7BWS4vfVrVUhCOMzSgZVjQGTdToM3hD3tqb6TIdwaJTa9VusAAGTmtLvw/T0UqHbYA+Siv4QRxwPuS/rTr7Sw2ea0ENBbTdno98BR4mJXrtc+YrUpZuwVjdLgftp7vKhAQ6YPoXQWNK/BQMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772244798; c=relaxed/simple;
	bh=dnF74kE5oy9FISbgKVNRsSlOXGW6xg9zR9pMZFwzYFo=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=JSRUb0/MEqd/WesRIZQOS8VPZDRnVMPD+br6Cq29RfgqzpcZpZq5bX7VMkQLm7Jy0VoLEHOhbdgv8QpuNhj+vbZtiOUkkmLxABhkh1/VVJZ66xKwYs3FdY4OB3QNpK4rbGVcWhf1y3PtRBX/LVnLhZkrCddEcGFTeXgbz5SSKCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ue098aE3; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ue098aE3"
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772244772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1DZ0N50HvflxW8zPy9f1ek+ioek65yAf72JJpGPMR0=;
	b=Ue098aE3TLcW0tYZuRPLkJCM731j31VeVEQHQFMqpRtOiUp4vgrgNotp0yQvkQIVEKakGQ
	K9wU7C1SSJIWAfPG3kVZmZE7gzHWg4abaZxvRV4Ahe+CZAixsUpLpQjX2Ios9H/ph0Iq64
	odeEfE1FAEYSKhaYYjOSQU0pHQ+sYFU=
Date: Sat, 28 Feb 2026 02:12:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <be4bb599b953d304a0591fbb397968a8b99f0077@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] defer: Fix grammar issues across Chapter 9 text
To: paulmck@kernel.org, "Akira Yokosawa" <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
In-Reply-To: <13296074-d702-4a4e-98a5-0d309714eb70@paulmck-laptop>
References: <20260225124424.3325034-1-kunwu.chan@linux.dev>
 <f301d1e0-11be-4016-a85d-b0788fcde60c@paulmck-laptop>
 <f3515ef3292777bf756941333f552ea011a7ec51@linux.dev>
 <e55cfdd7-919f-46c8-b5b9-1d83e3aaefca@paulmck-laptop>
 <f55228123f7b2b1dd6c4fc0c25a8623ba692f771@linux.dev>
 <0058258d-0799-48b7-ab61-748b66828f15@gmail.com>
 <13296074-d702-4a4e-98a5-0d309714eb70@paulmck-laptop>
X-Migadu-Flow: FLOW_OUT

February 28, 2026 at 3:13 AM, "Paul E. McKenney" <paulmck@kernel.org mail=
to:paulmck@kernel.org?to=3D%22Paul%20E.%20McKenney%22%20%3Cpaulmck%40kern=
el.org%3E > wrote:


>=20
>=20On Fri, Feb 27, 2026 at 12:48:45PM +0900, Akira Yokosawa wrote:
>=20
>=20>=20
>=20> Hi,
> >=20=20
>=20>  Let me chime in.
> >=20
>=20Thank you both for digging into this!
>=20
>=20I am with Akira on these. Responding to each inline...
>=20
Thanks=20for the clear explanation =E2=80=94 very helpful, appreciate it.

> >=20
>=20> On Fri, 27 Feb 2026 02:34:43 +0000, Kunwu Chan wrote:
> >  [...]
> >=20=20
>=20>  Hi Paul,
> >=20=20
>=20>  Sounds good. I went through the current PDF and gathered the occur=
rences=20
>=20>  of "hinted at/on" that I could find. Here is the list for review:
> >=20=20
>=20>  Using PDF file: perfbook.2025.12.18a.pdf.
> >=20=20
>=20>  1) PDF location:
> >  p.98 (PDF page 110/686), Chapter 6 (Beyond Partitioning)
> >  Source location: SMPdesign/beyond.tex (line 14)
> >=20=20
>=20>  =E2=80=9CThis chapter has discussed how data partitioning can be u=
sed to
> >  design simple linearly scalable parallel programs.
> >  \Cref{sec:SMPdesign:Data Ownership} hinted at the possibilities of
> >  data replication, which will be used to great effect in
> >  \cref{sec:defer:Read-Copy Update (RCU)}.=E2=80=9D
> >=20
>=20Here we are referencing a section, so we say "in Section ...".
>=20
Thanks.
>=20>=20
>=20> 2) PDF location:
> >  p.142 (PDF page 154/686), Chapter 9.4 (Sequence Locks)
> >  Source location: defer/seqlock.tex (lines 411=E2=80=93416)
> >=20=20
>=20>  =E2=80=9CAs hinted on
> >  \cpageref{sec:defer:Mysteries sequence locking},
> >  both the read-side and write-side critical sections of a sequence
> >  lock can be thought of as transactions, and sequence locking
> >  therefore can be thought of as a limited form of transactional
> >  memory, which will be discussed in
> >  \cref{sec:future:Transactional Memory}.=E2=80=9D
> >=20
>=20And here as well.
>=20
>=20>=20
>=20> 3) PDF location:
> >  p.155 (PDF page 167/686), Chapter 9.5 (RCU)
> >  Source location: defer/rcufundamental.tex (lines 559=E2=80=93563)
> >=20=20
>=20>  =E2=80=9CIn such cases, RCU readers can be considered to be fully =
ordered with
> >  updaters, despite the fact that these readers might be executing the
> >  exact same sequence of machine instructions that would be executed b=
y
> >  a single-threaded program, as hinted on
> >  \cpageref{sec:defer:Mysteries RCU}.=E2=80=9D
> >=20
>=20But the English language being what it is, we say "on page ...".
> The rational is that when you read a physical dead-tree book, the page =
is
> laid out flat, with the ink you are reading being physically on the pag=
e.
> As opposed to inside of it or something.
>=20
Thanks=20=E2=80=94 the "ink physically on the page" image really helped.=
=20
Much=20easier to grasp. :-)

> >=20
>=20> 4) PDF location:
> >  p.184 (PDF page 196/686), Chapter 9.5.4.12 area
> >  Source location: defer/rcuusage.tex (lines 2052=E2=80=932054)
> >=20=20
>=20>  =E2=80=9CAnd so it is that RCU's use cases are conceptually more c=
omplex than
> >  is RCU itself, as hinted on
> >  \cpageref{sec:defer:Mysteries RCU Use Cases}.=E2=80=9D
> >=20
>=20Again "on page ...".
>=20
>=20>=20
>=20> 5) PDF location:
> >  p.533 (PDF page 545/686), Quick Quiz answers area
> >  Source location: defer/rcuintro.tex (lines 141=E2=80=93145)
> >=20=20
>=20>  =E2=80=9CAs hinted at in
> >  \cref{sec:cpu:Hardware Optimizations,sec:cpu:Hardware Free Lunch?},
> >  speed-of-light delays mean that a computer's data is always stale
> >  compared to whatever external reality that data is intended to model=
.=E2=80=9D
> >=20
>=20And again "in Section ...".
>=20
>=20One way of thinking of this is that sections are usually multiple pag=
es.
> If you held in your hand the pages making up a section, the writing
> would be in (not on) the stack of pages.
>=20
Thanks=20=E2=80=94 that =E2=80=9Cstack of pages=E2=80=9D picture makes it=
 very clear.

> >=20
>=20> Please let me know which ones you=E2=80=99d prefer to keep as-is an=
d=20
>=20>  which should be adjusted, and I=E2=80=99ll prepare a patch accordi=
ngly.
> >=20=20
>=20>  Not a native speaker of English, but I don't see any need of chang=
ing them.
> >=20=20
>=20> From 1)
> >=20=20
>=20>  Section XXX hinted at the possibilities of data replication, ...
> >=20=20
>=20> From 2), 3), and 4)
> >=20=20
>=20>  As/as hinted on page YYY ...
> >=20=20
>=20> From 5)
> >=20=20
>=20>  As hinted at in Section ZZZ, ...
> >=20=20
>=20>  All of them sound pretty natural to me.
> >=20=20
>=20>  You might be missing the implication of "page XXX", which can mean
> >  physical page in a book. Saying "on page XXX" is quite natural.
> >  OTOH, when you see "Section XXX hinted at <some ideas>", you should
> >  consider "hint at" works as a synonym of "indicate" as a verb.
> >=20
>=20I suspect that both Chinese and Japanese make different choices, but =
I
> don't know enough about either to say. Google Translate seems to treat
> pages and sections the same for Chinese ("=E5=9C=A8=E7=AC=AC3=E9=A1=B5"=
 and "=E5=9C=A8=E7=AC=AC2=E9=83=A8=E5=88=86"
> but Arabic numerals?) and for Japanese ("3=E3=83=9A=E3=83=BC=E3=82=B8=
=E3=81=AB=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99" and
> "=E3=82=BB=E3=82=AF=E3=82=B7=E3=83=A7=E3=83=B32=E3=81=AB=E3=81=82=E3=82=
=8A=E3=81=BE=E3=81=99" and also Arabic numerals?). On the
> other hand, I trust Google Translate only up to a point. So you guys
> tell me! ;-)
>=20
>=20For whatever it is worth, French is similar to English, with "=C3=A0 =
la"
> for pages and "dans la" for sections, where "la" is the feminine form o=
f
> the English word "the". The in/on/with words are big bags of meanings,
> so French "=C3=A0" can be English "on", but the meanings do not coincid=
e
> precisely, for example, "=C3=A0" sometimes translates instead to Englis=
h
> "from". However, French "dans" almost always translates to English "in"=
.
>=20
>=20I took four years of French in high school, mais cela signifie en
> am=C3=A9ricain =C2=ABJe ne parle pas fran=C3=A7ais=C2=BB ("but that is =
American for
> 'I don't speak French'"). ;-)
>=20
>=20And you know the old joke: English is what you get when Germans attem=
pt
> to speak French.
>=20
Thanks=20for the explanation =E2=80=94 very helpful.
The language notes (and the joke!) were fun too.=20
Learned=20something new there. ;-)

Thanx, Kunwu

>  Thanx, Paul
>=20
>=20>=20
>=20> Hope this helps.
> >=20=20
>=20>  Thanks, Akira
> >=20=20
>=20>=20=20
>=20>=20=20
>=20>  Thanx, Kunwu
> >
>
