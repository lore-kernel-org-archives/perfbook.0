Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjFTWkh (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 20 Jun 2023 18:40:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD98193
        for <perfbook@vger.kernel.org>; Tue, 20 Jun 2023 15:40:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 860E96131A
        for <perfbook@vger.kernel.org>; Tue, 20 Jun 2023 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687300836;
        bh=9Qtv1W+u3vUR6eTdHDu5VVb8YQj3eGMIqV6CltI8cSY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AoKQ5ntRAMadTSS2y5FOEnqangA27X/Cd5sPKRod2pkxmaP8Nsk1PUcgPyD9ZFIEA
         0GNMf5cZvqtAOV3/MTJcZIDRb+OJRC+cpxRuL5UP0TF/jorboChz4iMD2EDlCHuDnt
         j0fPKjIUfPY9wkbrpDS0rHUGjYwotyFvcg9con/mjgf8ThWFejKorkqThxUZsbn0XB
         e/I2TbtrpdHsne7crlPIGea/8ln4rr0GlKhPf+VYt3jffDvAp7h9xWUCgfEm3FDTrb
         iNOoWhcxiNJff+nh8lv0wZcunyMng05R/XkJ7jGZkVmC9qF6xix87gmYjnkNHQKrB+
         GWprF+GI0Zmjg==
Date: Tue, 20 Jun 2023 15:40:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples/tree: Fix compiler warning on free
Message-ID: <bbb2031b-dba8-43b1-bc98-99394aec12c1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230616063903.207676-3-leobras.c@gmail.com>
 <e90e329664670a8b92a64970310be2ff92b41301.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e90e329664670a8b92a64970310be2ff92b41301.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jun 19, 2023 at 11:13:32PM -0300, Leonardo Bras wrote:
> On Fri, 2023-06-16 at 03:39 -0300, Leonardo Bras wrote:
> > While building the CodeSamples/datastruct/Issaquah/ directory, I can
> > see
> > a couple instances of this warning:
> > 
> > In function ‘free_treenode_cache’,
> >     inlined from ‘tree_remove_all’ at tree.c:102:2,
> >     inlined from ‘tree_free’ at tree.c:128:2:
> > tree.c:251:9: warning: ‘free’ called on pointer ‘trp’ with nonzero
> > offset 96 [-Wfree-nonheap-object]
> >   251 |         free(tnp);
> >       |         ^~~~~~~~~
> > 
> > I took a look and tried to understand what was happening:
> > - tree_remove_all() calls free_treenode_cache() on it's input, which
> > ends
> >   up free()'ing it (!BAD_MALLOC)
> > - It makes sense in most treenodes, since they are allocated with
> >   alloc_treenode_cache() and the malloc() output is the same as the
> > free()
> >   input.
> > - tree_free() calls tree_remove_all() on &trp->max, which ends up
> > trying
> >   to free() this same address.
> > - trp is a struct treeroot, which is composed of 2 treenodes: min &
> > max
> > - The output of malloc() for trp ends up being different from the
> > address
> >   used for free(), since &trp->max is used instead, and there is an
> > offset
> >   since max is the second element of struct treeroot.
> > 
> > To solve this while keeping the tree_remove_all() generic, move
> > struct traceroot->max to be the first element, and guarantee the
> > address
> > used for free() is the same returned by malloc().
> 
> Extra info:
> 
> Bug reproduction:
> https://gitlab.com/linux-kernel/perfbook/-/jobs/4501216686#L212
> 
> With bugfix provided in this patch:
> https://gitlab.com/linux-kernel/perfbook/-/jobs/4485986705

Hello, Leo, and apologies for being slow.

My feeling is that there is a deeper bug involving use of the wrong
pointer, as in freeing a pointer to a field of the enclosing structure.
What are your thoughts on adjusting things so that the correct pointer
is freed?  (And no, I have not yet looked at this closely, so there
might well be a very good reason why my suggestion is bogus.  But I have
to ask!)

							Thanx, Paul

> Thanks,
> Leo
> 
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  CodeSamples/datastruct/Issaquah/tree.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/CodeSamples/datastruct/Issaquah/tree.h
> > b/CodeSamples/datastruct/Issaquah/tree.h
> > index f007558a..bbe5e7c1 100644
> > --- a/CodeSamples/datastruct/Issaquah/tree.h
> > +++ b/CodeSamples/datastruct/Issaquah/tree.h
> > @@ -48,8 +48,8 @@ struct treenode {
> >   * Root of a tree.
> >   */
> >  struct treeroot {
> > -       struct treenode min;
> >         struct treenode max;
> > +       struct treenode min;
> >  } __attribute__((__aligned__(CACHE_LINE_SIZE)));
> >  
> >  void treenode_wire_call_rcu(void);
> 


