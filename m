Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229954AbhD3TKs (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 30 Apr 2021 15:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619809800;
        bh=QhICOBuYeKI6095+JuQjE/IVFpxMZYqsvYW4P0/PNTU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KkT4nX+6M5MNv1aRrCB2bMaeqZ4folbpkCi2+rJ70AduBksZD5C0A7lFEQ+1ztDX+
         h2Mj4nevUF4IByPE2BNU2tZRK4YIWxioT1uhRmgG7oQoKaUsvr3VIK5/blMXV6CP7j
         mtjnTkjzStHVJSz85NSMCway8TGHkJax/oucbbG4xz4/2MUPFE6D3EpnYolLYDI69q
         SkNgUPDqrBDBxTXhkVtadAJ9ZvZx7ESPhLgul1LQrQ9x+Stn2I/voou9JBuZi4dM5k
         yuZo4KThNoOaMKXzJ1avA3D7wdOCG0RG4St27A7bRbYDFcbJu3Lp1yxNDN6cCsERlm
         +LGlfJ/DZXBJA==
Date: Fri, 30 Apr 2021 12:09:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/4] periodcheck and other updates
Message-ID: <20210430190959.GI975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 30, 2021 at 01:42:57PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set consists of random updates.
> 
> Patch 1/4 is a revised one to run periodcheck on "make"
> or "make all", with the option to run only periodcheck
> by "make periodcheck".  It also improves obsolete targets
> "qq" and "mslm" by adding dependencies in the same way
> done in "periodcheck-auto".
> 
> Patch 2/4 adds patterns to catch wrong uses of "\@." and
> ".\@".
> I expect these two are confusing to anybody including myself.
> 
> Patch 3/4 is a trivial fix somewhat related to periods.
> I think this type of errors can also be checked by a script.
> Such a script is now on my todo list.
> 
> Patch 4/4 adds data of v5.12 in Figure 12.4.
> I don't see any anomaly in v5.12, but I'm not closely
> watching the changes in rcu/rcutorture of kernel tree.
> If you are aware of any changes which necessitate updates
> in CodeSamples/formal/rcutorture.sh, put this one on hold
> and let me know what I can do.

Queued and pushed, thank you!  I added a sentence and comment giving a
couple of significant changes added in v5.12.

Also, as an aside, I had to remove the workaround a2ping script, but the
one on my system now works fine.  Not sure what caused the workaround
to stop functioning, perhaps an update that I didn't notice.  But either
way, it does work now.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   Auto run periodcheck on 'make'
>   periodcheck: Add check of '\@.' and '.\@' uses
>   locking: Fix typo
>   formal: Add v5.12 rcu-test data in Figure 12.4
> 
>  Makefile                  |   15 +-
>  formal/RCU-test-ratio.eps | 1113 +++++++++++++++++++------------------
>  formal/data/rcu-test.dat  |    3 +-
>  locking/locking.tex       |    2 +-
>  utilities/periodcheck.pl  |    4 +
>  5 files changed, 585 insertions(+), 552 deletions(-)
> 
> -- 
> 2.17.1
> 
