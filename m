Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230221AbhCOPc4 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 15 Mar 2021 11:32:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8829C60295
        for <perfbook@vger.kernel.org>; Mon, 15 Mar 2021 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615822376;
        bh=kKrNOnXz1fdwmOHIAo9oP88Qd4FEwKP7oxmpJxIoD+U=;
        h=Date:From:To:Subject:Reply-To:References:In-Reply-To:From;
        b=jhGDPjpjXBtniRvuSTIYP1eCQd7n57tfG8FvA37hF7oJ2fBXQWZi7J8ap/0xKrqZp
         7tg4H1G1EAur2IKRqkHMG6sfAKeMI8fkS14NdiPCf5+Bb4sVqTQ+zX7qwzwBVUZcAC
         W5Gs22Wf92Raj8Y1ZI8XMG5zKQVaj4HPN7V3rCZH8Hoz7XzaB136egbcrk0hXb/Muw
         6+j0jc0apYxbNQQ7GpupDQcurf/kk4pibeR0giR/GCfkX06faSBuUIwNtKAe/ecIdA
         khtyl4Z+YuCZShIBenZWcN6ExADxPlFAgjsiEfwS/zyApfN0gLzDrVkNSS/QwLBPJW
         dTEpRNxfWwa3A==
Date: Mon, 15 Mar 2021 08:32:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Second edition coming up soon!
Message-ID: <20210315153256.GA9958@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210308164105.GA2210@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308164105.GA2210@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

On Mon, Mar 08, 2021 at 08:41:05AM -0800, Paul E. McKenney wrote:
> Hello!
> 
> Had I been living right, I would have been announcing the Second Edition's
> release candidates on this list.  Hopefully better late than never...
> 
> The Second Edition Release Candidate 10 is available here:
> 
> https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
> 
> There are only a few appendices to go, as I am not going to do an update
> of Appendix B or C.  So it is likely that the Second Edition will be
> released this coming weekend (of March 14).
> 
> So if you see anything needing a bit of wordsmithing, please let me know!

And there were too many typos remaining, so I posted Second Edition
Release Candidate 11.  Hopefully next week...

							Thanx, Paul
