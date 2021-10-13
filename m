Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233128AbhJMATf (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 12 Oct 2021 20:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634084253;
        bh=0N59gnPE6QhClPjaKS+NGIlZuaqT0/K1dtElqmuaECk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=e/Bj13yojDfLmPjD2GTaOGM95/Nv3F2+LAJSnQBA1lR3YFzfygJCJxTh9iw6zqVXJ
         I5D+4cDs+Fg6lUFCPiZFuYHKa+NwDF5XIybAOOt/1mWWBVDipfV7i3lUM5MHUEDxMm
         d/cpElt1WDBbK7xtq2FoiGlw+NZUkHlSk3If0ih4xnwX6rx8lLQecTeroPq4kRhSTe
         2EbAMa4FyJqsSG6sIdhLCnoJvhcOXU59SZj7i1QTdilVlqk6RvE2beNcvMz8ioIvda
         tWn9t1/O8Mjyx33e75rdIKmj9rumpKqDjf8wslExFw6o6wdnSSvzvYmce6h920ma1c
         ezJr7Qs5CPpJg==
Date: Tue, 12 Oct 2021 17:17:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] toolsoftrade: Fix typo
Message-ID: <20211013001732.GO880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211012023438.5322-1-shiyn.lin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012023438.5322-1-shiyn.lin@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Chin En Lin <shiyn.lin@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 12, 2021 at 10:34:38AM +0800, Chin En Lin wrote:
> Signed-off-by: Chin En Lin <shiyn.lin@gmail.com>

Good eyes!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 8c86d728..c9f5b399 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -2052,7 +2052,7 @@ which are up next.
>  
>  Although it is now much maligned, before the advent of C11 and
>  C++11~\cite{PeteBecker2011N3242}, the \apic{volatile} keyword was an
> -indispensible tool in the parallel programmer's toolbox.
> +indispensable tool in the parallel programmer's toolbox.
>  This raises the question of exactly what \co{volatile} means,
>  a question that is not answered with excessive precision even
>  by more recent versions of this standard~\cite{RichardSmith2019N4800}.\footnote{
> -- 
> 2.24.3 (Apple Git-128)
> 
