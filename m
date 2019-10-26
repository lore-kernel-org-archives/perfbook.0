Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbfJZXE1 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 26 Oct 2019 19:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572131066;
        bh=twEzRugbivIXYC+hSFEDz5/vELjXZvWuxefiEgO/RWc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rjMJo7AtT/BRb2ztnX21TL4SFXqi/VwE32J8FIDbQl4joZq+SzsWHGgnFznIZHcb/
         RFNPI1XkWlLVHFMvqNosCYykqITTKHn5no7UJKVjxIplZ3Y1ok1qPEvBQoJ5kS2rEY
         N2NjiAXBzVwpJmMLTPfytPUJof1yQr1n16IsZdM0=
Date: Sat, 26 Oct 2019 16:04:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] Fixes to recent updates in count
Message-ID: <20191026230424.GF4465@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 26, 2019 at 09:18:27AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> So you had (or still have?) a chance to run the parallel count algorithms
> on the large x86 (224-core with HT) system. Interesting data.

Yes, but access is still a bit patchy.  I probably should have waited,
but I was too pleased to have large-scale data.  What can I say?  ;-)

> This patch set is to adjust a few contexts with existing contents.
> 
> Patch #1 adjusts horizontal spacing of tables getting wider than 1c
> column width.

Good point -- I should have checked, thank you for catching this!
Would it make sense to rotate the "Exact?" heading 90 degrees and
to put the "(ns)" underneath the "Updates"?  Those two changes
might make Figure 5.2 fit horizontally.

> Patch #2 adds a dashed line mentioned in Quick Quiz 5.8.
> Patch #3 substitutes "x86" for "POWER6".

Good catches, all three queued and pushed, thank you!

> If you have conflicting local updates, I'd be happy to rebase.

No problem, as my updates didn't conflict.  Sometimes we get lucky.  ;-)

> Also, you might want to add a Quick Quiz on the slope changes in
> Figure 5.1 at number of CPUs 2 and 28. I think you know what I mean.

You are right, that would be good.  I believe that at least some of
the change in slope is due to hyperthreading, but I do not believe that
this is the only effect.  But I need to get the system into better shape
before I will be able to track this down, which might be a few weeks.

If I forget, please feel free to remind me again, though!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   count: Tweak horizontal spacing of wide tables in 1c layout
>   count: Add dashed line indicating ideal time of (non-atomic) increment
>   count: Update CPU type/system
> 
>  CodeSamples/count/atomic_hps.eps | 111 ++++++++++++++++++++++++++++++-
>  CodeSamples/count/atomic_hps.png | Bin 3113 -> 3120 bytes
>  CodeSamples/count/plots.sh       |   2 +-
>  count/count.tex                  |  12 ++--
>  4 files changed, 117 insertions(+), 8 deletions(-)
> 
> -- 
> 2.17.1
> 
