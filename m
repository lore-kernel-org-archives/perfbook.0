Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236305AbhEFRxB (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 6 May 2021 13:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620323523;
        bh=to9pdUyLLYjMO2FW18p2nRTgnFrxAnUU1z+0q2qtOP0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Z1sfJBvASILNJFAUPQQzE3v6kalq5Hh8nUPUXSHRs0zKRTCkZUcB/cBZMJtJdaJhS
         CR/lARSxyznzn5vmlqhwp28sARdvDwKphPZgGqEx1G3d7FikD7+7VI2UB8WDn+Izuu
         p3ZExioj4ReQks3YLLItQS1Vc+FuCtI7eca+cQXQmp+kTQWECBkl4H6SPY4rBA9FEo
         xrILwtkphugmwvkYtRBFyqgUwVXa6chypH8T4okyf10y0jTq048lBVRdrxZdysmzbt
         343bJj7uZ0JuzRO/t7yjeIuRSEpzDBg71VvNUudhZ4YUZFv9DB50RqHAK3NXbyOGOj
         zvm9bOsqtyieA==
Date: Thu, 6 May 2021 10:52:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/4] Add script to check cleveref macro uses
Message-ID: <20210506175202.GT975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, May 06, 2021 at 11:21:36PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Now that end-of-sentence periods are at the end of input lines,
> wrong uses of \Cref{}, \cref{}, and their variants can be detected
> by a not-that-intelligent script.
> 
> Patch 1/4 adds the set of scripts.
> They also detect raw \ref{} and \lnref{} commands.
> 
> Patches 2/4--4/4 are updates of intro, cpu, and toolsoftrade
> to satisfy the scripts.
> 
> Remaining updates of the other chapters will follow when they
> are ready.
> 
> My plan is to add the check as a make target once the other updates
> are finished.
> 
> In the meantime, you can run the check of each file by:
> 
>     ./utilities/cleverefcheck.pl count/count.tex
> 
> , or tree-wide:
> 
>     ./utilities/cleverefcheck.sh

Nice!!!  And sounds like a good plan.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> --
> Akira Yokosawa (4):
>   cleverefcheck: Add check script of cleveref macro usage
>   intro: Employ \cref{} and its variants
>   cpu: Employ \cref{} and its variants
>   toolsoftrade: Employ \cref{} and its variants
> 
>  cpu/cpu.tex                   |   6 +-
>  cpu/hwfreelunch.tex           |  12 +-
>  cpu/overheads.tex             |  26 +--
>  cpu/overview.tex              |  32 +--
>  cpu/swdesign.tex              |  18 +-
>  intro/intro.tex               |  24 +-
>  perfbook-lt.tex               |  21 ++
>  toolsoftrade/toolsoftrade.tex | 412 +++++++++++++++++-----------------
>  utilities/cleverefcheck.pl    |  96 ++++++++
>  utilities/cleverefcheck.sh    |  23 ++
>  10 files changed, 402 insertions(+), 268 deletions(-)
>  create mode 100755 utilities/cleverefcheck.pl
>  create mode 100755 utilities/cleverefcheck.sh
> 
> -- 
> 2.17.1
> 
