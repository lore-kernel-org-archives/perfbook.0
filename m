Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389660AbhAKRjq (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 11 Jan 2021 12:39:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8C40225AB
        for <perfbook@vger.kernel.org>; Mon, 11 Jan 2021 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610386743;
        bh=2CrNn/HkTqDAqgW/DTfxhR0/MDrJfCw86EDpXDZBbwA=;
        h=Date:From:To:Subject:Reply-To:From;
        b=FVaKt9NTCouLVlMO1VlcOnPQW98u+DFr2mJqkv0GKaeRbc2A98I0vK+f9HiuN69qW
         ybx+pJry5QqVZqeUDpKaWVTzWUaVqvkpImFcAzcoLinLIiwrboUzgwFwZ4zZAR6IgA
         dlSQAzfYR5aLHe0uvEEKk/RtZSqCTP6hWTdD5XmhAkm+agMxhRRix6KLEyqiE5aqKM
         7U+qbqLac5yAaWYJIoLJhUwdsy06/Uvd57vzQGPrIlkKmInqbTz0+maxt5/rg2um6c
         4LiHbj8NWucxt9RMefCu5CcIwcFyDOK/s3kq2Fs2uSNQIe/erJy+B4zr2Sh7U9PiSF
         6VlySrHLRSvbg==
Date: Mon, 11 Jan 2021 09:39:03 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Second Edition, Release Candidate 2
Message-ID: <20210111173903.GA28842@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello!

I pushed the second edition, release candidate 2, which may be found at
tag Edition.2-rc2.  I expect that there will be a number of additional
release candidates while I take a pass through the book.  If you know of
issues, please do not keep them a secret!

Oh, and what happened to the announcement for second edition, release
candidate 1?  Here you go: https://paulmck.livejournal.com/59935.html

							Thanx, Paul
