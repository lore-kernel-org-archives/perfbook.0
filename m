Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230497AbhC1QIg (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 28 Mar 2021 12:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616947716;
        bh=shI/Eo+kflYFAV0u2AlL9NXvLbliP4BJ/zDoQlXelEI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=cp0vFDS7Wet21bXyFsJcltWLlHVYDWiuUr9cX78P5qMePP0OCy94fdxRz9gGHDKwx
         zimGIo1EwVSEwH1Op+DllHwwm4TfM28AKruJPew0wji8a9TSjt1HWXjb3JA1YoUM7Y
         wHIRUhOJqsrT2/y6+4M1pDxoLN8BWlkxWUBKlIwrPyuSJ0dxXgz0mcMCOwfoLqra+8
         xA5zrtx8ufN6NQIYIiqKjAszTFUxSE2+YTm/TErBdgwrJTRsYQJm0t/l+Nt1TOkfM8
         5loRmE76H8++lcHoHLpl92eufT3sDDaxl4HX5E6ttwNHVqiE5o6rNW6WQZeOb/KnuO
         cSAB/OPUaUJvg==
Date: Sun, 28 Mar 2021 09:08:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] Misc fixes and updates
Message-ID: <20210328160836.GT2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 28, 2021 at 05:48:14PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set consists of fixes/updates, some of which take care
> of ebook-size build.
> 
> Patch 1/5 fixes truncated index pages in ebook-size build.
> Patch 2/5 adds check of warning messages from makeindex, which are
> sometimes hard to track down after the fact.
> Patch 3/5 improves look of final pages of index.
> I'd like final pages of chapters in two-column layout to be
> balanced similarly, but have not succeeded.
> Patch 4/5 fixes the wrong use of \Clnref{} macro, which I failed to
> catch before the release of Second Edition.
> Patch 5/5 fixes an orphaned heading of Section B.2 in ebook-size
> build.
> 
> To build ebook-size PDF with index pages enabled, use the sequence
> of command below:
> 
>     rm perfbook-ix.tex; env PERFBOOK_PAPER=EB make ix
> 
> Resulting perfbook-ix.pdf will be of ebook size.
> As was mentioned earlier, make error due to messages of
> "LaTeX Warning: Float too large for page by ..." is expected
> and can be ignored.

Applied, thank you!

Just out of curiosity, what must be typed to get an ebook layout with
index?  My guess of "PERFBOOK_PAPER=EB make ix" did not do the trick.
Of course, "make ix" continues to create a two-column full-size PDF
with index.

							Thanx, Paul

>         Thanks, Akira
> 
> --
> Akira Yokosawa (5):
>   index: Adjust settings respecting ebook-size build
>   runlatex.sh: Catch warning from makeindex early
>   index: Enable balanced layout of last page of multi-column index
>   together: Fix usage of \clnref{} for 'lines M and N'
>   toyrcu: Move float away from section heading
> 
>  appendix/toyrcu/toyrcu.tex | 10 +++++-----
>  perfbook-lt.tex            |  8 +++++---
>  together/applyrcu.tex      |  2 +-
>  utilities/runlatex.sh      |  5 +++++
>  4 files changed, 16 insertions(+), 9 deletions(-)
> 
> -- 
> 2.17.1
> 
