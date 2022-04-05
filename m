Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457164AbiDEQCs (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 5 Apr 2022 12:02:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D62447049
        for <perfbook@vger.kernel.org>; Tue,  5 Apr 2022 08:31:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC464617EF
        for <perfbook@vger.kernel.org>; Tue,  5 Apr 2022 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649172681;
        bh=NIy0zjbBwSQSTj2nHvj2IWoB1DcTHBukxfTafoSZ6Wo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZP8TknmbRPaFcUmIXQjbyu72/5iIUanlenTYAm7n/EpvKCoRv6vCUrt9hto9LctqV
         nLXUtpKo2tsZlKih2Xcfj7tyQd4maO2IoIBDDRj8K4FcEc7cMppip5nVIE4Vq7Ak+P
         wf3LrbkRooT0BpdCKEYRE4YBEr88qfBmHpjADRV0hImvrQfpsTPjb7ySxwGjiiQDAA
         dGYHS/STRlDsDhzkPVQUkxpF53Qg0pwyfyLxYfArlcMYfVxofyFdn4Im2NaZzpQPfH
         EqIa3QAO8i+XbHaWZF9FwRgr/TQNakZe8Ga4nbGKK605whc/wv0NejDz7MtxaP3fEW
         u7ru1cKnEQJvA==
Date: Tue, 5 Apr 2022 08:31:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Does perfbook need some prior knowledge?
Message-ID: <20220405153120.GH4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CA+PpKPmTsMMP6n3hYEqNxav_qQcyFPmff0GwYCauyuHY7GDM3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+PpKPmTsMMP6n3hYEqNxav_qQcyFPmff0GwYCauyuHY7GDM3w@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 05, 2022 at 09:52:23PM +0800, Hao Lee wrote:
> Hi, Paul
> 
> I'm currently reading perfbook, but I often get stuck in some concepts
> which are not explained. Does this book need some prior knowledge?
> Or all these concepts are explained later and I just need to keep
> reading patiently?
> 
> For example, on page 67 in v2021.12.22a:
> 
>     For example, a write memory barrier (Linux kernel smp_wmb()) would
>     order the store, but not the load. This situation might suggest use
>     of smp_store_release() over smp_wmb().
> 
> Unfortunately, although I have some knowledge about Linux kernel, I'm not
> familiar with the concepts such as store_release, smp_wmb, etc. I don't
> know if I should keep reading this book until all these concepts are
> explained or stop reading the book and learn some prior knowledge.

Good point.  On the one hand, this book is rather advanced, but on the
other hand, it needs to be as accessible as is reasonably possible.

I do not believe that there is a good definition of these two in the
current text.  So could you please do the following when you come
across an undefined term or API member like this?

1.	Search within the PDF.	If there is a good definition later,
	let us know so that we can either move the definition earlier,
	forward-reference the definition, or make the API reference at
	the end of the book point readers at the definition.

	If you don't see an obvious definition, continue.

2.	Check the web.	If you find what looks to be a good definition,
	tell us where it is.  Perhaps we should create a similar
	definition in the book, or perhaps we should cite the definition
	you found.

	If you don't see an obvious definition, continue.

3.	Search within the Linux kernel source code.  (When I did
	this, the best definition I found was the much-maligned
	Documentation/memory-barriers.txt!)  Again, maybe we should
	put a similar definition in the book or maybe we should
	cite the Linux-kernel source tree.

When I did this for smp_store_release() and smp_wmb(), I didn't find
much that was helpful.

Here is how I might define them:

smp_store_release(): This is a store-release operation.  This operation
	guarantees that all memory references preceding the
	smp_store_release() will be visible to other threads and CPUs
	before the store carried out by the smp_store_release().

	This means that smp_store_release(&a, v) is similar to the
	plain C-language assignment statement a = v, but also provides
	the aforementioned ordering guarantee while also preventing the
	counterproductive compiler optimizations described in Section
	4.3.4 ("Accessing Shared Variables").

smp_wmb(): This is a write memory barrier.  This barrier guarantees
	that memory stores preceding this barrier will be visible to
	other threads and CPUs before any memory stores following this
	barrier.

The text would also need to reiterate that ordering the stores is of
no use unless the other threads' and CPU's loads are also ordered.

Part of this definition would likely appear in the Glossary entries
for store release and write memory barrier.

Would this help?

Again, this book is reasonably advanced, but it is very helpful for us to
understand which things are tripping people up.  We cannot promise to fix
all of them, because there is a very large number of such functions, and
many of them are subject to change over time.  However, we -can- promise
that we most definitely will not fix those that we do not know about.  ;-)

If you are wondering why it is not obvious to me what definitions
are needed where, please keep in mind that I have been doing parallel
programming for more than 30 years, and that my learning process was
highly non-traditional.  I learned much of this from the hardware itself,
some by reading code and exercising it, and a little bit by inventing it.

So I need your help to work out what a traditional learning process
should look like.

							Thanx, Paul
