Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237259AbjIRFuz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 18 Sep 2023 01:50:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B313100
        for <perfbook@vger.kernel.org>; Sun, 17 Sep 2023 22:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695016249;
        bh=umNKKY7gKA6cTptQmmvnugH/b3Mh6Z3vpUh+ZQceZQU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=usoDBAMl4LLuzhyyTlik8YyJuxZg7MWkSU/yT+ZU0/e/VHg9Z+Rjnj3YoUXgBUJ6L
         pghPg63k+GFIrTlrkQXLzghdUdtb2nT5tyoyqZSjBWugIyEsVSVc2NA6Fl76O7sAAG
         cv92hOp60B3hf+u3sokXACCemK57HJ99GhhBzy3n6ceYRJu1yIOoizl2Xm04+aogob
         Mt9HNKkpF82YpUEhsmWw0phqT0KY2hQCN1dBpszz2bAY56mXwAXUGa0nz2FBTgbv2z
         fR+GtWuU2SL8I5XfBbJ/ccBFEy6fXELTTNpkjNuSTn+lgdSduQbZQieJ5PYwcYgmUf
         uoTbhpETAJk/A==
Date: Sun, 17 Sep 2023 22:50:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfboof] memorder: Fix word choice (data dependencies
 --> address dependencies)
Message-ID: <cc5a57cd-9715-4cf9-9848-818f98cfb8d6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <3f951591-8279-eeda-65d4-42cb76a2a013@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f951591-8279-eeda-65d4-42cb76a2a013@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 18, 2023 at 10:00:18AM +0900, Akira Yokosawa wrote:
> There remain obsolete word choices of "data dependencies" in section
> Alpha.
> 
> It is load-to-load address dependencies that other archs respect.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I caught them while attempting to add index markers to
> address/data/control dependency.

Good catch, queued and pushed, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 1a4edf8bbb6d..86bb8f41b5f8 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -5403,7 +5403,7 @@ One could place an \co{smp_rmb()} primitive
>  between the pointer fetch and dereference in order to force Alpha
>  to order the pointer fetch with the later dependent load.
>  However, this imposes unneeded overhead on systems (such as \ARM,
> -Itanium, PPC, and SPARC) that respect data dependencies on the read side.
> +Itanium, PPC, and SPARC) that respect address dependencies on the read side.
>  A \co{smp_read_barrier_depends()} primitive was therefore added to the
>  Linux kernel to eliminate overhead on these systems, but was removed
>  in v5.9 of the Linux kernel in favor of augmenting Alpha's definition
> @@ -5428,7 +5428,7 @@ Upon receipt of such an IPI, a CPU would execute a memory-barrier
>  instruction, implementing a system-wide memory barrier similar to that
>  provided by the Linux kernel's \co{sys_membarrier()} system call.
>  Additional logic is required to avoid deadlocks.
> -Of course, CPUs that respect data dependencies would define such a barrier
> +Of course, CPUs that respect address dependencies would define such a barrier
>  to simply be \co{smp_store_release()}.
>  However, this approach was deemed by the Linux community
>  to impose excessive overhead~\cite{McKenney01f}, and to their point would
> 
> base-commit: 8224a12917dd115ead6fce0f785b19a4c7d50f18
> -- 
> 2.25.1
> 
