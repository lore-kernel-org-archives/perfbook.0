Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9593859FE
	for <perfbook@vger.kernel.org>; Fri, 27 Feb 2026 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219609; cv=none; b=mnZaWerCAloyrkoI825gzw//79mW340Zp4s+Jfu1bgk5eojQb/tnlaaIt/dXwV19b6t4nz+gBZIzRdmNOHG3lTyEinAObYY/slkjPbW0sT/SyeCJ2Kwa4J3BypLbzhVeaRg4tSofzLzrD6pabFghW/gIZFtjspsDKz+DCrZvetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219609; c=relaxed/simple;
	bh=BTJuG53BiYdF+7t/iSjWAkP9w2yqYP5E8HzMPSvUtpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MC0zk1aRifFIfdlJAZEiUmNzrbmCgf2JxfmLmlT67FES16WaGdq/K5yo9EUq3bv5u6mm4mk+gddhw5SqVag80dOZXUne0CphX+RctveQLL2QZsyHrha0A31NeHcXPFQVA7h5Gk0AWjIk3iG/T0qd0C+zQ7mVTz8BelaocFUHz74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbGe/rr1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbGe/rr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3795C116C6;
	Fri, 27 Feb 2026 19:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772219608;
	bh=BTJuG53BiYdF+7t/iSjWAkP9w2yqYP5E8HzMPSvUtpk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=qbGe/rr1I2V0YjoCY3vE7skpuX+XGNyyX4Zu3gG5asJGUWQb4tuyH2T8MtAGKO1E7
	 XUyUvT8ibAqEMT25QAfbSyxJutwUz9ZDBuWTdbAxmg6EJXltpo8hQmiHQuCVbbywBw
	 4UzQjTXH7pI1Q5lHyWKfMj6rGXrEjOxiyEUb4+UmuY3CHyKD1hpM/+fIHAXaB7kSL9
	 BDXB9MLYC1rUPHDfxKvbB5ZpObgJhAFYWxZztmFdDuElL3qVod5ujIKR6kjbps35rc
	 0Jtedmpu1EjTihSqS2SrKaJCmz4av4m9gWsJVKcRtqIfW5r9ujXW5oe0ge74HONHeK
	 BvzPqk8+cvPlQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3390DCE0F4C; Fri, 27 Feb 2026 11:13:28 -0800 (PST)
Date: Fri, 27 Feb 2026 11:13:28 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, perfbook@vger.kernel.org
Subject: Re: [PATCH] defer: Fix grammar issues across Chapter 9 text
Message-ID: <13296074-d702-4a4e-98a5-0d309714eb70@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260225124424.3325034-1-kunwu.chan@linux.dev>
 <f301d1e0-11be-4016-a85d-b0788fcde60c@paulmck-laptop>
 <f3515ef3292777bf756941333f552ea011a7ec51@linux.dev>
 <e55cfdd7-919f-46c8-b5b9-1d83e3aaefca@paulmck-laptop>
 <f55228123f7b2b1dd6c4fc0c25a8623ba692f771@linux.dev>
 <0058258d-0799-48b7-ab61-748b66828f15@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0058258d-0799-48b7-ab61-748b66828f15@gmail.com>

On Fri, Feb 27, 2026 at 12:48:45PM +0900, Akira Yokosawa wrote:
> Hi,
> 
> Let me chime in.

Thank you both for digging into this!

I am with Akira on these.  Responding to each inline...

> On Fri, 27 Feb 2026 02:34:43 +0000, Kunwu Chan wrote:
> [...]
> 
> > Hi Paul,
> > 
> > Sounds good. I went through the current PDF and gathered the occurrences 
> > of "hinted at/on" that I could find. Here is the list for review:
> > 
> > Using PDF file: perfbook.2025.12.18a.pdf.
> > 
> > 1) PDF location:
> >    p.98 (PDF page 110/686), Chapter 6 (Beyond Partitioning)
> >    Source location: SMPdesign/beyond.tex (line 14)
> > 
> >    “This chapter has discussed how data partitioning can be used to
> >    design simple linearly scalable parallel programs.
> >    \Cref{sec:SMPdesign:Data Ownership} hinted at the possibilities of
> >    data replication, which will be used to great effect in
> >    \cref{sec:defer:Read-Copy Update (RCU)}.”

Here we are referencing a section, so we say "in Section ...".

> > 2) PDF location:
> >    p.142 (PDF page 154/686), Chapter 9.4 (Sequence Locks)
> >    Source location: defer/seqlock.tex (lines 411–416)
> > 
> >    “As hinted on
> >    \cpageref{sec:defer:Mysteries sequence locking},
> >    both the read-side and write-side critical sections of a sequence
> >    lock can be thought of as transactions, and sequence locking
> >    therefore can be thought of as a limited form of transactional
> >    memory, which will be discussed in
> >    \cref{sec:future:Transactional Memory}.”

And here as well.

> > 3) PDF location:
> >    p.155 (PDF page 167/686), Chapter 9.5 (RCU)
> >    Source location: defer/rcufundamental.tex (lines 559–563)
> > 
> >    “In such cases, RCU readers can be considered to be fully ordered with
> >    updaters, despite the fact that these readers might be executing the
> >    exact same sequence of machine instructions that would be executed by
> >    a single-threaded program, as hinted on
> >    \cpageref{sec:defer:Mysteries RCU}.”

But the English language being what it is, we say "on page ...".
The rational is that when you read a physical dead-tree book, the page is
laid out flat, with the ink you are reading being physically on the page.
As opposed to inside of it or something.

> > 4) PDF location:
> >    p.184 (PDF page 196/686), Chapter 9.5.4.12 area
> >    Source location: defer/rcuusage.tex (lines 2052–2054)
> > 
> >    “And so it is that RCU's use cases are conceptually more complex than
> >    is RCU itself, as hinted on
> >    \cpageref{sec:defer:Mysteries RCU Use Cases}.”

Again "on page ...".

> > 5) PDF location:
> >    p.533 (PDF page 545/686), Quick Quiz answers area
> >    Source location: defer/rcuintro.tex (lines 141–145)
> > 
> >    “As hinted at in
> >    \cref{sec:cpu:Hardware Optimizations,sec:cpu:Hardware Free Lunch?},
> >    speed-of-light delays mean that a computer's data is always stale
> >    compared to whatever external reality that data is intended to model.”

And again "in Section ...".

One way of thinking of this is that sections are usually multiple pages.
If you held in your hand the pages making up a section, the writing
would be in (not on) the stack of pages.

> > Please let me know which ones you’d prefer to keep as-is and 
> > which should be adjusted, and I’ll prepare a patch accordingly.
> 
> Not a native speaker of English, but I don't see any need of changing them.
> 
> >From 1)
> 
>   Section XXX hinted at the possibilities of data replication, ...
> 
> >From 2), 3), and 4)
>   
>   As/as hinted on page YYY ...
> 
> >From 5)
> 
>   As hinted at in Section ZZZ, ...
> 
> All of them sound pretty natural to me.
> 
> You might be missing the implication of "page XXX", which can mean
> physical page in a book.  Saying "on page XXX" is quite natural.
> OTOH, when you see "Section XXX hinted at <some ideas>", you should
> consider "hint at" works as a synonym of "indicate" as a verb.

I suspect that both Chinese and Japanese make different choices, but I
don't know enough about either to say.  Google Translate seems to treat
pages and sections the same for Chinese ("在第3页" and "在第2部分"
but Arabic numerals?) and for Japanese ("3ページにあります" and
"セクション2にあります" and also Arabic numerals?).  On the
other hand, I trust Google Translate only up to a point.  So you guys
tell me!  ;-)

For whatever it is worth, French is similar to English, with "à la"
for pages and "dans la" for sections, where "la" is the feminine form of
the English word "the".  The in/on/with words are big bags of meanings,
so French "à" can be English "on", but the meanings do not coincide
precisely, for example, "à" sometimes translates instead to English
"from".  However, French "dans" almost always translates to English "in".

I took four years of French in high school, mais cela signifie en
américain «Je ne parle pas français» ("but that is American for
'I don't speak French'").  ;-)

And you know the old joke:  English is what you get when Germans attempt
to speak French.

							Thanx, Paul

> Hope this helps.
> 
> Thanks, Akira
> 
> > 
> > 
> > Thanx, Kunwu
