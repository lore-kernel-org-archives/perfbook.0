Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbfLGQnJ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 7 Dec 2019 11:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575736988;
        bh=Y1NFw2TNgDKz85K9sUuWkQmr2uRjdmaESXIJHlSF7RU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hdXv7TfUaWdDnMwjZITv+q+B0Ipc4paT1pWK+lcnTO3e3dUyxB+bAnSnlMDMrhhqa
         sRnnq9SxapjX/oMROa/g93X2v3KgTiV0/zGagi38oNP9G+7idXI/iQnX+vcQlKOPQs
         O/YOuk8KVTKF/qypHXojU3Cff/Q7fF/8kDghG5n0=
Date: Sat, 7 Dec 2019 08:43:08 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] Minor updates
Message-ID: <20191207164308.GP2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Dec 07, 2019 at 01:05:17PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set fixes minor issues I noticed while reading your
> recent updates.

Queued and pushed, along with a fix to another of my typos, thank
you very much!

> Apart from the changes, I'd like you to mention in the answer to
> Quick Quiz 9.43 that modern Intel CPUs don't execute x86_64
> instructions directly, but decode them into uOPs (via MOP) and
> keep them in a uOP cache [1].
> So the execution cycle is not necessarily corresponds to instruction
> count, but heavily depends on the behavior of the microarch, which
> is not predictable without actually running the code. 
> 
> [1]: https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(server)

My thought is that I should review the "Hardware and it Habits" chapter,
add this information if it is not already present, and then make the
answer to this Quick Quiz refer back to that.  Does that seem reasonable?

Also, I am thinking in terms of a release (not yet an edition) in
the near term.  Anything else that absolutely must be fixed first?

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (2):
>   toyrcu: Use mathcal O for 'orders of'
>   defer/rcuusage: Fix typo (that -> than)
> 
>  appendix/toyrcu/toyrcu.tex | 2 +-
>  defer/rcuusage.tex         | 2 +-
>  perfbook.tex               | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> -- 
> 2.17.1
> 
