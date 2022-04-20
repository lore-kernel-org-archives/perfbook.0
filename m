Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbiDTSSn (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 20 Apr 2022 14:18:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C339FE7
        for <perfbook@vger.kernel.org>; Wed, 20 Apr 2022 11:15:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4A681B82142
        for <perfbook@vger.kernel.org>; Wed, 20 Apr 2022 18:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650478554;
        bh=eV7BH/thV3iH+QtBFU+H9HusxlsksDBC6RzJ1nJBjOs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=B4jUhvD5XRrS+Fi68H1QHbCxK5C9pr5RWqtzMysy2b5HtWca/1NQltSFpOxz8gQnw
         TTnbCHbZtvmeJ+gpGtDWEBLvZSIFM9n2U/o7eQEPndN/5O7n5bHetXOWao6wgvjtUu
         B908U/9DxiqJChxineDNjz6Yyz/HJLosJBSUv56pKg18aO/dB58yldOq5jEb/Vbmmp
         L3lzYyYibC9uV0Y8rAth0ZKqckn1rK0G4xg2OujNllXPDboeQsPd6NkatwJkRmdgoP
         USYIBceqYtANEfid+5hhWOalNcsj9fr0yLOeonkUbblny8joK9zte5adeD/A4nfYM4
         YOg+8L6OJtJIA==
Date: Wed, 20 Apr 2022 11:15:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: The answer of Quiz C.8 is not quite reasonable
Message-ID: <20220420181553.GI4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220414174225.GA29861@haolee.io>
 <20220417174454.GR4285@paulmck-ThinkPad-P17-Gen-1>
 <20220418080117.GC12176@haolee.io>
 <20220419172850.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <20220420064523.GA25496@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420064523.GA25496@haolee.io>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Apr 20, 2022 at 06:45:23AM +0000, Hao Lee wrote:
> On Tue, Apr 19, 2022 at 10:28:50AM -0700, Paul E. McKenney wrote:
> > On Mon, Apr 18, 2022 at 08:01:17AM +0000, Hao Lee wrote:
> > > On Sun, Apr 17, 2022 at 10:44:54AM -0700, Paul E. McKenney wrote:
> > > > On Thu, Apr 14, 2022 at 05:42:25PM +0000, Hao Lee wrote:
> > > > > Hi,
> > > > > 
> > > > > At the beginning of C.3.3 we have supposed the cache line containing "a"
> > > > > resides _only_ in _CPU1’s_ cache. I think this is why _CPU0_ has to send
> > > > > a "_read_ invalidate message" to _retrieve_ the cache line and invalid
> > > > > CPU1's cache line.
> > > > > 
> > > > > However, the answer says the reason is the cache line in question
> > > > > contains more than just the variable a. I can't understand the logical
> > > > > relationship between this answer and the question. Am I missing
> > > > > something here? Thanks.
> > > > 
> > > > I added the commit shown below.  Does that help?
> > > > 
> > > > 							Thanx, Paul
> > > > 
> > > > ------------------------------------------------------------------------
> > > > 
> > > > commit 36fe14d5ebe406e331a5d89533fe3187d2019898
> > > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > > Date:   Sun Apr 17 10:41:33 2022 -0700
> > > > 
> > > >     appendix/whymb: Clarify QQ C.8
> > > >     
> > > >     More clearly note the presence of data other than the variable a.
> > > >     
> > > >     Reported-by: Hao Lee <haolee.swjtu@gmail.com>
> > > >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > > 
> > > > diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> > > > index 8f607e35..43f1307b 100644
> > > > --- a/appendix/whymb/whymemorybarriers.tex
> > > > +++ b/appendix/whymb/whymemorybarriers.tex
> > > > @@ -821,9 +821,14 @@ Then the sequence of operations might be as follows:
> > > >  	In \cref{seq:app:whymb:Store Buffers and Memory Barriers} above,
> > > >  	why does CPU~0 need to issue a ``read invalidate''
> > > >  	rather than a simple ``invalidate''?
> > > > +	After all, \co{foo()} will overwrite \co{a} in any case, so why
> > > > +	should it care about the old value of \co{a}?
> > > 
> > > Totally clear!
> > > 
> > > And we may also need to add some details to C.3.1:
> > > 
> > > 	With the addition of these store buffers, CPU 0 can simply
> > > 	record its write in its store buffer and continue executing.
> > > 	When the cache line does finally make its way from CPU 1 to CPU
> > > 	0, the data will be moved from the store buffer to the cache
> > > 	line.
> > > 
> > > This passage explains why we need a store buffer, but I think the data
> > > in store buffer won't be moved directly to the cache line.
> > > Instead, the store buffer must be merged with the cache line responded
> > > by CPU1, and only after that can it be moved to CPU0's cache line.
> > 
> > You lost me here.
> > 
> > Ah, maybe the missing point is that store buffers do not necessarily
> > maintain full cache lines, but only the data that was actually stored.
> 
> Yes! This is exactly what I want to say. I don't find any hardware sheet
> that illustrates the details, but I think the following process may be
> reasonable:
> 
> The memory data from address 0x0~0xf only exists in CPU1's cache line,
> and now CPU0 wants to write a byte at address 0x0. CPU0 write the _byte_
> into its store buffer and send a "read invalidate" message to CPU1. When
> CPU0 receives the whole cache line responded by CPU1, it needs to
> overwrite the first byte of the responded cache line with the byte in
> store buffer, leaving the other 15 bytes untouched. And then, the
> "merged" cache line can be moved to CPU0's cache.

How about as in the commit shown below?

> > Or, if the store buffer does contain full cache lines, it also contains
> > a mask to indicate what portions of the cache line need to be updated.
> 
> I think this scenario seems impossible because CPU0 doesn't have the
> content of the target cache line, and it can only record changed bytes
> in store buffer.

Well, there are many ways to record changed bytes.  One way would be
to have eache store-buffer entry have double the bits of a cache line,
so that if each cache line is 64 bits, each store-buffer entry has
128 bits.  64 of those bits record the recently stored values, with
don't-care bits for any portions of that cache line that have not been
recently stored to by this CPU.  The other 64 bits are set to the value
1 if the corresponding bit has recently been stored to, and set to the
value zero otherwise.

The obvious disadvantage of this approach is the larger size of each
store-buffer entry.  The corresponding advantage is that the common
case of consecutive stores can usually be merged into a single
store-buffer entry.

Again, how about the commit shown below?

							Thanx, Paul

------------------------------------------------------------------------

commit 475cc7fa460f60b0e518808c68890c8d63658d1c
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Apr 20 10:50:59 2022 -0700

    appendix/whymb: Store buffers and partial cache lines
    
    Reported-by: Hao Lee <haolee.swjtu@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index aeaa4291..347635a4 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -12,7 +12,10 @@ So what possessed CPU designers to cause them to inflict \IXBpl{memory barrier}
 on poor unsuspecting SMP software designers?
 
 In short, because reordering memory references allows much better performance,
-and so memory barriers are needed to force ordering in things like
+courtesy of the finite speed of light and the non-zero size of atoms
+noted in \cref{sec:cpu:Overheads}, and particularly in the
+hardware-performance question posed by \QuickQuizRef{\QspeedOfLightAtoms}.
+Therefore, memory barriers are needed to force ordering in things like
 synchronization primitives whose correct operation depends on ordered
 memory references.
 
@@ -658,16 +661,55 @@ When the cache line does finally make its way from CPU~1 to CPU~0,
 the data will be moved from the store buffer to the cache line.
 
 \QuickQuiz{
-	But if the main purpose of store buffers is to hide acknowledgment
-	latencies in multiprocessor cache-coherence protocols, why
-	do uniprocessors also have store buffers?
+	But then why do uniprocessors also have store buffers?
 }\QuickQuizAnswer{
 	Because the purpose of store buffers is not just to hide
 	acknowledgement latencies in multiprocessor cache-coherence protocols,
 	but to hide memory latencies in general.
 	Because memory is much slower than is cache on uniprocessors,
 	store buffers on uniprocessors can help to hide write-miss
-	latencies.
+	memory latencies.
+}\QuickQuizEnd
+
+Please note that the store buffer does not necessarily operate on
+full cache lines.
+The reason for this is that a given store-buffer entry need only contain
+the value stored, not the other data contained in the corresponding
+cache line.
+Which is a good thing, because the CPU doing the store has no idea
+what that other data might be!
+But once the corresponding cache line arrives, any values from the
+store buffer that update that cache line can be merged into it,
+and the corresponding entries can then be removed from the store buffer.
+Any other data in that cache line is of course left intact.
+
+\QuickQuiz{
+	So store-buffer entries are variable length?
+	Isn't that difficult to implement in hardware?
+}\QuickQuizAnswer{
+	Here are two ways for hardware to easily handle variable-length
+	stores.
+
+	First, each store-buffer entry could be a single byte wide.
+	Then an 64-bit store would consume eight store-buffer entries.
+	This approach is simple and flexible, but one disadvantage is
+	that each entry would need to replicate much of the address that
+	was stored to.
+
+	Second, each store-buffer entry could be double the size of a
+	cache line, with half of the bits containing the values stored,
+	and the other half indicating which bits had been stored to.
+	So, assuming a 32-bit cache line, a single-byte store of 0x5a
+	to the low-order byte of a given cache line would result in
+	\co{0xXXXXXX5a} for the first half and \co{0x000000ff} for the
+	second half, where the values labeled \co{X} are arbitrary
+	because they would be ignored.
+	This approach allows multiple consecutive stores corresponding to
+	a given cache line to be merged into a single store-buffer entry,
+	but is space-inefficient for random stores of single bytes.
+
+	Much more complex and efficient schemes are of course used
+	by actual hardware designers.
 }\QuickQuizEnd
 
 \begin{figure}
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index b8a65faa..c9f5f1f7 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -425,6 +425,8 @@ thousand clock cycles.
 	able to do to ease the plight of parallel programmers.
 }\QuickQuizEnd
 
+\QuickQuizLabel{\QspeedOfLightAtoms}
+
 \begin{table}
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
