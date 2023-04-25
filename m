Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234582AbjDYRud (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 25 Apr 2023 13:50:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43A0AD0F
        for <perfbook@vger.kernel.org>; Tue, 25 Apr 2023 10:50:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3EF2262F03
        for <perfbook@vger.kernel.org>; Tue, 25 Apr 2023 17:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682445030;
        bh=432qFA8mrKBVT1TXrTP6eqbPRFzIUFaIPUyyfET99f4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=iZ7Q49uKDb90XDqEDHlLdha6JSHGjKvpiz3qJG4vWLtHFTKK0McirmH8oQF0kv115
         mhXbN1HnrUg7IvtfL54fPdH3ci9TYNEhp+rs5x+DHbDZbsYFGW1wabxfLG9ywedWw5
         AkHv9YdSEx4vrEiyRmUAJuwjN5kFR/cBugvON/FQ5j5fiTwma+ZbvSospxwMKLdnE8
         FaPSQs5T9djd8Uu+3W61+cxK8NgpF+c0akHZ4r4yh64iiFrR0QtSggB85whWrhGALi
         IYpUGeZGUrT7dtlBdMpOl/HJwidCZCK0EF0E8SV6OR9+jPw4zifXkIyKxrN+o1uxtg
         69nurcQEvshHw==
Date: Tue, 25 Apr 2023 10:50:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question: Why does the modification of seq in write_seqlock not
 require WRITE_ONCE?
Message-ID: <2f93807e-5137-4ed2-9267-ab3dab24ac57@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <77ACB1FE-73A2-4C0D-A4EE-67D108DA539C@gmail.com>
 <25bd5e72-0d70-3268-afa4-7a6ba0febcfa@gmail.com>
 <6FDBABBC-7444-4189-A881-147F9D42B041@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6FDBABBC-7444-4189-A881-147F9D42B041@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Wed, Apr 26, 2023 at 01:06:57AM +0800, Alan Huang wrote:
> Hi Akira,
> 
> > 2023年4月25日 23:33，Akira Yokosawa <akiyks@gmail.com> 写道：
> > 
> > Hi Alan,
> > 
> > On Tue, 25 Apr 2023 21:52:48 +0800, Alan Huang wrote:
> >> Hi,
> >> 
> >> I noticed that the modifications of seq in write_seqlock and write_sequnlock of Listing 9.10 use plain ++ operation.
> >> But as Chapter 4 (especially 4.3.4.4) says, there will be store tearing since there are concurrent readers.
> >> 
> >> However, the kernel implementation of sequence lock also uses plain ++ operation.
> >> 
> >> I’m somewhat confused.
> >> 
> >> Why does the modification of seq in write_seqlock not require WRITE_ONCE?
> > 
> > Good question...
> > 
> > I don't have a straight answer, but the history of include/linux/seqlock.h
> > says those plain increments predate the introduction of ACCESS_ONCE
> > (predecessor to READ_ONCE/WRITE_ONCE) to the Linux kernel.
> > 
> > The code at the time (pre v2.6.0) looked like this:
> > 
> > static inline void write_seqlock(seqlock_t *sl)
> > {
> > spin_lock(&sl->lock);
> > ++sl->sequence;
> > smp_wmb(); 
> > } 
> > 
> > static inline void write_sequnlock(seqlock_t *sl) 
> > {
> > smp_wmb();
> > sl->sequence++;
> > spin_unlock(&sl->lock);
> > }
> > 
> > static inline int write_tryseqlock(seqlock_t *sl)
> > {
> > int ret = spin_trylock(&sl->lock);
> > 
> > if (ret) {
> > ++sl->sequence;
> > smp_wmb(); 
> > }
> > return ret;
> > }
> > 
> > The purpose of WRITE_ONCE() would be to suppress compiler optimization
> > of write accesses.  In the code above, smp_wmb(), spin_lock(),
> > spin_unlock(), and spin_trylock() all imply compiler barriers.
> > So, there is not much room for compilers to optimize the store part
> > of increments.
> 
> But unsigned long is at least 32 bits, here is the COMPILER BARRIER section of Documentation/memory-barriers.txt:
> 
> 	For example, given an architecture having 16-bit store instructions with 7-bit immediate fields, the compiler
> 	might be tempted to use two 16-bit store-immediate instructions to implement the following 32-bit store:
> 		p = 0x00010002;
> 
> The kernel defines sequence as unsigned, which is at least 16 bits, I don’t know if there exists an architecture having 16-bit store instructions with 32-bit unsigned…

There have been CPUs and compilers that would use a pair of 16-bit
store-immediate instructions to store a 32-bit constant.  I don't know
of any situation where a compiler would use 16-bit loads or stores for
a 32-bit increment, but there is no law forbidding the compiler from
doing so.

To answer the higher-level question, once we had the Linux-kernel memory
model in place, I focused more on explaining it and clearly not enough
on bringing the perfook code samples into line with it.

So I would welcome a patch making sequence locking use READ_ONCE()
and WRITE_ONCE() to do the increments.  The Linux kernel might not
be so excited about the corresponding patch because it could result
in slightly worse code being generated, for example, a++ might use
an x86 add-to-memory instruction while the READ_ONCE()/WRITE_ONCE()
counterpart would load, increment, and store.  Though I hear rumors that
some compilers might start better optimizing this.

							Thanx, Paul

> Thanks,
> Alan
> 
> > 
> > I think those plain-looking increments are safe as far as current
> > compilers are concerned.
> > 
> > Does this explanation help you?
> > 
> > Paul, please chime in if I'm missing something.
> > 
> >        Thanks, Akira
> > 
> >> 
> >> Thanks,
> >> Alan
> 
