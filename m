Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238921AbiDRQI7 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 18 Apr 2022 12:08:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000DE24093
        for <perfbook@vger.kernel.org>; Mon, 18 Apr 2022 09:06:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B458CB80FCD
        for <perfbook@vger.kernel.org>; Mon, 18 Apr 2022 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650297976;
        bh=rHLC5FyjAZUSRLYsWve2RTx53Y+JdjWNXZeRL9UYc6o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZpqVCMkx+AXVOPLzPI0/aMDRuLeqRnvqs6dyyLaj55IVTEUcWrA0qHzn8maKnI/yL
         KK/zB4cG+RG9zgRJlDdSObHZ982beApxoGXg7ptjrer5eV2Mu9v+t1oHbl7KkfJSV2
         yTyppaDy0O0DmgvBdHfhw+wCJSkZaPlNtRwaHuJNmGuYZRNnloCriu7+YZ4ckCD4dX
         O+DjAU1BHAw9fpOmkZlbx8cLmUvQunyZKyvzNS3KNFHPa2PKxSVARtqQuGMxRzv/aD
         lejlRCkzx8QS0fYzNnUnfrnjVL2p1OzflP7f13lQG/j4qCbsUu74ZXhvzAFtko+wGA
         w3Yn0gcw9Z+nw==
Date: Mon, 18 Apr 2022 09:06:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/3] glossary: Tweak index markers
Message-ID: <20220418160616.GU4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <551bdf14-33c0-6876-6644-ff3494ad38f0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <551bdf14-33c0-6876-6644-ff3494ad38f0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 18, 2022 at 06:54:21PM +0900, Akira Yokosawa wrote:
> \IXGr{} is for marking a term with uppercase chars preserved
> (e.g., proper nouns, Company names, etc.).
> Use \IXG{} instead for normal terms.
> 
> Use \IXGh{}{} for "read memory barrier" and "write memory barrier"
> so that they come together under "memory barrier" in the 
> hierarchical index.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Very good, thank you!  I have queued and pushed these.  One of these days,
I might get the glossary and indexing commands straight, but I would
not recommend holding your breath while waiting for that to happen...

							Thanx, Paul

> ---
>  glossary.tex | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/glossary.tex b/glossary.tex
> index ffe46efd..d488670d 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -9,7 +9,7 @@
>  	        David~Levary~et~al.}}
>  
>  \begin{description}
> -\item[\IXGr{Acquire Load}:]
> +\item[\IXG{Acquire Load}:]
>  	A read from memory that has acquire semantics.
>  	Normal use cases pair an acquire load with a release store,
>  	in which case if the load returns the value stored, then all
> @@ -396,7 +396,7 @@
>  	caches, and store buffers in which values might be stored.
>  	However, this term is often used to denote the main memory
>  	itself, excluding caches and store buffers.
> -\item[\IXGr{Memory Barrier}:]
> +\item[\IXG{Memory Barrier}:]
>  	A compiler directive that might also include a special
>  	memory-barrier instruction.
>  	The purpose of a memory barrier is to order memory-reference
> @@ -576,7 +576,7 @@
>  	RCU is thus best-suited for read-mostly situations where
>  	stale data can either be tolerated (as in routing tables)
>  	or avoided (as in the Linux kernel's System V IPC implementation).
> -\item[\IXGr{Read Memory Barrier}:]
> +\item[\IXGh{Read}{Memory Barrier}:]
>  	A memory barrier that is only guaranteed to affect the ordering
>  	of load instructions, that is, reads from memory.
>  	(See also ``memory barrier'' and ``write memory barrier''.)
> @@ -620,7 +620,7 @@
>  	entity.
>  	Reference counters provide existence guarantees and are sometimes
>  	used to implement garbage collectors.
> -\item[\IXGr{Release store}:]
> +\item[\IXG{Release store}:]
>  	A write to memory that has release semantics.
>  	Normal use cases pair an acquire load with a release store,
>  	in which case if the load returns the value stored, then all
> @@ -743,7 +743,7 @@
>  \item[\IXG{Wait Free}:]
>  	A forward-progress guarantee in which every thread makes
>  	progress within a finite period of time.
> -\item[\IXGr{Write Memory Barrier}:]
> +\item[\IXGh{Write}{Memory Barrier}:]
>  	A memory barrier that is only guaranteed to affect the ordering
>  	of store instructions, that is, writes to memory.
>  	(See also ``memory barrier'' and ``read memory barrier''.)
> 
> base-commit: cccd47c1bcda6420bfe3acdb690aa7eb86c8a769
> -- 
> 2.25.1
> 
