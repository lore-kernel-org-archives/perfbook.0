Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444437AbiEFVb6 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 6 May 2022 17:31:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F9D6F48A
        for <perfbook@vger.kernel.org>; Fri,  6 May 2022 14:28:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 852A5B839A2
        for <perfbook@vger.kernel.org>; Fri,  6 May 2022 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651872491;
        bh=GnzAIrpKU8JyWr7iYcnRxhhR/OBFrNpBTBVUiw76c80=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=dR8cRjUtfDZkiE7z/xrIaEjqIeMeDIf++/BWQEP2YDFcRhZfG1vUnouCy3SXi7ui3
         DVp9MLBLuMTswjdiXjahucLi9fqA6N74G5Ydt1EN5imirN9mzemkYarvTiN7SQdfm0
         6ZM9hqf6wLK5ryPHMcxb/YtlmeN8Uy/GmBx69X5okM99u28E6hAHGSZ9yH3bSbBsgK
         DywTXyabnzWY51DNbQwTrEMl8mEJeEL2e0HdTlOw+N9mJf1DyvjUWJapaCLnnT8K1g
         jxqvgTZS2/qzz2hC7Btvb2FbPd462wa1HJgLOpp3RurmyPQlh8MzrEc3xrUyMgRzBE
         EDkyugYJd+VyA==
Date: Fri, 6 May 2022 12:15:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] whymb: convert event sequence without store forwarding
 to table
Message-ID: <20220506191559.GH1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220505043732.GA24693@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505043732.GA24693@haolee.io>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, May 05, 2022 at 04:37:32AM +0000, Hao Lee wrote:
> To make the process more clear, introduce a "CPU operations" column
> which represents micro-operations.
> 
> Signed-off-by: Hao Lee <haolee.swjtu@gmail.com>

The table does look much better, thank you!

However, there are a couple of adjustments required:

1.	
	Combine the "Instruction" and "CPU operation" columns in the same
	way as Table 15.1 and with the same column header.  One reason
	is compatibility in order to avoid confusing readers and another
	reason is to accomodate three-CPU examples.

2.	Add a "Store Buffer" column to CPU 1.  Yes, it is not used in
	this example, but it helps those readers who might have missed
	the fact that every CPU has a store buffer.

3.	Please leave the list in place.  Feel free to modify it
	to indicate which row goes with which step in the sequence.
	Either way, I will wordsmith it to be similar to the discussion
	of the tables in Chapter 15.

	Yes, at this point -you- might be able to work out what is
	going on from the table itself and the summary you produced,
	but that won't be the common case.

And yes, Table C.1 is an odd special case at this point.  Maybe we
should leave it as it is, or maybe it should be converted to the common
form.  Thoughts?

							Thanx, Paul

> ---
>  appendix/whymb/whymemorybarriers.tex | 74 ++++++++++++++++++----------
>  1 file changed, 47 insertions(+), 27 deletions(-)
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index 2140eb8a..e9c4665b 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -752,29 +752,50 @@ However, if one were foolish enough to use the very simple architecture
>  shown in
>  \cref{fig:app:whymb:Caches With Store Buffers},
>  one would be surprised.
> -Such a system could potentially see the following sequence of events:
> -\begin{sequence}
> -\item	CPU~0 starts executing the \co{a = 1}.
> -\item	CPU~0 looks ``a'' up in the cache, and finds that it is missing.
> -\item	CPU~0 therefore sends a ``read invalidate'' message in order to
> -	get exclusive ownership of the cache line containing ``a''.
> -\item	CPU~0 records the store to ``a'' in its store buffer.
> -\item	CPU~1 receives the ``read invalidate'' message, and responds
> -	by transmitting the cache line and removing that cacheline from
> -	its cache.
> -\item	CPU~0 starts executing the \co{b = a + 1}.
> -\item	CPU~0 receives the cache line from CPU~1, which still has
> -	a value of zero for ``a''.
> -\item	CPU~0 loads ``a'' from its cache, finding the value zero.
> -	\label{item:app:whymb:Need Store Buffer}
> -\item	CPU~0 applies the entry from its store buffer to the newly
> -	arrived cache line, setting the value of ``a'' in its cache
> -	to one.
> -\item	CPU~0 adds one to the value zero loaded for ``a'' above,
> -	and stores it into the cache line containing ``b''
> -	(which we will assume is already owned by CPU~0).
> -\item	CPU~0 executes \co{assert(b == 2)}, which fails.
> -\end{sequence}
> +Such a system could potentially see the sequence of events in
> +\Cref{tab:app:whymb:Load without store forwarding}.
> +
> +Row~1 shows the initial state, where CPU~0 has \co{b} in its cache and CPU~1
> +has \co{a} in its cache, both variables having a value of zero.
> +Row~2-5 store 1 to variable \co{a} and Row~6-9 calculate \co{b}. Row~10
> +does an assertion which is failed.
> +
> +\begin{table*}
> +\rowcolors{6}{}{lightgray}
> +\renewcommand*{\arraystretch}{1.1}
> +\small
> +\centering\OneColumnHSpace{-0.1in}
> +\ebresizewidth{
> +\begin{tabular}{llllllll}
> +	\toprule
> +	& \multicolumn{4}{c}{CPU 0} &  & \multicolumn{2}{c}{CPU 1} \\
> +	\cmidrule(l){2-5} \cmidrule(l){7-8}
> +	& Instruction & CPU operations & Store Buffer & Cache &  &
> +		CPU operations & Cache \\
> +	\cmidrule{1-1} \cmidrule(l){2-5} \cmidrule(l){7-8}
> +	1 & (Initial state) &  &  & \tco{b==0} &  & (Initial state)
> +		& \tco{a==0} \\
> +	2 & \tco{a = 1;} & read and invalidate \tco{a} &  & \tco{b==0}
> +		&  &  & \tco{a==0} \\
> +	3 &  & record \tco{a} to StoreBuffer & \tco{a==1} & \tco{b==0}
> +		&  &  & \tco{a==0} \\
> +	4 &  & wait & \tco{a==1} & \tco{b==0} &  &
> +		remove \tco{a} and response &  \\
> +	5 &  & install response to cacheline & \tco{a==1} & \tco{a==0;b==0}
> +		&  &  &  \\
> +	6 & \tco{b = a + 1;} & load \tco{a==0} from cacheline & \tco{a==1}
> +		& \tco{a==0;b==0}
> +		&  &  &  \\
> +	7 &  & apply StoreBuffer &  & \tco{a==1;b==0} &  &  &  \\
> +	8 &  & calculate \tco{a+1} &  & \tco{a==1;b==0} &  &  &  \\
> +	9 &  & store \tco{b} &  & \tco{a==1;b==1} &  &  &  \\
> +	10 & \tco{assert(b == 2);} & (failed) &  &  &  &  & \\
> +	\bottomrule
> +\end{tabular}
> +}
> +\caption{Load without store forwarding}
> +\label{tab:app:whymb:Load without store forwarding}
> +\end{table*}
>  
>  The problem is that we have two copies of ``a'', one in the cache and
>  the other in the store buffer.
> @@ -797,10 +818,9 @@ subsequent loads, without having to pass through the cache.
>  \label{fig:app:whymb:Caches With Store Forwarding}
>  \end{figure}
>  
> -With store forwarding in place, item~\ref{item:app:whymb:Need Store Buffer}
> -in the above sequence would have found the correct value of 1 for ``a'' in
> -the store buffer, so that the final value of ``b'' would have been 2,
> -as one would hope.
> +With store forwarding in place, Row~7 in the above sequence would have found
> +the correct value of 1 for ``a'' in the store buffer, so that the final value
> +of ``b'' would have been 2, as one would hope.
>  
>  \subsection{Store Buffers and Memory Barriers}
>  \label{sec:app:whymb:Store Buffers and Memory Barriers}
> -- 
> 2.21.0
> 
