Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440240AbgLNQ0x (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 14 Dec 2020 11:26:53 -0500
Date: Mon, 14 Dec 2020 08:26:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607963172;
        bh=WFlGFflXdt36c1Dxk89jB9KOY/9EQlHpM7SOa/Iqo8k=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=GOSIWpm0M+n4VZx7T3hn554A5oY0KgmXJhHtrZZnNLkErDZTl1OYG2ylzjgBpFecx
         KSb7HfL5LAWXE97+IJ4qlPbxfdVnb/BDlY+J1+ocQwL9TLYRO+NzUCTpQNBGComPW+
         ITnEOlyOGVfBffOMSoF5FbghbW+6+VutsBcsTC2jKKk89MRZISYmVFMPMFq5M8Czqo
         fvZyoOgHa2dCFjPVW9tS39Aqx4ofsweLKVxkI2tNOWZ3hQhRgZIdno8sYqkig4eGZ5
         VhVa/wBgCw0wUoG4QDo6eMUaQMHLIrLy8/WKIb1FuGdUTLfvlHBjtB10hG6Xj3P+HB
         1WfFDsYlKTjSA==
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] memorder: Reword 'memory-barrier shootdown' ->
 'system-wide memory barrier'
Message-ID: <20201214162612.GQ2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <34246c02-de82-cb41-2f86-6443b3870f14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34246c02-de82-cb41-2f86-6443b3870f14@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Motohiro Kanda <kanda.motohiro@gmail.com>, perfbook@vger.kernel.org

On Mon, Dec 14, 2020 at 08:29:41PM +0900, Akira Yokosawa wrote:
> >From 5b917177f7c6c3ee1678689a6c19c352f9f60ef5 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 14 Dec 2020 19:55:28 +0900
> Subject: [PATCH -perfbook] memorder: Reword 'memory-barrier shootdown' -> 'system-wide memory barrier'
> 
> As Motohiro pointed out in his translation comment [1], memory barriers
> can not be shot down.  Motohiro assumed that it was a typo of
> "cache-memory shootdown".
> 
> However, in this case, each CPU is only required to issue a memory-
> barrier instruction (to wait for ongoing cache activities to complete)
> in response to the IPI rather than to flush some cache memory.
> 
> This paragraph has since been updated to mention the sys_membarrier
> syscall added in Linux kernel v4.3 [2].
> 
> Let's borrow the term "system-wide memory barrier" from the commit log.

That makes a lot of sense, so I have pull this in, and thank you both!

In case it helps in the future, the way to think of "shootdown" in the
old context was that the code was using IPIs and memory barriers to
"shoot down" any problematic misordering that might be happening on any
of those CPUs.

But again, it makes a lot of sense to tie into the sys_membarrier()
nomenclature, and again, thank you both!

							Thanx, Paul

> [1]: https://sites.google.com/view/kandamotohiro2/perfbook-d/perfbookappendixc
> [2]: https://git.kernel.org/linus/5b25b13ab08f
> 
> Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 93d18dc5..28b5e433 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -4070,7 +4070,7 @@ all reading CPUs to see the writing CPU's writes in order.
>  This software barrier could be implemented by sending inter-processor
>  interrupts (IPIs) to all other CPUs.
>  Upon receipt of such an IPI, a CPU would execute a memory-barrier
> -instruction, implementing a memory-barrier shootdown similar to that
> +instruction, implementing a system-wide memory barrier similar to that
>  provided by the Linux kernel's \co{sys_membarrier()} system call.
>  Additional logic is required to avoid deadlocks.
>  Of course, CPUs that respect data dependencies would define such a barrier
> -- 
> 2.17.1
> 
