Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727168AbgBXCpw (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 23 Feb 2020 21:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582512352;
        bh=IaeSKHakQPfxIMFO99O1z4MeZ2u8HX1As1djJYJAd3Q=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=U9a9C/euD2yg0ZNyUg2P3Bk26njCKLXRF3bO6PgtvyqUqxX7ZiI2c0G/+d8N7WaQ0
         x16iiYOZD+IK915K2ui+dBkDwR2hPXNlpZ3f0ThmyjaZv53gHQ1DqN6K1LAgllANrF
         6IYVBdzkSytVBFSHoi6Pvv4l6DDJSs79JjsuhpMA=
Date: Sun, 23 Feb 2020 18:45:49 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Towards second edition
Message-ID: <20200224024549.GG2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200223153317.GA23764@paulmck-ThinkPad-P72>
 <dfc81528-fbe1-3a47-5d75-46d92756e6b7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfc81528-fbe1-3a47-5d75-46d92756e6b7@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 24, 2020 at 08:42:09AM +0900, Akira Yokosawa wrote:
> On 2020/02/24 0:33, Paul E. McKenney wrote:
> > Hello!
> > 
> > I finally found and fixed the rcu_barrier() bug [1], so I should again
> > be able to devote some big-system test time to redoing performance
> > results in perfbook.  Once that is done, I expect that it is time for
> > the second edition.
> > 
> > I might also convert the blank page hiding the solution to the Dining
> > Philosophers Problem to a quick quiz, but I consider this optional.
> > 
> > Are there any other changes that are needed? [2]
> 
> In response to Junchang's (off the list) proposal, I noticed that
> Figure 10.27 needs update to reflect the change in the code done
> in early 2019.
> 
> Can you update it?
> 
> The change simplified the lookup side, but doubled the cost of
> updates during resizing. So it is likely the discussion in the text
> also needs update.

I will update this when rerunning on the large system in any case,
but thank you for calling my attention to this.  Yes, it does need
to be fixed.  (My problem in early 2019 was not having access to
a large system, now solved!)

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > 
> > [1] The fix is at 77abca1c358a ("rcu: Make rcu_barrier() account for
> >     offline no-CBs CPUs") in -rcu, in case anyone is curious.
> > 
> > [2] Here is a list of some things that I believe can follow the second
> >     edition:
> > 
> > 	Expand lock-free algorithm discussion to include LIFO push,
> > 	illustrating the infamous pointer-zap issue.  (See ISO SC22
> > 	WG21 P1726R3, which should appear in a couple of weeks, for
> > 	more details.)
> > 
> > 	Add text describing the Issaquah Challenge.
> > 
> > 	Add text describing skiplists, one of the more concurrency
> > 	friendly data structures.
> > 
> > 	Add text describing data-race detectors such as KCSAN.  (This needs
> > 	to wait for more Linux-kernel experience.)
> > 
> > 	Additional material from todo.txt.  ;-)
> > 
