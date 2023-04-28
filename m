Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345398AbjD1QUr (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 28 Apr 2023 12:20:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDE359DC
        for <perfbook@vger.kernel.org>; Fri, 28 Apr 2023 09:20:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6500564466
        for <perfbook@vger.kernel.org>; Fri, 28 Apr 2023 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682698843;
        bh=RnAnhMx5TH0PnxzpstfEqe9g1h8ULiEB5EjAvlxJQmc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=WL8BHM2eZrUehZxvABYf8aneIEL4TkHAJOZFuNaAYurQLXFVcsuVx4xyXzfG6K9rV
         OEk2HKCJyjIKm5OULqPIt5g09Oghsch+l6B+6/RRtC2zhnCLVkqa9Wzsx0ynj5rw2C
         xKK4XGsh9PZaNpVQfI79dIqo1LGyVrgZzoVVp9KGTnYOWoAYALCL6+5BrG5EoCuO3Z
         PNKq1fzOTzIKRqiImSZOdQv9EYfwDirbcrtfviYVMmlEADMW3SYUk3vVKXd1oT9+35
         v54Zf9BuAKEBC/SSCrnGCH/ETYyunEB4OsW6fevEFNnWDXWAojX+usTProw9TEzPlj
         tJB87sr8p3GDw==
Date: Fri, 28 Apr 2023 09:20:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] toolsoftrade: Add section titles of 'API
 Members'
Message-ID: <200781b9-a67f-4d6b-8670-0e39f00870e7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f6647f14-4364-1b96-b85a-93b8fcb6766c@gmail.com>
 <28d45967-fd47-45eb-5f37-b91792b428e0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d45967-fd47-45eb-5f37-b91792b428e0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 28, 2023 at 07:20:46PM +0900, Akira Yokosawa wrote:
> For proper document structure, add section titles to the converted
> description lists.
> 
> Amend preceding sentences as well.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Looks good, queued both, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index ea65d6b99b29..5a38d957c19f 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1262,7 +1262,7 @@ which includes program counter and stack.
>  
>  The thread API is shown in
>  \cref{lst:toolsoftrade:Thread API}, and members are described in the
> -following sections.
> +following section.
>  
>  \begin{listing}
>  \begin{VerbatimL}[numbers=none,xleftmargin=2pt]
> @@ -1277,6 +1277,8 @@ void wait_all_threads(void)
>  \label{lst:toolsoftrade:Thread API}
>  \end{listing}
>  
> +\subsubsection{API Members}
> +
>  \begin{description}[style=nextline]
>  \item[\tco{create_thread()}]
>  The \apipf{create_thread()} primitive creates a new thread,
> @@ -1389,7 +1391,7 @@ as in this case they are all \co{NULL}, which is not very interesting.
>  
>  A good starting subset of the Linux kernel's locking API is shown in
>  \cref{lst:toolsoftrade:Locking API},
> -each API element being described in the following sections.
> +each API element being described in the following section.
>  This book's CodeSamples locking API closely follows that of the Linux kernel.
>  
>  \begin{listing}
> @@ -1403,6 +1405,8 @@ void spin_unlock(spinlock_t *sp);
>  \label{lst:toolsoftrade:Locking API}
>  \end{listing}
>  
> +\subsubsection{API Members}
> +
>  \begin{description}[style=nextline]
>  
>  \item[\tco{spin_lock_init()}]
> @@ -2524,6 +2528,8 @@ init_per_thread(name, v)
>  	not they were C static variables!
>  }\QuickQuizEnd
>  
> +\subsubsection{API Members}
> +
>  \begin{description}[style=nextline]
>  \item[\tco{DEFINE_PER_THREAD()}]
>  
> -- 
> 2.25.1
> 
> 
