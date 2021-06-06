Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229885AbhFFXoQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 6 Jun 2021 19:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623022946;
        bh=9VtvjyWc+hT6PBcnjaEWaswhG4GE+XWBIj6DCm9utjw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Kr541gYUeVSx9gv5gzsYVpWv+bHycGg5ftDOz3etLtrJXXlbM3bD8xBc1dqyVtE9w
         Njb30jgSAlG67RnK0uzDvQ0NKACyt3AWtgMEQUbhqELqXht1DG9G/xf+Je1yYD94rM
         1cwvVQI4GAdg5l0VKAmIIc7S7MAAYToAGh1e0Kw8mMExvE3vZ7C073GnfupG0gxWm9
         72paMQ89ni75qxKsX2z5Dj+jhXlVsLxUTa5Up7CFeJikhvLQBcQmKJQyUwhfsOSzL6
         SYhv/F/bHH8Pb0lrI+cmP4kTHxbPn07YBxlFQuHSYkNrxI1i0Fc8k/BXsvER/Yn2/s
         B9dh4zeNzsOVg==
Date: Sun, 6 Jun 2021 16:42:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] intro: Fix trivial nits
Message-ID: <20210606234226.GO4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210606081727.2125-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606081727.2125-1-sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jun 06, 2021 at 10:17:25AM +0200, SeongJae Park wrote:
> This patchset fixes trivial nits in intro chapter, which I found while
> translating it.
> 
> SeongJae Park (2):
>   intro: Fix a wrong opening quote ('' -> ``)
>   intro: Add missed unbreakable spaces

Good eyes!  Queued and pushed, thank you!

							Thanx, Paul

>  intro/intro.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> -- 
> 2.17.1
> 
