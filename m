Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:58480 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235850AbhL1RGx (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 28 Dec 2021 12:06:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2994D612D8
        for <perfbook@vger.kernel.org>; Tue, 28 Dec 2021 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640711212;
        bh=fPodceYL/3dnxCuXjqDHAjla7NNcMckK6VRdq9CNyHE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=n9D/waFkfYORUlazoW0NzsQgWKsdVMGFqwLJgvp02ETnkczKPlRD1D05IPWFzBC9T
         tU+dAG/soBSbvURMzpA2FvffZ5mxHimM1M8r4l6nNqaQuQeAySk6LderwXd+LF9GAY
         0ms5KFjiU/DtHC/KT0FDrj7epkHJk082e9DBavx3ihAKcbREeEQZs+DWN4zsTHia6e
         zdef+nVMbLaIebSE8v0abZ+sAW56GDi/zOAKb4ZVAEL47yf0/E5txMUHevh/crZfgP
         7nZ9UhApn5HP/bLQDvk9wXU3GZUd/w5WRZN4hXonqtwYfL4Zo7JvwXiGkMaFN2OU1M
         fCG7zPAlDpCWg==
Date: Tue, 28 Dec 2021 09:06:52 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/4] ebook: Improve overall page layout
Message-ID: <20211228170652.GX4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Dec 28, 2021 at 11:25:01PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Now that the ebook-sized build is provided at the landing page,
> I am trying to improve its overall looks.
> 
> Here are a couple of minor issues as of current master:
> 
>  1) In TOC, page counts larger than 999 don't align properly.
>  2) Page counts are invisible (printed out of paper area).
>  3) Chapter headings are too large for ebook size.
> 
> Patch 1/4 resolves issue #1.
> Patch 2/4 restores page counts in a way not that distracting.
> This is done by the help of the fancyhdr package.
> Patch 3/4 changes chapter-wise epigraph position to below chapter
> heading.  This looks better in ebook-sized builds and avoids
> conflict between fancyhdr and epigraph packages.
> Patch 4/4 resolves issue #3.

Nice improvements!!!  Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   ebook: Allocate enough width for four-digit page counts in TOC
>   ebook: Print page counts on upper-right edge of page
>   ebook: Use normal epigraph for chapter headings
>   ebook: Reduce chapter heading's font size and spaces
> 
>  perfbook-lt.tex | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 204f9c99b8c56f68b0e6c7ffb8d63f7699643c1a
> -- 
> 2.17.1
> 
