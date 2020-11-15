Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727317AbgKOUmq (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 15 Nov 2020 15:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605472965;
        bh=Kp2BGKJMi7WUsP8ZMFnDQec6GSUlnU5ndW3q8e/BG8I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Xr8Lzam06V7REenc2ye59fy66KLN9Yjnu/Vdyrnwn0AdRT8pKIeahXeTB52PNqdW1
         MwSJKZHhVpKQlTP2ixRwEnblR1vQaIGqSrYOxXvBRQLetsYfrL+9HP48aAVoV9pddG
         FmeVF+SI8aaMMX1Uu9H5CpYDyOShxE/ymahsYdEI=
Date: Sun, 15 Nov 2020 12:42:44 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH perfbook 0/2] CodeSamples/formal: Cleanup of init blocks
 in litmus tests
Message-ID: <20201115204244.GM3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Nov 14, 2020 at 01:51:01PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set is what I mentioned the other day in response to
> your LKMM patch for 5.11.
> klitmus7 doesn't need most of type info in litmus-test init blocks.
> 
> While there are some cases where klitmus7 requires type info of variables
> to be watched (via the "exists", "locations", or "filter" directive),
> as long as the watched variables are of type "int", extra type info
> in the init block is not required.
> 
> Litmus tests under CodeSamples/formal/ should keep compatible with
> klitmus7 after this patch set is applied.
> 
> Patch 1/2 removes initialization to 0 and type info of "int" or "int *"
> under CodeSamples/formal/litmus/.
> 
> Patch 2/2 further reduce line counts of litmus tests by using "{}"
> as empty init blocks.
> It also adds/removes empty lines for those code snippets to have
> consistent looks.
> 
> Similar changes to patch 1/2 can be made in the RCU litmus tests
> presented in Section 12.3.2. They are not touched in this patch set.
> 
> May be in a follow-up patch.

Queued and pushed, thank you very much!

>         Thanks, Akira
> 
> *NOTE*:
> 
> There are cases where litmus tests for herd7 can not be
> made compatible with (current) klitmus7, though.
> 
> One such example is when a variable of a type other than the "int"
> or "int *" (such as "spinlock_t") is specified in the "locations" or "filter"
> directive.
> Current klitmus7 has no idea of the way to obtain the value of such a
> variable.

Good to know!  Do we have litmus tests that have problems with this?

> As for herd7, all the variables are treated as if they were "int" or
> "int *" regardless of the type specified in the litmus tests, there
> is no such problem.

Indeed, herd7 lets you get away with quite a bit.  ;-)

							Thanx, Paul

> --
> Akira Yokosawa (2):
>   CodeSamples/formal/litmus: Remove redundant initializations
>   CodeSamples/formal: Use '{}' for empty init blocks in litmus tests
> 
>  CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus | 5 ++---
>  CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus | 5 ++---
>  CodeSamples/formal/herd/C-Lock1.litmus                    | 5 +++--
>  CodeSamples/formal/herd/C-Lock2.litmus                    | 5 +++--
>  .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus | 3 +--
>  ...C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus | 3 +--
>  .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus | 3 +--
>  ...C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus | 3 +--
>  .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus   | 3 +--
>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus    | 3 +--
>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus   | 3 +--
>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus    | 3 +--
>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus   | 3 +--
>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus      | 3 +--
>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus     | 3 +--
>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus    | 3 +--
>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus     | 3 +--
>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus    | 3 +--
>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus       | 3 +--
>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus     | 3 +--
>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus    | 3 +--
>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus     | 3 +--
>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus    | 3 +--
>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus       | 3 +--
>  .../formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus      | 5 ++---
>  CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus       | 5 ++---
>  ...B+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus | 7 ++-----
>  .../formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus       | 5 ++---
>  .../formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus        | 5 ++---
>  .../formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus        | 5 ++---
>  .../herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus    | 6 ++----
>  .../formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus        | 5 ++---
>  .../formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus        | 5 ++---
>  CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus           | 5 ++---
>  CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus   | 5 ++---
>  CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus     | 5 ++---
>  CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus   | 5 ++---
>  .../formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus       | 5 ++---
>  CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus     | 5 ++---
>  .../formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus     | 4 ++--
>  .../formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus        | 4 ++--
>  CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus     | 4 ++--
>  CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus     | 4 ++--
>  .../formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus  | 7 +++----
>  CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus             | 5 ++---
>  CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus             | 5 ++---
>  CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus        | 6 +++---
>  CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus        | 5 ++---
>  CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus         | 8 ++------
>  CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus        | 7 ++-----
>  CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus    | 8 ++------
>  CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus         | 7 +------
>  CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus     | 7 +------
>  CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus  | 4 ++--
>  CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus       | 5 ++---
>  CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus     | 8 ++------
>  CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus       | 5 ++---
>  CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus             | 6 +++---
>  .../formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus    | 4 +---
>  .../formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus        | 6 +-----
>  CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus   | 6 +-----
>  CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus | 4 ++--
>  CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus          | 3 +--
>  .../formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus        | 6 ++----
>  CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus     | 6 ++----
>  .../formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus     | 4 ++--
>  CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus  | 4 ++--
>  .../formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus     | 4 ++--
>  CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus  | 4 ++--
>  CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus    | 6 +-----
>  CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus   | 5 ++---
>  CodeSamples/formal/litmus/C-cmpxchg.litmus                | 4 ++--
>  memorder/memorder.tex                                     | 8 ++------
>  73 files changed, 124 insertions(+), 217 deletions(-)
> 
> -- 
> 2.17.1
> 
