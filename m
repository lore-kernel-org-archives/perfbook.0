Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbhACDxa (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 2 Jan 2021 22:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609645970;
        bh=ohIVFmMTJsjozoZbLD4vIU+RMVpUQW5ntROxaDNefIQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ngkgytYjiYlwYEcM1WrG2YvEsAi8FfUyLCYab4w+Jt5Qubxq8KywdWTiXVN4+cbhH
         2LbFfsLAy1/L5jrRUocNer3jhqDQ/bddhA6WHksfUm/rcODlKSvH2AVeAlo8GWwwS/
         1c/qLDYP/zZ0Yj1Vt5KbgS7eBZyWN0h4dl5vXUwLTalgmnU6BQTJLedNsFNkcVgekG
         zHOKdETcfUjpqcf4Y+SxZU36gZn+FpX3/RPwNYF/m0Y6Nj72THM6UnfI6cjPQLD7Px
         q5BxdhKo4blqqTzz1iOwQVTAhLDd5Ea3DuvVwtdlN+l3rwpj6i9vgrA9gCQv0URoCx
         xbEEntrnLK4BQ==
Date: Sat, 2 Jan 2021 19:52:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Request for clarification on Alpha reordering
Message-ID: <20210103035250.GE12032@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Daniel Nitzan <danny.nitzan@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 03, 2021 at 12:04:24AM +0200, Daniel Nitzan wrote:
> In 15.5.1 (Alpha) - In regard to the following statement: "Yes, this
> does mean that Alpha can in effect fetch the data pointed to before it
> fetches the pointer itself, strange but true."
> I'd appreciate it if someone could clarify what this means. I don't
> understand this statement in light of the actual data-dependent
> reordering presented in this section, i.e. the pointer itself is
> fetched, points to the correct location in memory, but the data is
> stale.

Yes, your last statement is equivalent.  Either way, the reading CPU sees
the new value of the pointer and the old value of the pointed-to data.
You can look at it either as counter-intuitive reordering (as I did)
or as counter-intuitive stale data (as you did).

The key point is that these values are not in a single location, but
are instead replicated across the CPUs' caches.  Stores are therefore
not atomic unless the hardware goes to a lot of trouble to make them
appear to be atomic.

							Thanx, Paul
