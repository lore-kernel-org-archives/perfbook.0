Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbjDXP4j (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 24 Apr 2023 11:56:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF595FD7
        for <perfbook@vger.kernel.org>; Mon, 24 Apr 2023 08:56:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CF4E62689
        for <perfbook@vger.kernel.org>; Mon, 24 Apr 2023 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682351796;
        bh=RispzUvQXH3/qI0iW8KRr6SJr6ll1bSj+TxF3xMMY1M=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=UqKiNq6VtPfwO+LvFTBPT+PmwWqpeUdn3cL6pvI0nqmy7fxuw+i+bC7LLTkGpx7mN
         QHhAAsVPP3QKawrbGXo9bYX4BpvVtCmwYIR8kCrkVl8bs7DZdACGDocPprnf9RMpRs
         QiV34wr/7Qg3cdRcVgHQjvwgwcqzOO3o/5peH4X9JJcIITKengdDnSthWTkcH6uAoN
         thCKiTdIgQISswq11WKYI+K7clLM/q2cXgxVs15XI30jlKeUnyXViyWU4DpQWO6n2L
         QyNp1w0yerdEOGOWPxqKTw5g6mTpPMlWH32sDidE/D+zNj2QTTX3yYGRw42yeTQK/+
         UQpFFu/3nrpZA==
Date: Mon, 24 Apr 2023 08:56:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] memorder: Use desctiption list for PowerPC
 terminology
Message-ID: <20f67b11-09ed-404d-bf09-6d14f7b20f1d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <23dea7ea-6dda-bfdc-c0b5-50e0e841677b@gmail.com>
 <07f95142-2631-e0aa-f5a3-dbf669d5fcec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07f95142-2631-e0aa-f5a3-dbf669d5fcec@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 22, 2023 at 02:56:26PM +0900, Akira Yokosawa wrote:
> Using \paragraph under subsection level breaks normal document
> structure.
> 
> A description list should be a better fit for the purpose of
> presenting PowerPC terminology.
> 
> As a bonus, this change makes the end of the list of terminology
> becomes obvious to your eyes.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I think this is what you wanted do.
> I changed the periods at the end of terms into colons.
> Do they look good to you?

Looks good, queued and pushed, thank you!

I did not know about "style=nextline", very nice!

Good catch on \FloatBarrier!  The reason I moved it was that while I
was writing the new section, it was leaving most of a page blank.
But now that that section is complete, it doesn't seem to be having
much effect.  So I removed it.

Please let me know if this removal had bad effects somewhere that
I missed.

							Thanx, Paul

>         Thanks, Akira
> --
>  memorder/memorder.tex | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 7d6153a1a67e..cbd772e4fde4 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2571,15 +2571,17 @@ later \co{lwz} from \co{x} must precede \co{P0()}'s \co{stw} to \co{x}.
>  Seeing how this can happen requires a rough understanding of the
>  following PowerPC terminology.
>  
> -\paragraph{Instruction commit.}
> +\begin{description}[style=nextline]
> +
> +\item[Instruction commit:]
>  This can be thought of as the execution of that instruction as opposed
>  to the memory-system consequences of having executed that instruction.
>  
> -\paragraph{Write reaching coherence point.}
> +\item[Write reaching coherence point:]
>  This can be thought of as the value written being deposited into the
>  corresponding cache line.
>  
> -\paragraph{Partial coherence commit.}
> +\item[Partial coherence commit:]
>  This can be thought of as the system having worked out the order in which
>  a pair of values written will be deposited into the corresponding cache
>  line, but potentially well before that cache line arrives.
> @@ -2589,7 +2591,7 @@ suggests that real PowerPC hardware does in fact use partial coherence
>  commits to handle concurrent stores by multiple hardware threads within
>  a single core.
>  
> -\paragraph{Write propagate to thread.}
> +\item[Write propagate to thread:]
>  This occurs when a second hardware thread becomes aware of the first
>  hardware thread's write.
>  The time at which a write propagates to a given thread might not have
> @@ -2601,11 +2603,11 @@ the first thread's write's value might have been deposited into the
>  corresponding cache line long before the second thread learns of that
>  write.
>  
> -\paragraph{Barrier propagate to thread.}
> +\item[Barrier propagate to thread:]
>  Hardware threads make each other aware of memory-barrier instructions
>  as needed by propagating them to each other.
>  
> -\paragraph{Acknowledge \co{sync}.}
> +\item[Acknowledge \tco{sync}:]
>  The PowerPC \co{sync} instruction implements the Linux kernel's
>  \co{smp_mb()} full barrier.
>  And one reason that the \co{sync} instruction provides such strong
> @@ -2614,6 +2616,8 @@ threads, but these other threads must also acknowledge each \co{sync}.
>  This two-way communication allows the hardware threads to cooperate
>  to produce the required strong global ordering.
>  
> +\end{description}
> +
>  \begin{figure*}[tbp]
>  \centering
>  \resizebox{\textwidth}{!}{\includegraphics{memorder/PPCMEM0.png}}
> -- 
> 2.25.1
> 
> 
