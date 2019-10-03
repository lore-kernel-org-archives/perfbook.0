Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbfJCCuL (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 2 Oct 2019 22:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570071010;
        bh=Vmod1zn7Pd61byMJ4XHTXiocanQ4UNeDya0QMf//ZEE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=K3yu62+38nAtof5QvoMS1qNzEg8zGs6Q/W0lq3CmLSnhjQTByvKeaTI/ucboeQviR
         4EMKtYJZgXywzwGLWan0e8K8iyTQqsvM9woiTH1GEo+q5yUyDGg6f+E367xoHdHNJA
         fNxzL15XUUACGY5u3LQ2M8g2omlnEbEFN8pl8vXM=
Date: Wed, 2 Oct 2019 19:50:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/6] ppcmem: Apply new scheme of code snippets
Message-ID: <20191003025009.GK2689@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Sep 28, 2019 at 10:56:10AM +0900, Akira Yokosawa wrote:
> Subject: [PATCH 0/6] ppcmem: Apply new scheme of code snippets
> 
> Hi Paul,
> 
> This patch series mostly consists of code snippet updates in
> formal/ppcmem.tex.
> 
> Patch #1 fixes a trivial typo in dyntickrcu.
> Patch #2 is the main changes in this series. It also employs
> "cleveref" way of cross references.
> 
> Patches #3--#6 touches the text and add a couples of references
> to PowerPC atomic updates in the Linux kernel.
> 
> Patch #3 adds entries in bib/swtools
> Patch #4 adds citation of Git commit in 2013
> Patches #5 and #6 add a Quick Quiz on another missing full memory
> barrier in the beginning. I'm not that sure the added Quick Quiz
> makes sense, though. If it doesn't, please skip #5 and #6.

I believe that the additional Quick Quiz is worthwhile, but I felt
the need to edit it a bit.  I have queued and pushed the result.
Could you please double-check it?

And good stuff, thank you!

							Thanx, Paul

> I remember asking you about the difference of the code emitted by
> an atomic built-in of PowerPC-GCC and the code in Linux kernel [1].
> IIUC, the added references and Quick Quiz are related to the
> question.
> 
> [1]: https://www.spinics.net/lists/perfbook/msg02077.html
> 
> Seeing the history of the changes and your answer to [1], I suspect
> that now that PPC_ATOMIC_ENTRY_BARRIER is "sync", "isync" might be
> sufficient for PPC_ATOMIC_EXIT_BARRIER. Obviously I'm not an expert
> of PowerPC and can be missing something, but I couldn't help
> mentioning.
> 
>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   dyntickrcu: Fix trivial typo
>   ppcmem: Apply new scheme of code snippets
>   bib/swtools: Add refereneces to PowerPC atomic RMW fixes
>   ppcmem: Cite Git commit of PowerPC atomic_xxx_return fix
>   ppcmem: Add Quick Quiz on lwsync in Listing 12.23
>   ppcmem: Move final sentence of Answer to QQZ 12.27 to the next
> 
>  bib/swtools.bib       |  33 +++++++
>  formal/dyntickrcu.tex |   2 +-
>  formal/ppcmem.tex     | 210 +++++++++++++++++++++++-------------------
>  3 files changed, 149 insertions(+), 96 deletions(-)
> 
> -- 
> 2.17.1
> 
